defmodule HListRecursion5 do
  def all?(list, fun), do: _all?(list, true, fun)
  defp _all?(_, applies, _) when not applies, do: false
  defp _all?([], _, _), do: true
  defp _all?([h|t], applies, fun), do: _all?(t, fun.(h), fun)

  def each(list, fun), do: _each(list, fun, [])
  defp _each([], _, acc), do: Enum.reverse acc
  defp _each([h|t], fun, acc), do: _each(t, fun, [fun.(h) | acc])

  # def split(), do: _split()

  # def filter(), do: _filter()

  # def take(), do: _take()
end
