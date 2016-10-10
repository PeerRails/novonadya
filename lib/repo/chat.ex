defmodule Novonadya.Chat do
  use Ecto.Model

  schema "chats" do
    field :chat_id, :integer
    field :title, :string
    timestamps
  end
end
