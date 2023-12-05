defmodule WillowishElixirPoison do
  use HTTPoison.Base, Jason.Encoder
  @config Application.get_env(:willowish_elixir_poison, WillowishElixirPoison)
  @moduledoc """
  Documentation for `WillowishElixirPoison`.
  """
  alias Hexdocs.Poison

  def start(_type, _args) do
    IO.puts "starting"
    [{key,value}] = Application.get_env(:willowish_elixir_poison, WillowishElixirPoison)

    "#{key}:#{value}"
    |> make_request()

  end

  @endpoint "http://dev.virtualearth.net/REST/v1/Traffic/Incidents/"
  def make_request(params \\ %{},region \\ "39,-9,40,-8") do
    url = "#{@endpoint}/#{region}"
    |>HTTPoison.get(params)
    |>handle_response

  end
  defp handle_response({:ok, %HTTPoison.Response{body: body}}) do
    # Parse the JSON response using Jason
    {:ok, parsed_body} = Jason.decode(body)

    # Do something with the parsed data
    IO.inspect(parsed_body)

  end

  defp handle_response({:error, reason}) do
    # Handle error responses
    IO.puts("Error: #{reason}")
  end

end
