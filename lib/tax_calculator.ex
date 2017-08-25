import Input
alias Decimal, as: D

defmodule TaxCalculator do
  @moduledoc """
  Write a simple program to compute the tax on an order
  amount. The program should prompt for the order amount
  and the state. If the state is “WI,” then the order must be
  charged 5.5% tax. The program should display the subtotal,
  tax, and total for Wisconsin residents but display just the
  total for non-residents.
  """

  @wi_tax 0.055

  def calc do
    amount = get_float_input("What is the order amount? ")
    state = get_string_input("What is the state? ") |> String.upcase

    _calc(amount, state)
  end

  defp _calc(amount, state) do
    amount = D.new(amount) |> D.round(2)

    case state do
      "WI" ->
        tax = calc_tax(amount)
        total = calc_total(tax, amount)

        IO.puts "The subtotal is $#{amount}."
        IO.puts "The tax is $#{tax}."
        IO.puts "The total is $#{total}."
      _ ->
        IO.puts "The total is $#{amount}."
    end
  end

  defp calc_tax(amount) do
    D.mult(amount, D.new(@wi_tax)) |> D.round(2)
  end

  defp calc_total(tax, amount) do
    D.add(tax, amount) |> D.round(2)
  end
end
