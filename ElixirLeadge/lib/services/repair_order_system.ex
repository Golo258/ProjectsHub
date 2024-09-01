defmodule StringLengthException do
  defexception message: "Given string length incorrect"
end

defmodule NotAppropriateStatusTypeException do
  defexception message: "Given status type incorrect"
end

defmodule IncorrectTypeException do
  defexception message: "Given type of variable is  incorrect"
end

defprotocol Processable do
  @doc """
      Update status of process type
      Returns %Type{...status: change}

    ## Example
      Process.update_status(value)
  """
  def update_status(model, changed_status_value)

  def update_cost(model, changed_cost_value \\ Enum.random(100..1000))
end

defmodule OrderModel do
  @order_status_types [:not_accepted, :accepted, :pending, :in_progress, :completed]

  defstruct [:id, :client_name, :car_model, :cost, :status]

  def new(id, client_name, car_model, cost \\ 0.0, status \\ :pending) do
    try do
      if valid_client_name?(client_name) and valid_status?(status) and valid_order_cost?(cost) do
        %OrderModel{
          id: id,
          client_name: client_name,
          car_model: car_model,
          cost: cost,
          status: status
        }
      end
    rescue
      lengthError in StringLengthException ->
        IO.puts("Client name error occurred: " <> lengthError.message)

      statusError in NotAppropriateStatusTypeException ->
        IO.puts("Order status error occurred: " <> statusError.message)

      typeError in IncorrectTypeException ->
        IO.puts("Given cost type error occurred: " <> typeError.message)
    end
  end

  defp valid_client_name?(client_name) do
    if is_binary(client_name) do
      if String.length(client_name) > 0 do
        true
      else
        raise StringLengthException
      end
    end
  end

  defp valid_status?(status) do
    if status in @order_status_types do
      true
    else
      raise NotAppropriateStatusTypeException
    end
  end

  defp valid_order_cost?(cost) do
    if is_integer(cost) or is_float(cost) do
      true
    else
      raise IncorrectTypeException
    end
  end
end

defimpl Processable, for: OrderModel do
  def update_status(%OrderModel{} = order, changed_status_value) do
    %OrderModel{order | status: changed_status_value}
  end

  def update_cost(%OrderModel{} = order, changed_cost_value) do
    %OrderModel{order | cost: changed_cost_value}
  end
end

defmodule Services.RepairOrderSystem do
  @moduledoc """
      Simple system of repair orders for car workshop
      Orders collected in maps, processed  and returned with report
  """
#  @orders_list []
  def init_example_orders do
      bmw_order = OrderModel.new(1, "Piotr", "BMW")
      audi_order = OrderModel.new(2, "Marcin", "Audi", 1.5)
      ford_order = OrderModel.new(3, "Rafal", "Ford", 5.1, :accepted)
#      [bmw_order, audi_order, ford_order]
      Agent.start_link( fn -> [bmw_order, audi_order, ford_order] end, name: __MODULE__)
  end

  def get_order_list do
      Agent.get(__MODULE__, & &1)
  end

  def add_order(new_order) do
      Agent.update(__MODULE__, fn order_list -> order_list ++ [new_order] end)
  end

  def process_order_change(order_id, attribute_map_to_change) do
      order_list = get_order_list()
      order_to_process = Enum.find(order_list,
          fn order -> order.id == order_id end )
      if order_to_process do
          updated_order =
          cond do
              Map.has_key?(attribute_map_to_change, :status) -> Processable.update_status(order_to_process, :status)
              Map.has_key?(attribute_map_to_change, :cost) -> Processable.update_cost(order_to_process, :cost)
              true -> order_to_process
          end
          index_of_order = Enum.find_index(order_list, fn order -> order.id == order_id end)
          updated_list = List.replace_at(order_list, index_of_order, updated_order)
          Agent.update(__MODULE__, fn _ -> updated_list end)
      else
        IO.puts("Order with id #{order_id} not found")
      end
  end



  def run_system do
      {:ok, _pid} = Services.RepairOrderSystem.init_example_orders()
      IO.inspect(get_order_list(), label: "List order after init: ")
      add_order(OrderModel.new(4, "Maciek", "Mazda", 125.0))
      IO.inspect(get_order_list(), label: "List after adding new order: ")
      process_order_change(1, %{status: :completed})
      IO.inspect(get_order_list(), label: "List after order status update: ")
  end

end
