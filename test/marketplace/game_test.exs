defmodule Marketplace.GameTest do
  use Marketplace.DataCase

  test "correct amount produced" do
    {:ok, tom} = Marketplace.Game.create_player(%{name: "Tom"})
    port_facility = Marketplace.Repo.get_by!(Marketplace.Game.Generator, name: "Port Facility")
    {:ok, northern_pier} = Marketplace.Game.create_plot(%{level: 3, guilding: 1, player: tom, generator: port_facility})
    assert Marketplace.Game.turn() == true
    assert Marketplace.Game.list_products() == true
  end
end
