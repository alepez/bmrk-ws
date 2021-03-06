defmodule Bmrk.BookmarkControllerTest do
  use Bmrk.ConnCase

  alias Bmrk.Bookmark
  @valid_attrs %{description: "some content", notes: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, bookmark_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    bookmark = Repo.insert! %Bookmark{}
    conn = get conn, bookmark_path(conn, :show, bookmark)
    assert json_response(conn, 200)["data"] == %{"id" => bookmark.id,
      "url" => bookmark.url,
      "title" => bookmark.title,
      "description" => bookmark.description,
      "notes" => bookmark.notes}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, bookmark_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, bookmark_path(conn, :create), bookmark: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Bookmark, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, bookmark_path(conn, :create), bookmark: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    bookmark = Repo.insert! %Bookmark{}
    conn = put conn, bookmark_path(conn, :update, bookmark), bookmark: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Bookmark, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    bookmark = Repo.insert! %Bookmark{}
    conn = put conn, bookmark_path(conn, :update, bookmark), bookmark: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    bookmark = Repo.insert! %Bookmark{}
    conn = delete conn, bookmark_path(conn, :delete, bookmark)
    assert response(conn, 204)
    refute Repo.get(Bookmark, bookmark.id)
  end
end
