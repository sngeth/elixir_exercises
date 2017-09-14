defmodule PasswordGenerator do
  import Input

  @moduledoc """
  Create a program that generates a secure password. Prompt
  the user for the minimum length, the number of special
  characters, and the number of numbers. Then generate a
  password for the user using those inputs.

  Example Output
  What's the minimum length? 8
  How many special characters? 2
  How many numbers? 2
  Your password is
  aurn2$1s#
  """

  def run do
    min_length = get_numeric_input "What's the minimum length? "
    num_special = get_numeric_input "How many special characters? "
    num_numbers = get_numeric_input "How many numbers? "

    generate_password(min_length, num_special, num_numbers)
  end

  def generate_password(min_length, num_special, num_numbers) do
    special_chars = ~w(! @ # $ % ^ & * \( \))
    numbers = 0..9 |> Enum.to_list
    letters = for n <- ?a..?z, do: << n :: utf8 >>

    possible = special_chars ++ numbers ++ letters

    possible |> Enum.take_random(min_length) |> Enum.join
  end
end
