{
  # If we don't specify system we use the one we're building on
  system ? builtins.currentSystem
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
  # A very basic test system
  nixosConfigurations.hetztest = eval-config {
    inherit pkgs system;
    modules = [
      ./host
    ];
  };
}
