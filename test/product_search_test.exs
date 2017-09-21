defmodule ProductSearchTest do
  import Product
  import ProductSearch
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "searching for product" do
    fun = fn ->
      read_products
      |> search("Widget")
      |> print_results
    end

    assert capture_io(fun) == ~s(Name: Widget\nPrice: 25.0\nQuantity: 5\n)
  end
end
