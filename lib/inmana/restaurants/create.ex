# Design pattern usado nesse projeto se chama command, onde você cria uma pasta referente ao
# modulo que você quer referenciar, e nessa pasta criamos arquivos para cada funcionalidade,
# Neste exemplos criamos uma pasta restaurants e criaremos um arquivo referente a cada método http,
# Tornando mais facil encontrar cada funcionalidade da sua aplicação
defmodule Inmana.Restaurants.Create do
  alias Inmana.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
