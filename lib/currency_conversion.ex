import Input
alias Decimal, as: D

defmodule CurrencyConversion do
  @moduledoc """
  Write a program that converts currency. Specifically, convert euros to U.S.
  dollars. Prompt for the amount of money in euros you have, and prompt for the
  current exchange rate of the euro. Print out the new amount in U.S. dollars.
  """

  @usd_exchange_rate 0.85

  def convert do
    euros = get_numeric_input("How many euros are you exchanging? ")
    rate = get_float_input("What is the exchange rate? ")
    converted_amt = calc(euros, rate) |> D.round(2)

    IO.puts("#{euros} euros at an exchange rate of #{rate} is $#{converted_amt}")
  end

  defp calc(amount_from, rate_from) do
    D.mult(D.new(amount_from), D.new(rate_from)) |> D.div(D.new(@usd_exchange_rate))
  end
end
