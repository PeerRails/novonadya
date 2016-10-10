defmodule Novonadya.MainTest do
  use ExUnit.Case

  @bot Novonadya
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
      text: "слышь"
    }
  }


  #@message %Nadia.Model.Message{}
  #@user %Nadia.Model.User{}
  #@chat %Nadia.Model.Chat.{}
  #@income nil

  test "welcome" do
    assert Novonadya.hello == "hello"
  end

  test "start" do
    assert true != false
  end

  test "proccess Telegram Message" do
    assert @bot.proccess_update(@update) == true
  end
end
