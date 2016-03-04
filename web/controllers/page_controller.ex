defmodule Bmrk.PageController do
  use Bmrk.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
