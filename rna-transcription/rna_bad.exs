defmodule RNATranscription do

  def to_rna(dna) do
    cond do
      is_lis(dna) ->  iter(dna)
      single_g(dna) -> 'C'
      single_c(dna) -> 'G'
      single_t(dna) -> 'A'
      single_a(dna) -> 'U'
    end
  end

  def is_lis(dna) do
    str = List.to_string(dna)
    String.length(str) > 1
  end

  def iter(dna) do
    strr  = List.to_string(dna)
    char_arr = String.split(strr, "", trim: true)
    Enum.map(char_arr, fn l -> translate(l) end)
    |> List.to_charlist
  end

  def translate(char) do
    cond do
      is_g(char) -> 'C'
      is_c(char) -> 'G'
      is_t(char) -> 'A'
      is_a(char) -> 'U'
    end
  end

  def is_g(dna) do
    String.contains?(dna, "G")
  end

  def single_g(dna) do
    str = List.to_string(dna)
    String.contains?(str, "G")
  end


  def is_c(dna) do
    String.contains?(dna, "C")
  end

  def single_c(dna) do
    str = List.to_string(dna)
    String.contains?(str, "C")
  end


  def is_t(dna) do
    String.contains?(dna, "T")
  end

  def single_t(dna) do
    str = List.to_string(dna)
    String.contains?(str, "T")
  end


  def is_a(dna) do
    String.contains?(dna, "A")
  end

  def single_a(dna) do
    str = List.to_string(dna)
    String.contains?(str, "A")
  end
end
