defmodule Marketplace.Game.Resource do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "resources" do
    field :tier, :integer, default: 0
    field :export, :integer, default: 0
    field :import, :integer, default: 0
    field :name, :string
    field :perishable, :boolean, default: false
    field :importable, :boolean, default: true
    belongs_to :luxury, Marketplace.Game.Resource
    has_one :common, Marketplace.Game.Resource, foreign_key: :luxury_id
    has_many :material_costs, Marketplace.Game.MaterialCost, foreign_key: :product_resource_id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:name, :tier, :export, :import, :perishable, :importable])
    |> put_assoc(:luxury, Map.get(attrs, :luxury))
    |> validate_required([:name, :tier, :export, :import, :perishable, :importable])
  end
end
