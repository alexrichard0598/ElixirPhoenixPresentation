defmodule PetTracker.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :type, :string
      add :age, :integer
      add :owner, references(:owners, on_delete: :nothing)

      timestamps()
    end

    create index(:pets, [:owner])
  end
end
