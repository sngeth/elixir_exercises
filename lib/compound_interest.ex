require IEx
import Input
alias Decimal, as: D

defmodule CompoundInterest do
  @moduledoc """
  Write a program to compute the value of an investment
  compounded over time. The program should ask for the
  starting amount, the number of years to invest, the interest
  rate, and the number of periods per year to compound.
  The formula you’ll use for this is

  A = P(1 + r/n)^n*t

  where
  • P is the principal amount.
  • r is the annual rate of interest.
  • t is the number of years the amount is invested.
  • n is the number of times the interest is compounded per year.
  • A is the amount at the end of the investment.

  Example Output
  What is the principal amount? 1500
  What is the rate? 4.3
  What is the number of years? 6
  What is the number of times the interest
  is compounded per year? 4

  $1500 invested at 4.3% for 6 years
  compounded 4 times per year is $1938.84.
  """

  def calc do
    principal = get_numeric_input("What is the principal amount? ")
    rate = get_float_input("What is the rate(%)? ")
    years = get_numeric_input("What is the number of years? ")
    n = get_numeric_input("What is the number of times the interest is compounded per year? ")
    gains = calculate_interest(principal, rate, years, n)

    IO.puts("$#{principal} invested at #{rate}% for #{years} years compounded #{n} per year is $#{gains}")
  end

  defp calculate_interest(principal, rate, years, n) do
    p = D.new(principal)
    r = D.div(D.new(rate), D.new(100))
    t = D.new(years)
    n = D.new(n)

    nt = D.mult(n, t) |> D.to_float
    r_over_n = D.div(r, n)

    (D.add(D.new(1), r_over_n)
      |> D.to_float
      |> :math.pow(nt))
      |> D.new
      |> D.mult(p)
      |> D.round(2)
  end
end
