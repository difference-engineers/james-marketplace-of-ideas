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

    products = %{plot: plot, resource: output.resource}
      |> List.duplicate(quantity)
      |> Enum.map(fn product ->
        case plot.guilding do
          2 -> Map.merge(product, %{luxury: true})
          _ -> product
        end
      end)

    case plot.guilding do
      1 ->
        [head | tail] = products
        [Map.merge(head, %{luxury: true}), tail]
      _ -> products
    end
  end
end
