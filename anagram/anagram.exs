defmodule Anagram do

  def match(base, candidates), do: for x <- candidates,
    (fingerprint(x) == fingerprint(base)) && (String.downcase(base) != String.downcase(x)), do: x

  defp fingerprint(base), do: String.downcase(base) |> String.to_charlist |> Enum.sort

end
