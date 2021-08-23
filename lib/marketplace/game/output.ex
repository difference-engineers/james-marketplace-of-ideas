defmodule Marketplace.Game.Output do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "outputs" do
    field :amounts, {:array, :integer}, default: []
    belongs_to :generator, Marketplace.Game.Generator
    belongs_to :resource, Marketplace.Game.Resource

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> Marketplace.Repo.preload([:resource, :generator])
    |> cast(attrs, [:amounts])
    |> put_assoc(:resource, Map.get(attrs, :resource))
    |> put_assoc(:generator, Map.get(attrs, :generator))
    |> validate_required([:amounts])
  end
end
