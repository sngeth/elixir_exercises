defmodule Input do
  def get_string_input(str) do
    IO.gets(str) |> String.trim
  end

  def get_numeric_input(str) do
    input = get_string_input(str)

    case Integer.parse(input) do
      { parsed_input , _ } ->
        parsed_input
      :error ->
        get_numeric_input("Invalid number, try again: ")
    end
  end

  def get_float_input(str) do
    input = get_string_input(str)

    case Float.parse(input) do
      { parsed_input , _ } ->
        parsed_input
      :error ->
        raise ArgumentError, message: "Invalid number"
    end
  end

  def get_gender_input(str) do
    input = get_string_input(str) |> String.upcase

    case input do
      "M" -> "male"
      "F" -> "female"
      _ ->
        get_gender_input("Invalid gender, enter m or f: ")
    end
  end

  def get_y_or_n_input(str) do
    input = get_string_input(str) |> String.upcase

    if (input != "Y" && input != "N") do
      get_y_or_n_input("Invalid input, enter y or n: ")
    else
      input
    end
  end
end
