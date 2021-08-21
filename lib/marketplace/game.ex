defmodule Marketplace.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false

  @doc """
  Returns the list of resources.

  ## Examples

      iex> list_resources()
      [%Marketplace.Game.Resource{}, ...]

  """
  def list_resources do
    Marketplace.Repo.all(Marketplace.Game.Resource)
  end

  @doc """
  Gets a single resource.

  Raises `Ecto.NoResultsError` if the Marketplace.Game.Resource does not exist.

  ## Examples

      iex> get_resource!(123)
      %Marketplace.Game.Resource{}

      iex> get_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource!(id), do: Marketplace.Repo.get!(Marketplace.Game.Resource, id)

  @doc """
  Creates a resource.

  ## Examples

      iex> create_resource(%{field: value})
      {:ok, %Marketplace.Game.Resource{}}

      iex> create_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource(attrs \\ %{}) do
    %Marketplace.Game.Resource{}
    |> Marketplace.Game.Resource.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a resource.

  ## Examples

      iex> update_resource(resource, %{field: new_value})
      {:ok, %Marketplace.Game.Resource{}}

      iex> update_resource(resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource(%Marketplace.Game.Resource{} = resource, attrs) do
    resource
    |> Marketplace.Game.Resource.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a resource.

  ## Examples

      iex> delete_resource(resource)
      {:ok, %Marketplace.Game.Resource{}}

      iex> delete_resource(resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource(%Marketplace.Game.Resource{} = resource) do
    Marketplace.Repo.delete(resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource changes.

  ## Examples

      iex> change_resource(resource)
      %Ecto.Changeset{data: %Marketplace.Game.Resource{}}

  """
  def change_resource(%Marketplace.Game.Resource{} = resource, attrs \\ %{}) do
    Marketplace.Game.Resource.changeset(resource, attrs)
  end


  @doc """
  Returns the list of generators.

  ## Examples

      iex> list_generators()
      [%Marketplace.Game.Generator{}, ...]

  """
  def list_generators do
    Marketplace.Repo.all(Marketplace.Game.Generator)
  end

  @doc """
  Gets a single generator.

  Raises `Ecto.NoResultsError` if the Marketplace.Game.Resource generator does not exist.

  ## Examples

      iex> get_generator!(123)
      %Output{}

      iex> get_generator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_generator!(id), do: Marketplace.Repo.get!(Marketplace.Game.Generator, id)

  @doc """
  Creates a generator.

  ## Examples

      iex> create_generator(%{field: value})
      {:ok, %Marketplace.Game.Generator{}}

      iex> create_generator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_generator(attrs \\ %{}) do
    %Marketplace.Game.Generator{}
    |> Marketplace.Game.Generator.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a generator.

  ## Examples

      iex> update_generator(generator, %{field: new_value})
      {:ok, %Marketplace.Game.Generator{}}

      iex> update_generator(generator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_generator(%Marketplace.Game.Generator{} = generator, attrs) do
    generator
    |> Marketplace.Game.Generator.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a generator.

  ## Examples

      iex> delete_generator(generator)
      {:ok, %Marketplace.Game.Generator{}}

      iex> delete_generator(generator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_generator(%Marketplace.Game.Generator{} = generator) do
    Marketplace.Repo.delete(generator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking generator changes.

  ## Examples

      iex> change_generator(generator)
      %Ecto.Changeset{data: %Marketplace.Game.Generator{}}

  """
  def change_generator(%Marketplace.Game.Generator{} = generator, attrs \\ %{}) do
    Output.changeset(generator, attrs)
  end

  alias Marketplace.Game.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Marketplace.Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Marketplace.Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Marketplace.Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  @doc """
  Returns the list of plots.

  ## Examples

      iex> list_plots()
      [%Marketplace.Game.Plot{}, ...]

  """
  def list_plots do
    Marketplace.Repo.all(Marketplace.Game.Plot)
  end

  @doc """
  Gets a single plot.

  Raises `Ecto.NoResultsError` if the Player resource generator does not exist.

  ## Examples

      iex> get_plot!(123)
      %Marketplace.Game.Plot{}

      iex> get_plot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plot!(id), do: Marketplace.Repo.get!(Marketplace.Game.Plot, id)

  @doc """
  Creates a plot.

  ## Examples

      iex> create_plot(%{field: value})
      {:ok, %Marketplace.Game.Plot{}}

      iex> create_plot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plot(attrs \\ %{}) do
    %Marketplace.Game.Plot{}
    |> Marketplace.Game.Plot.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a plot.

  ## Examples

      iex> update_plot(plot, %{field: new_value})
      {:ok, %Marketplace.Game.Plot{}}

      iex> update_plot(plot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plot(%Marketplace.Game.Plot{} = plot, attrs) do
    plot
    |> Marketplace.Game.Plot.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a plot.

  ## Examples

      iex> delete_plot(plot)
      {:ok, %Marketplace.Game.Plot{}}

      iex> delete_plot(plot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plot(%Marketplace.Game.Plot{} = plot) do
    Marketplace.Repo.delete(plot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plot changes.

  ## Examples

      iex> change_plot(plot)
      %Ecto.Changeset{data: %Marketplace.Game.Plot{}}

  """
  def change_plot(%Marketplace.Game.Plot{} = plot, attrs \\ %{}) do
    Marketplace.Game.Plot.changeset(plot, attrs)
  end

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Marketplace.Game.Product{}, ...]

  """
  def list_products do
    Marketplace.Repo.all(Marketplace.Game.Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Player resource transaction does not exist.

  ## Examples

      iex> get_product!(123)
      %Marketplace.Game.Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Marketplace.Repo.get!(Marketplace.Game.Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Marketplace.Game.Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Marketplace.Game.Product{}
    |> Marketplace.Game.Product.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Marketplace.Game.Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Marketplace.Game.Product{} = product, attrs) do
    product
    |> Marketplace.Game.Product.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Marketplace.Game.Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Marketplace.Game.Product{} = product) do
    Marketplace.Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Marketplace.Game.Product{}}

  """
  def change_product(%Marketplace.Game.Product{} = product, attrs \\ %{}) do
    Marketplace.Game.Product.changeset(product, attrs)
  end

  alias Marketplace.Game.Marketplace.Game.Output

  @doc """
  Returns the list of output.

  ## Examples

      iex> list_output()
      [%Marketplace.Game.Output{}, ...]

  """
  def list_output do
    Marketplace.Repo.all(Marketplace.Game.Output)
  end

  @doc """
  Gets a single output.

  Raises `Ecto.NoResultsError` if the Marketplace.Game.Resource generator need does not exist.

  ## Examples

      iex> get_output!(123)
      %Marketplace.Game.Output{}

      iex> get_output!(456)
      ** (Ecto.NoResultsError)

  """
  def get_output!(id), do: Marketplace.Repo.get!(Marketplace.Game.Output, id)

  @doc """
  Creates a output.

  ## Examples

      iex> create_output(%{field: value})
      {:ok, %Marketplace.Game.Output{}}

      iex> create_output(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_output(attrs \\ %{}) do
    %Marketplace.Game.Output{}
    |> Marketplace.Game.Output.changeset(attrs)
    |> Marketplace.Repo.insert()
  end

  @doc """
  Updates a output.

  ## Examples

      iex> update_output(output, %{field: new_value})
      {:ok, %Marketplace.Game.Output{}}

      iex> update_output(output, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_output(%Marketplace.Game.Output{} = output, attrs) do
    output
    |> Marketplace.Game.Output.changeset(attrs)
    |> Marketplace.Repo.update()
  end

  @doc """
  Deletes a output.

  ## Examples

      iex> delete_output(output)
      {:ok, %Marketplace.Game.Output{}}

      iex> delete_output(output)
      {:error, %Ecto.Changeset{}}

  """
  def delete_output(%Marketplace.Game.Output{} = output) do
    Marketplace.Repo.delete(output)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking output changes.

  ## Examples

      iex> change_output(output)
      %Ecto.Changeset{data: %Marketplace.Game.Output{}}

  """
  def change_output(%Marketplace.Game.Output{} = output, attrs \\ %{}) do
    Marketplace.Game.Output.changeset(output, attrs)
  end
end
