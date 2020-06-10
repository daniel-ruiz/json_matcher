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

    test "matches JSON when all key-value pairs in pattern are in the target" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
        is_smoker: false
      }

      pattern = %{
        name: "John",
        is_smoker: false,
        age: 30
      }

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

    test "does not match JSON when several keys are not found" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
        is_smoker: false
      }

      pattern = %{
        name: "John",
        this_key: "is not found",
        exists_in_json: false
      }

      assert JSONMatcher.match(pattern, json) == false
    end

    test "does not match JSON when pattern key is found but not its value" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
      }

      assert JSONMatcher.match(%{surname: "Johnson"}, json) == false
    end

    test "does not match JSON when pattern has several different values" do
      json = %{
        name: "John",
        surname: "Doe",
        age: 30,
        is_smoker: false
      }

      pattern = %{
        name: "Jane",
        surname: "Doe",
        is_smoker: true
      }

      assert JSONMatcher.match(pattern, json) == false
    end
  end
end
