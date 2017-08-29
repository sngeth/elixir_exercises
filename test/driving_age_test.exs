defmodule DrivingAgeTests do
  import DrivingAge
  use ExUnit.Case

  test "legal?" do
    assert legal?(15) == "You are not old enough to legally drive."
    assert legal?(16) == "You are old enough to legally drive."
  end
end
