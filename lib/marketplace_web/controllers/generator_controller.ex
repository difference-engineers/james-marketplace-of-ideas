defmodule MarketplaceWeb.GeneratorController do
  use MarketplaceWeb, :controller

  alias Marketplace.Game
  alias Marketplace.Game.Generator

  def index(conn, _params) do
    generators = Game.list_generators()
    render(conn, "index.html", generators: generators)
  end

  def new(conn, _params) do
    changeset = Game.change_generator(%Generator{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"generator" => generator_params}) do
    case Game.create_generator(generator_params) do
      {:ok, generator} ->
        conn
        |> put_flash(:info, "Generator created successfully.")
        |> redirect(to: Routes.generator_path(conn, :show, generator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    generator = Game.get_generator!(id)
    render(conn, "show.html", generator: generator)
  end

  def edit(conn, %{"id" => id}) do
    generator = Game.get_generator!(id)
    changeset = Game.change_generator(generator)
    render(conn, "edit.html", generator: generator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "generator" => generator_params}) do
    generator = Game.get_generator!(id)

    case Game.update_generator(generator, generator_params) do
      {:ok, generator} ->
        conn
        |> put_flash(:info, "Generator updated successfully.")
        |> redirect(to: Routes.generator_path(conn, :show, generator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", generator: generator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    generator = Game.get_generator!(id)
    {:ok, _generator} = Game.delete_generator(generator)

    conn
    |> put_flash(:info, "Generator deleted successfully.")
    |> redirect(to: Routes.generator_path(conn, :index))
  end
end
