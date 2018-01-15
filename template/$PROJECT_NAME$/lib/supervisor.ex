defmodule <%= @project_name_camel_case %>.Supervisor do

  @moduledoc """
  Main supervisor

  In elixir, process is first class citizen and managed by supervisor to create resilient software.
  Actually, supervisor manages Genserver which is a type of process.
  Interestingly, supervisor is a kind of Genserver.
  You can supervise supervisor which supervise another supervisor, on and on.
  Suppose you want to create client for a datastore connection such as redis, mysql, etc.
  You want to wrap it in a process and make a pool. 
  Happy building.
  """

  use Supervisor

  alias Plug.Adapters.Cowboy

  @port Application.get_env(:<%= @project_name %>, :port)

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    IO.puts "Listening on port #{@port}"

    # Please use the new child_spec (module-based child spec)for elixir 1.5
    # see https://hexdocs.pm/elixir/Supervisor.html#module-child-specification
    children = [
      Cowboy.child_spec(:http, <%= @project_name_camel_case %>.Router, [], port: @port)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
