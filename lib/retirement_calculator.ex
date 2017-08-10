defmodule RetirementCalculator do
  @moduledoc """
  """

  @doc """
  """
  def calculate do
    current_age = get_current_age()
    retirement_age = get_retirement_age()
    years_left = years_until_retirement(current_age, retirement_age)

    cond do
      years_left < 0 ->
        print_retire_already()

      true ->
        print_years_until_retirement(years_left)
        print_date_until_retirement(years_left)
    end
  end

  def get_current_age do
    { current_age, _ }  = IO.gets("What is your current age? ")
                          |> String.strip
                          |> Integer.parse

    current_age
  end

  def get_retirement_age do
    { retirement_age, _ } = IO.gets("At what age would you like to retire? ")
                            |> String.strip

                            |> Integer.parse
    retirement_age
  end

  def years_until_retirement(current_age, retirement_age) do
    retirement_age - current_age
  end

  def print_retire_already do
    IO.puts "You can retire already!"
  end


  def print_years_until_retirement(years_left) do
    IO.puts "You have #{years_left} years left until you can retire."
  end

  def print_date_until_retirement(years_left) do
    {{current_year, _, _}, _ } = :os.timestamp |> :calendar.now_to_datetime
    retirement_year = current_year + years_left

    IO.puts "It's #{current_year}, so you can retire in #{retirement_year}"
  end
end
