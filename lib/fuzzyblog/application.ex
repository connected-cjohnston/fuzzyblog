defmodule Fuzzyblog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FuzzyblogWeb.Telemetry,
      # Start the Ecto repository
      Fuzzyblog.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fuzzyblog.PubSub},
      # Start Finch
      {Finch, name: Fuzzyblog.Finch},
      # Start the Endpoint (http/https)
      FuzzyblogWeb.Endpoint
      # Start a worker by calling: Fuzzyblog.Worker.start_link(arg)
      # {Fuzzyblog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fuzzyblog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FuzzyblogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
