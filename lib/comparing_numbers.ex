defmodule ComparingNumbers do
  import Input

  def run do
    _run(1, [])
  end

  def _run(n, list) when n > 3 do
    max(list)
  end

  def _run(n, list) do
    num = get_numeric_input("Enter a number: ")
    _run(n+1, list ++ [num])
  end

  def max(list) do
    _max(list, hd list)
  end

  def _max([], largest) do
    largest
  end

  def _max([h | t], largest) do
    if h > largest, do: _max(t, h), else: _max(t, largest)
  end
end
