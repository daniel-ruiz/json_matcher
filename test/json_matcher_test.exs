defmodule JSONMatcherTest do
  use ExUnit.Case

  describe "JSONMatcher" do
    test "matches JSON when key and value are found" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30
      }

      pattern = %{age: 30}

      assert JSONMatcher.match(pattern, json) == true
    end

    test "does not match JSON when key is not found" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
      }

      assert JSONMatcher.match(%{gender: "male"}, json) == false
    end

    test "does not match JSON when pattern key is found but not its value" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
      }

      assert JSONMatcher.match(%{surname: "Johnson"}, json) == false
    end
  end
end
