defmodule TestSpaceTest do
  use ExUnit.Case
  doctest TestSpace

  test "greets the world" do
    assert TestSpace.hello() == :world
  end
end
