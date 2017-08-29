defmodule BloodAlcoholTest do
  import BloodAlcohol
  use ExUnit.Case

  test "legal?" do
    abv = 14
    vol_drank = 16
    w = 180
    r = alcohol_dist_ratio("male")
    h = 1

    assert legal?(abv, vol_drank, w, r, h) == "Your BAC is 0.031: It is legal for you to drive."
  end
end
