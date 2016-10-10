defmodule Novonadya.ReplyHandlerTest do
  use ExUnit.Case
  alias Novonadya.Repo
  alias Novonadya.Chat
  import Ecto.Query

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

  setup_all do
    {:ok, pid} = Novonadya.start(nil, nil)
    {:ok, [pid: pid]}
  end

  test "command /start in new chat" do
    @bot_reply.reply(@update)
    assert [@update.message.chat.id] == Chat
                    |> select([chat], chat.chat_id)
                    |> where([chat], chat.chat_id == ^@update.message.chat.id)
                    |> Repo.all
  end
end
