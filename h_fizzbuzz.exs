defmodule HFizzBuzz do
  def remainder_buzz(n) do
    calculate(rem(n,3), rem(n,5), n)
  end

  def calculate(0, 0, _) do
    "FizzBuzz"
  end

  def calculate(0, _, _) do
    "Fizz"
  end

  def calculate(_, 0, _) do
    "Buzz"
  end

  def calculate(_, _, c) do
    c
  end
end
