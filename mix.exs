defmodule ApiPlugCowboy.MixProject do
  use Mix.Project

  def project do
    [
      app: :api_plug_cowboy,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug_cowboy],
      mod: {ApiPlugCowboy.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:ecto_sql, "~> 3.2"},
      {:myxql, "~> 0.2.9"},
      {:plug_cowboy, "~> 2.1"},
      {:poison, "~> 4.0"}
    ]
  end
end
