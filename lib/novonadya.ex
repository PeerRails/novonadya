defmodule Novonadya do
  use Application
  use Amnesia
  use Novodb

  def start(name, _) do
    #Should start Supervisor
    import Supervisor.Spec, warn: false

    Amnesia.start
    Novodb.wait

    children = [
      worker(Novonadya.Repo, [])
    ]
    opts = [strategy: :one_for_one, name: name]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Process message to either do nothing or reply to message
  """
  @spec proccess_update(Nadia.Model.Update) :: Boolean
  def proccess_update(update) do
    if update.message != nil, do: true, else: false
  end
end
