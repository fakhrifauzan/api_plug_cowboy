defmodule ApiPlugCowboy.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book) do
      add :title, :string, null: false
      add :sinopsis, :string
    end
  end
end
