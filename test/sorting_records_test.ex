defmodule SortingRecordsTest do
  use ExUnit.Case
  import SortingRecords

  test "sorts by last name" do
    names = [
      %{first_name: "John", last_name: "Johnson"},
      %{first_name: "Tou", last_name: "Xiong"},
      %{first_name: "Michaela", last_name: "Michaelson"},
      %{first_name: "Jacob", last_name: "Jacobson"},
      %{first_name: "Jacquelyn", last_name: "Jackson"},
      %{first_name: "Sally", last_name: "Weber"}
    ]

    sorted_by_last_name = [
      %{first_name: "Jacquelyn", last_name: "Jackson"},
      %{first_name: "Jacob", last_name: "Jacobson"},
      %{first_name: "John", last_name: "Johnson"},
      %{first_name: "Michaela", last_name: "Michaelson"},
      %{first_name: "Sally", last_name: "Weber"},
      %{first_name: "Tou", last_name: "Xiong"}
    ]

    assert sorted_by_last_name == SortingRecords.sort(names)
  end
end
