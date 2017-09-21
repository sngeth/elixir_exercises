defmodule Product do
  @derive [Poison.Encoder]
  defstruct [:name, :price, :quantity]
end

defmodule ProductSearch do
  import Input

  @moduledoc """
  Create a program that takes a product name as input and
  retrieves the current price and quantity forthat product. The
  product data is in a data file in the JSON format and looks
  like this:
  {
    "products" : [
      {"name": "Widget", "price": 25.00, "quantity": 5 },
      {"name": "Thing", "price": 15.00, "quantity": 5 },
      {"name": "Doodad", "price": 5.00, "quantity": 10 }
    ]
  }

  Print out the product name, price, and quantity if the product
  is found. If no product matches the search, state that no
  product was found and start over.

  Example Output
  What is the product name? iPad
  Sorry, that product was not found in our inventory.
  What is the product name? Widget
  Name: Widget
  Price: $25.00
  Quantity on hand: 5
  """

  def run do
    name = get_string_input "What is the product name? "

    read_products
    |> search(name)
    |> print_results
  end

  def read_products do
    products = case File.read("./products.json") do
      {:ok, products}  -> products
      {:error, reason} -> IO.puts("There was an error: #{reason}")
    end

    Poison.decode!(products, as: %{"products" => [%Product{}]})
  end

  def search(products, name) do
    products["products"]
    |> Enum.filter(fn(x) -> x.name == "#{name}" end)
  end

  def print_results([]) do
    IO.puts "Sorry, that product was not found in our inventory"
    run()
  end

  def print_results(results) when is_list(results) and length(results) > 0 do
    product = hd(results)

    IO.puts "Name: #{product.name}\nPrice: #{product.price}\nQuantity: #{product.quantity}"
  end
end
