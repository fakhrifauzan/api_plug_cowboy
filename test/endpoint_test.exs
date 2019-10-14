defmodule ApiPlugCowboy.EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts ApiPlugCowboy.Endpoint.init([])

  test "ping" do
    # Create a test connection
    conn = conn(:get, "/ping")

    # Invoke the plug
    conn = ApiPlugCowboy.Endpoint.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "invalid routes" do
    conn = conn(:get, "/error")
    conn = ApiPlugCowboy.Endpoint.call(conn, @opts)
    assert conn.status == 404
  end

  test "valid book payload" do
    conn = conn(:post, "/books", %{books: [%{}]})
    conn = ApiPlugCowboy.Endpoint.call(conn, @opts)
    assert conn.status == 200
  end

  test "invalid book payload" do
    conn = conn(:post, "/books", %{})
    conn = ApiPlugCowboy.Endpoint.call(conn, @opts)
    assert conn.status == 422
  end

end