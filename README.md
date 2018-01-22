# Purwa

Purwa is a boilerplate for new microservice projects in Elixir following Bukalapak guideline.

## Highlights

- Cowboy, http server
- Plug, http server wrapper
- Poison, json parser
- Prometheus_ex, prometheus client
- Credo, elixir linting
- Dialyxir, static checking
- Excoveralls, code coverage

## Install

_Note that Purwa requires Elixir 1.5.0+._

[How to install elixir?](https://elixir-lang.org/install.html)

```
$ mix archive.install hex mix_generator
$ mix archive.install hex mix_templates
$ mix template.install github bukalapak/purwa
```

## Use

```
$ mix gen purwa <your_project_name>
$ cd <your_project_name>
$ make setup
```

## License

The MIT License (MIT), copyright (c) 2017 Bukalapak.
