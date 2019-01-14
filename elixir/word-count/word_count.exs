defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> normalize
    |> scan
    |> count_words
  end

  defp normalize(sentence) do
    sentence |> String.downcase
  end

  defp scan(sentence) do
    Regex.scan(~r/[\pL\pN-]+/u, sentence) |> List.flatten
  end

  defp count_words(words) do
    words |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
