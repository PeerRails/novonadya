defmodule Novonadya.ReplyHandlerTest do
  use ExUnit.Case, async: false
  use Amnesia
  use Novodb

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
    chat_id = @update.message.chat.id
    assert [chat_id] == Chat.select_chat(chat_id).chat_id
  end

  test "command /start in existing chat should not create new record" do
    @bot_reply.reply(@update)
    chat_id = @update.message.chat.id
    assert length(Chat.select_chat(chat_id)) == 1
  end

  test "command /stop in existing chat" do
    @bot_reply.reply(%{message: %{chat: %{id: -666}, text: "/stop"} })
    chat_id = -666
    assert is_nil(Chat.select_chat(-666)) == true
  end
end
