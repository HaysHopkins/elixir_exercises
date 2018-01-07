defmodule HPrimeNumbers do

  def prime_numbers(n), do: _prime_numbers(n)
  defp _prime_numbers(n) do
    for x <- 1..n, _is_prime?(x), do: x
  end

  defp _is_prime?(x) do
    range = 2..(Integer.floor_div(x,2) + 1)
    Enum.all?(range, fn y -> rem(x, y) !== 0 end)
  end
end
