defmodule EasyAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :easy_auth,
      version: "1.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "EasyAuth",
      source_url: "https://github.com/vesuvium/easy_auth",
      docs: [
          main: "readme",
          extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.9", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:plug, "~> 1.7"}
    ]
  end

  defp description do
    "A Plug for HTTP basic authentication that's also easy to configure"
  end

  defp package do
    [
      name: :easy_auth,
      files: ~w(mix.exs lib .formatter.exs README.md LICENSE),
      maintainers: ["Jacopo Cascioli"],
      licenses: ["MPL 2.0"],
      links: %{"GitHub" => "https://github.com/Vesuvium/easy_auth"}
    ]
  end
end
