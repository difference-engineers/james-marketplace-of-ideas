defmodule Marketplace.Game.ResourceGenerator do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "resource_generators" do
    field :name, :string
    field :profit, :integer

    timestamps()
  end

  @doc false
  def changeset(resource_generator, attrs) do
    resource_generator
    |> cast(attrs, [:name, :profit])
    |> validate_required([:name, :profit])
  end
end
