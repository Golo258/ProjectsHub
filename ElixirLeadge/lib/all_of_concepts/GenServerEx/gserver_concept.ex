@doc
"""
    Creating more advanced processes than standard ones
    Creating servers processes with state and requests storage
    :gen_server library
    @components:
        - init/1 - init state of server
        - handle_call/3  - sync client requests
        - handle_call/2  - async client requests
        - handle_call/1  - other messages send/2
        - terminate/2 - end of server work
"""

# Creating custom server

defmodule CustomGenServer do
  use GenServer
  #
  @doc """
    Run and connect with process
  """
  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, name: __MODULE__)
  end

  @doc """
    Send sync request for state, call -> wait for request
  """
  def get_state do
    GenServer.call(__MODULE__, :get_state)
  end

  @doc """
    Send async request for state, cast -> not wait for request
  """
  def set_state(new_state) do
    GenServer.cast(__MODULE__, {:set_state, new_state})
  end

  # Callbacks -> response for client requests and inner operation
  @doc """
    Execute at first run of server
  """
  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @doc """
      Like GET request
    Response for an Server.call request
      @args
          :get_state = type of returned message
          :from = process which send request
          :state = current server state
  """
  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @doc """
      Like POST request
    Response for an async Server.cast request
      @args
          :set_state| :new_state = type of message and new state to assign
          :state = current server state
      @return
          @noreply so its just update state without sending response
  """
  @impl true
  def handle_cast({:set_state, new_state}, _state) do
    {:noreply, new_state}
  end

  @doc """
    Response for other messages like send/2
      @args
          :msg = message which server receives
          :state = current server state
      @return
          @noreply so its just show message without sending response
  """
  @impl true
  def handle_info(msg, state) do
    IO.puts("Received info message: #{inspect(msg)}")
    {:noreply, state}
  end
end

defmodule ServerRunner do

    def run do
        {:ok, _pid} = CustomGenServer.start_link(:inital_state)
    end
end