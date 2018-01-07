defmodule HListRecursion5Hard do
  def  flatten(list),                        do: _flatten(list, [])
  defp _flatten([], acc),                    do: Enum.reverse(acc)
  defp _flatten([h|t], acc) when is_list(h), do: _flatten(t, Enum.reverse(_flatten(h, [])) ++ acc)
  defp _flatten([h|t], acc),                 do: _flatten(t, [h|acc])
end
