defmodule ApiPlugCowboy.Model.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book" do
    field :title, :string
    field :sinopsis, :string
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:title, :sinopsis])
    |> validate_required([:title, :sinopsis])
  end

end