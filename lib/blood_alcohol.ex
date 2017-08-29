import Input

defmodule BloodAlcohol do
  @moduledoc """
  Create a program that prompts for your weight, gender, number of drinks, the
  amount of alcohol by volume of the drinks consumed, and the amount of time
  since your last drink. Calculate your blood alcohol content (BAC) using this
  formula
  BAC = (A × 5.14 / W × r) − .015 × H
  where
  • A is total alcohol consumed, in ounces (oz).
  • W is body weight in pounds.
  • r is the alcohol distribution ratio:
  – 0.73 for men
  – 0.66 for women
  • H is number of hours since the last drink.

  Display whether or not it’s legal to drive by comparing the
  blood alcohol content to 0.08.'
  """

  @male_alcohol_distribution_ratio 0.73
  @female_alcohol_distribution_ratio 0.66

  def check do
    w = get_numeric_input("What is your weight? (lbs) ")
    r = get_gender_input("What is your gender? (m/f) ") |> alcohol_dist_ratio
    vol_drank = get_numeric_input("How many drinks have you had? (ounces) ")
    abv = get_numeric_input("Amount of alcohol by volume? (abv %) ")
    h = get_numeric_input("Amount of time since your last drink? (hours) ")

    legal?(abv, vol_drank, w, r, h)
  end

  def alcohol_dist_ratio(gender) do
    case gender do
      "male" ->
        @male_alcohol_distribution_ratio
      "female" ->
        @female_alcohol_distribution_ratio
    end
  end

  def legal?(abv, vol_drank, w, r, h) do
    bac = abv * vol_drank * 0.823 * r / (16 * w) - 0.016 * h |> Float.round(3)

    if bac >= 0.08 do
      "Your BAC is #{bac}: It is not legal for you to drive."
    else
      "Your BAC is #{bac}: It is legal for you to drive."
    end
  end
end
