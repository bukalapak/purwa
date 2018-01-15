defmodule <%= @project_name_camel_case %>.Router do

  @moduledoc """
  See https://hexdocs.pm/plug/Plug.Router.html#content
  """

  use Plug.Router

  alias Prometheus.Format.Text

  plug <%= @project_name_camel_case %>.Plug.AccessLog
  plug <%= @project_name_camel_case %>.Plug.Modify
  plug :match
  plug Plug.RequestId
  plug Plug.Parsers, parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :dispatch

  # sub router forwarding

  forward "/example", to: <%= @project_name_camel_case %>.Router.Example

  # pattern matching

  get "/healthz" do
    {http_status, json} = Jcoder.encode(%NormMsg{http_status: 200, data: %{message: "ok"}})
    send_resp(conn, http_status, json)
  end

  get "/metrics" do
    format = Text.format(:default)
    send_resp(conn, 200, format)
  end

  # everything else
  match _ do
    {http_status, json} = Jcoder.encode(%ErrorMsg{message: "Not found", http_status: 404, code: 999})
    send_resp(conn, http_status, json)
  end

end
