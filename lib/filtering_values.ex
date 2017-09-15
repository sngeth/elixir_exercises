defmodule FilteringValues do
  @moduledoc """
  Create a program that prompts for a list of numbers, separated
  by spaces. Have the program print out a new list containing
  only the even numbers.

  Example Output

  Enter a list of numbers, separated by spaces: 1 2 3 4 5 6 7 8
  The even numbers are 2 4 6 8.
  """

  def run do
    even_nums = IO.gets "Enter a list of numbers seperated by spaces: "
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> Enum.filter(fn(x) -> rem(x, 2) == 0 end)

    IO.puts "The even numbers are #{even_nums}"
  end
end
