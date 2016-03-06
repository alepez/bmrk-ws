defmodule Bmrk.BookmarkController do
  use Bmrk.Web, :controller

  alias Bmrk.Bookmark

  plug :scrub_params, "bookmark" when action in [:create, :update]

  def index(conn, _params) do
    bookmarks = Repo.all(Bookmark)
    render(conn, "index.json", bookmarks: bookmarks)
  end

  def create(conn, %{"bookmark" => bookmark_params}) do
    changeset = Bookmark.changeset(%Bookmark{}, bookmark_params)

    case Repo.insert(changeset) do
      {:ok, bookmark} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", bookmark_path(conn, :show, bookmark))
        |> render("show.json", bookmark: bookmark)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bmrk.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bookmark = Repo.get!(Bookmark, id)
    render(conn, "show.json", bookmark: bookmark)
  end

  def update(conn, %{"id" => id, "bookmark" => bookmark_params}) do
    bookmark = Repo.get!(Bookmark, id)
    changeset = Bookmark.changeset(bookmark, bookmark_params)

    case Repo.update(changeset) do
      {:ok, bookmark} ->
        render(conn, "show.json", bookmark: bookmark)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bmrk.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bookmark = Repo.get!(Bookmark, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(bookmark)

    send_resp(conn, :no_content, "")
  end
end
