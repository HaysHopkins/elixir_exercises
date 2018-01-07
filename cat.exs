defmodule CatCounter do
  def cat(scheduler) do
    send scheduler, { :ready, self() }
    receive do
      { :cat, words, client } ->
        send client, { :answer, cat_calc(words, 0), self() }
        cat(scheduler)
      { :shutdown } ->
        exit(:normal)
    end
  end

  defp cat_calc([], acc), do: acc
  defp cat_calc([h|t], acc) when h == "cat", do: cat_calc(t, acc+1)
  defp cat_calc([_|t], acc), do: cat_calc(t, acc)
end

defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [ next | tail ] = queue
        send pid, {:cat, next, self()}
        schedule_processes(processes, tail, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results)
        else
          Enum.sort(results, fn {n1,_}, {n2,_} -> n1 <= n2 end)
        end

      {:answer, number, result, _pid} ->
        schedule_processes(processes, queue, [ {number, result} | results ])
    end
  end
end


File.cd! "texts"
to_process = File.ls!
              |> Enum.reject(fn(el) -> String.first(el) == "." end)
              |> Enum.map(&File.read!/1)
              |> List.duplicate(20)

Enum.each 1..10, fn num_processes ->
  {time, result} = :timer.tc(
      Scheduler, :run,
      [num_processes, CatCounter, :cat, to_process]
  )

  if num_processes == 1 do
    IO.puts inspect result
    IO.puts "\n #  time (s)"
  end
  :io.format "~2B    ~.2f~n", [num_processes, time/1000000.0]
end

