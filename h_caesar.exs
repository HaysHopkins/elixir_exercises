defmodule HCaesar do
  def caesar(str, offset), do: _caesar(str, offset)
  defp _caesar([], _offset), do: []
  defp _caesar([head | tail], offset), do: [_encrypt(head + offset) | _caesar(tail, offset)]

  defp _encrypt(code) when code > ?z do
    code - 26
  end

  defp _encrypt(code) do
    code
  end
end
