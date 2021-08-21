defmodule Marketplace.Game.Resource do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "resources" do
    field :export, :integer, default: 0
    field :import, :integer, default: 0
    field :luxury_export, :integer, default: 0
    field :luxury_import, :integer, default: 0
    field :name, :string
    field :perishable, :boolean, default: false
    field :guildable, :boolean, default: true
    field :importable, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:name, :export, :import, :luxury_export, :luxury_import, :perishable])
    |> validate_required([:name, :export, :import, :luxury_export, :luxury_import, :perishable])
  end
end
