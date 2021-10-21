defmodule Chex.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :positions, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:positions])
    |> validate_required([:positions])
  end
end
