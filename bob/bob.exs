defmodule Bob do

  def hey(input) do
    cond do
      is_yelling(input)  -> "Calm down, I know what I'm doing!"
      is_shouting(input) -> "Whoa, chill out!"
      is_asking(input)   -> "Sure."
      is_silent(input)   -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  def is_yelling(input) do
    String.upcase(input) == input
      && String.downcase(input) != input
      && String.ends_with?(input, "?")
  end

  def is_shouting(input) do
    String.upcase(input) == input
      && String.downcase(input) != input
  end

  def is_asking(input) do
    String.ends_with?(input, "?")
  end

  def is_silent(input) do
    String.trim(input) == ""
  end
end
