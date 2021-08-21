defmodule Marketplace.Repo.Migrations.CreateMaterialCosts do
  use Ecto.Migration

  def change do
    create table(:material_costs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :integer, null: false, default: 0
      add :product_resource_id, references(:resources, on_delete: :nothing, type: :binary_id)
      add :required_resource_id, references(:resources, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:material_costs, [:product_resource_id])
    create index(:material_costs, [:required_resource_id])
  end
end
