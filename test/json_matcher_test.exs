defmodule JSONMatcherTest do
  use ExUnit.Case

  test "matches JSON when key and value are found" do
    json = %{
      name: "John",
      surname: "Doe",
      age: 30,
    }

    pattern = %{age: 30}

    assert JSONMatcher.match(pattern, json) == true
  end
end
