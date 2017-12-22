defmodule HPrefixer do
  def prefix(pre) do
    fn (post) -> pre <> post end
  end
end
