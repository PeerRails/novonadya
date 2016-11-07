defmodule Novonadya.ReplyHandler do

  @doc """
  Start proccessing messages in chat by command
  """
  @spec reply({atom, any}) :: Boolean
  def reply(%{"message": %{"text": "/start", "chat": %{"id": id, "title": title}}}) do
    IO.puts id
    IO.puts title
    #case result do
    #  true -> Novonadya.Repo.insert chat
    #  _ -> IO.puts title
    #end
  end

  @doc """
  Stop proccessing messages in chat by command
  """
  @spec reply({atom, any}) :: Boolean
  def reply(%{"message": %{"text": "/stop", "chat": %{"id": id}}}) do
    IO.puts id
    IO.puts "Delete"
    #case result do
    #  false -> Novonadya.Repo.delete chat.id
    #  _ -> IO.puts id
    #end
  end

end
