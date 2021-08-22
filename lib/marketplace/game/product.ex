defmodule Marketplace.Game.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :luxury, :boolean, default: false
    belongs_to :plot, Marketplace.Game.Plot
    belongs_to :resource, Marketplace.Game.Resource

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:luxury])
    |> put_assoc(:plot, attrs.plot)
    |> put_assoc(:resource, attrs.resource)
    |> validate_required([:luxury])
  end
end
