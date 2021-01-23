defmodule Chex.Repo do
  use Ecto.Repo,
    otp_app: :chex,
    adapter: Ecto.Adapters.Postgres
end
