defmodule PetTrackerWeb.PetLive.Index do
  use PetTrackerWeb, :live_view

  alias PetTracker.Tracker
  alias PetTracker.Tracker.Pet

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(socket, :pets, list_pets()),
      temporary_assigns: [
        select: Tracker.owners_select_opts(),
        owners: Tracker.list_owners()
      ]
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pet")
    |> assign(:pet, Tracker.get_pet!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pet")
    |> assign(:pet, %Pet{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pets")
    |> assign(:pet, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pet = Tracker.get_pet!(id)
    {:ok, _} = Tracker.delete_pet(pet)

    {:noreply, assign(socket, :pets, list_pets())}
  end

  defp list_pets do
    Tracker.list_pets()
  end
end
