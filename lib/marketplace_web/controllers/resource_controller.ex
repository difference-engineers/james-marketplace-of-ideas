defmodule MarketplaceWeb.ResourceController do
  use MarketplaceWeb, :controller

  alias Marketplace.Game
  alias Marketplace.Game.Resource

  def index(conn, _params) do
    resources = Game.list_resources()
    render(conn, "index.html", resources: resources)
  end

  def new(conn, _params) do
    changeset = Game.change_resource(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    case Game.create_resource(resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource created successfully.")
        |> redirect(to: Routes.resource_path(conn, :show, resource))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Game.get_resource!(id)
    render(conn, "show.html", resource: resource)
  end

  def edit(conn, %{"id" => id}) do
    resource = Game.get_resource!(id)
    changeset = Game.change_resource(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Game.get_resource!(id)

    case Game.update_resource(resource, resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: Routes.resource_path(conn, :show, resource))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Game.get_resource!(id)
    {:ok, _resource} = Game.delete_resource(resource)

    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: Routes.resource_path(conn, :index))
  end
end
