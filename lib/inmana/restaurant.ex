defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  @required_params [:email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}
  # O Schema é praticamento os models que uso no js, onde mostra qual é a estrutura que o dado espera receber
  schema "restaurants" do
    field :email, :string
    field :name, :string

    has_many :supplies, Supply
    # O timestamps já entrega os valores de updated_at e created_at
    timestamps()
  end

  def changeset(params) do
    # __MODULE__ Ele se referencia ao modulo atual que estamos, que no caso é o Inmana.Restaurant
    # Todas as funções após os pipes não funções de verificações, analisando se o dado esperado foi informado
    # Se tem no minimo 2 caracteres ou se o email contem @ e se o email informado já existe no banco


    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end

end
