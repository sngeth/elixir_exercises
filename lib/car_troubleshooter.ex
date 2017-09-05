defmodule CarTroubleshooter do
  import Input

  def start do
    input = get_y_or_n_input("Is the car silent when you turn the key? ")

    case input do
      "Y" -> check_terminals()
      "N" -> check_clicking()
    end
  end

  def check_terminals(input \\ nil) do
    input = input || get_y_or_n_input("Are the battery terminals corroded? ")

    case input do
      "Y" -> IO.puts "Clean terminals and try starting again."
      "N" -> IO.puts "The battery cables may be damaged. Replace cables and try again."
    end
  end

  def check_clicking(input \\ nil, check_car_cranks \\ &check_car_cranks/0) do
    input = input || get_y_or_n_input("Does the car make a clicking noise? ")

    case input do
      "Y" -> IO.puts "Replace the battery."
      "N" -> check_car_cranks
    end
  end

  def check_car_cranks(input \\ nil, check_engine_start \\ &check_engine_start/0) do
    input = input || get_y_or_n_input("Does the car crank up but fail to start? ")

    case input do
      "Y" -> IO.puts "Check spark plug connections."
      "N" -> check_engine_start
    end
  end

  def check_engine_start(input \\ nil, check_fuel_injection \\ &check_fuel_injection/0) do
    input = input || get_y_or_n_input("Does the engine start and then die? ")

    case input do
      "Y" -> check_fuel_injection
    end
  end

  def check_fuel_injection(input \\ nil) do
    input = input || get_y_or_n_input("Does your car have fuel injection? ")

    case input do
      "Y" -> IO.puts "Get it in for service."
      "N" -> IO.puts "Check to ensure the choke is opening and closing."
    end
  end
end
