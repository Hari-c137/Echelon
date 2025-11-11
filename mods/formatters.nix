{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    stylua
    shfmt
    nixfmt
    rust-analyzer
    wasm-pack
  ];
}
