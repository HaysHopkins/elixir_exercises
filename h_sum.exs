
defmodule HSum do
  def sum(list) do
    sum(list, 0)
  end

  defp sum([], total) do
    total
  end

  defp sum([h|t], total) do
    sum(t, total + h)
  end
end

defmodule HReduce do
  def reduce(list, acc, fun) do
    h, t = list[h|t]
    result = fun.(h, acc)
    reduce(t, result, fun)
  end

  defp reduce([], acc, fun) do
    acc
  end
end


defmodule HFibonacci do
  def fibonacci(count) when is_number(count) do
    case count do
      count > 0 -> fibonacci(count, 1)
      other     -> IO.puts "Must enter a number that is greater than 0"
    end
  end

  def fibonacci(count) do
    IO.puts "Must enter a number"
  end

  defp fibonnaci(0, count, last_num)
    IO.puts to_string(last_num)
  end

  defp fibonacci(count, last_num)
    IO.puts to_string()
  end
end

