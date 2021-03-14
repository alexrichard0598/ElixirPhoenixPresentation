defmodule PetTracker.Tracker do
  @moduledoc """
  The Tracker context.
  """

  import Ecto.Query, warn: false
  alias PetTracker.Repo

  alias PetTracker.Tracker.Owner

  @doc """
  Returns the list of owners.

  ## Examples

      iex> list_owners()
      [%Owner{}, ...]

  """
  def list_owners do
    Repo.all(Owner)
  end

  @doc """
  Gets a single owner.

  Raises `Ecto.NoResultsError` if the Owner does not exist.

  ## Examples

      iex> get_owner!(123)
      %Owner{}

      iex> get_owner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_owner!(id), do: Repo.get!(Owner, id)

  @doc """
  Creates a owner.

  ## Examples

      iex> create_owner(%{field: value})
      {:ok, %Owner{}}

      iex> create_owner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_owner(attrs \\ %{}) do
    %Owner{}
    |> Owner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a owner.

  ## Examples

      iex> update_owner(owner, %{field: new_value})
      {:ok, %Owner{}}

      iex> update_owner(owner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_owner(%Owner{} = owner, attrs) do
    owner
    |> Owner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a owner.

  ## Examples

      iex> delete_owner(owner)
      {:ok, %Owner{}}

      iex> delete_owner(owner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking owner changes.

  ## Examples

      iex> change_owner(owner)
      %Ecto.Changeset{data: %Owner{}}

  """
  def change_owner(%Owner{} = owner, attrs \\ %{}) do
    Owner.changeset(owner, attrs)
  end

  alias PetTracker.Tracker.Pet

  @doc """
  Returns the list of pets.

  ## Examples

      iex> list_pets()
      [%Pet{}, ...]

  """
  def list_pets do
    Repo.all(Pet)
  end

  @doc """
  Gets a single pet.

  Raises `Ecto.NoResultsError` if the Pet does not exist.

  ## Examples

      iex> get_pet!(123)
      %Pet{}

      iex> get_pet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pet!(id), do: Repo.get!(Pet, id)

  @doc """
  Creates a pet.

  ## Examples

      iex> create_pet(%{field: value})
      {:ok, %Pet{}}

      iex> create_pet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pet(attrs \\ %{}) do
    %Pet{}
    |> Pet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pet.

  ## Examples

      iex> update_pet(pet, %{field: new_value})
      {:ok, %Pet{}}

      iex> update_pet(pet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pet(%Pet{} = pet, attrs) do
    pet
    |> Pet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pet.

  ## Examples

      iex> delete_pet(pet)
      {:ok, %Pet{}}

      iex> delete_pet(pet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pet(%Pet{} = pet) do
    Repo.delete(pet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pet changes.

  ## Examples

      iex> change_pet(pet)
      %Ecto.Changeset{data: %Pet{}}

  """
  def change_pet(%Pet{} = pet, attrs \\ %{}) do
    Pet.changeset(pet, attrs)
  end

  def owners_select_opts() do
    Enum.map(list_owners(), fn owner ->
      {"#{owner.firstName} #{owner.lastName}", owner.id}
  end)
  end
end
