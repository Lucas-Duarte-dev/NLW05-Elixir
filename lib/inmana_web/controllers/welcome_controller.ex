defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  #This scope use pattern match
  def index(conn, params) do

    # |> Pipe Operator, torna possivel adicionar funções para uma variavel ou até mesmo para uma função,
    # Exemplo: "LUCAS DUARTE    \n" |> String.trim() |> String.downcase()
    # Então ele vai pegar essa string e aplicar nela as funções que escrevi, tornando a string minuscula e sem espaçoss
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: render_response(conn, message, :ok)

  # Function in one line
  defp handle_response({:error, message}, conn), do: render_response(conn, message, :bad_request)


  defp render_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
