defmodule Marketplace.Repo.Migrations.CreatePlots do
  use Ecto.Migration

  def change do
    create table(:plots, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :level, :integer, null: false, default: 0
      add :guilding, :integer, null: false, default: 0
      add :player_id, references(:players, on_delete: :nothing, type: :binary_id), null: false
      add :generator_id, references(:generators, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:plots, [:player_id])
    create index(:plots, [:generator_id])
  end
end
