defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias Inmana.Restaurants.Create

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    # O with ele faz um pattern match com um modolo ou vários modulos, e se der match ele executa
    # Caso contrario ele pode receber um else que retorna varias respostas que você define
    # Simm!! Isso é bizarro de incrível

    with {:ok, %Restaurant{} = restaurant } <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
