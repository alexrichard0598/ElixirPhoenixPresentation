defmodule PetTracker.TrackerTest do
  use PetTracker.DataCase

  alias PetTracker.Tracker

  describe "owners" do
    alias PetTracker.Tracker.Owner

    @valid_attrs %{age: 42, firstName: "some firstName", lastName: "some lastName"}
    @update_attrs %{age: 43, firstName: "some updated firstName", lastName: "some updated lastName"}
    @invalid_attrs %{age: nil, firstName: nil, lastName: nil}

    def owner_fixture(attrs \\ %{}) do
      {:ok, owner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_owner()

      owner
    end

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Tracker.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Tracker.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      assert {:ok, %Owner{} = owner} = Tracker.create_owner(@valid_attrs)
      assert owner.age == 42
      assert owner.firstName == "some firstName"
      assert owner.lastName == "some lastName"
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{} = owner} = Tracker.update_owner(owner, @update_attrs)
      assert owner.age == 43
      assert owner.firstName == "some updated firstName"
      assert owner.lastName == "some updated lastName"
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_owner(owner, @invalid_attrs)
      assert owner == Tracker.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Tracker.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Tracker.change_owner(owner)
    end
  end

  describe "pets" do
    alias PetTracker.Tracker.Pet

    @valid_attrs %{age: 42, name: "some name", type: "some type"}
    @update_attrs %{age: 43, name: "some updated name", type: "some updated type"}
    @invalid_attrs %{age: nil, name: nil, type: nil}

    def pet_fixture(attrs \\ %{}) do
      {:ok, pet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracker.create_pet()

      pet
    end

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Tracker.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Tracker.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      assert {:ok, %Pet{} = pet} = Tracker.create_pet(@valid_attrs)
      assert pet.age == 42
      assert pet.name == "some name"
      assert pet.type == "some type"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracker.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{} = pet} = Tracker.update_pet(pet, @update_attrs)
      assert pet.age == 43
      assert pet.name == "some updated name"
      assert pet.type == "some updated type"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracker.update_pet(pet, @invalid_attrs)
      assert pet == Tracker.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Tracker.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Tracker.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Tracker.change_pet(pet)
    end
  end
end
