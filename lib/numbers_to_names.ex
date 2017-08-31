defmodule NumbersToNames do
  import Input

  def print_month do
    get_numeric_input("Please enter the number of the month: ")
      |> print_month
  end

  def print_month(num) do
    "The name of the month is #{month_num_to_name(num)}"
  end

  def month_num_to_name(num) do
    month_names[num]
  end

  def month_names do
    %{
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "July",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December"
    }
  end
end
