defmodule Novonadya.Repo do
  use Ecto.Repo, otp_app: :novonadya, adapter: Sqlite.Ecto
end
