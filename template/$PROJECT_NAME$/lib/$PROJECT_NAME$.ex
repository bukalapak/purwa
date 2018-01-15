defmodule <%= @project_name_camel_case %> do

  @moduledoc """
  Application module callback, this is the entrypoint.
  """

  use Application

  def start(_type, _args) do
    <%= @project_name_camel_case %>.Supervisor.start_link()
  end

end
