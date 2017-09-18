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

  def run do
    read_names()
    |> handle_names()
    |> write_names()
  end

  def read_names do
    file = Path.expand('./names.txt')

    case File.read(file) do
      {:ok, names}     -> names
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end
  end

  def handle_names(names) do
    String.split(names, "\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.sort
  end

  def write_names(names) do
    file_path = Path.expand('./names_sorted.txt')
    file = File.open!(file_path, [:write])

    IO.puts(file, "Total of #{length(names)} names")
    IO.puts(file, "-------------------------------")
    IO.puts(file, names |> Enum.join("\n"))
  end
end
