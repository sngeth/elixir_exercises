require IEx

defmodule StringCounter do
  @moduledoc """
  Documentation for StringCounter
  """

  @doc """
  Prompts for an input string and displays out that shows the input string and
  the number of characters the string contains
  """
  def count do
    str = (IO.gets "What is the input string? ") |> String.strip
    IO.puts "#{str} has #{String.length(str)} characters"
  end
end
