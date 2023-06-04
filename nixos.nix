{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    config = {
      system.stateVersion = config.system.nixos.release;
      environment = {
        systemPackages = [
          pkgs.nyancat
        ];
      };
      users = {
        allowNoPasswordLogin = true;
        mutableUsers = false;
        groups.nyancat = {};
        users.nyancat = {
          group = "nyancat";
          isNormalUser = true;
          shell = "/run/current-system/sw/bin/nyancat";
        };
      };
      services.getty.autologinUser = lib.mkForce "nyancat";
      isoImage.makeUsbBootable = true;
      boot.loader.timeout = lib.mkForce null;
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
