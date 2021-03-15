defmodule Rps do
  def main([]) do
    IO.puts("Please provide a value of 'rock', 'paper', or 'scissors'")
  end

  def main(argv) do
    argv |> parse_args |> determine_winner |> IO.puts
    ##player_move = List.first(argv)
    ##play(player_move)
    ##parse_args(argv)
  end

  defp parse_args(argv) do
    switches = [rock: :boolean, paper: :boolean, scissors: :boolean]
    parse = OptionParser.parse(argv, switches: switches)
    case parse do
      {[{switch, true}], [player_move], _} ->
        {to_string(switch), player_move}
      {_, [player_move], _} ->
        {get_comp_move(), player_move}
    end
  end

  # defp play(player_move) do
  #   get_comp_move()
  #   |> determine_winner(player_move)
  #   |> IO.puts
  # end

  defp get_comp_move do
    Enum.random(["rock", "paper", "scissors"])
  end

  # comp WINS
  defp determine_winner({"paper", "rock"}) do
    "You lost, computer played paper"
  end
  defp determine_winner({"rock", "scissors"}) do
    "You lost, computer played rock"
  end
  defp determine_winner({"scissors", "paper"}) do
    "You lost, computer played scissors"
  end

  # TIE GAME
  defp determine_winner({comp_move, player_move}) when comp_move == player_move do
    "It was a tie. You both played #{comp_move}"
  end

  # PLAYER WINS
  defp determine_winner({comp_move, _}) do
    "You win! Computer played #{comp_move}"
  end
end
