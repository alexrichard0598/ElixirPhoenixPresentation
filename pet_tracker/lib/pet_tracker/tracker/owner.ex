defmodule PetTracker.Tracker.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :age, :integer
    field :firstName, :string
    field :lastName, :string

    timestamps()
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [:firstName, :lastName, :age])
    |> validate_required([:firstName, :lastName, :age])
  end
end
