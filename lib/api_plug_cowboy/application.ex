defmodule ApiPlugCowboy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc "OTP Application specification for API PlugCowboy"

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ApiPlugCowboy.Worker.start_link(arg)
      # {ApiPlugCowboy.Worker, arg},
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ApiPlugCowboy.Endpoint,
        options: [port: Application.get_env(:api_plug_cowboy, :port)]
      ),
      {ApiPlugCowboy.Repo, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiPlugCowboy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
