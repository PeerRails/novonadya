defmodule Novonadya do
  use Application

  def start(name) do
    #Should start Supervisor
    import Supervisor.Spec, warn: false
    IO.puts "starting"

    children = [
      worker(Novonadya.ReplyHandler, [])
    ]
    opts = [strategy: :one_for_one, name: name]
    Supervisor.start_link(children, opts)
  end
end
