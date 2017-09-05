defmodule CarTroubleshooterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias CarTroubleshooter

  test "check terminals for corrosion - N" do
    assert capture_io(fn -> CarTroubleshooter.check_terminals "N" end)
      == "The battery cables may be damaged. Replace cables and try again.\n"
  end

  test "check terminals for corrosion - Y" do
    assert capture_io(fn -> CarTroubleshooter.check_terminals "Y" end)
      == "Clean terminals and try starting again.\n"
  end

  test "check car makes a clicking noise - Y" do
    assert capture_io(fn -> CarTroubleshooter.check_clicking "Y" end)
      == "Replace the battery.\n"
  end

  test "check car makes a clicking noise - N" do
    assert CarTroubleshooter.check_clicking("N", "Calling check_car_cranks()")
      == "Calling check_car_cranks()"
  end

  test "check car cranks - Y" do
    assert capture_io(fn -> CarTroubleshooter.check_car_cranks("Y") end)
      == "Check spark plug connections.\n"
  end

  test "check car cranks - N" do
    assert CarTroubleshooter.check_clicking("N", "Calling check_engine_start()")
      == "Calling check_engine_start()"
  end

  test "check engine start - Y" do
    assert CarTroubleshooter.check_clicking("N", "Calling check_fuel_injection()")
      == "Calling check_fuel_injection()"
  end

  test "check fuel injection - Y" do
    assert capture_io(fn -> CarTroubleshooter.check_fuel_injection("Y") end)
      == "Get it in for service.\n"
  end

  test "check fuel injection - N" do
    assert capture_io(fn -> CarTroubleshooter.check_fuel_injection("N") end)
      == "Check to ensure the choke is opening and closing.\n"
  end
end
