defmodule KarvonenHeartRate do
  import Input

  def print_table do
    restingHR = get_numeric_input("Resting Pulse: ")
    age = get_numeric_input("Age: ")
    intensities = Stream.iterate(55, &(&1+5)) |> Enum.take(9)

    IO.puts "Resting Pulse: #{restingHR} Age: #{age}"
    IO.puts("Intensity | Rate")
    IO.puts("----------|-------")

    for i <- intensities do
      target = target_heart_rate(restingHR, age, i)
      IO.puts("#{i}%       | #{target}")
    end
  end

  def target_heart_rate(restingHR, age, intensity) do
    (((220 - age) - restingHR) * intensity/100) + restingHR
      |> round
  end
end
