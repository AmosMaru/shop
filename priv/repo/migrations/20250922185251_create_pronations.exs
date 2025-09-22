defmodule Shop.Repo.Migrations.CreatePronations do
  use Ecto.Migration

  def change do
    create table(:pronations) do
      add :name, :string
      add :code, :string
      add :expires_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:pronations, [:code])
  end
end
