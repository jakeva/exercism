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
  
  @vowels ~w(a e i o u)

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&translate_word(&1, []))
    |> Enum.join(" ")
  end

  def translate_word(word = [first | rest], acc)
  when first in @vowels do
    "#{word}#{acc|>Enum.reverse}ay"
  end

  def translate_word(word = [first, second | _], _) 
  when first in ~w(x y) and second not in @vowels do
    "#{word}ay"
  end

  def translate_word(["q", "u" | rest], acc) do
    translate_word(rest, ["u", "q" | acc])
  end

  def translate_word([first | rest], acc) do
    translate_word(rest, [first | acc])
  end
end
