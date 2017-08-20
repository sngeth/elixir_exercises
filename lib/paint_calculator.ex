import Input

defmodule PaintCalculator do
  @moduledoc """
  Calculate gallons of paint needed to paint the ceiling of a room. Prompts for
  the length and width, and assumes one gallon covers 350 square feet.
  Displays the number of gallons needed to paint the ceiling as a whole number.

  Example Output
   You will need to purchase 2 gallons of
   paint to cover 360 square feet.
  """

  @gals_per_sq_ft 350

  def calc do
    length = get_numeric_input("What is the length of the room? ")
    width = get_numeric_input("What is the area of the room? ")
    sq_ft = length * width
    required = calc_required_gallons(sq_ft)

    IO.puts "You will need to purchase #{required} gallons of paint to cover #{sq_ft} square feet."
  end

  defp calc_required_gallons(sq_ft) do
    Float.ceil(sq_ft / @gals_per_sq_ft) |> round
  end
end
