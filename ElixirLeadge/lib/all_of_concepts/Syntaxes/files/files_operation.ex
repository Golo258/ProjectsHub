defmodule FilesOperations do
  @file_path "static/names_list.txt"

  def read_file(file_path \\ @file_path) do
    if check_file_existence() do
      # reading from files
      {:ok, content} = File.read(file_path)
      parsed_content = content |> String.split(["\r\n", "\n"], trim: true)
      parsed_content
    else
      raise "File not exist"
    end
  end

  def write_into_file(content, is_created \\ true) do
    if check_file_existence(@file_path) do
      # writing into files
      if is_created do
        File.write(@file_path, content, [:append])
      else
        File.write(@file_path, content)
      end
      IO.puts("Content after parsed #{inspect(content |> String.split("\n"))}")
      read_file()
      |> Enum.filter(fn line -> String.contains?(line, content |> String.split("\n")) end)
      |> case do
        [] -> raise "Added content #{content} not found in file"
        filtered_lines -> IO.puts("Content found in file: #{inspect(filtered_lines)}")
      end
    else
      raise "File not exist"
    end
  end

  defp check_file_existence(file_path \\ @file_path) do
    File.exists?(file_path)
  end

  defp _get_absolute_path(file_path \\ @file_path) do
    Path.expand(file_path)
  end
end

#content = FilesOperations.read_file()
#IO.inspect(content, label: "File content")
FilesOperations.write_into_file("Second funny content\n")
