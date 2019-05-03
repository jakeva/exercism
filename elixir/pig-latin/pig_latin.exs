defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  
  @vowels ['a', 'e', 'i', 'o', 'u']
  
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&(translate_word(&1)))
    |> Enum.join(" ")
  end
  
  def translate_word(word) do
    [first | rest] = word |> to_charlist()
    case first do 
      c when [c] in @vowels ->
        [first] ++ rest ++ 'ay'
      c when [c] == 'y' or [c] == 'x'->
        handle_x_and_y_Words(first, rest)
      _ ->
        translate([first], rest)
    end |> List.to_string()
  end

  defp translate(consonants, [first | rest]) do
    case should_treat_as_consonant(first, consonants) do
      true ->
        translate(consonants ++ [first], rest)
      _ ->
        [first] ++ rest ++ consonants ++ 'ay'
    end
  end

  defp handle_x_and_y_Words(first, rest) do
    [next | _] = rest
      case consonant?(next) do
        true -> [first] ++ rest ++ 'ay'
        _ -> translate([first], rest)
    end 
  end

  defp should_treat_as_consonant(letter, consonants) do
    consonant?(letter) or is_qu_word?(letter, consonants) 
  end

  defp consonant?(letter) do
    [letter] not in @vowels
  end

  defp is_qu_word?(letter, consonants) do
    [letter] == 'u' and [consonants |> List.last()] == 'q'
  end
end
