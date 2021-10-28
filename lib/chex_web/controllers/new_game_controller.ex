defmodule ChexWeb.NewGameController do
  use ChexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _params) do
    case Chex.Game.create_game do
      {:ok, id} ->
        render(conn, "board.html", id: id)
      {:error, changeset} ->
        #render(conn, "errorplaceholder")
    end
  end
end
