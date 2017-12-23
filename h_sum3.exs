defmodule HSum3 do
  def sum(list), do: _sum(list)
  defp _sum([]), do: 0
  defp _sum([head|tail]), do: head + sum(tail)
end
