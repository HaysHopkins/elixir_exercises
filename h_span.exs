defmodule HSpan do
  def span(list, from, to), do: _span(list, from, to)
  defp _span([], _from, _to), do: []

  defp _span([head|tail], from, to) when head >= from and head <= to  do
    [head] ++ _span(tail, from, to)
  end

  defp _span([_head|tail], from, to) do
    _span(tail, from, to)
  end
end
