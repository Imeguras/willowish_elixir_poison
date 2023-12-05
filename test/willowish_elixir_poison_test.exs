defmodule WillowishElixirPoisonTest do
  use ExUnit.Case
  doctest WillowishElixirPoison

  test "greets the world" do
    assert WillowishElixirPoison.hello() == :world
  end
end
