defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: true}

  schema "restaurants" do
    field :email, :string,
    field :name, :string,

    timestamps()
  end
end
