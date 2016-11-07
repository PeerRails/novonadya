defmodule Novonadya.ReplyHandlerTest do
  use ExUnit.Case, async: false
  alias Novonadya.Repo
  alias Novonadya.Chat
  use Amnesia

  @bot_reply Novonadya.ReplyHandler
  @update %Nadia.Model.Update{
    update_id: 777,
    chosen_inline_result: nil,
    inline_query: nil,
    message: %Nadia.Model.Message{
      chat: %Nadia.Model.Chat{
        id: -666,
        title: "testnadya",
        type: "group"
        },
      date: 1476101324,
      from: %Nadia.Model.User{
        first_name: "Nadya",
        id: 7,
        last_name: "Zlaya",
        username: "nadyabooot"
        },
      message_id: 2,
      reply_to_message: nil,
      text: "/start"
    }
  }

  setup context do
    {:ok, registry} = Novonadya.start(context.test)
    {:ok, registry: registry}
  end

  test "command /start in new chat" do
    @bot_reply.reply(@update)
    assert [@update.message.chat.id] == Chat
                    |> select([chat], chat.chat_id)
                    |> where([chat], chat.chat_id == ^@update.message.chat.id)
                    |> Repo.all
  end

  test "command /start in existing chat" do
    @bot_reply.reply(@update)
    assert [@update.message.chat.id] == Chat
                    |> select([chat], chat.chat_id)
                    |> where([chat], chat.chat_id == ^@update.message.chat.id)
                    |> Repo.all
  end

  test "command /stop in existing chat" do
    @bot_reply.reply(%{message: %{chat: %{id: -666}, text: "/stop"} })
    refute [@update.message.chat.id] == Chat
                    |> select([chat], chat.chat_id)
                    |> where([chat], chat.chat_id == ^@update.message.chat.id)
                    |> Repo.all
  end
end
