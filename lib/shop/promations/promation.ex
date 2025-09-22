defmodule Shop.Promations.Promation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pronations" do
    field :name, :string
    field :code, :string
    field :expires_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(promation, attrs) do
    promation
    |> cast(attrs, [:name, :code, :expires_at])
    |> validate_required([:name, :code, :expires_at])
    |> unique_constraint(:code)
  end
end
