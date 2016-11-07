use Amnesia

defdatabase Novodb do

    deftable Member, [:chat_id, :id, :name, :telegram_id, :screen_name], type: :bag do
      @type t :: %Member{id: String.t, chat_id: integer, name: String.t, telegram_id: integer}

    end

    deftable Chat, [:telegram_id, :name], type: :bag do
      @type t :: %Chat{telegram_id: integer, name: String.t}

      @doc """
      Add new chat
      """
      @spec add_chat(number, String.t) :: any
      def add_chat(chat_id, name) do
          Amnesia.transaction do
              %Chat{telegram_id: chat_id, name: name} |> Chat.write
          end
      end

      @doc """
      Delete chat
      """
      @spec delete_chat(number) :: any
      def delete_chat(chat_id) do
          Amnesia.transaction do
              Chat.delete(chat_id)
          end
      end

      @doc """
      select chat
      """
      @spec select_chat(number) :: any
      def select_chat(chat_id) do
          Amnesia.transaction do
              Chat.read(chat_id)
          end
      end

      @doc """
      List member of chat from chat_id
      """
      @spec list_members(number) :: any
      def list_members(chat_id) do
          Amnesia.transaction do
              Member.read(chat_id)
          end
      end

      @doc """
      Add new Member
      """
      @spec add_member(number, number, String.t, String.t) :: any
      def add_member(chat_id, telegram_id, name, screen_name) do
          Amnesia.transaction do
              id = Integer.to_string(telegram_id) <> "@" <> Integer.to_string(chat_id)
              %Member{id: id, chat_id: chat_id, telegram_id: telegram_id, name: name, screen_name: screen_name} |> Member.write
          end
      end

      @doc """
      Find target member with screen_name
      """
      @spec show_member(number, String.t) :: any
      def show_member(chat_id, screen_name) do
          list = Chat.list_members(chat_id)
          member =  Enum.find(list, &(&1.screen_name == screen_name))
          member
      end

      def add_members do
          Chat.add_member(1, 1, "admin", "admin")
          Chat.add_member(1, 2, "noadmin", "noadmin")
          Chat.add_member(1, 3, "krisa", "krisa")
      end

      @doc """
      Remove Member
      """
      @spec remove_member(number, String.t) :: any
      def remove_member(chat_id, screen_name) do
          Amnesia.transaction do
              Chat.show_member(chat_id, screen_name) |> Member.delete
          end
      end

      @doc """
      Remove Members from Chat list
      """
      @spec clear_list(number) :: any
      def clear_list(chat_id) do
          Amnesia.transaction do
              Member.delete(chat_id)
          end
      end
    end

    deftable Greeting

end
