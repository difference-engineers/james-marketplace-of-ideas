defmodule Marketplace.Game.Plot do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "plots" do
    field :level, :integer
    field :player_id, :binary_id
    field :generator_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:level])
    |> validate_required([:level])
  end
end
