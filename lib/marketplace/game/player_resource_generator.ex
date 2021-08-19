defmodule Marketplace.Game.PlayerResourceGenerator do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "player_resource_generators" do
    field :level, :integer
    field :player_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(player_resource_generator, attrs) do
    player_resource_generator
    |> cast(attrs, [:level])
    |> validate_required([:level])
  end
end
