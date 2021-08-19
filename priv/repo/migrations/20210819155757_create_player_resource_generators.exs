defmodule Marketplace.Repo.Migrations.CreatePlayerResourceGenerators do
  use Ecto.Migration

  def change do
    create table(:player_resource_generators, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :level, :integer, null: false, default: 0
      add :player_id, references(:players, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:player_resource_generators, [:player_id])
  end
end
