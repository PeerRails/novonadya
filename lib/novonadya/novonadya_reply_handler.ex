defmodule Novonadya.ReplyHandler do

  @doc """
  Start proccessing messages in chat by command
  """
  @spec reply({atom, any}) :: Boolean
  def reply(%{"message": %{"text": "/start", "chat": %{"id": id, "title": title}}}) do
    chat = %Novonadya.Chat{chat_id: id, title: title}
    result = Novonadya.Chat |> Novonadya.Repo.get_by(chat_id: id) |> is_nil
    case result do
      true -> Novonadya.Repo.insert chat
      _ -> IO.puts "Error"
    end
  end
end
