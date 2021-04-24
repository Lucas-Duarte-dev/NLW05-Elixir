defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  #CLIENT

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  #SERVER

  # \\ define o valor padrão
  @impl true
  def init(state \\ %{}) do
    schadule_notification()
    {:ok, state}
  end

  # Recebe qualquer mensagem
  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schadule_notification()

    {:noreply, state}
  end

  # # async todo handle_cast é async
  # # :noreply quer dizer que ele não vai devolver nada!
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  defp schadule_notification do
    Process.send_after(self(), :generate, 1000 * 10)
  end

  # # sync
  # # :reply dando uma resposta
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end
end
