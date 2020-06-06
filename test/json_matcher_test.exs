defmodule JSONMatcherTest do
  use ExUnit.Case
  doctest JSONMatcher

  test "greets the world" do
    assert JSONMatcher.hello() == :world
  end
end
