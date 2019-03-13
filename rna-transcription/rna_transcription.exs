defmodule RNATranscription do

  def to_rna(?A), do: ?U
  def to_rna(?G), do: ?C
  def to_rna(?T), do: ?A
  def to_rna(?C), do: ?G

  def to_rna(dna), do: Enum.map(dna, fn e -> to_rna(e) end)
end
