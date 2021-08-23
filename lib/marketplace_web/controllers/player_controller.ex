defmodule MarketplaceWeb.PlayerController do
  use MarketplaceWeb, :controller

  def index(conn, _params) do
    players = Marketplace.Game.list_players()
    render(conn, "index.html", players: players)
  end

  def show(conn, %{"id" => id}) do
    player = Marketplace.Game.get_player!(id)
    render(conn, "show.html", player: player)
  end
end
