defmodule ChexWeb.NewGameController do
  use ChexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
