defmodule Bmrk.Bookmark do
  use Bmrk.Web, :model

  schema "bookmarks" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :notes, :string

    timestamps
  end

  @required_fields ~w(url)
  @optional_fields ~w(title description notes)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
