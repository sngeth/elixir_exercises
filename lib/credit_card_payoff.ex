defmodule CreditCardPayoff do
  import Input

  @moduledoc """
  Write a program that will help you determine how many months it will take to pay
  off a credit card balance. The program should ask the user to enter the balance
  of a credit card and the APR of the card. The program should then return the
  number of months needed.

  The formula for this is
    n = −1/30 × log(1 + b/p(1 − (1 + i)^30)) / log(1 + i)

    • n is the number of months.
    • i is the daily rate (APR divided by 365).
    • b is the balance.
    • p is the monthly payment.

  Example Output
    What is your balance? 5000
    What is the APR on the card (as a percent)? 12
    What is the monthly payment you can make? 100
    It will take you 70 months to pay off this card.
  """

  def calc(input \\ get_input()) do
    months = months_until_paid_off(input)
    IO.puts("It will take you #{months} months to pay off this card.")
  end

  def get_input do
    balance = get_float_input("What is your balance? ")
    apr = get_float_input("What is the APR on the card (as a percent)? ")
    monthly_payments = get_numeric_input("What is the monthly payment you can make? ")

    {balance, apr, monthly_payments}
  end

  def months_until_paid_off({b, i, p}) do
    -1/30 * :math.log(1 + (b/p)*(1 - :math.pow(1+daily_rate(i), 30))) / :math.log(1+daily_rate(i))
      |> Float.ceil |> round
  end

  defp daily_rate(i) do
    i / 100 / 365
  end
end
