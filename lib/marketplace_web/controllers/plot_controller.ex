defmodule MarketplaceWeb.PlotController do
  use MarketplaceWeb, :controller

  alias Marketplace.Game
  alias Marketplace.Game.Plot

  def index(conn, _params) do
    plots = Game.list_plots() |> Enum.map(&Marketplace.Repo.preload(&1, [:player, :generator]))
    render(conn, "index.html", plots: plots)
  end

  def new(conn, _params) do
    changeset = Game.change_plot(%Plot{player: conn.assigns.current_player})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plot" => plot_params}) do
    case Game.create_plot(Map.merge(plot_params, %{player: conn.assigns.current_player})) do
      {:ok, plot} ->
        conn
        |> put_flash(:info, "Plot created successfully.")
        |> redirect(to: Routes.plot_path(conn, :show, plot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plot = Game.get_plot!(id)
    render(conn, "show.html", plot: plot)
  end

  def edit(conn, %{"id" => id}) do
    plot = Game.get_plot!(id)
    changeset = Game.change_plot(plot)
    render(conn, "edit.html", plot: plot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plot" => plot_params}) do
    plot = Game.get_plot!(id)

    case Game.update_plot(plot, plot_params) do
      {:ok, plot} ->
        conn
        |> put_flash(:info, "Plot updated successfully.")
        |> redirect(to: Routes.plot_path(conn, :show, plot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plot: plot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plot = Game.get_plot!(id)
    {:ok, _plot} = Game.delete_plot(plot)

    conn
    |> put_flash(:info, "Plot deleted successfully.")
    |> redirect(to: Routes.plot_path(conn, :index))
  end
end
