defmodule Marketplace.Game.Output do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "outputs" do
    field :amounts, {:array, :integer}, default: []
    field :generator_id, :binary_id
    field :resource_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
