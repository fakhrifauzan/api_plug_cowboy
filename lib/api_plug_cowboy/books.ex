defmodule ApiPlugCowboy.Books do
  alias ApiPlugCowboy.Utils
  alias ApiPlugCowboy.Repo, as: Repo
  alias ApiPlugCowboy.Model.Book, as: Book

  def index do
    {200, Utils.format_success(Book |> Repo.all())}
  end

  def create(params) do
    case %Book{} |> Book.changeset(params) |> Repo.insert() do
      {:ok, result} ->
        {201, Utils.format_success(%{book: result})}

      {:error, changeset} ->
        {400, Utils.format_failed_response(changeset)}
    end
  end

  def get(book_id) do
    result = Book |> Repo.get(book_id)

    case result do
      nil ->
        {404, Utils.format_failed_response("Book with id: #{book_id} is not found")}

      book ->
        {200, Utils.format_success(book)}
    end
  end
end