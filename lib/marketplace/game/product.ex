defmodule Marketplace.Game.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :plot_id, :binary_id
    field :resource_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [])
    |> validate_required([])
  end
end
