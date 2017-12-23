defmodule HMaxList do
  def max(list), do: _max(list, 0)
  defp _max([], cur), do: cur
  defp _max([head | tail], cur) when head > cur, do: _max(tail, head)
  defp _max([_head | tail], cur), do: _max(tail, cur)
end
