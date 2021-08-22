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

{:ok, luxury_beef_resource} = Marketplace.Game.create_resource(%{name: "Luxury Beef", export: 15, import: 30, perishable: true})
{:ok, beef_resource} = Marketplace.Game.create_resource(%{name: "Beef", export: 5, import: 10, luxury: luxury_beef_resource, perishable: true})
{:ok, luxury_dairy_resource} = Marketplace.Game.create_resource(%{name: "Luxury Dairy", export: 15, import: 30, perishable: true})
{:ok, dairy_resource} = Marketplace.Game.create_resource(%{name: "Dairy", export: 5, import: 10, luxury: luxury_dairy_resource, perishable: true})
{:ok, luxury_produce_resource} = Marketplace.Game.create_resource(%{name: "Luxury Produce", export: 9, import: 36, perishable: true})
{:ok, produce_resource} = Marketplace.Game.create_resource(%{name: "Produce", export: 3, import: 12, luxury: luxury_produce_resource, perishable: true})
{:ok, luxury_mutton_resource} = Marketplace.Game.create_resource(%{name: "Luxury Mutton", export: 15, import: 30, perishable: true})
{:ok, mutton_resource} = Marketplace.Game.create_resource(%{name: "Mutton", export: 5, import: 10, luxury: luxury_mutton_resource, perishable: true})
{:ok, luxury_textile_resource} = Marketplace.Game.create_resource(%{name: "Silk", export: 12, import: 24})
{:ok, textile_resource} = Marketplace.Game.create_resource(%{name: "Textile", export: 4, import: 8, luxury: luxury_textile_resource})
{:ok, luxury_grain_resource} = Marketplace.Game.create_resource(%{name: "Luxury Grain", export: 12, import: 24})
{:ok, grain_resource} = Marketplace.Game.create_resource(%{name: "Grain", export: 4, import: 8, luxury: luxury_grain_resource})
{:ok, luxury_beer_resource} = Marketplace.Game.create_resource(%{name: "Luxury Beer", export: 24, import: 36})
{:ok, beer_resource} = Marketplace.Game.create_resource(%{name: "Beer", export: 8, import: 16, luxury: luxury_beer_resource})
{:ok, luxury_seafood_resource} = Marketplace.Game.create_resource(%{name: "Luxury Seafood", export: 15, import: 30, perishable: true})
{:ok, seafood_resource} = Marketplace.Game.create_resource(%{name: "Seafood", export: 5, import: 10, luxury: luxury_seafood_resource, perishable: true})
{:ok, warship_resource} = Marketplace.Game.create_resource(%{name: "Warship", export: 5, importable: false})
{:ok, luxury_stone_resource} = Marketplace.Game.create_resource(%{name: "Marble", export: 18, import: 36})
{:ok, stone_resource} = Marketplace.Game.create_resource(%{name: "Stone", export: 6, import: 12, luxury: luxury_stone_resource})
{:ok, luxury_metal_resource} = Marketplace.Game.create_resource(%{name: "Luxury Metal", export: 18, import: 36})
{:ok, metal_resource} = Marketplace.Game.create_resource(%{name: "Metal", export: 6, import: 12, luxury: luxury_metal_resource})
{:ok, luxury_wood_resource} = Marketplace.Game.create_resource(%{name: "Luxury Wood", export: 12, import: 24})
{:ok, wood_resource} = Marketplace.Game.create_resource(%{name: "Wood", export: 4, import: 8, luxury: luxury_wood_resource})
{:ok, luxury_game_meat_resource} = Marketplace.Game.create_resource(%{name: "Luxury Game Meat", export: 24, import: 28, perishable: true})
{:ok, game_meat_resource} = Marketplace.Game.create_resource(%{name: "Game Meat", export: 8, import: 16, luxury: luxury_game_meat_resource, perishable: true})
{:ok, champion_animal_resource} = Marketplace.Game.create_resource(%{name: "Champion Animal", export: 10, import: 20})
{:ok, cash_resource} = Marketplace.Game.create_resource(%{name: "Cash", export: 1, import: 1})

{:ok, sheep_ranch_generator} = Marketplace.Game.create_generator(%{name: "Sheep Ranch"})
{:ok, cattle_ranch_generator} = Marketplace.Game.create_generator(%{name: "Cattle Ranch"})
{:ok, produce_farm_generator} = Marketplace.Game.create_generator(%{name: "Produce Farm"})
{:ok, mine_generator} = Marketplace.Game.create_generator(%{name: "Mine"})
{:ok, breeding_pens_generator} = Marketplace.Game.create_generator(%{name: "Breeding Pens"})
{:ok, grain_farm_generator} = Marketplace.Game.create_generator(%{name: "Grain Farm"})
{:ok, port_facility_generator} = Marketplace.Game.create_generator(%{name: "Port Facility"})
{:ok, quary_generator} = Marketplace.Game.create_generator(%{name: "Quarry"})
{:ok, logging_camp_generator} = Marketplace.Game.create_generator(%{name: "Logging Camp"})

{:ok, wood_warship_material_cost} = Marketplace.Game.create_material_cost(%{product_resource: warship_resource, required_resource: wood_resource, amount: 2})
{:ok, textile_warship_material_cost} = Marketplace.Game.create_material_cost(%{product_resource: warship_resource, required_resource: textile_resource, amount: 1})

{:ok, mutton_sheep_ranch_output} = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: sheep_ranch_generator, resource: mutton_resource})
{:ok, textiles_sheep_ranch_output} = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: sheep_ranch_generator, resource: textile_resource})
{:ok, beef_cattle_ranch_output} = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: cattle_ranch_generator, resource: beef_resource})
{:ok, dairy_cattle_ranch_output} = Marketplace.Game.create_output(%{amounts: [0, 2, 4, 6, 8], generator: cattle_ranch_generator, resource: dairy_resource})
{:ok, produce_produce_farm_output} = Marketplace.Game.create_output(%{amounts: [2, 6, 10, 14, 18], generator: produce_farm_generator, resource: produce_resource})
{:ok, metal_mine_output} = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: mine_generator, resource: metal_resource})
{:ok, champion_breeding_pens_output} = Marketplace.Game.create_output(%{amounts: [1, 1, 1, 1, 1], generator: breeding_pens_generator, resource: champion_animal_resource})
{:ok, cash_breeding_pens_output} = Marketplace.Game.create_output(%{amounts: [4, 8, 12, 16, 20], generator: breeding_pens_generator, resource: cash_resource})
{:ok, grain_grain_farm_output} = Marketplace.Game.create_output(%{amounts: [2, 3, 6, 9, 12], generator: grain_farm_generator, resource: grain_resource})
{:ok, beer_grain_farm_output} = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: grain_farm_generator, resource: beer_resource})
{:ok, seafood_port_facility_output} = Marketplace.Game.create_output(%{amounts: [2, 2, 4, 6, 8], generator: port_facility_generator, resource: seafood_resource})
{:ok, warships_port_facility_output} = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: port_facility_generator, resource: warship_resource})
{:ok, stone_quary_output} = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: quary_generator, resource: stone_resource})
{:ok, game_meat_logging_camp_output} = Marketplace.Game.create_output(%{amounts: [0, 1, 2, 3, 4], generator: logging_camp_generator, resource: game_meat_resource})
{:ok, wood_logging_camp_output} = Marketplace.Game.create_output(%{amounts: [2, 4, 6, 8, 10], generator: logging_camp_generator, resource: wood_resource})
