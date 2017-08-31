defmodule NumbersToNamesTest do
  import NumbersToNames
  use ExUnit.Case

  test "month_num_to_name" do
    assert month_num_to_name(3) == "March"
  end
end
