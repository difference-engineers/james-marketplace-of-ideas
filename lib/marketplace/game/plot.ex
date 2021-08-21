defmodule Marketplace.Game.Plot do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "plots" do
    field :level, :integer, default: 0
    field :guilding, :integer, default: 0
    belongs_to :player, Marketplace.Game.Player
    belongs_to :generator, Marketplace.Game.Generator

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:level])
    |> put_assoc(:player, attrs.player)
    |> put_assoc(:generator, attrs.generator)
    |> validate_required([:level])
  end

  def work(plot) do
    plot.generator.outputs
      |> Enum.flat_map(&Marketplace.Game.Output.produce(&1, plot))
      |> Enum.map(&Marketplace.Game.create_product/1)
  end
end
