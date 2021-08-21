# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Marketplace.Repo.insert!(%Marketplace.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

beef_resource = Game.create_resource(%{name: "Beef", export: 5, import: 10, luxury_export: 15, luxury_import: 30})
dairy_resource = Game.create_resource(%{name: "Dairy", export: 5, import: 10, luxury_export: 15, luxury_import: 30})
produce_resource = Game.create_resource(%{name: "Produce", export: 3, import: 12, luxury_export: 9, luxury_import: 36})
mutton_resource = Game.create_resource(%{name: "Mutton", export: 5, import: 10, luxury_export: 15, luxury_import: 30})
textiles_resource = Game.create_resource(%{name: "Textiles", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
grain_resource = Game.create_resource(%{name: "Grain", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
beer_resource = Game.create_resource(%{name: "Beer", export: 8, import: 16, luxury_export: 24, luxury_import: 36})
seafood_resource = Game.create_resource(%{name: "Seafood", export: 5, import: 10, luxury_export: 15, luxury_import: 30})
warships_resource = Game.create_resource(%{name: "Warships", export: 5}
stone_resource = Game.create_resource(%{name: "Stone", export: 6, import: 12, luxury_export: 18, luxury_import: 36})
metal_resource = Game.create_resource(%{name: "Metal", export: 6, import: 12, luxury_export: 18, luxury_import: 36})
wood_resource = Game.create_resource(%{name: "Wood", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
game_meat_resource = Game.create_resource(%{name: "Game Meat", export: 8, import: 16, luxury_export: 24, luxury_import: 48})
animals_resource = Game.create_resource(%{name: "C. Animal", export: 0, import: 20, luxury_export: 30, luxury_import: 60})

sheep_ranch_generator = Game.create_generator(%{name: "Sheep Ranch", profits: [8, 26, 44, 62, 80]})
cattle_ranch_generator = Game.create_generator(%{name: "Cattle Ranch", profits: [0, 20, 40, 60, 80]})
produce_farm_generator = Game.create_generator(%{name: "Produce Farm", profits: [6, 18, 30, 42, 54]})
mine_generator = Game.create_generator(%{name: "Mine", profits: [12, 24, 36, 48, 60]})
breeding_pens_generator = Game.create_generator(%{name: "Breeding Pens", profits: [14, 28, 42, 56, 70]})
grain_farm_generator = Game.create_generator(%{name: "Grain Farm", profits: [8, 20, 40, 60, 80]})
port_facility_generator = Game.create_generator(%{name: "Port Facility", profits: [10, 10, 20, 30, 40]})
quary_generator = Game.create_generator(%{name: "Quarry", profits: [12, 24, 36, 48, 60]})
logging_camp_generator = Game.create_generator(%{name: "Logging Camp", profits: [8, 24, 40, 56, 72]})

_output = Game.create_output(%{})
