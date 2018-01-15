# put reusable utilities module accross difference microservice here

defmodule ErrorMsg do
  @moduledoc false

  defstruct [
    message: "",
    http_status: "",
    code: ""
  ]
end

defmodule NormMsg do
  @moduledoc false

  defstruct [
    http_status: "",
    data: ""
  ]
end

defmodule Jcoder do
  @moduledoc """
  wrapping around poison to enforce consistent output to use with Plug and
  Bukalapak API Blueprint

  requires %ErrorMsg{}, %NormMsg{}, Poison
  """

  @spec encode(%ErrorMsg{}) :: {integer, binary}
  def encode(struct = %ErrorMsg{}) do
    data = %{
      meta: %{http_status: struct.http_status},
      error: %{
        message: struct.message,
        code: struct.code
      },
    }
    {:ok, json} = Poison.encode(data)
    {struct.http_status, json}
  end

  @spec encode(%NormMsg{}) :: {integer, binary}
  def encode(struct = %NormMsg{}) do
    data = %{
      meta: %{http_status: struct.http_status},
      data: struct.data
    }
    {:ok, json} = Poison.encode(data)
    {struct.http_status, json}
  end

end
