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
    num_people = get_num_people()
    num_pizzas = get_num_pizzas()
    num_slices = num_pizzas * @slices_in_pie
    num_slices_each = div(num_slices, num_people)
    leftovers = rem(num_slices, num_people)

    IO.puts "#{num_people} people with #{num_pizzas} pizzas"
    IO.puts "Each person gets #{num_slices_each} slices of pizza."
    IO.puts "There are #{leftovers} leftover pieces."
  end

  defp get_num_people do
    { people, _ }  = IO.gets("How many people? ")
                          |> String.strip
                          |> Integer.parse

    people
  end

  defp get_num_pizzas do
    { pizzas, _ }  = IO.gets("How many pizzas do you have? ")
                          |> String.strip
                          |> Integer.parse

    pizzas
  end
end
