defmodule ApiPlugCowboyTest do
  use ExUnit.Case
  doctest ApiPlugCowboy

  test "greets the world" do
    assert ApiPlugCowboy.hello() == :world
  end
end
