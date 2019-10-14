defmodule ApiPlugCowboy.Books do
  alias ApiPlugCowboy.Utils
  alias ApiPlugCowboy.Repo, as: Repo
  alias ApiPlugCowboy.Model.Book, as: Book

  def create(params) do
    case %Book{} |> Book.changeset(params) |> Repo.insert() do
      {:ok, result} ->
        {201, Utils.format_success(%{book: result})}

      {:error, changeset} ->
        {400, Utils.format_failure_response(Utils.translate_errors(changeset))}
    end
  end
end