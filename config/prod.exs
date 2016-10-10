use Mix.Config

config :novonadya, Novonadya.Repo,
  adapter: Sqlite.Ecto,
  database: "db/novonadya_prod.db"

config :nadia,
  token: System.get_env("BOTTOKEN")
