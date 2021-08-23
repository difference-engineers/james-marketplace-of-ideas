defmodule Marketplace.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""
    create table(:players, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :naive_datetime

      timestamps()
    end
    create unique_index(:players, [:email])
    create unique_index(:players, [:name])
  end
end
