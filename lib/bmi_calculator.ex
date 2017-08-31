defmodule BMICalculator do
  import Input
  @moduledoc """
  Calculate the BMI by using the following formula:
  bmi = (weight / (height × height)) * 703
  If the BMI is between 18.5 and 25, display that the person is at a normal
  weight. If they are out of that range, tell them if they are underweight or
  overweight and tell them to consult their doctor.

  Example Output
         Your BMI is 19.5.
         You are within the ideal weight range.
  or
         Your BMI is 32.5.
         You are overweight. You should see your doctor.
  """

  def run do
    weight = get_float_input("What is your weight(lbs): ")
    height = get_float_input("What is your height(in): ")

    bmi(weight, height) |> print_bmi
  end

  def print_bmi(bmi) do
    cond do
      bmi >= 18.5 && bmi <= 25 ->
        "Your BMI is #{bmi}. You are within the ideal weight range."
      true ->
        "Your BMI is #{bmi}. You are overweight. You should see your doctor."
    end
  end

  def bmi(weight, height) do
    (weight / (height * height)) * 703 |> Float.round(2)
  end
end
