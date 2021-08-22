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
      |> Enum.map(&Marketplace.Repo.preload(&1, plot: [:player, :generator], resource: []))
      |> Enum.group_by(fn product -> product.resource.name end)
      |> Enum.map(fn {name, products} ->
        {
          name,
          products
          |> Enum.split_with(fn product -> product.luxury end)
          |> Tuple.to_list
          |> Enum.map(&length/1)
          |> List.to_tuple()
        }
      end)
      |> Enum.into(%{})
      |> is(%{"Game Meat" => {3, 2}, "Mutton" => {0, 8}, "Seafood" => {1, 7}, "Textile" => {0, 10}, "Warship" => {1, 3}, "Wood" => {7, 7}})
  end
end
