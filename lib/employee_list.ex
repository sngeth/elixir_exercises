defmodule EmployeeList do
  import Input

  def all do
    # Ideally we should supervise this and start when app runs
    Employees.start_link
    Employees.print_employees
  end

  def delete do
    get_string_input("Enter name to be deleted: ")
    |> Employees.delete

    Employees.print_employees
  end
end

defmodule Employees do
  def start_link do
    Agent.start_link(fn -> initial_employees end, name: :employees)
  end

  def print_employees do
    employees = Agent.get(:employees, fn list -> list end)
    num_employees = length(employees)

    IO.puts "There are currently #{num_employees} employees:"
    for e <- employees, do: "#{e}"
  end

  def delete(name) do
    Agent.update(:employees, &List.delete(&1, name))
  end

  defp initial_employees do
    ["John Smith", "Jackie Jackson", "Chris Jones", "Amanda Cullen", "Jeremy Goodwin"]
  end
end
