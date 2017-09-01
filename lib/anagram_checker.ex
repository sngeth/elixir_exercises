defmodule AnagramChecker do
  import Input

  def check(input \\ get_input) do
    {first, second} = input

    case anagram?(first, second) do
      true ->
        IO.puts "\"#{first}\" and \"#{second}\" are anagrams"
      false ->
        IO.puts "\"#{first}\" and \"#{second}\" are not anagrams"
    end
  end

  defp get_input do
    first = get_string_input("Enter the first string: ")
    second = get_string_input("Enter the second string: ")
    {first, second}
  end

  def anagram?(first, second) do
    first = first |> String.graphemes
    second = second |> String.graphemes

    counter(first, %{}) == counter(second, %{})
  end

  defp counter([], occurrences) do
    occurrences
  end

  defp counter([h | t], occurrences) do
    if occurrences[h] == nil do
      occurrences = Map.put(occurrences, h, 1)
    else
      occurrences = occurrences[h] + 1
    end

    counter(t, occurrences)
  end
end
