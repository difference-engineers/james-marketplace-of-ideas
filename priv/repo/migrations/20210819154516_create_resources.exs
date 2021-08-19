defmodule Marketplace.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :export, :integer, null: false, default: 0
      add :import, :integer, null: false, default: 0
      add :luxury_export, :integer, null: false, default: 0
      add :luxury_import, :integer, null: false, default: 0
      add :perishable, :boolean, default: false, null: false

      timestamps()
    end

  end
end
