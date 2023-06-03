{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
      system.stateVersion = "22.11";
      environment = {
        systemPackages = [
          pkgs.nyancat
        ];
      };
      users = {
        users = {
          nixos = {
            isNormalUser = true;
            password = "password";
          };
        };
      };
    };
  };
in
inputs.nixos-generators.nixosGenerate {
  system = "x86_64-linux";
  format = "iso";
  modules = [
    nixosModule
  ];
}
