defmodule ChexWeb.BoardLive do
  use ChexWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, position: "start")}
  end

  @impl true
  def handle_event("board-update", value, socket) do
    {:noreply, assign(socket, position: value)}
  end

  def render(assigns) do
    ~L"""
    <chess-board
        id="board"
        phx-hook="MoveMade"
        style="width: 600px; margin: auto;"
        position="<%= @position %>"
        draggable-pieces>
    </chess-board>
    """
  end

  defp search(query) do
    if not ChexWeb.Endpoint.config(:code_reloader) do
      raise "action disabled when not in development"
    end

    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end
end
