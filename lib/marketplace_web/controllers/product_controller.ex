defmodule MarketplaceWeb.ProductController do
  use MarketplaceWeb, :controller

  alias Marketplace.Game
  alias Marketplace.Game.Product

  def index(conn, _params) do
    products = Game.list_products()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Game.change_product(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case Game.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Game.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Game.get_product!(id)
    changeset = Game.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Game.get_product!(id)

    case Game.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Game.get_product!(id)
    {:ok, _product} = Game.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end
