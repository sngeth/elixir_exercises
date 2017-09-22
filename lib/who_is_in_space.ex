defmodule WhoIsInSpace do
  use HTTPoison.Base

  @expected_fields ~w(number message people)

  def process_url(url) do
    "http://api.open-notify.org" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> print_table
  end

  def print_table(astros) do
    max_length = max_name_length(astros)
    name_header = String.pad_trailing("Name", max_length)

    IO.puts "There are #{astros[:number]} people in space right now:"
    IO.puts "#{name_header} | Craft"
    IO.puts "--------------------------"

    for person <- astros[:people] do
      name = String.pad_trailing(person["name"], max_length)
      IO.puts "#{name} | #{person["craft"]}"
    end

  end
  def max_name_length(astros) do
    (for astro <- astros[:people], into: [], do: astro["name"])
    |> Enum.max_by(&String.length/1)
    |> String.length
  end

  def run do
    WhoIsInSpace.start
    WhoIsInSpace.get!("/astros").body
  end
end
