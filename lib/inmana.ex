# Usando o Design pattern Facade trazendo nossa regra de negócio para o modolo principal
# Tendo assim modolos enxuto e independentes e centralizado em um unico lugar
defmodule Inmana do
  alias Inmana.Restaurants.Create
  # Delegar um função
  defdelegate create_restaurant(params), to: Create, as: :call
end
