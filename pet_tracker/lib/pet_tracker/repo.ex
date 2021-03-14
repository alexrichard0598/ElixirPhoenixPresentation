defmodule PetTracker.Repo do
  use Ecto.Repo,
    otp_app: :pet_tracker,
    adapter: Ecto.Adapters.MyXQL
end
