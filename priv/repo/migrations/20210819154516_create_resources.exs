defmodule Marketplace.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :tier, :integer, null: false, default: 0
      add :export, :integer, null: false, default: 0
      add :import, :integer, null: false, default: 0
      add :perishable, :boolean, default: false, null: false
      add :importable, :boolean, null: false, default: true
      add :luxury_id, references(:resources, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:resources, [:luxury_id])
  end
end
