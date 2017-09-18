defmodule NameSorterTest do
  use ExUnit.Case
  import NameSorter

  test "sorts a list of names" do
    names = "Ling, Mai\nJohnson, Jim\nZarnecki, Sabrina\nJones, Chris\nJones, Aaron\nSwift, Geoffrey\nXiong, Fong\n"

    handle_names(names)
    |> write_names

    assert File.read!('./names_sorted.txt') == """
    Total of 7 names
    -------------------------------
    Johnson, Jim
    Jones, Aaron
    Jones, Chris
    Ling, Mai
    Swift, Geoffrey
    Xiong, Fong
    Zarnecki, Sabrina
    """
  end
end
