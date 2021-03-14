defmodule PetTracker.Tracker.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :age, :integer
    field :name, :string
    field :type, :string
    field :owner, :id

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :type, :age, :owner])
    |> validate_required([:name, :type, :age, :owner])
    |> validate_inclusion(:age, 0..120, message: "Age must be between 0 and 120")
  end
end
