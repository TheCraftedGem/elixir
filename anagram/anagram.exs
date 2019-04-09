defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates), do: for x <- candidates, (fingerprint(x) == fingerprint(base)) && (String.downcase(base) != String.downcase(x)), do: x

  defp fingerprint(base) do
    String.downcase(base)
    |> String.to_charlist
    |> Enum.sort
  end

end
