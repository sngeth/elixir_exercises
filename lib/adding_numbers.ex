defmodule AddingNumbers do
  import Input

  @moduledoc """
  Write a program that prompts the userforfive numbers and
  computes the total of the numbers.

  Example Output
  Enter a number: 1
  Enter a number: 2
  Enter a number: 3
  Enter a number: 4
  Enter a number: 5
  The total is 15.
  """

  def run do
    calc(1, 0)
  end

  def calc(n, total) when n > 5 do
    IO.puts "The total is #{total}"
  end

  def calc(n, total) do
    num = get_numeric_input("Enter a number: ")
    calc(n + 1, total + num)
  end
end
