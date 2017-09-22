defmodule WordFrequencyFinder do
  @moduledoc """
  Create a program that reads in a file and counts the frequency
  of words in the file. Then construct a histogram displaying
  the words and the frequency, and display the histogram to
  the screen.

  Example Output
  Given the text file words.txt with this content
  badger badger badger badger mushroom mushroom
  snake badger badger badger

  the program would produce the following output:

  badger: *******
  mushroom: **
  snake: *
  """

  def run do
    read_file
    |> String.split
    |> frequency()
  end

  def read_file do
    case File.read("./words.txt") do
      {:ok, input} -> input
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end
  end

  def frequency([], occurrences) do
    for {occurrence, count} <- occurrences do
      stars = String.duplicate("*", count)
      IO.puts("#{occurrence}: #{stars}")
    end
  end

  def frequency(input, occurrences \\ %{}) do
    [h | t] = input

    if Map.get(occurrences, h) do
      occurrences = Map.put(occurrences, h, occurrences[h] + 1)
    else
      occurrences = Map.put(occurrences, h, 1)
    end

    frequency(t, occurrences)
  end
end
