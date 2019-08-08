defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  # @spec numerals(pos_integer) :: String.t()

  def numerals(n) when n in 1000..3000, do: "M#{numerals(n-1000)}"
  def numerals(n) when n in 900..999,   do: "CM#{numerals(n-900)}"
  def numerals(n) when n in 500..899,   do: "D#{numerals(n-500)}"
  def numerals(n) when n in 400..499,   do: "CD#{numerals(n-400)}"
  def numerals(n) when n in 100..399,   do: "C#{numerals(n-100)}"
  def numerals(n) when n in 90..99,     do: "XC#{numerals(n-90)}"
  def numerals(n) when n in 50..89,     do: "L#{numerals(n-50)}"
  def numerals(n) when n in 40.. 49,    do: "XL#{numerals(n-40)}"
  def numerals(n) when n in 10..39,     do: "X#{numerals(n-10)}"
  def numerals(9),                      do: "IX"
  def numerals(n) when n in 5..8,       do: "V#{numerals(n-5)}"
  def numerals(4),                      do: "IV"
  def numerals(n) when n in 1..3,       do: "#{numerals(n-1)}I"
  def numerals(0),                      do: ""
end
