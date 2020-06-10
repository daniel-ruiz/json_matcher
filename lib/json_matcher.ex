defmodule JSONMatcher do
  def match(pattern, json) do
    pattern
    |> Enum.map(fn {key, value} -> Map.has_key?(json, key) and json[key] == value end)
    |> Enum.all?
  end
end
