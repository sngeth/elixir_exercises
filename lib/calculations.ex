defmodule Calculations do
  @sq_ft_to_m_factor 0.09290304

  @doc """
  Calculates the area of room. It prompts the user for the length and width of the
  room in feet. Then displays the area in both square feet and square meters
  """
  def area_of_room do
    width = get_width()
    length = get_length()

    IO.puts("You entered dimensions of #{width} feet by #{length} feet.")

    area_in_ft = area(width, length)
    IO.puts("#{area_in_ft} square feet")
    IO.puts("#{area_ft_to_m(area_in_ft)} square meters")
  end

  defp get_length do
    { length, _ }  = IO.gets("What is the length of the room in feet? ")
                          |> String.strip
                          |> Integer.parse

    length
  end

  defp get_width do
    { width, _ }  = IO.gets("What is the width of the room in feet? ")
                          |> String.strip
                          |> Integer.parse
    width
  end

  defp area(width, length) do
    width * length
  end

  defp area_ft_to_m(area_in_ft) do
    Float.round(area_in_ft * @sq_ft_to_m_factor, 3)
  end
end
