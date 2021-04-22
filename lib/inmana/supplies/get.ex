defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}


  # Outro modo de usar pattern matching no elixir, é bizarro como fico impressionado com essa linguagem
  # No casa abaixo ela recebe um modulo e seus parametros e dentro do case fazemos pattern matching
  # Para cada tipo de verificação.
  # Abaixo verificamos se foi encontrado um suprimento e se encontrar ele retorna, caso contrario trás um erro not_found
  def call(id) do
   case Repo.get(Supply, id) do
    nil -> {:error, %{result: "Supply not found", status: :not_found}}
    supply -> {:ok, supply}
   end
  end


end
