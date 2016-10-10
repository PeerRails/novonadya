defmodule Novonadya.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :chat_id, :integer
      add :title, :string
      timestamps
    end

    create index(:chats, [:chat_id], unique: true)
  end
end
