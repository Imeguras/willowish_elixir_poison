defmodule WillowishElixirPoison do
  use HTTPoison.Base, Jason.Encoder
  @config Application.get_env(:willowish_elixir_poison, WillowishElixirPoison)
  @moduledoc """
  Documentation for `WillowishElixirPoison`.
  """
  alias Hex.Application
  def pilot() do
    Map.get(@config, :key, "Check_CONFIG_EXAMPLE")
    |> make_request()
  end

  @endpoint "http://dev.virtualearth.net/REST/v1/Traffic/Incidents/"
  def make_request(region \\ "39,-9,40,-8", params \\ %{}) do
    url = "#{@endpoint}/#{region}"

    response =
      get(url, params, %{
        headers: [
          {"Content-Type", "application/json"}
          # Add other headers if needed
        ]
      })
    |> handle_response
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
