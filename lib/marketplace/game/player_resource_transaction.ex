defmodule Marketplace.Game.PlayerResourceTransaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "player_resource_transactions" do
    field :player_id, :binary_id
    field :player_resource_generator_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(player_resource_transaction, attrs) do
    player_resource_transaction
    |> cast(attrs, [])
    |> validate_required([])
  end
end
