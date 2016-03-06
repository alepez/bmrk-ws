defmodule Bmrk.Repo.Migrations.CreateBookmark do
  use Ecto.Migration

  def change do
    create table(:bookmarks, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :url, :string
      add :title, :string
      add :description, :string
      add :notes, :string

      timestamps
    end

  end
end
