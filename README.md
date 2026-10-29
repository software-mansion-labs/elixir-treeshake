# Treeshake

Removes unused modules and functions from compiled BEAM code. It is extracted from [Popcorn](https://github.com/software-mansion/popcorn).

Treeshake starts from the applications' callbacks and the entry points you give it. It follows calls, captures, MFA tuples, behaviours, protocols and more to find the reachable functions, and removes everything else. The output is a directory of `.beam` files.

Due to the dynamic nature of Elixir, it's not possible to detect unused code with full certainty. In particular, if some code is only called through dynamic calls (like `apply/3` on a module known at runtime), it's possible that tree-shaking removes it. You can use `keep` option to mitigate that (see Usage section below).

## Usage

For example, to tree-shake a Mix project and its dependencies, compile it with `MIX_ENV=prod mix compile`, then run:

```elixir
Treeshake.run(
  project: "path/to/mix/project",
  output_dir: "treeshaken/beams/land/here",
  keep: [mfa: {MyApp.CLI, :main, 1}] # Tree-shaker won't remove it, nor the code it calls
)
```

See `Treeshake.run/1`'s documentation, in `lib/treeshake/treeshake.ex`, for all the options and details.

## Authors

Treeshake is created by Software Mansion.

Since 2012 [Software Mansion](https://swmansion.com/) is a software agency with experience in building web and mobile apps as well as complex multimedia solutions. We are Core React Native Contributors and experts in live streaming and broadcasting technologies. We can help you build your next dream product – [Hire us](https://swmansion.com/contact/projects).

Copyright 2025, [Software Mansion](https://swmansion.com/)

[![Software Mansion](https://logo.swmansion.com/logo?color=white&variant=desktop&width=200&tag=membrane-github)](https://swmansion.com/)

## License

Licensed under the [Apache License, Version 2.0](LICENSE)
