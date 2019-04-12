defmodule Anagram do
  def match(base, candidates), do: for x <- candidates,
    filter(base, x), fingerprint(x) == fingerprint(base), do: x

  defp fingerprint(base),
    do: String.downcase(base) |> String.to_charlist() |> Enum.sort

  defp filter(candidate, base),
    do: String.downcase(candidate) != String.downcase(base)
end
