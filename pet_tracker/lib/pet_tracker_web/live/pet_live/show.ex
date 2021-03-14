defmodule PetTrackerWeb.PetLive.Show do
  use PetTrackerWeb, :live_view

  alias PetTracker.Tracker

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      socket,
      temporary_assigns: [
        select: Tracker.owners_select_opts(),
        owners: Tracker.list_owners()
      ]
    }
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pet, Tracker.get_pet!(id))}
  end

  defp page_title(:show), do: "Show Pet"
  defp page_title(:edit), do: "Edit Pet"

end
