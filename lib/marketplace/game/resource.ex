defmodule Marketplace.Game.Resource do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "resources" do
    field :export, :integer
    field :import, :integer
    field :luxury_export, :integer
    field :luxury_import, :integer
    field :name, :string
    field :perishable, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(resource, attrs) do
    resource
    |> cast(attrs, [:name, :export, :import, :luxury_export, :luxury_import, :perishable])
    |> validate_required([:name, :export, :import, :luxury_export, :luxury_import, :perishable])
  end
end
