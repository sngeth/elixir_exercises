defmodule NameSorterTest do
  use ExUnit.Case
  import NameSorter
  import ExUnit.CaptureIO

  test "sorts a list of names" do
    names = "Ling, Mai\nJohnson, Jim\nZarnecki, Sabrina\nJones, Chris\nJones, Aaron\nSwift, Geoffrey\nXiong, Fong\n"

    fun = fn ->
      handle_names(names)
    end

    assert capture_io(fun) == """
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
