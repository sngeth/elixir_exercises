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
    length = get_length()
    width = get_width()
    sq_ft = length * width
    required = calc_required_gallons(sq_ft)

    IO.puts "You will need to purchase #{required} gallons of paint to cover #{sq_ft} square feet."
  end

  defp calc_required_gallons(sq_ft) do
    Float.ceil(sq_ft / @gals_per_sq_ft) |> round
  end

  defp get_length do
    input = IO.gets("What is the length of the room? ")
            |> String.strip

    case Integer.parse(input) do
      { length, _ } ->
        length
      :error ->
        raise ArgumentError, message: "Invalid number"
    end
  end

  defp get_width do
    input = IO.gets("What is the width of the room? ")
            |> String.strip

    case Integer.parse(input) do
      { width, _ } ->
        width
      :error ->
        raise ArgumentError, message: "Invalid number"
    end
  end
end
