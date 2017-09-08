defmodule HandlingBadInput do
  import Input

  def try do
    r = case Integer.parse(get_input()) do
      { num , _ } -> num
      :error -> :error
    end

    cond do
      r in [0, :error] ->
        IO.puts "Sorry. That's not a valid input."
        try()
      true ->
        IO.puts "It will take #{years_to_double(r)} years to double your initial investment"
    end
  end

  def get_input do
    get_string_input("What is the rate of return? ")
  end

  def years_to_double(r) do
    72 / r
  end
end
