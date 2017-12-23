defmodule HMapSum do
  def mapsum(list, fun), do: _mapsum(list, fun)
  defp _mapsum([], _fun), do: 0
  defp _mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)
end
