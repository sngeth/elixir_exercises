defmodule TemperatureConverterTest do
  import TemperatureConverter
  use ExUnit.Case

  test "converting from F to C" do
    assert f_to_c(32) == "The temperature in Celcius is 0.0"
  end

  test "converting from C to F" do
    assert c_to_f(32) == "The temperature in Fahrenheit is 89.6"
  end
end
