defmodule HFibonacci do

  def start(n) do
    start = :os.system_time(:seconds)
    fibonacciNumber = fibonacci(n)
    finish = :os.system_time(:seconds)
    totalTime = finish - start
    IO.puts "The fibonacciNumber was #{fibonacciNumber}."
    IO.puts "Fibonacci for number placed #{n} finished in #{totalTime} seconds!"
  end

  def fibonacci(count) when count < 0, do: raise "Must use a non-negative number"
  def fibonacci(count), do: fibonacci(count, 1, 0)
  defp fibonacci(0, _, result), do: result
  defp fibonacci(count, next, result), do: fibonacci(count-1, next + result, next)
end
