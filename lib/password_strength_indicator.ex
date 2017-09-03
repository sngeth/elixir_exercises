require IEx;

defmodule PasswordStrengthIndicator do
  @moduledoc """
  Create a program that determines the complexity of a given password based on these rules:
  • A very weak password contains only numbers and is fewer than eight characters.
  • A weak password contains only letters and is fewer than eight characters.
  • A strong password contains letters and at least one number and is at least eight characters.
  • A very strong password contains letters, numbers, and special characters and is at least eight characters.

  Example Output
       The password '12345' is a very weak password.
       The password 'abcdef' is a weak password.
       The password 'abc123xyz' is a strong password.
       The password '1337h@xor!' is a very strong password.
   """

   def password_validator(pw) do
     strength = cond do
       numbers_only?(pw) -> "very weak"
       letters_only?(pw) -> "weak"
       strong?(pw) -> "strong"
       very_strong?(pw) -> "very strong"
     end

     IO.puts "The password '#{pw}' is a #{strength} password."
   end

   def numbers_only?(pw) do
     pw =~ ~r/^\d+$/
   end

   def letters_only?(pw) do
     pw =~ ~r/^[a-zA-Z]+$/
   end

   def long?(pw) do
     String.length(pw) >= 8
   end

   def strong?(pw) do
     !numbers_only?(pw) && !letters_only?(pw) && long?(pw) && !special_char?(pw)
   end

   def special_char?(pw) do
     pw =~ ~r/[-!@#$%^&*()_+|~=`{}\[\]:;<>?,.]+/
   end

   def very_strong?(pw) do
     !numbers_only?(pw) && !letters_only?(pw) && long?(pw) && special_char?(pw)
   end
end
