defmodule Chex.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chex.Repo

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

  def create_game do
    case Repo.insert(%Chex.Game{positions: ["start"]}) do
      {:ok, struct} -> {:ok, struct.id}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
