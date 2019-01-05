defmodule Bob do
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      question?(input) && !(text?(input) && uppercase?(input)) -> "Sure."
      question?(input) && uppercase?(input) -> "Calm down, I know what I'm doing!"
      text?(input) && uppercase?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp text?(input) do
    String.upcase(input) != String.downcase(input)
  end

  defp empty?(input) do
    input |> String.trim() == ""
  end

  defp uppercase?(input) do
    String.upcase(input) == input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
