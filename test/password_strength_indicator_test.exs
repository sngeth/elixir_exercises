defmodule PasswordStrengthIndicatorTest do
  import PasswordStrengthIndicator
  import ExUnit.CaptureIO
  use ExUnit.Case

  test "very weak password" do
    assert capture_io(fn -> password_validator "12345" end)
      == "The password '12345' is a very weak password.\n"
  end

  test "weak password" do
    assert capture_io(fn -> password_validator "abcdef" end)
      == "The password 'abcdef' is a weak password.\n"
  end

  test "strong password" do
    assert capture_io(fn -> password_validator "abc123xyz" end)
      == "The password 'abc123xyz' is a strong password.\n"
  end

  test "very strong password" do
    assert capture_io(fn -> password_validator "1337h@xor!" end)
      == "The password '1337h@xor!' is a very strong password.\n"
  end
end
