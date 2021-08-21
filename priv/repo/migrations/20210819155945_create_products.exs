defmodule Marketplace.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :luxury, :boolean, default: false, null: false
      add :plot_id, references(:plots, on_delete: :nothing, type: :binary_id), null: false
      add :resource_id, references(:resources, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:products, [:plot_id])
    create index(:products, [:resource_id])
  end
end
