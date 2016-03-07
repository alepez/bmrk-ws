defmodule Bmrk.BookmarkView do
  use Bmrk.Web, :view

  def render("index.json", %{bookmarks: bookmarks}) do
    %{data: render_many(bookmarks, Bmrk.BookmarkView, "bookmark.json")}
  end

  def render("show.json", %{bookmark: bookmark}) do
    %{data: render_one(bookmark, Bmrk.BookmarkView, "bookmark.json")}
  end

  def render("bookmark.json", %{bookmark: bookmark}) do
    %{id: bookmark.id,
      url: bookmark.url,
      title: bookmark.title,
      description: bookmark.description,
      notes: bookmark.notes}
  end
end
