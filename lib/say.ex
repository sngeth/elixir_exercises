defmodule Say do
  @moduledoc """
  Documentation for Say
  """

  @doc """
  Hello world.

  ## Examples

      iex> Say.hello(Bob)
      "Hello, Bob, nice to meet you!
      :ok

  """
  def hello(name) do
    IO.puts "Hello, #{name}, nice to meet you!"
  end
end
