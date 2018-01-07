defmodule SpawnLinkTest do
  import :timer, only: [sleep: 1]
  def run do
    spawn_monitor(SpawnLinkTest, :test, [self()])

    sleep 500

    loop_receive()
  end

  def loop_receive do
    receive do
      msg ->
        IO.puts "Message: #{inspect msg}"
        loop_receive
    after 600 -> IO.puts "Done receiving messages"
    end
  end

  def test(parent) do
    send parent, "Message from the child!"
    raise RuntimeError
  end
end
