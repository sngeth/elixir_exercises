defmodule NameSorter do
  @moduledoc """
  Create a program that reads in the following list of names:

  Ling, Mai
  Johnson, Jim
  Zarnecki, Sabrina
  Jones, Chris
  Jones, Aaron
  Swift, Geoffrey
  Xiong, Fong

  Read this program and sort the list alphabetically. Then print the sorted list
  to a file that looks like the following example output.
  """

  def print_sorted_names do
    file = Path.expand('./names.txt')

    case File.read(file) do
      {:ok, body}      -> handle_names(body)
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end
  end

  def handle_names(names) do
    names = String.split(names, "\n")
            |> Enum.reject(&(&1 == ""))
            |> Enum.sort

    IO.puts "Total of #{length(names)} names"
    IO.puts "-------------------------------"
    IO.puts names |> Enum.join("\n")
  end
end
