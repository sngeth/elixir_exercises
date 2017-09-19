defmodule ParsingDataFile do
  @moduledoc """
  Construct a program that reads in the following data file:

     Ling,Mai,55900
     Johnson,Jim,56500
     Jones,Aaron,46000
     Jones,Chris,34500
     Swift,Geoffrey,14200
     Xiong,Fong,65000
     Zarnecki,Sabrina,51500

  Process the records and display the results formatted as a
  table, evenly spaced, as shown in the example output.

  Example Output
     Last     First     Salary
     -------------------------
     Ling     Mai       55900
     Johnson  Jim       56500
     Jones    Aaron     46000
     Jones    Chris     34500
     Swift    Geoffrey  14200
     Xiong    Fong      65000
     Zarnecki Sabrina   51500
  """

  def run do
    read_names()
    |> handle_names()
    |> print_table
  end

  def read_names do
    file = Path.expand('./unparsed_data.txt')

    case File.read(file) do
      {:ok, names}     -> names
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end
  end

  def handle_names(names) do
    names = String.split(names, "\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(fn(x) -> String.split(x, ",") end)
  end

  defp print_table(names) do
    max_lengths = col_lengths(names)

    print_header(names)

    for i <- names do
      last_name = Enum.at(i, 0) |> String.pad_trailing(max_lengths.first_name)
      first_name = Enum.at(i, 1) |> String.pad_trailing(max_lengths.last_name)
      salary = Enum.at(i, 2) |> String.pad_trailing(max_lengths.salary)

      IO.puts "#{last_name} #{first_name} #{salary}"
    end
  end

  defp print_header(names) do
    max_lengths = col_lengths(names)

    last = "Last" |> String.pad_trailing(max_lengths.last_name)
    first = "First" |> String.pad_trailing(max_lengths.first_name)
    salary = "Salary" |> String.pad_trailing(max_lengths.salary)
    IO.puts("#{last} #{first} #{salary}")
    IO.puts("-------------------------------")
  end


  defp col_lengths(names) do
    %{
      first_name: Enum.max_by(names, fn(x) -> String.length(Enum.at(x, 0)) end)
      |> Enum.at(0) |> String.length,

      last_name: Enum.max_by(names, fn(x) -> String.length(Enum.at(x, 1)) end)
      |> Enum.at(1) |> String.length,

      salary: Enum.max_by(names, fn(x) -> String.length(Enum.at(x, 2)) end)
      |> Enum.at(2) |> String.length,
    }
  end
end
