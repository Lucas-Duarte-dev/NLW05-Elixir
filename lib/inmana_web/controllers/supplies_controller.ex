defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply


  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    # O with ele faz um pattern match com um modolo ou vários modulos, e se der match ele executa
    # Caso contrario ele pode receber um else que retorna varias respostas que você define
    # Simm!! Isso é bizarro de incrível

    with {:ok, %Supply{} = supply } <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Supply{} = supply } <- Inmana.get_supply(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
