defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  def count(strand, nucleotide) do
    Enum.count(strand, fn e -> e == nucleotide end)
  end

  defp initial_histogram() do
    %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
  end

  def histogram(strand) do
    histogram = initial_histogram()
    Enum.reduce(strand, histogram, &update_histogram/2)
  end

  def update_histogram(nucleotide, histogram) do
    Map.update!(histogram, nucleotide, &(&1 + 1))
  end
end
