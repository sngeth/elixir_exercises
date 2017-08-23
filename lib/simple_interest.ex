import Input
alias Decimal, as: D

defmodule SimpleInterest do
  @moduledoc """
  Create a program that computes simple interest. Prompt for
  the principal amount, the rate as a percentage, and the time,
  and display the amount accrued (principal + interest).

  The formula for simple interest is
  A = P(1 + rt), where P is
  the principal amount, r is the annual rate of interest, t is the
  number of years the amount is invested, and A is the amount
  at the end of the investment.
  """

  def calc do
    principal = get_numeric_input("Enter the principal: ")
    rate = get_float_input("Enter the rate of interest (%): ")
    years = get_numeric_input("Enter the rate of interest: ")
    gains = calculate_simple_interest(principal, rate, years)

    IO.puts("After #{years} years at #{rate}%, the investment will be worth $#{gains}")
  end

  defp calculate_simple_interest(principal, rate, years) do
    p = D.new(principal)
    r = D.new(rate)
    t = D.new(years)

    D.div(r, D.new(100))
    |> D.mult(t)
    |> D.add(D.new(1))
    |> D.mult(p)
    |> D.round(2)
  end
end
