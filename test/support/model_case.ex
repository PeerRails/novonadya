defmodule Novonadya.ModelCase do
  use ExUnit.CaseTemplate, async: true

  using do
    quote do
      alias Novonadya.Repo
      import Ecto.Changeset
      import Ecto.Query
      import Novonadya.ModelCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Novonadya.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Novonadya.Repo, {:shared, self()})
    end
    :ok
  end

end
