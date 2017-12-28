defmodule HListRecursion5 do
  def  all?(list, fun),                       do: _all?(list, true, fun)
  defp _all?(_, applies, _) when not applies, do: false
  defp _all?([], _, _),                       do: true
  defp _all?([h|t], _, fun),                  do: _all?(t, fun.(h), fun)

  def  each(list, fun),        do: _each(list, fun, [])
  defp _each([], _, acc),      do: Enum.reverse acc
  defp _each([h|t], fun, acc), do: _each(t, fun, [fun.(h) | acc])

  def  split(list, amount),        do: _split(list, amount, [])
  defp _split([], _, acc),         do: { Enum.reverse(acc), [] }
  defp _split(list, 0, acc),       do: { Enum.reverse(acc), list }
  defp _split([h|t], amount, acc), do: _split(t, amount-1, [h|acc])

  def  filter(list, fun),   do: _filter(list, fun, acc)
  defp _filter([], _, acc), do: acc
  defp _filter([h|t], fun, acc) do
    if fun.(h) do
      _filter(t, fun, [h|acc])
    else
      _filter(t, fun, acc)
    end
  end

  def  take(list, amount),        do: _take(list, amount, [])
  defp _take(_, 0, acc),          do: Enum.reverse acc
  defp _take([h|t], amount, acc), do: _take(t, amount-1, [h|acc])
end
