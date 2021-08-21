defmodule Marketplace.Game.Player do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "players" do
    field :name, :string
    has_many :plots, Marketplace.Game.Plot

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
