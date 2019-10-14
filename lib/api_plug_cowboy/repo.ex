defmodule ApiPlugCowboy.Repo do
  use Ecto.Repo,
    otp_app: :api_plug_cowboy,
    adapter: Ecto.Adapters.MyXQL
end
