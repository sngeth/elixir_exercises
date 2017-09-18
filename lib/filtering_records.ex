defmodule FilteringRecords do
  import Input

  def run do
    search_str = get_string_input "Enter a search string: "

    filter(search_str, employees()) |> sort |> print_table
  end

  def filter(str, names) do
    names |> Enum.filter(fn(x) ->
       x.first_name =~ ~r/#{str}/i ||
       x.last_name =~ ~r/#{str}/i
    end)
  end

  def sort(names) do
    names |> Enum.sort(&(&1.first_name <= &2.first_name))
  end

  def print_table(employees) do
    IO.puts "Name                 | Position             | Seperation Date |"
    for e <-employees do
      full_name = "#{e.first_name} #{e.last_name}" |> String.pad_trailing(20)
      position = "#{e.position}" |> String.pad_trailing(20)
      seperation_date = "#{e.sep_date}" |> String.pad_trailing(15)

      IO.puts "#{full_name} | #{position} | #{seperation_date} |"
    end
  end

  def employees do
    [
      %{first_name: "John", last_name: "Johnson", position: "Manager", sep_date: "2016-12-31"},
      %{first_name: "Tou", last_name: "Xiong", position: "Software Enginer", sep_date: "2016-10-05"},
      %{first_name: "Michaela", last_name: "Michaelson", position: "District Manager", sep_date: "2015-12-19"},
      %{first_name: "Jake", last_name: "Jacobson", position: "Programmer", sep_date: ""},
      %{first_name: "Jacquelyn", last_name: "Jackson", position: "DBA", sep_date: ""},
      %{first_name: "Sally", last_name: "Weber", position: "Web Developer", sep_date: "2015-12-28"}
    ]
  end
end
