import Input

defmodule PizzaParty do
  @moduledoc """
  Prompt for the number of people, the number of pizzas, and the number of
  slices per pizza. Ensures that the number of pieces comes out
  even. Display the number of pieces of pizza each person
  should get. If there are leftovers, show the number of leftover
  pieces.
  """


  @slices_in_pie 8

  def calc do
    num_people = get_numeric_input("How many people? ")
    num_pizzas = get_numeric_input("How many pizzas do you have? ")
    num_slices = num_pizzas * @slices_in_pie
    num_slices_each = div(num_slices, num_people)
    leftovers = rem(num_slices, num_people)

    IO.puts "#{num_people} people with #{num_pizzas} pizzas"
    IO.puts "Each person gets #{num_slices_each} #{piece_or_pieces(num_slices_each)} of pizza."
    IO.puts "There are #{leftovers} leftover pieces."
  end

  defp piece_or_pieces(num) do
    cond do
      num == 1 ->
        "piece"
      num > 1 ->
        "pieces"
    end
  end
end
