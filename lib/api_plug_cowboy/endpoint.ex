defmodule ApiPlugCowboy.Endpoint do
  @moduledoc false

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  plug(
    Plug.Parsers,
    parsers: [:json],
    json_decoder: Poison
  )

  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  post "/books" do
    {status, body} =
      case conn.body_params do
         %{"books" => books} -> {200, process_books(books)}
         _ -> {422, missing_books()}
      end
    send_resp(conn, status, body)
  end

  defp process_books(books) when is_list(books) do
    Poison.encode!(%{response: "Received Events!"})
  end

  defp process_books(_) do
    Poison.encode!(%{response: "Please Send Some Books!"})
  end

  defp missing_books do
    Poison.encode!(%{error: "Expected Payload: { 'books': [...] }"})
  end

  match _ do
    send_resp(conn, 404, "Oops... Nothing here :(")
  end

end