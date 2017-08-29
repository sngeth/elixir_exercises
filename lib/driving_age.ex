import Input

defmodule DrivingAge do
  @moduledoc """
  program that asks the user for their age and compare
  it to the legal driving age of sixteen. If the user is sixteen or
  older, then the program should display “You are old enough
  to legally drive.” If the user is under sixteen, the program
  should display “You are not old enough to legally drive.”
  """

  def check do
    get_numeric_input("How old are you? ") |> legal?
  end

  def legal?(age) do
    cond do
      age >= 16 ->
        "You are old enough to legally drive."
      age < 16 ->
        "You are not old enough to legally drive."
    end
  end
end
