defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  defp initial_histogram(), do:
    %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  def count(strand, nucleotide), do:
    Enum.count(strand, fn e -> e == nucleotide end)

  def histogram(strand), do:
    Enum.reduce(strand, initial_histogram(), &update_histogram/2)

  def update_histogram(nucleotide, histogram), do:
    Map.update!(histogram, nucleotide, &(&1 + 1))
end
