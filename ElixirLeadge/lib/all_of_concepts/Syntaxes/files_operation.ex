defmodule FileStylesModel do
  defstruct [:color, :value]
end

defmodule FilesOperations do
  @file_path "static/names_list.txt"

  alias Jason

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

  def decode_json_string do
    json_string = "{\"name\": \"Alice\", \"age\": 30}"
    {:ok, decoded} = Jason.decode(json_string)
    IO.inspect(decoded)
  end

  def decode_json_file do
    path = "lib/static_files/styles_list.json"
    IO.puts("Absolute path: #{inspect(Path.expand(path))}")

    if check_file_existence(path) do
      IO.puts("Exists and its fine")
      # Read content from file
      {:ok, content} = File.read(path)
      IO.inspect(content, label: "File content")
      # decode file content to json objects #{"key" => "value", ...}
      {:ok, decoded} = Jason.decode(content)
      IO.inspect(decoded, label: "Decoded version")
      # encode json objects to file content
      {:ok, json_string} = Jason.encode(decoded)
      IO.inspect(json_string, label: "Encoded json string version")

      # creating model objects based on json objects
      styles =
        decoded
        |> Enum.map(fn %{"color" => color, "value" => value} ->
          %FileStylesModel{color: color, value: value}
        end)

      IO.inspect(styles, label: "Styles models based on json objects ")
    else
      IO.puts("File not exist")
    end
  end

  def load_styles_into_models do
    path = "lib/static_files/styles_list2.json"

    style_models =
      with {:ok, file_content} <- File.read(path),
           {:ok, json_data} <- Jason.decode(file_content) do
          json_data
          |> Enum.map(fn %{"color" => color, "value" => value} ->
              %FileStylesModel{color: color, value: value}
          end)
      else
          error ->
              IO.puts("Failed to process the file, Reason: #{inspect(error)}.")
              nil
      end

    IO.inspect(style_models, label: "Styles models based on json objects ")

  end
end
