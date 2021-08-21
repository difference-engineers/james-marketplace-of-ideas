defmodule Marketplace.Repo.Migrations.CreateOutputs do
  use Ecto.Migration

  def change do
    create table(:outputs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :map, default: [], null: false
      add :plot_id, references(:plots, on_delete: :nothing, type: :binary_id), null: false
      add :resource_id, references(:resources, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:outputs, [:plot_id])
    create index(:outputs, [:resource_id])
  end
end
