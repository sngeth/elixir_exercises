defmodule FilteringRecordsTest do
  use ExUnit.Case
  import FilteringRecords

  test "filters by name" do
    names = [
      %{first_name: "John", last_name: "Johnson"},
      %{first_name: "Tou", last_name: "Xiong"},
      %{first_name: "Michaela", last_name: "Michaelson"},
      %{first_name: "Jake", last_name: "Jacobson"},
      %{first_name: "Jacquelyn", last_name: "Jackson"},
      %{first_name: "Sally", last_name: "Weber"}
    ]

    filtered_by_first_name = [
      %{first_name: "Jacquelyn", last_name: "Jackson"},
      %{first_name: "Jake", last_name: "Jacobson"},
    ]

    search_str = "Jac"
    assert filtered_by_first_name ==
      FilteringRecords.filter(search_str, names)
      |> FilteringRecords.sort
  end
end
