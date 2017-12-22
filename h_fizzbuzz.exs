defmodule HFizzBuzz do
  def calculate(0, 0, _) do
    "FizzBuzz"
  end

  def calculate(0, _, _) do
    "Fizz"
  end

  def calculate(_, 0, _) do
    "Buzz"
  end
end
