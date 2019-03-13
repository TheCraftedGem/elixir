defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  # @spec numerals(pos_integer) :: String.t()
  def numerals(1) do
    "I"
  end

  def numerals(2) do
    "II"
  end

  def numerals(3) do
    "III"
  end
end
