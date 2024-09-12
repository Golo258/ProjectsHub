defmodule RockPaperScissors.MixProject do
  use Mix.Project

  def project do
    [
      app: :rock_paper_scissors,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_options: [warnings_as_errors: false],
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      run_game: ["compile --no-warnings-as-errors", "run -e 'RockPaperScissors.Game.run_game()'"]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"}
    ]
  end
end
