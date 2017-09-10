defmodule GuessingGame do
  import Input
  @moduledoc """
  Prompt for the difficulty level, and then start the game. The
  computer picks a random number in that range and prompts
  the player to guess that number. Each time the player guesses,
  the computer should give the player a hint as to
  whether the number is too high or too low. The computer
  should also keep track of the number of guesses. Once the
  player guesses the correct number, the computer should
  present the number of guesses and ask if the player would
  like to play again.

  Example Output
  Let's play Guess the Number.
  Pick a difficulty level (1, 2, or 3): 1
  I have my number. What's your guess? 1
  Too low. Guess again: 5
  Too high. Guess again: 2
  You got it in 3 guesses!
  Play again? n
  Goodbye!
  """

  def start do
    IO.puts "Let's play Guess the Number."

    answer = select_difficulty()
              |> random_number

    guess |> check_guess(answer, 1)
  end

  def select_difficulty do
    get_numeric_input("Pick a difficulty level: ")
  end

  def random_number(difficulty) do
    n = case difficulty do
      1 -> 10
      2 -> 100
      3 -> 1000
    end

    :rand.uniform(n)
  end

  def guess do
    get_numeric_input("I have my number. What's your guess? ")
  end

  def check_guess(guess, answer, num_guesses) do
    cond do
      guess < answer ->
        get_numeric_input("Too low. Guess again: ")
          |> check_guess(answer, num_guesses + 1)
      guess > answer ->
        get_numeric_input("Too high. Guess again: ")
          |> check_guess(answer, num_guesses + 1)
      guess == answer ->
        IO.puts "You got it in #{num_guesses} guesses!"
        play_again?()
    end
  end

  def play_again? do
    case get_y_or_n_input("Play again (y/n)? ") do
      "Y" -> start()
      "N" -> IO.puts "Goodbye!"
    end
  end
end
