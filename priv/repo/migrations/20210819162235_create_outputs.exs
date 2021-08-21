defmodule Marketplace.Repo.Migrations.CreateOutputs do
  use Ecto.Migration

  def change do
    create table(:outputs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amounts, {:array, :integer}, default: [], null: false
      add :generator_id, references(:generators, on_delete: :nothing, type: :binary_id), null: false
      add :resource_id, references(:resources, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:outputs, [:generator_id])
    create index(:outputs, [:resource_id])
  end
end
