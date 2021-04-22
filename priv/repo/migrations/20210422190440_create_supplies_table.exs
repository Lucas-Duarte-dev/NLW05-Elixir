defmodule Inmana.Repo.Migrations.CreateSuppliesTable do
  use Ecto.Migration

  def change do
    create table(:supplise) do
      add :description, :string
      add :expiration_date, :date
      add :responsible, :string
      add :restaurant_id, references(:restaurants)

      timestamps()
    end
  end
end
