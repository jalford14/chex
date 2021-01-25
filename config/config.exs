use Mix.Config

config :chex,
  ecto_repos: [Chex.Repo]

config :chex, ChexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pfMi/Y8jviEB3/LKPIAcU71+9i7oh084UOelaQJKjLaMT+NYRYDKZrhXvlfhIEHS",
  render_errors: [view: ChexWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chex.PubSub,
  live_view: [signing_salt: "9QiOXXM8"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
