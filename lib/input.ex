defmodule Input do
  def get_numeric_input(str) do
    input = IO.gets(str) |> String.trim

    case Integer.parse(input) do
      { parsed_input , _ } ->
        parsed_input
      :error ->
        raise ArgumentError, message: "Invalid number"
    end
  end

  def get_float_input(str) do
    input = IO.gets(str) |> String.trim

    case Float.parse(input) do
      { parsed_input , _ } ->
        parsed_input
      :error ->
        raise ArgumentError, message: "Invalid number"
    end
  end
end
