defmodule Novonadya.ChatRepoTest do
  use Novonadya.ModelCase
  alias Novonadya.Chat
  alias Novonadya.Repo

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

  test "save chat to database" do
    chat = Chat.changeset(%Chat{}, @valid_attrs)
    |> Repo.delete!
    case Chat.save(@valid_attrs) do
       {:ok, chat} -> assert true
       {:error, changeset} -> IO.puts changeset
    end
  end

end
