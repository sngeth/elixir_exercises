defmodule Magic8Ball do
  import Input

  @moduledoc """
  Create a Magic 8 Ball game that prompts for a question and
  then displays either “Yes,” “No,” “Maybe,” or “Ask again later.”

  Example Output
  What's your question? Will I be rich and famous?
  Ask again later.
  """

  def shake do
    get_string_input "What's your question? "
    print_answer
  end

  def print_answer do
    ["Yes", "No", "Maybe", "Ask again later."]
    |> Enum.random
    |> IO.puts
  end
end
