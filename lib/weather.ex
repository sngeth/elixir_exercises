defmodule Weather do
  import Input

  def run do
    HTTPoison.start
    city = get_string_input("Where are you? ")

    HTTPoison.get!("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}").body
    |> Poison.decode!
    |> print_temp(city)
  end

  def print_temp(%{"main" => main}, city) do
    temp = main["temp"] |> convert_k_to_f |> round

    IO.puts "#{city} weather:"
    IO.puts "#{temp} degrees Fahrenheit"
  end

  def convert_k_to_f(temp) do
    temp * 9/5 - 459.67
  end

  def api_key do
    System.get_env("OPENWEATHER_API_KEY")
  end
end
