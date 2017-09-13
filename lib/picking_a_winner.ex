defmodule PickingAWinner do
  import Input

  @moduledoc """
  Create a program that picks a winner for a contest or prize drawing. Prompt
  for names of contestants until the user leaves the entry blank. Then randomly
  select a winner.

  Example Output
  Enter a name: Homer
  Enter a name: Bart
  Enter a name: Maggie
  Enter a name: Lisa
  Enter a name: Moe
  Enter a name:
  """

  def run do
    get_names()
    |> pick_winner
  end

  defp get_names(names \\ []) do
    name = get_string_input "Enter a name: "

    case name do
      "" ->
        names
      _ ->
        names = [name | names]
        get_names(names)
    end
  end

  defp pick_winner(names) do
    winner = names |> Enum.random
    IO.puts "The winner is... #{winner}"
  end
end
