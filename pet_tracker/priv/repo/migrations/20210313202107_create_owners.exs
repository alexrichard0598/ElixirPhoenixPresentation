defmodule PetTracker.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :firstName, :string
      add :lastName, :string
      add :age, :integer

      timestamps()
    end

  end
end
