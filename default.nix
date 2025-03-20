{
  # If we don't specify system we use the one we're building on
  system ? builtins.currentSystem,
}:
let
  # import our pins
  npins = import ./npins;
  # import nixpkgs
  pkgs = import npins.nixpkgs {
    inherit system;
  };
  # import eval-config (same code that flakes use to make a NixOS system)
  # https://github.com/NixOS/nixpkgs/blob/ed760cd0705bcb5bca961aec890c06b60a32c06c/flake.nix#L59
  eval-config = import "${npins.nixpkgs}/nixos/lib/eval-config.nix";
in
{
  inherit
    npins
    pkgs
    ;
  # A very basic test system
  outputs =
    let
      specialArgs = {
        inherit npins;
        root = ./.;
      };
      mkBase =
        baseName: system:
        eval-config {
          inherit system;
          modules = [
            {
              networking.hostName = baseName;
              hnk = {
                baseImage = true;
                labels = {
                  k8s_role = "none";
                };
                k8s = {
                  dist = "k3s";
                  role = "agent";
                };
              };
            }
            ./host
          ];
          inherit specialArgs;
        };
    in
    {
      nixosConfigurations.nixos-x86-base = mkBase "nixos-x86-base" "x86-64-linux";
      nixosConfigurations.nixos-arm-base = mkBase "nixos-arm-base" "aarch64-linux";
    };
}
