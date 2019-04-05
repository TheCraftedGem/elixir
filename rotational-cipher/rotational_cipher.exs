defmodule RotationalCipher do

  def rotate(text, shift) do
    text
      |> String.split(~r{[^\w]+})
      |> String.to_charlist()
      |> Enum.map( fn char -> 97 + rem( char - 71 + shift, 26 ) end )
      |> to_string()
  end
end
