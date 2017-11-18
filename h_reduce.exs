defmodule HReduce do
  def reduce([], acc, fun) do
    acc
  end

  def reduce(list, acc, fun) do
    [h|t] = list
    result = fun.(h, acc)
    reduce(t, result, fun)
  end
end
