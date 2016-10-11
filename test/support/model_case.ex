defmodule Novonadya.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Novonadya.Repo
      import Ecto.Changeset
      import Ecto.Query
      import Novonadya.ModelCase
    end
  end

end
