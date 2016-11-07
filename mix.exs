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
    [applications: [:logger,:nadia, :amnesia]]
  end

  defp deps do
    [{:nadia, "~> 0.4.1"},
     {:amnesia, "~> 0.2.5"},
     {:credo, "~> 0.4", only: [:dev, :test]}]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    ["db.setup": ["amnesia.create -db Novodb --disk"],
    "db.drop": ["amnesia.drop -db Novodb"],
    "db.reset": ["db.drop", "db.setup"],
    "test": ["db.setup", "test", "db.drop"]]
  end
end
