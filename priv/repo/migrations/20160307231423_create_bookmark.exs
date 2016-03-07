defmodule Bmrk.Repo.Migrations.CreateBookmark do
  use Ecto.Migration

  def change do
    create table(:bookmarks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string
      add :title, :string
      add :description, :text
      add :notes, :text

      timestamps
    end

  end
end
