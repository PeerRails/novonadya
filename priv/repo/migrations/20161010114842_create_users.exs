defmodule Novonadya.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :chat_id, :integer
      add :accepted, :boolean
      timestamps
    end
  end
end
