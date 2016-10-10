defmodule Novonadya.Mixfile do
  use Mix.Project

  def project do
    [app: :novonadya,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger,:nadia, :sqlite_ecto, :ecto]]
  end

  defp deps do
    [{:nadia, "~> 0.4"},
     {:sqlite_ecto, "~> 1.0.0"}]
  end
end
