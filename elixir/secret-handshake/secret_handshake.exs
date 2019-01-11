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
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = collect(["wink", "double blink", "close your eyes", "jump"], code, [])
    case code > 16 do
      true -> result
      false -> Enum.reverse(result)
    end
  end

  defp collect([], code, acc) do
    acc
  end

  defp collect([head | tail], code, acc) do
    case code &&& 1 do
      1 -> collect(tail, code >>> 1, [head | acc])
      _ -> collect(tail, code >>> 1, acc)
    end
  end
end
