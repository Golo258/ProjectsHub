import Config

config :rock_paper_scissors, RockPaperScissors.Repo,
       database: "postgres@192.168.56.102",
       username: "postgres",
       password: "admin123",
       hostname: "192.168.56.102"

config :rock_paper_scissors, ecto_repos: [RockPaperScissors.Repo]
