defmodule Novonadya.Mixfile do
  use Mix.Project

  def project do
    [app: :novonadya,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     aliases: aliases(),
     deps: deps]
  end

  def application do
    [applications: [:logger,:nadia, :sqlite_ecto, :ecto]]
  end

  defp deps do
    [{:nadia, "~> 0.4"},
     {:sqlite_ecto, "~> 1.0.0"}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate"],
    "ecto.reset": ["ecto.drop", "ecto.setup"],
    "test": ["ecto.create --quiet", "ecto.migrate --quiet", "test", "ecto.drop"]]
  end
end
