import Input

defmodule TemperatureConverter do
  def run do
    convert_to = get_string_input("""
    Press C to convert from Farenheit to Celcius
    Press F to convert from Celcius to Farenheit
    Your choice:
    """) |> String.upcase

    case convert_to do
      "C" ->
        get_temp("Fahrenheit") |> f_to_c
      "F" ->
        get_temp("Celcius") |> c_to_f
      _   ->
        IO.puts "Invalid choice"
        run()
    end
  end

  def get_temp(type) do
    get_float_input("Please enter the temperature in #{type}: ")
  end

  def f_to_c(f) do
    "The temperature in Celcius is #{(f-32) * 5/9}"
  end

  def c_to_f(c) do
    "The temperature in Fahrenheit is #{(c * 9/5) + 32}"
  end
end
