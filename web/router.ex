defmodule Bmrk.Router do
  use Bmrk.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bmrk do
    pipe_through :api
    resources "/bookmarks", BookmarkController, except: [:new, :edit]
  end
end
