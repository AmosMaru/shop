defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :names, :string
    field :price, :integer
    field :slug, :string
    field :console, Ecto.Enum, values: [:pc, :xbox, :playsation, :swith]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:names, :price, :slug, :console])
    |> validate_required([:names, :price, :slug, :console])
    |> unique_constraint(:slug)
  end
end
