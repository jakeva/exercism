defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """

  @nucleotides %{?A => ?U, ?C => ?G, ?G => ?C, ?T => ?A }

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &(@nucleotides[&1]))
  end
end
