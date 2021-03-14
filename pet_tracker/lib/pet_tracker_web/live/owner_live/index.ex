defmodule PetTrackerWeb.OwnerLive.Index do
  use PetTrackerWeb, :live_view

  alias PetTracker.Tracker
  alias PetTracker.Tracker.Owner

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :owners, list_owners())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Owner")
    |> assign(:owner, Tracker.get_owner!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Owner")
    |> assign(:owner, %Owner{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Owners")
    |> assign(:owner, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    owner = Tracker.get_owner!(id)
    {:ok, _} = Tracker.delete_owner(owner)

    {:noreply, assign(socket, :owners, list_owners())}
  end

  defp list_owners do
    Tracker.list_owners()
  end
end
