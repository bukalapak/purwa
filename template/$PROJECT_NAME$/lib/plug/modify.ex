defmodule <%= @project_name_camel_case %>.Plug.Modify do

  @moduledoc """
  Modify response according Bukalapak API Blueprint
  Please remmeber all 4XX and 5XX must be done by raising exception
  """

  alias Plug.Conn
  @behaviour Plug

  def init(opts) do
    opts
  end

  def call(conn, _) do
    case conn.request_path do
      "/metrics" ->
        conn |> Conn.put_resp_content_type("text/plain")
      _ ->
        conn |> Conn.put_resp_content_type("application/json")
    end
  end

end
