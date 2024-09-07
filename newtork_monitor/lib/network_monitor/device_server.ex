
defmodule NetworkMonitor.DeviceServer do
    use GenServer

    # API
    @doc """
        Start Server for specific decide
    """
    def start_link() do
        GenServer.start(__MODULE__, %{device_id: device_id, status: :offline}, name: via_tuple(device_id))
    end

    def update_device_status(device_id, new_status) do
        GenServer.cast(via_tuple(device_id), {:update_status, new_status})
    end

    def get_device_status(device_id) do
        GenServer.call(via_tuple(device_id), :get_status)
    end

    @impl true
    def init(primary_state) do
        {:ok, primary_state}
    end

    @impl true
    def handle_call(:get_status, _from, state) do
        {:reply, state, state}
    end

    @impl true
    def handle_cast({:update_status, new_status}, state) do
        {:noreply, %{state | status: new_status}}
    end

    defp via_tuple(device_id) do
        {:via, Registry, {NetworkMonitor.Registry, device_id}}
    end
end