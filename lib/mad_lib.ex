defmodule MadLib do
  @moduledoc """
  Documentation for MadLib
  Mad libs are a simple game where you create a story tem- plate with blanks for
  words. You, or another player, then construct a list of words and place them
  into the story, cre- ating an often silly or funny story as a result.

  Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
  """

  @doc """
  Prompts for a noun, a verb, an adverb, and an adjective and injects those
  into a story.

  Example output:

  Enter a noun: dog
  Enter a verb: walk
  Enter an adjective: blue
  Enter an adverb: quickly
  Do you walk your blue dog quickly? That's hilarious!
  """
  def create do
    noun = (IO.gets "Enter a noun: ") |> String.strip
    verb = (IO.gets "Enter a verb: ") |> String.strip
    adjective = (IO.gets "Enter an adjective: ") |> String.strip
    adverb = (IO.gets "Enter an adverb: ") |> String.strip
    IO.puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
  end
end
