defmodule ComparingNumbersTest do
  import ComparingNumbers
  use ExUnit.Case

  test "max" do
    list = [1, 51, 2]
    assert max(list) == 51
  end
end
