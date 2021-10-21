defmodule Chex.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :positions, {:array, :string}

      timestamps()
    end

  end
end
