{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # Nix extensions
      mkhl.direnv
      kamadorueda.alejandra
      jnoortheen.nix-ide
      # Rust Extensions
      # CodeLLDB must be defined here
      # it's a dynamically generated binary
      vadimcn.vscode-lldb
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
    ];
    userSettings = {
      "nix.serverPath" = "nil";
      "nix.enableLanguageServer" = true;
      "nixpkgs.expr" = "import <nixpkgs> {}";
      "formatting.command" = ["alejandra"];
    };
  };
}
