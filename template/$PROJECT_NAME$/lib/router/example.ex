defmodule <%= @project_name_camel_case %>.Router.Example do

  @moduledoc """
  Example router
  """

  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    sample = %{
      a_string: "some text",
      a_number: 100,
      a_list: ["some", "list"],
    }
    {http_status, json} = Jcoder.encode(%NormMsg{http_status: 200, data: sample})
    send_resp(conn, http_status, json)
  end

  post "/" do
    case conn.body_params do
      %{"accepted" => _value} ->
        {http_status, json} = Jcoder.encode(%NormMsg{http_status: 201, data: conn.body_params})
        send_resp(conn, http_status, json)
      _ ->
        {http_status, json} = Jcoder.encode(%ErrorMsg{http_status: 400, message: "Bad request", code: 999})
        send_resp(conn, http_status, json)
    end
  end

  # everything else
  match _ do
    {http_status, json} = Jcoder.encode(%ErrorMsg{message: "Not found", http_status: 404, code: 999})
    send_resp(conn, http_status, json)
  end

end
