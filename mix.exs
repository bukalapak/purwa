defmodule Edan.Mixfile do
  use Mix.Project

  def project do
    [
      app: :edan,
      version: "0.0.1",
      deps: deps(),
      elixir: "~> 1.5",
      package: package(),
      description: "A microservice boilerplate using Plug following Bukalapak guideline",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
    ]
  end

  defp package do
    [
      name: :edan,
      files: ["lib", "mix.exs", "README.md", "LICENSE.md", "template"],
      maintainers: ["Abdul Somat Budiaji <abdul.somat@bukalapak.com>"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/bukalapak/edan",
      },
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_templates, "> 0.0.0",  app: false},
      {:ex_doc, "> 0.0.0",  only: [:dev, :test]},
    ]
  end
end
