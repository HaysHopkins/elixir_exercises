defmodule HEveryOtherD do
  def every_other_d(file) do
    file_contents(file)
    |> String.split("\n\n")
    |> Stream.reject(&String.first(&1) != "d")
    |> Stream.take_every(2)
    |> Stream.map(&String.capitalize(&1))
    |> Enum.sort(&(byte_size(&1) > byte_size(&2)))
  end

  defp file_contents(file) do
    {_, words} = File.read(file)
    words
  end
end
