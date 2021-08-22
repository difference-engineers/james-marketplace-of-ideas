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
    |> cast(attrs, [:amounts])
    |> put_assoc(:resource, attrs.resource)
    |> put_assoc(:generator, attrs.generator)
    |> validate_required([:amounts])
  end

  def produce(output, plot) do
    quantity = case plot.guilding do
      0 -> Enum.at(output.amounts, plot.level)
      _ -> Enum.at(output.amounts, plot.level + 1)
    end

    products = %{plot: plot, resource: output.resource} |> List.duplicate(quantity)

    case plot.guilding do
      0 -> products
      1 -> put_in(products, [Access.at(0), :resource], Enum.at(products, 0).resource.luxury || Enum.at(products, 0).resource )
      2 -> products |> Enum.map(fn product -> Map.merge(product, %{resource: product.resource.luxury || product.resource}) end)
    end
  end
end
