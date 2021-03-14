defmodule PetTrackerWeb.Router do
  use PetTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PetTrackerWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PetTrackerWeb do
    pipe_through :browser

    live "/", OwnerLive.Index, :index

    live "/owners", OwnerLive.Index, :index
    live "/owners/new", OwnerLive.Index, :new
    live "/owners/:id/edit", OwnerLive.Index, :edit

    live "/owners/:id", OwnerLive.Show, :show
    live "/owners/:id/show/edit", OwnerLive.Show, :edit

    live "/pets", PetLive.Index, :index
    live "/pets/new", PetLive.Index, :new
    live "/pets/:id/edit", PetLive.Index, :edit

    live "/pets/:id", PetLive.Show, :show
    live "/pets/:id/show/edit", PetLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", PetTrackerWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PetTrackerWeb.Telemetry
    end
  end
end
