defmodule Novonadya.Repo.Migrations.CreateSpeeches do
  use Ecto.Migration

  def change do
    create table(:speeches) do
      add :chat_id, :integer
      add :text, :string
      timestamps
    end
  end
end
