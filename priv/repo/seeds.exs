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

beef_resource = Marketplace.Game.create_resource(%{name: "Beef", export: 5, import: 10, luxury_export: 15, luxury_import: 30, perishable: true})
dairy_resource = Marketplace.Game.create_resource(%{name: "Dairy", export: 5, import: 10, luxury_export: 15, luxury_import: 30, perishable: true})
produce_resource = Marketplace.Game.create_resource(%{name: "Produce", export: 3, import: 12, luxury_export: 9, luxury_import: 36, perishable: true})
mutton_resource = Marketplace.Game.create_resource(%{name: "Mutton", export: 5, import: 10, luxury_export: 15, luxury_import: 30, perishable: true})
textile_resource = Marketplace.Game.create_resource(%{name: "Textiles", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
grain_resource = Marketplace.Game.create_resource(%{name: "Grain", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
beer_resource = Marketplace.Game.create_resource(%{name: "Beer", export: 8, import: 16, luxury_export: 24, luxury_import: 36})
seafood_resource = Marketplace.Game.create_resource(%{name: "Seafood", export: 5, import: 10, luxury_export: 15, luxury_import: 30, perishable: true})
warship_resource = Marketplace.Game.create_resource(%{name: "Warships", export: 5, guildable: false, importable: false})
stone_resource = Marketplace.Game.create_resource(%{name: "Stone", export: 6, import: 12, luxury_export: 18, luxury_import: 36})
metal_resource = Marketplace.Game.create_resource(%{name: "Metal", export: 6, import: 12, luxury_export: 18, luxury_import: 36})
wood_resource = Marketplace.Game.create_resource(%{name: "Wood", export: 4, import: 8, luxury_export: 12, luxury_import: 24})
game_meat_resource = Marketplace.Game.create_resource(%{name: "Game Meat", export: 8, import: 16, luxury_export: 24, luxury_import: 48, perishable: true})
champion_animal_resource = Marketplace.Game.create_resource(%{name: "Champion Animal", export: 0, import: 20, guildable: false})
cash_resource = Marketplace.Game.create_resource(%{name: "Cash", export: 1, import: 1, luxury_export: 1, luxury_import: 1})

sheep_ranch_generator = Marketplace.Game.create_generator(%{name: "Sheep Ranch"})
cattle_ranch_generator = Marketplace.Game.create_generator(%{name: "Cattle Ranch"})
produce_farm_generator = Marketplace.Game.create_generator(%{name: "Produce Farm"})
mine_generator = Marketplace.Game.create_generator(%{name: "Mine"})
breeding_pens_generator = Marketplace.Game.create_generator(%{name: "Breeding Pens"})
grain_farm_generator = Marketplace.Game.create_generator(%{name: "Grain Farm"})
port_facility_generator = Marketplace.Game.create_generator(%{name: "Port Facility"})
quary_generator = Marketplace.Game.create_generator(%{name: "Quarry"})
logging_camp_generator = Marketplace.Game.create_generator(%{name: "Logging Camp"})

wood_warship_material_cost = Marketplace.Game.create_material_cost(%{product_resource: warship_resource, required_resource: wood_resource, amount: 2})
textile_warship_material_cost = Marketplace.Game.create_material_cost(%{product_resource: warship_resource, required_resource: textile_resource, amount: 1})

mutton_sheep_ranch_output = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: sheep_ranch_generator, resource: mutton_resource})
textiles_sheep_ranch_output = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: sheep_ranch_generator, resource: textile_resource})
beef_cattle_ranch_output = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: cattle_ranch_generator, resource: beef_resource})
dairy_cattle_ranch_output = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: cattle_ranch_generator, resource: dairy_resource})
produce_produce_farm_output = Marketplace.Game.create_output(%{amounts: [2, 6, 10, 14, 18], generator: produce_farm_generator, resource: produce_resource})
metal_mine_output = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: mine_generator, resource: metal_resource})
champion_breeding_pens_output = Marketplace.Game.create_output(%{amounts: [1, 1, 1, 1, 1], generator: breeding_pens_generator, resource: champion_animal_resource})
cash_breeding_pens_output = Marketplace.Game.create_output(%{amounts: [4, 8, 12, 16, 20], generator: breeding_pens_generator, resource: cash_resource})
grain_grain_farm_output = Marketplace.Game.create_output(%{amounts: [2, 3, 6, 9, 12], generator: grain_farm_generator, resource: grain_resource})
beer_grain_farm_output = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: grain_farm_generator, resource: beer_resource})
seafood_port_facility_output = Marketplace.Game.create_output(%{amounts: [2, 2, 4, 6, 8], generator: port_facility_generator, resource: seafood_resource})
warships_port_facility_output = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: port_facility_generator, resource: warship_resource})
stone_quary_output = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: quary_generator, resource: stone_resource})
game_meat_logging_camp_output = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: logging_camp_generator, resource: game_meat_resource})
wood_logging_camp_output = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: logging_camp_generator, resource: wood_resource})
