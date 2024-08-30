defmodule Task do
  defstruct [:id, :title, :description, :status]


  def new(id, title, description) do
    %Task{
      id: id,
      title: title,
      description: description,
      status: :incomplete
    }
  end

  # @spec valid_desctipion(Boolean)
  defp valid_description?(description) do
    Integer
  end


end
