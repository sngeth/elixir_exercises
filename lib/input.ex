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
        raise ArgumentError, message: "Invalid number"
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
end
