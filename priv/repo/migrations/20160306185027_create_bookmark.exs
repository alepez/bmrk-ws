defmodule Bmrk.Repo.Migrations.CreateBookmark do
  use Ecto.Migration

  def change do
    create table(:bookmarks) do
      add :url, :string
      add :title, :string
      add :description, :string
      add :notes, :string

      timestamps
    end

  end
end
