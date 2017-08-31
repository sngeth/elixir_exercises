defmodule BMICalculatorTest do
  import BMICalculator
  use ExUnit.Case

  test "bmi" do
    weight = 180
    height = 71
    assert bmi(weight, height) == 25.1
  end

  test "bmi in ideal range" do
    assert print_bmi(bmi(160, 71)) == "Your BMI is 22.31. You are within the ideal weight range."
  end

  test "bmi is overweight range" do
    assert print_bmi(bmi(180, 71)) == "Your BMI is 25.1. You are overweight. You should see your doctor."
  end
end
