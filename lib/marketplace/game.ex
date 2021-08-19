defmodule Marketplace.Game do
  @moduledoc """
  The Game context.
  """

  import Ecto.Query, warn: false
  alias Marketplace.Repo

  alias Marketplace.Game.Resource

  @doc """
  Returns the list of resources.

  ## Examples

      iex> list_resources()
      [%Resource{}, ...]

  """
  def list_resources do
    Repo.all(Resource)
  end

  @doc """
  Gets a single resource.

  Raises `Ecto.NoResultsError` if the Resource does not exist.

  ## Examples

      iex> get_resource!(123)
      %Resource{}

      iex> get_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource!(id), do: Repo.get!(Resource, id)

  @doc """
  Creates a resource.

  ## Examples

      iex> create_resource(%{field: value})
      {:ok, %Resource{}}

      iex> create_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource(attrs \\ %{}) do
    %Resource{}
    |> Resource.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource.

  ## Examples

      iex> update_resource(resource, %{field: new_value})
      {:ok, %Resource{}}

      iex> update_resource(resource, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource(%Resource{} = resource, attrs) do
    resource
    |> Resource.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource.

  ## Examples

      iex> delete_resource(resource)
      {:ok, %Resource{}}

      iex> delete_resource(resource)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource(%Resource{} = resource) do
    Repo.delete(resource)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource changes.

  ## Examples

      iex> change_resource(resource)
      %Ecto.Changeset{data: %Resource{}}

  """
  def change_resource(%Resource{} = resource, attrs \\ %{}) do
    Resource.changeset(resource, attrs)
  end

  alias Marketplace.Game.ResourceGenerator

  @doc """
  Returns the list of resource_generators.

  ## Examples

      iex> list_resource_generators()
      [%ResourceGenerator{}, ...]

  """
  def list_resource_generators do
    Repo.all(ResourceGenerator)
  end

  @doc """
  Gets a single resource_generator.

  Raises `Ecto.NoResultsError` if the Resource generator does not exist.

  ## Examples

      iex> get_resource_generator!(123)
      %ResourceGenerator{}

      iex> get_resource_generator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_resource_generator!(id), do: Repo.get!(ResourceGenerator, id)

  @doc """
  Creates a resource_generator.

  ## Examples

      iex> create_resource_generator(%{field: value})
      {:ok, %ResourceGenerator{}}

      iex> create_resource_generator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_resource_generator(attrs \\ %{}) do
    %ResourceGenerator{}
    |> ResourceGenerator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a resource_generator.

  ## Examples

      iex> update_resource_generator(resource_generator, %{field: new_value})
      {:ok, %ResourceGenerator{}}

      iex> update_resource_generator(resource_generator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_resource_generator(%ResourceGenerator{} = resource_generator, attrs) do
    resource_generator
    |> ResourceGenerator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a resource_generator.

  ## Examples

      iex> delete_resource_generator(resource_generator)
      {:ok, %ResourceGenerator{}}

      iex> delete_resource_generator(resource_generator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_resource_generator(%ResourceGenerator{} = resource_generator) do
    Repo.delete(resource_generator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking resource_generator changes.

  ## Examples

      iex> change_resource_generator(resource_generator)
      %Ecto.Changeset{data: %ResourceGenerator{}}

  """
  def change_resource_generator(%ResourceGenerator{} = resource_generator, attrs \\ %{}) do
    ResourceGenerator.changeset(resource_generator, attrs)
  end

  alias Marketplace.Game.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
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
  def get_player!(id), do: Repo.get!(Player, id)

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
    |> Repo.insert()
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
    |> Repo.update()
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
    Repo.delete(player)
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

  alias Marketplace.Game.PlayerResourceGenerator

  @doc """
  Returns the list of player_resource_generators.

  ## Examples

      iex> list_player_resource_generators()
      [%PlayerResourceGenerator{}, ...]

  """
  def list_player_resource_generators do
    Repo.all(PlayerResourceGenerator)
  end

  @doc """
  Gets a single player_resource_generator.

  Raises `Ecto.NoResultsError` if the Player resource generator does not exist.

  ## Examples

      iex> get_player_resource_generator!(123)
      %PlayerResourceGenerator{}

      iex> get_player_resource_generator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_resource_generator!(id), do: Repo.get!(PlayerResourceGenerator, id)

  @doc """
  Creates a player_resource_generator.

  ## Examples

      iex> create_player_resource_generator(%{field: value})
      {:ok, %PlayerResourceGenerator{}}

      iex> create_player_resource_generator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_resource_generator(attrs \\ %{}) do
    %PlayerResourceGenerator{}
    |> PlayerResourceGenerator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_resource_generator.

  ## Examples

      iex> update_player_resource_generator(player_resource_generator, %{field: new_value})
      {:ok, %PlayerResourceGenerator{}}

      iex> update_player_resource_generator(player_resource_generator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_resource_generator(%PlayerResourceGenerator{} = player_resource_generator, attrs) do
    player_resource_generator
    |> PlayerResourceGenerator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_resource_generator.

  ## Examples

      iex> delete_player_resource_generator(player_resource_generator)
      {:ok, %PlayerResourceGenerator{}}

      iex> delete_player_resource_generator(player_resource_generator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_resource_generator(%PlayerResourceGenerator{} = player_resource_generator) do
    Repo.delete(player_resource_generator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_resource_generator changes.

  ## Examples

      iex> change_player_resource_generator(player_resource_generator)
      %Ecto.Changeset{data: %PlayerResourceGenerator{}}

  """
  def change_player_resource_generator(%PlayerResourceGenerator{} = player_resource_generator, attrs \\ %{}) do
    PlayerResourceGenerator.changeset(player_resource_generator, attrs)
  end

  alias Marketplace.Game.PlayerResourceTransaction

  @doc """
  Returns the list of player_resource_transactions.

  ## Examples

      iex> list_player_resource_transactions()
      [%PlayerResourceTransaction{}, ...]

  """
  def list_player_resource_transactions do
    Repo.all(PlayerResourceTransaction)
  end

  @doc """
  Gets a single player_resource_transaction.

  Raises `Ecto.NoResultsError` if the Player resource transaction does not exist.

  ## Examples

      iex> get_player_resource_transaction!(123)
      %PlayerResourceTransaction{}

      iex> get_player_resource_transaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_resource_transaction!(id), do: Repo.get!(PlayerResourceTransaction, id)

  @doc """
  Creates a player_resource_transaction.

  ## Examples

      iex> create_player_resource_transaction(%{field: value})
      {:ok, %PlayerResourceTransaction{}}

      iex> create_player_resource_transaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_resource_transaction(attrs \\ %{}) do
    %PlayerResourceTransaction{}
    |> PlayerResourceTransaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_resource_transaction.

  ## Examples

      iex> update_player_resource_transaction(player_resource_transaction, %{field: new_value})
      {:ok, %PlayerResourceTransaction{}}

      iex> update_player_resource_transaction(player_resource_transaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_resource_transaction(%PlayerResourceTransaction{} = player_resource_transaction, attrs) do
    player_resource_transaction
    |> PlayerResourceTransaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_resource_transaction.

  ## Examples

      iex> delete_player_resource_transaction(player_resource_transaction)
      {:ok, %PlayerResourceTransaction{}}

      iex> delete_player_resource_transaction(player_resource_transaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_resource_transaction(%PlayerResourceTransaction{} = player_resource_transaction) do
    Repo.delete(player_resource_transaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_resource_transaction changes.

  ## Examples

      iex> change_player_resource_transaction(player_resource_transaction)
      %Ecto.Changeset{data: %PlayerResourceTransaction{}}

  """
  def change_player_resource_transaction(%PlayerResourceTransaction{} = player_resource_transaction, attrs \\ %{}) do
    PlayerResourceTransaction.changeset(player_resource_transaction, attrs)
  end
end
