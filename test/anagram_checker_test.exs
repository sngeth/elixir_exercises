defmodule AnagramCheckerTest do
  import AnagramChecker
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "anagram?" do
    assert anagram?("note", "tone") == true
  end

  test "check" do
    fun = fn ->
      check({"note", "tone"})
    end

    assert capture_io(fun) == ~s("note" and "tone" are anagrams\n)
  end
end
