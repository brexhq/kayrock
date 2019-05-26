defmodule Kayrock.MixProject do
  use Mix.Project

  def project do
    [
      app: :kayrock,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kafka_ex, "~> 0.10.0"},
      {:kafka_protocol, "~> 2.2.7"},
      {:connection, "~>1.0.4"},
      {:credo, "~>1.0.5", only: [:dev, :test]},
      {:snappy, git: "https://github.com/fdmanana/snappy-erlang-nif", only: [:test]},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false},
      {:ex_doc, "~>0.20.2", only: [:dev], runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "generated_code"]
  defp elixirc_paths(_), do: ["lib"]
end