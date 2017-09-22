defmodule WordFinder do
  @moduledoc """
  Given an input file, read the file and look for all occurrences
  of the word utilize. Replace each occurrence with use. Write
  the modified file to a new file.

  Example Output
  Given the input file of
  One should never utilize the word "utilize" in
  writing. Use "use" instead.

  The program should generate
  One should never use the word "use" in
  writing. Use "use" instead.
  """

  def run do
    read_file
    |> replace_utilize
    |> write_file
  end

  def read_file do
    case File.read("./word_finder.txt") do
      {:ok, input} -> input
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end
  end

  def replace_utilize(input) do
    String.replace(input, "utilize", "use")
  end

  def write_file(input) do
    file = File.open!("replaced.txt", [:read, :utf8, :write])
    IO.puts(file, input)
  end
end
