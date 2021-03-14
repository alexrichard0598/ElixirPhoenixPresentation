# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pet_tracker,
  ecto_repos: [PetTracker.Repo]

# Configures the endpoint
config :pet_tracker, PetTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IpAXxjsJrHZ4+YhIDqB4zLXM6J8XB9hs8oP8oDNZFnI71tPO8X3uRJEAGvGPRlYh",
  render_errors: [view: PetTrackerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PetTracker.PubSub,
  live_view: [signing_salt: "duCfL4pf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
