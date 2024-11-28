{
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      kamadorueda.alejandra
      jnoortheen.nix-ide
    ];
    userSettings = {
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs.expr" = "import <nixpkgs> {}";
      "formatting.command" = ["alejandra"];
    };
  };
}
