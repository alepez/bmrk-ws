defmodule Bmrk.BookmarkTest do
  use Bmrk.ModelCase

  alias Bmrk.Bookmark

  @valid_attrs %{description: "some content", notes: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bookmark.changeset(%Bookmark{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bookmark.changeset(%Bookmark{}, @invalid_attrs)
    refute changeset.valid?
  end
end
