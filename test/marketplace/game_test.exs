defmodule Marketplace.GameTest do
  use Marketplace.DataCase

  alias Marketplace.Game

  describe "resources" do
    alias Marketplace.Game.Resource

    @valid_attrs %{export: 42, import: 42, luxury_export: 42, luxury_import: 42, name: "some name", perishable: true}
    @update_attrs %{export: 43, import: 43, luxury_export: 43, luxury_import: 43, name: "some updated name", perishable: false}
    @invalid_attrs %{export: nil, import: nil, luxury_export: nil, luxury_import: nil, name: nil, perishable: nil}

    def resource_fixture(attrs \\ %{}) do
      {:ok, resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_resource()

      resource
    end

    test "list_resources/0 returns all resources" do
      resource = resource_fixture()
      assert Game.list_resources() == [resource]
    end

    test "get_resource!/1 returns the resource with given id" do
      resource = resource_fixture()
      assert Game.get_resource!(resource.id) == resource
    end

    test "create_resource/1 with valid data creates a resource" do
      assert {:ok, %Resource{} = resource} = Game.create_resource(@valid_attrs)
      assert resource.export == 42
      assert resource.import == 42
      assert resource.luxury_export == 42
      assert resource.luxury_import == 42
      assert resource.name == "some name"
      assert resource.perishable == true
    end

    test "create_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_resource(@invalid_attrs)
    end

    test "update_resource/2 with valid data updates the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{} = resource} = Game.update_resource(resource, @update_attrs)
      assert resource.export == 43
      assert resource.import == 43
      assert resource.luxury_export == 43
      assert resource.luxury_import == 43
      assert resource.name == "some updated name"
      assert resource.perishable == false
    end

    test "update_resource/2 with invalid data returns error changeset" do
      resource = resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_resource(resource, @invalid_attrs)
      assert resource == Game.get_resource!(resource.id)
    end

    test "delete_resource/1 deletes the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{}} = Game.delete_resource(resource)
      assert_raise Ecto.NoResultsError, fn -> Game.get_resource!(resource.id) end
    end

    test "change_resource/1 returns a resource changeset" do
      resource = resource_fixture()
      assert %Ecto.Changeset{} = Game.change_resource(resource)
    end
  end

  describe "resource_generators" do
    alias Marketplace.Game.ResourceGenerator

    @valid_attrs %{name: "some name", profit: 42}
    @update_attrs %{name: "some updated name", profit: 43}
    @invalid_attrs %{name: nil, profit: nil}

    def resource_generator_fixture(attrs \\ %{}) do
      {:ok, resource_generator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_resource_generator()

      resource_generator
    end

    test "list_resource_generators/0 returns all resource_generators" do
      resource_generator = resource_generator_fixture()
      assert Game.list_resource_generators() == [resource_generator]
    end

    test "get_resource_generator!/1 returns the resource_generator with given id" do
      resource_generator = resource_generator_fixture()
      assert Game.get_resource_generator!(resource_generator.id) == resource_generator
    end

    test "create_resource_generator/1 with valid data creates a resource_generator" do
      assert {:ok, %ResourceGenerator{} = resource_generator} = Game.create_resource_generator(@valid_attrs)
      assert resource_generator.name == "some name"
      assert resource_generator.profit == 42
    end

    test "create_resource_generator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_resource_generator(@invalid_attrs)
    end

    test "update_resource_generator/2 with valid data updates the resource_generator" do
      resource_generator = resource_generator_fixture()
      assert {:ok, %ResourceGenerator{} = resource_generator} = Game.update_resource_generator(resource_generator, @update_attrs)
      assert resource_generator.name == "some updated name"
      assert resource_generator.profit == 43
    end

    test "update_resource_generator/2 with invalid data returns error changeset" do
      resource_generator = resource_generator_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_resource_generator(resource_generator, @invalid_attrs)
      assert resource_generator == Game.get_resource_generator!(resource_generator.id)
    end

    test "delete_resource_generator/1 deletes the resource_generator" do
      resource_generator = resource_generator_fixture()
      assert {:ok, %ResourceGenerator{}} = Game.delete_resource_generator(resource_generator)
      assert_raise Ecto.NoResultsError, fn -> Game.get_resource_generator!(resource_generator.id) end
    end

    test "change_resource_generator/1 returns a resource_generator changeset" do
      resource_generator = resource_generator_fixture()
      assert %Ecto.Changeset{} = Game.change_resource_generator(resource_generator)
    end
  end

  describe "players" do
    alias Marketplace.Game.Player

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Game.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Game.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Game.create_player(@valid_attrs)
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Game.update_player(player, @update_attrs)
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player(player, @invalid_attrs)
      assert player == Game.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Game.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Game.change_player(player)
    end
  end

  describe "player_resource_generators" do
    alias Marketplace.Game.PlayerResourceGenerator

    @valid_attrs %{level: 42}
    @update_attrs %{level: 43}
    @invalid_attrs %{level: nil}

    def player_resource_generator_fixture(attrs \\ %{}) do
      {:ok, player_resource_generator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_player_resource_generator()

      player_resource_generator
    end

    test "list_player_resource_generators/0 returns all player_resource_generators" do
      player_resource_generator = player_resource_generator_fixture()
      assert Game.list_player_resource_generators() == [player_resource_generator]
    end

    test "get_player_resource_generator!/1 returns the player_resource_generator with given id" do
      player_resource_generator = player_resource_generator_fixture()
      assert Game.get_player_resource_generator!(player_resource_generator.id) == player_resource_generator
    end

    test "create_player_resource_generator/1 with valid data creates a player_resource_generator" do
      assert {:ok, %PlayerResourceGenerator{} = player_resource_generator} = Game.create_player_resource_generator(@valid_attrs)
      assert player_resource_generator.level == 42
    end

    test "create_player_resource_generator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player_resource_generator(@invalid_attrs)
    end

    test "update_player_resource_generator/2 with valid data updates the player_resource_generator" do
      player_resource_generator = player_resource_generator_fixture()
      assert {:ok, %PlayerResourceGenerator{} = player_resource_generator} = Game.update_player_resource_generator(player_resource_generator, @update_attrs)
      assert player_resource_generator.level == 43
    end

    test "update_player_resource_generator/2 with invalid data returns error changeset" do
      player_resource_generator = player_resource_generator_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player_resource_generator(player_resource_generator, @invalid_attrs)
      assert player_resource_generator == Game.get_player_resource_generator!(player_resource_generator.id)
    end

    test "delete_player_resource_generator/1 deletes the player_resource_generator" do
      player_resource_generator = player_resource_generator_fixture()
      assert {:ok, %PlayerResourceGenerator{}} = Game.delete_player_resource_generator(player_resource_generator)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player_resource_generator!(player_resource_generator.id) end
    end

    test "change_player_resource_generator/1 returns a player_resource_generator changeset" do
      player_resource_generator = player_resource_generator_fixture()
      assert %Ecto.Changeset{} = Game.change_player_resource_generator(player_resource_generator)
    end
  end

  describe "player_resource_transactions" do
    alias Marketplace.Game.PlayerResourceTransaction

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def player_resource_transaction_fixture(attrs \\ %{}) do
      {:ok, player_resource_transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game.create_player_resource_transaction()

      player_resource_transaction
    end

    test "list_player_resource_transactions/0 returns all player_resource_transactions" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert Game.list_player_resource_transactions() == [player_resource_transaction]
    end

    test "get_player_resource_transaction!/1 returns the player_resource_transaction with given id" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert Game.get_player_resource_transaction!(player_resource_transaction.id) == player_resource_transaction
    end

    test "create_player_resource_transaction/1 with valid data creates a player_resource_transaction" do
      assert {:ok, %PlayerResourceTransaction{} = player_resource_transaction} = Game.create_player_resource_transaction(@valid_attrs)
    end

    test "create_player_resource_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game.create_player_resource_transaction(@invalid_attrs)
    end

    test "update_player_resource_transaction/2 with valid data updates the player_resource_transaction" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert {:ok, %PlayerResourceTransaction{} = player_resource_transaction} = Game.update_player_resource_transaction(player_resource_transaction, @update_attrs)
    end

    test "update_player_resource_transaction/2 with invalid data returns error changeset" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Game.update_player_resource_transaction(player_resource_transaction, @invalid_attrs)
      assert player_resource_transaction == Game.get_player_resource_transaction!(player_resource_transaction.id)
    end

    test "delete_player_resource_transaction/1 deletes the player_resource_transaction" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert {:ok, %PlayerResourceTransaction{}} = Game.delete_player_resource_transaction(player_resource_transaction)
      assert_raise Ecto.NoResultsError, fn -> Game.get_player_resource_transaction!(player_resource_transaction.id) end
    end

    test "change_player_resource_transaction/1 returns a player_resource_transaction changeset" do
      player_resource_transaction = player_resource_transaction_fixture()
      assert %Ecto.Changeset{} = Game.change_player_resource_transaction(player_resource_transaction)
    end
  end
end
