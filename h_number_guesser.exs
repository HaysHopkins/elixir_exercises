defmodule HNumberGuesser do
  def guess(n, range) do
    guess = calculate_guess(Enum.max(range), Enum.min(range))
    cond do
      guess < n -> guess(n, guess, Enum.max(range))
      guess > n -> guess(n, guess, Enum.min(range))
      guess == n -> guess
    end
  end

  defp guess(n, prev_guess, prev_min) when prev_guess > n do
    guess = calculate_guess(prev_guess, prev_min)
    cond do
      guess < n -> guess(n, guess, prev_guess)
      guess > n -> guess(n, guess, prev_min)
      guess == n -> n
    end
  end

  defp guess(n, prev_guess, prev_max) when prev_guess < n do
    guess = calculate_guess(prev_max, prev_guess)
    cond do
      guess < n -> guess(n, guess, prev_max)
      guess > n -> guess(n, guess, prev_guess)
      guess == n -> n
    end
  end

  defp calculate_guess(max, min) do
    max - div(max - min, 2)
  end
end
