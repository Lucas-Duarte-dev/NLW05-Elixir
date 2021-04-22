defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}
  # O Schema é praticamento os models que uso no js, onde mostra qual é a estrutura que o dado espera receber
  schema "supplise" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant
    # O timestamps já entrega os valores de updated_at e created_at
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
  end

end
