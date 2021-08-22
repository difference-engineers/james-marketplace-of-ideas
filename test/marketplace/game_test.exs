defmodule Marketplace.GameTest do
  use Marketplace.DataCase
  use TestHelper

  test "correct amount produced" do
    port_facility = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Port Facility")
    logging_camp = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Logging Camp")
    sheep_ranch = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Sheep Ranch")
    wood = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Wood")
    textile = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Textile")
    mutton = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Mutton")
    seafood = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Seafood")
    game_meat = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Game Meat")
    warships = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Warship")
    {:ok, tom} = Marketplace.Game.create_player(%{name: "Tom"})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 3, guilding: 1, player: tom, generator: port_facility})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 2, guilding: 1, player: tom, generator: logging_camp})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 1, guilding: 2, player: tom, generator: logging_camp})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 4, guilding: 0, player: tom, generator: sheep_ranch})

    Marketplace.Game.turn()
    Marketplace.Game.list_products()
      |> Enum.map(&Marketplace.Repo.preload(&1, plot: [:player, :generator], resource: [:luxury]))
      |> Enum.group_by(fn product -> product.resource.name end)
      |> Enum.map(fn {name, products} -> { name, products |> Enum.count } end)
      |> Enum.into(%{})
      |> is(%{"Game Meat" => 2, "Mutton" => 8, "Seafood" => 7, "Textile" => 6, "Warship" => 4, "Luxury Game Meat" => 3, "Luxury Seafood" => 1, "Luxury Wood" => 6})
  end
  test "missing materials" do
    port_facility = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Port Facility")
    logging_camp = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Logging Camp")
    sheep_ranch = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Sheep Ranch")
    wood = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Wood")
    textile = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Textile")
    mutton = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Mutton")
    seafood = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Seafood")
    game_meat = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Game Meat")
    warships = Marketplace.Repo.get_by!(Marketplace.Game.Resource, name: "Warship")
    {:ok, tom} = Marketplace.Game.create_player(%{name: "Tom"})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 1, guilding: 0, player: tom, generator: port_facility})
    {:ok, _} = Marketplace.Game.create_plot(%{level: 1, guilding: 0, player: tom, generator: logging_camp})

    Marketplace.Game.turn()
    Marketplace.Game.list_products()
      |> Enum.map(&Marketplace.Repo.preload(&1, plot: [:player, :generator], resource: [:luxury]))
      |> Enum.group_by(fn product -> product.resource.name end)
      |> Enum.map(fn {name, products} -> { name, products |> Enum.count } end)
      |> Enum.into(%{})
      |> is(%{})
  end
end
