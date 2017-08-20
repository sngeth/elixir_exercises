import Input

defmodule SimpleMath do
  @moduledoc """
  Documentation for SimpleMath

  You’ll often write programs that deal with numbers. And depending on the
  programming language you use, you’ll have to convert the inputs you get to
  numerical data types.

  """

  @doc """
  Prompts for two numbers. Prints the sum, difference, product, and quotient of
  those numbers as shown in the example output:

  Example Output
       What is the first number? 10
       What is the second number? 5
       10 + 5 = 15
       10 - 5 = 5
       10 * 5 = 50
       10 / 5 = 2
  """
  def calculate do
    first = get_numeric_input("What is the first number? ")
    second = get_numeric_input("What is the second number? ")

    add(first, second)
    subtract(first, second)
    multiply(first, second)
    divide(first, second)
  end

  def add(first, second) do
    IO.puts "#{first} + #{second} = #{first + second}"
  end

  def subtract(first, second) do
    IO.puts "#{first} - #{second} = #{first - second}"
  end

  def multiply(first, second) do
    IO.puts "#{first} * #{second} = #{first * second}"
  end

  def divide(first, second) do
    IO.puts "#{first} / #{second} = #{first / second}"
  end
end
