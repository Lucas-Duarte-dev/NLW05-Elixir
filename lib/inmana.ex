# Usando o Design pattern Facade trazendo nossa regra de negócio para o modolo principal
# Tendo assim modolos enxuto e independentes e centralizado em um unico lugar
defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet
  # Delegar um função
  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
