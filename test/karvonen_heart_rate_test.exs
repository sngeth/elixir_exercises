defmodule KarvonenHeartRateTest do
  import KarvonenHeartRate
  use ExUnit.Case

  test "target_heart_rate" do
    resting_pulse = 65
    age = 22
    intensity = 55
    target = target_heart_rate(resting_pulse, age, intensity)

    assert target == 138
  end
end
