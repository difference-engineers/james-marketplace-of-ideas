defmodule MarketplaceWeb.Router do
  use MarketplaceWeb, :router

  import MarketplaceWeb.PlayerAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_player
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MarketplaceWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MarketplaceWeb do
  #   pipe_through :api
  # end

  ## Authentication routes

  scope "/", MarketplaceWeb do
    pipe_through [:browser, :redirect_if_player_is_authenticated]

    get "/player/register", PlayerRegistrationController, :new
    post "/player/register", PlayerRegistrationController, :create
    get "/player/log_in", PlayerSessionController, :new
    post "/player/log_in", PlayerSessionController, :create
    get "/player/reset_password", PlayerResetPasswordController, :new
    post "/player/reset_password", PlayerResetPasswordController, :create
    get "/player/reset_password/:token", PlayerResetPasswordController, :edit
    put "/player/reset_password/:token", PlayerResetPasswordController, :update
  end

  scope "/", MarketplaceWeb do
    pipe_through [:browser, :require_authenticated_player]

    get "/player/settings", PlayerSettingsController, :edit
    put "/player/settings", PlayerSettingsController, :update
    get "/player/settings/confirm_email/:token", PlayerSettingsController, :confirm_email
    resources "/generators", GeneratorController
    resources "/resources", ResourceController
    resources "/products", ProductController
    resources "/plots", PlotController
    resources "/players", PlayerController
  end

  scope "/", MarketplaceWeb do
    pipe_through [:browser]

    delete "/player/log_out", PlayerSessionController, :delete
    get "/player/confirm", PlayerConfirmationController, :new
    post "/player/confirm", PlayerConfirmationController, :create
    get "/player/confirm/:token", PlayerConfirmationController, :confirm
  end
end
