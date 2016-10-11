use Mix.Config

config :novonadya, Novonadya.Repo,
  adapter: Sqlite.Ecto,
  database: "/tmp/tmpfile",
  pool: Ecto.Adapters.SQL.Sandbox

config :nadia,
  token: "12345:9999"
