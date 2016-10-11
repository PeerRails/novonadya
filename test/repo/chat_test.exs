defmodule Novonadya.ChatRepoTest do
  use ExUnit.Case
  use Novonadya.ModelCase

  alias Novonadya.Chat

  @valid_attrs %{chat_id: -666, title: "testroom"}
  @invalid_attrs %{chat: -666, name: ""}

  test "changeset with valid attributes" do
    changeset = Chat.changeset(%Chat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chat.changeset(%Chat{}, @invalid_attrs)
    refute changeset.valid?
  end

end
