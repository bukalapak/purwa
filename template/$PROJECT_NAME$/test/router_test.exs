defmodule <%= @project_name_camel_case %>.RouterTest do
  use ExUnit.Case
  use Plug.Test

  alias <%= @project_name_camel_case %>.Router

  test "root url" do
    conn =
      conn(:get, "/")
      |> Router.call(<%= @project_name_camel_case %>.Router)

    assert conn.status == 404
  end

  test "health url" do
    conn =
      conn(:get, "/healthz")
      |> Router.call(<%= @project_name_camel_case %>.Router)

    assert conn.status == 200
  end

  test "metrics url" do
    conn =
      conn(:get, "/metrics")
      |> Router.call(<%= @project_name_camel_case %>.Router)

    assert conn.status == 200
  end

  test "example url" do
    conn =
      conn(:get, "/example")
      |> Router.call(<%= @project_name_camel_case %>.Router)

    assert conn.status == 200
  end

end
