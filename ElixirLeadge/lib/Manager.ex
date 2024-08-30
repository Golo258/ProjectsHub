defmodule Manager do
  alias TaskModel
  alias Collections

  def run do
    _task_list = init_task_list()
#    IO.inspect(task_list)
#    Collections.creating_inserting()
    Collections.operations()
#    IO.inspect(example_list)
  end

  defp init_task_list do
    task1 = TaskModel.new(1, "First Task", "Task 1 description", :pending)
    task2 = TaskModel.new(2, "Second Task", "Task 2 desc")
    task_list = [task1, task2]
    List.insert_at(task_list, 2, TaskModel.new(3, "Third one", "The last one")) # return changed version
  end
end
