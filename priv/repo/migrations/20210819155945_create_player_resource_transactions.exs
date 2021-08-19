defmodule Marketplace.Repo.Migrations.CreatePlayerResourceTransactions do
  use Ecto.Migration

  def change do
    create table(:player_resource_transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :player_id, references(:players, on_delete: :nothing, type: :binary_id), null: false
      add :player_resource_generator_id, references(:player_resource_generators, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:player_resource_transactions, [:player_id])
    create index(:player_resource_transactions, [:player_resource_generator_id])
  end
end
