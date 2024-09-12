
defmodule RockPaperScissors.Game do
    alias RockPaperScissors.Player, as: Player
#    alias RockPaperScissors.PlayerRegistry

    @default_number_of_players  5

    def run_game do
        first_player = Player.new(7, :anthony)
        IO.puts("First player: #{inspect(first_player)}")
        init_possible_players()

    end

    def get_names_from_file(players_amount) do
        names_file_path = "lib/Static/PlayerNames.txt"
        try do
             File.exists?(names_file_path) || raise File.Error, "File on path #{names_file_path} not exists}"
             names_list = File.read!(names_file_path) |> String.split(["\r\n", "\n"], trim: true)
             init_value = Enum.random(0..length(names_list) - players_amount)
             players_names_list = Enum.slice(
                names_list, init_value, init_value + players_amount
             )
             players_names_list
        rescue
            error -> {:error, "An error occurred #{Exception.message(error)} during parsing file"}
        end
    end


    def init_possible_players do
        RockPaperScissors.PlayerRegistry.start_link(nil)
        names = get_names_from_file(@default_number_of_players)
        IO.puts("Chossen names : #{inspect(names)}")
      #        new_players = for numb <- 1..@default_number_of_players do
#
#        end
    end

  def get_current_players_id() do
    [1, 2, 3, 4, 5]
  end

end
