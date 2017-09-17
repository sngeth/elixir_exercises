defmodule SortingRecords do
  def sort(names) do
    names |> Enum.sort(&(&1.last_name <= &2.last_name))
  end
end
