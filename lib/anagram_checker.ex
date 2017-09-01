defmodule AnagramChecker do
  import Input

  def check(input \\ get_input()) do
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

  @spec anagram?(binary, binary) :: boolean
  def anagram?(first, second) do
    first = first |> String.graphemes
    second = second |> String.graphemes

    counter(first, %{}) == counter(second, %{})
  end

  defp counter([], occurrences) do
    occurrences
  end

  defp counter([h | t], occurrences) do
    occurrences =
      if occurrences[h] == nil do
        Map.put(occurrences, h, 1)
      else
        occurrences[h] + 1
      end

    counter(t, occurrences)
  end
end
