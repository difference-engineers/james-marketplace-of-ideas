defmodule Marketplace.Game.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    belongs_to :plot, Marketplace.Game.Plot
    belongs_to :resource, Marketplace.Game.Resource

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> Marketplace.Repo.preload([:plot, :resource])
    |> cast(attrs, [])
    |> put_assoc(:plot, Map.get(attrs, :plot))
    |> put_assoc(:resource, Map.get(attrs, :resource))
    |> validate_required([])
  end
end
