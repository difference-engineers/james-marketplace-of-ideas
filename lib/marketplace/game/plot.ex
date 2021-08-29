defmodule Marketplace.Game.Plot do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "plots" do
    field :level, :integer, default: 0
    field :guilding, :integer, default: 0
    belongs_to :player, Marketplace.Accounts.Player, on_replace: :nilify
    belongs_to :generator, Marketplace.Game.Generator
    has_many :products, Marketplace.Game.Product

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> Marketplace.Repo.preload([:player, :generator], force: true)
    |> cast(attrs, [:level, :guilding])
    |> put_assoc(:player, Map.get(attrs, :player))
    |> put_assoc(:generator, Map.get(attrs, :generator))
    |> validate_required([:level, :guilding])
  end
end
