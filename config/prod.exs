use Mix.Config

config :bmrk, Bmrk.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "bmrk.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :bmrk, Bmrk.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

config :logger, level: :debug
