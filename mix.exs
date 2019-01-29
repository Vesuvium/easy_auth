defmodule SimpleAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_auth,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:confex, "~> 3.4.0"},
      {:credo, "~> 0.9.1", only: [:dev, :test], runtime: false},
      {:plug, "~> 1.7.1"}
    ]
  end
end
