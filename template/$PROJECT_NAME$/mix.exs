defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  def project do
    [
      app: :<%= @project_name %>,
      version: "0.0.3",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {<%= @project_name_camel_case %>, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.7", only: [:dev, :test]}, # linting
      {:dialyxir, "~> 0.5", only: :dev, runtime: false}, # static checking
      {:excoveralls, "~> 0.8", only: :test}, # code coverage
      {:poison, "~> 3.1"}, # json parser
      {:cowboy, "~> 1.1"}, # http server
      {:plug, "~> 1.3"}, # http server wrapper
      {:distillery, "~> 1.5"}, # make release of an app
      {:prometheus_ex, "~> 2.0"}, # promotheus client
    ]
  end
end
