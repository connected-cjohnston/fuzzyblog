defmodule Fuzzyblog.Repo do
  use Ecto.Repo,
    otp_app: :fuzzyblog,
    adapter: Ecto.Adapters.Postgres
end
