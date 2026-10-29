defmodule Treeshake.MixProject do
  use Mix.Project

  def project do
    [
      app: :treeshake,
      version: "0.1.0",
      elixir: "~> 1.19",
      deps: [],
      description: "Removes unused modules and functions from compiled BEAM code",
      package: [licenses: ["Apache-2.0"]]
    ]
  end
end
