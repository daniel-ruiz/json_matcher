defmodule JSONMatcher do
  def match(pattern, target) do
    pattern
    |> Enum.map(fn pair -> is_pair_included?(target, pair) end)
    |> Enum.all?
  end

  defp is_pair_included?(target, {key, value}) do
    Map.has_key?(target, key) and target[key] == value
  end
end
