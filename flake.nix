{
  description = "another test without a dash";
  inputs = {
    nixpkgs.url = "nixpkgs/22.11";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: 
  let
    flakeContext = {
      inherit inputs;
    };
  in
  {
    packages.x86_64-linux.default = import ./nixos.nix flakeContext;
  };
}
