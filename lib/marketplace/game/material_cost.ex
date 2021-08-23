defmodule Marketplace.Game.MaterialCost do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "material_costs" do
    field :amount, :integer, default: 0
    belongs_to :product_resource, Marketplace.Game.Resource
    belongs_to :required_resource, Marketplace.Game.Resource

    timestamps()
  end

  @doc false
  def changeset(material_cost, attrs) do
    material_cost
    |> Marketplace.Repo.preload([:product_resource, :required_resource])
    |> cast(attrs, [:amount])
    |> put_assoc(:product_resource, Map.get(attrs, :product_resource))
    |> put_assoc(:required_resource, Map.get(attrs, :required_resource))
    |> validate_required([:amount])
  end
end
