defmodule HFibonacci do
  def fibonacci(count) when not is_integer(count) do
    IO.puts "Must enter an integer"
  end

  def fibonacci(count) when count < 0 do
    IO.puts "Integer must be greater than 0"
  end

  def fibonacci(count) when count == 1 do
    1
  end

  def fibonacci(count) do
    fibonacci(count-1, 1, 1)
  end

  defp fibonacci(0, cur_num, last_num) do
    cur_num
  end

  defp fibonacci(count, cur_num, last_num) do
    fibonacci(count-1, cur_num + last_num, cur_num)
  end
end
