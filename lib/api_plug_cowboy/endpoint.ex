defmodule ApiPlugCowboy.Endpoint do
  @moduledoc false

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  alias ApiPlugCowboy.Books

  plug(
    Plug.Parsers,
    parsers: [:json],
    json_decoder: Poison
  )

  plug(:dispatch)

  get "/ping" do
    respond_with_result(conn, {200, "pong"})
  end

  post "/books-old" do
    {status, body} =
      case conn.body_params do
         %{"books" => books} -> {200, process_books(books)}
         _ -> {422, missing_books()}
      end
    send_resp(conn, status, body)
  end

  get "/books" do
    respond_with_result(conn, Books.index)
  end

  post "/books" do
    respond_with_result(conn, Books.create(conn.params))
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

  # ref : https://stackoverflow.com/questions/46443781/how-to-avoid-json-decoding-in-phoenix-while-sending-json-response
  def respond_with_result(conn, {status_code, result}) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      status_code,
      result |> Poison.encode!()
    )
  end

end