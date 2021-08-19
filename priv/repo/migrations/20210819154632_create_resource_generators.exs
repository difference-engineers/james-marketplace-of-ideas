defmodule Marketplace.Repo.Migrations.CreateResourceGenerators do
  use Ecto.Migration

  def change do
    create table(:resource_generators, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :profit, :integer, null: false, default: 0

      timestamps()
    end

  end
end
