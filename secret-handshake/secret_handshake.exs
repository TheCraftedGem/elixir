require IEx

defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  # @spec commands(code :: integer) :: list(String.t())



  def commands(1) do
    ["wink"]
  end

  def commands(2) do
    ["double blink"]
  end


  def commands(3) do
    commands(1) ++ commands(2)
  end

  def commands(4) do
    ["close your eyes"]
  end

  def commands(8) do
    ["jump"]
  end

  def commands(19)
    List.
  end

  def commands(code) do
    commands(code &&& 1)

    commands(code &&& 2)
    commands(code &&& 4)
    commands(code &&& 8)
    commands(code &&& 19)
  end






end
