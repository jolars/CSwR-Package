{
  pkgs,
  ...
}:

{
  packages = [
    pkgs.bashInteractive
    pkgs.go-task
    pkgs.arity
    pkgs.quartoMinimal
  ];

  languages.r = {
    enable = true;
    package = (
      pkgs.rWrapper.override {
        packages = with pkgs.rPackages; [
          devtools
          roxygen2
          spelling
          testthat
          ggplot2
          rlang
          bench
          covr
          readr
          here
          tidyverse
          quarto
        ];
      }
    );
  };

  git-hooks.hooks = {
    arity = {
      enable = true;
      entry = "${pkgs.arity}/bin/arity format --check";
      files = "\\.(r|R)$";
      language = "system";
    };
  };
}
