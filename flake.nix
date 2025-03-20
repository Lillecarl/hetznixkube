{
  inputs = {};
  outputs = { ... }: (import ./default.nix { system = "aarch64-linux"; }).outputs;
}
