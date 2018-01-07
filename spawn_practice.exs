defmodule SpawnPractice do
  def run do
    betty = spawn(SpawnPractice, :betty, [])
    fred = spawn(SpawnPractice, :fred, [])

    send betty, {self(), "betty"}
    send fred,  {self(), "fred"}

    receive do
      {_, "betty"} -> IO.puts "Betty responded first"
      {_, "fred"} -> IO.puts "Fred responded first"
    end

    receive do
      {_, "betty"} -> IO.puts "Betty responded second"
      {_, "fred"} -> IO.puts "Fred responded second"
    end
  end

  def betty do
    receive do
      {sender, "betty"} ->
        send sender, {self(), "betty"}
    end
  end

  def fred do
    receive do
      {sender, "fred"} ->
        send sender, {self(), "fred"}
    end
  end
end
