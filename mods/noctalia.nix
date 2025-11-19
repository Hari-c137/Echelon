{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    (inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      quickshell = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    })
  ];
}
