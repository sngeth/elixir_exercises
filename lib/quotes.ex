defmodule Quotes do
  @moduledoc """
  Documentation for Quotes
  """

  @doc """
  Create a program that prompts for a quote and an author. Display the quotation
  and author as shown in the example output.

  What is the quote? These aren't the droids you're looking for.
  Who said it? Obi-Wan Kenobi
  Obi-Wan Kenobi says, "These aren't the droids
  you're looking for."
  """
  def create do
    quote_str = (IO.gets "What is quote? ") |> String.strip
    author = (IO.gets "Who said it? ") |> String.strip
    IO.puts author <> " says, " <> "\"" <> quote_str <> "\""
  end
end
