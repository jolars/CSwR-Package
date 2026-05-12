{
  pkgs,
  ...
}:

{
  packages = [
    pkgs.bashInteractive
    pkgs.go-task
    pkgs.air
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
        ];
      }
    );
  };

  git-hooks.hooks = {
    air = {
      enable = true;
      entry = "air format --check";
      files = "\\.(r|R)$";
      language = "system";
    };
  };
}
