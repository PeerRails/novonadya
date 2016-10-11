defmodule Novonadya.Chat do
  use Ecto.Model

  schema "chats" do
    field :chat_id, :integer
    field :title, :string


    timestamps
  end

  @doc """
  Build a changeset based on the `struct` and `params`
  """
  def changeset(chat, params \\ :empty) do
    chat
    |> Ecto.Changeset.cast(params, [:chat_id, :title], ~w(chat_id))
    |> Ecto.Changeset.unique_constraint(:chat_id)
  end
end
