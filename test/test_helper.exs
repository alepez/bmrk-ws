ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Bmrk.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Bmrk.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Bmrk.Repo)

