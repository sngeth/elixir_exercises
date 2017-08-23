import Input

defmodule SelfCheckout do
  @moduledoc """
  Working with multiple inputs and currency can introduce
  some tricky precision issues.

  Create a simple self-checkout system. Prompt for the prices
  and quantities of three items. Calculate the subtotal of the
  items. Then calculate the tax using a tax rate of 5.5%. Print
  out the line items with the quantity and total, and then print
  out the subtotal, tax amount, and total.
  """

  def calc do
    _calc(1, 0.0)
  end

  defp _calc(n, subtotal) when n > 3 do
    IO.puts "Subtotal: #{subtotal}"
    tax = calc_tax(subtotal)
    calc_total(subtotal, tax)
  end

  defp _calc(n, subtotal) do
    subtotal = subtotal + calc_line_item_subtotal(n)
    _calc(n+1, subtotal)
  end

  defp calc_line_item_subtotal(n) do
    get_numeric_input("Enter the price of item #{n}: ") * get_numeric_input("Enter the quantity of item #{n}: ")
  end

  defp calc_tax(subtotal) do
    tax = subtotal * 0.055
    IO.puts("Tax: #{tax}")
    tax
  end

  defp calc_total(subtotal, tax) do
    IO.puts "Total: #{subtotal + tax}"
  end
end
