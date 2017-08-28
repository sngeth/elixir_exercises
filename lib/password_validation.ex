import Comeonin.Bcrypt
import Input

defmodule PasswordValidation do
  def validate do
    user = get_string_input("What is your username? ")
    pw = get_string_input("What is the password? ")

    case checkpw(pw, Users.get(user)) do
      true ->
        "Welcome!"
      false ->
        "I don't know you"
    end
  end
end

defmodule Users do
  def start_link do
    Agent.start_link(fn -> %{} end, name: :users)
  end

  def create do
    user = get_string_input("New Username: ")
    # TODO: Figure out how to turn off console echo
    pw_hash = get_string_input("New Password: ") |> hashpwsalt

    Agent.update(:users, &Map.put(&1, user, pw_hash))
  end

  def get(key) do
    Agent.get(:users, &Map.get(&1, key))
  end
end
