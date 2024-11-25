defmodule Syntaxes do

  def main_app do
      ues = [1,2,3,4,5]
      lists_all()
      log_data("UEs list", ues)
    end

  defp lists_all() do
      creation = ["one", 2, ["three"]]
      head = hd(creation)
      tail = tl(creation)
      by_index = Enum.at(creation, 2)
      Enum.eah(creation, fn element -> IO.puts(element) end)
      mapped_list = Enum.map([1,2,3,4,5], fn el -> el ** 2   end)
      if 
      + do
        
      end
      #TODO check whether map can also have a condition inside

    end

  defp log_data(text, data) do
    IO.puts("#{text}, #{inspect(data)}")
  end
end

# iex -S mix | Syntaxes.main_app()
