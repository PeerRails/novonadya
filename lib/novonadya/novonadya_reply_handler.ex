defmodule Novonadya.ReplyHandler do

  alias Novonadya.Chat

  @doc """
  Start proccessing messages in chat by command
  """
  @spec reply({atom, any}) :: Boolean
  def reply(%{"message": %{"text": "/start", "chat": %{"id": id, "title": title}}}) do
    chat = Chat.changeset(%Chat{}, %{chat_id: id, title: title})
    result = if chat.valid?, do: Chat |> Novonadya.Repo.get_by(chat_id: id) |> is_nil, else: false
    case result do
      true -> Novonadya.Repo.insert chat
      _ -> IO.puts "Error"
    end
  end

  @doc """
  Stop proccessing messages in chat by command
  """
  @spec reply({atom, any}) :: Boolean
  def reply(%{"message": %{"text": "/stop", "chat": %{"id": id}}}) do
    chat = Chat.changeset(%Chat{}, %{chat_id: id})
    result = if chat.valid?, do: Chat |> Novonadya.Repo.get_by(chat_id: id) |> is_nil, else: true
    case result do
      false -> Novonadya.Repo.delete chat.id
      _ -> IO.puts "Error"
    end
  end

end
