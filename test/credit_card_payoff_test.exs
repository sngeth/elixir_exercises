defmodule CreditCardPayoffTest do
  import CreditCardPayoff
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "months until paid off" do
    balance = 5000
    apr = 12
    monthly_payment_amount = 100

    assert months_until_paid_off({balance, apr, monthly_payment_amount}) == 70
  end

  test "calc" do
    fun = fn ->
      calc({5000, 12, 100})
    end

    assert capture_io(fun) == "It will take you 70 months to pay off this card.\n"
  end
end
