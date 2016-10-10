use Mix.Config

config :novonadya, Novonadya.Repo,
  adapter: Sqlite.Ecto,
  database: "db/novonadya_dev.db"

config :nadia,
  token: System.get_env("BOTTOKEN")
