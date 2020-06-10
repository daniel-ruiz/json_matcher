defmodule JSONMatcherTest do
  use ExUnit.Case

  @target_json %{
    name: "John",
    surname: "Doe",
    age: 30,
    is_smoker: false
  }

  describe "JSONMatcher" do
    test "matches JSON when key and value are found" do
      pattern = %{age: 30}

      assert JSONMatcher.match(pattern, @target_json) == true
    end

    test "matches JSON when all key-value pairs in pattern are in the target" do
      pattern = %{
        name: "John",
        is_smoker: false,
        age: 30
      }

      assert JSONMatcher.match(pattern, @target_json) == true
    end

    test "does not match JSON when key is not found" do
      pattern = %{gender: "male"}

      assert JSONMatcher.match(pattern, @target_json) == false
    end

    test "does not match JSON when several keys are not found" do
      pattern = %{
        name: "John",
        this_key: "is not found",
        exists_in_json: false
      }

      assert JSONMatcher.match(pattern, @target_json) == false
    end

    test "does not match JSON when pattern key is found but not its value" do
      pattern = %{surname: "Johnson"}

      assert JSONMatcher.match(pattern, @target_json) == false
    end

    test "does not match JSON when pattern has several different values" do
      pattern = %{
        name: "Jane",
        surname: "Doe",
        is_smoker: true
      }

      assert JSONMatcher.match(pattern, @target_json) == false
    end
  end
end
