defmodule ChexWeb.BoardLive do
  use ChexWeb, :live_view

  alias Chex.Repo
  alias Chex.Game

  @impl true
  def mount(%{"game_id" => game_id} = params, _session, socket) do
    topic = "game-#{game_id}"
    ChexWeb.Endpoint.subscribe(topic)

    case Repo.get(Game, game_id) do
      game ->
        {:ok, assign(socket, position: List.last(game.positions), topic: topic)}

      nil ->
        {:ok, assign(socket, error: "can't find game")}
    end
  end

  @impl true
  def handle_event("board-update", %{"new_position" => fen}, socket) do
    state = %{position: fen}
    # Currently, we can create a new game and read its position
    # We need to leverage this function to update the game with each new
    # position when the 'board-update' event occurs
    ChexWeb.Endpoint.broadcast_from(self(), socket.assigns[:topic], fen, state)
    {:noreply, assign(socket, state)}
  end

  @impl true
  def handle_event("reset", _value, socket) do
    {:noreply, assign(socket, position: "start")}
  end

  @impl true
  def handle_info(%{payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end

  def render(assigns) do
    ChexWeb.NewGameView.render("board.html", assigns)
  end
end
