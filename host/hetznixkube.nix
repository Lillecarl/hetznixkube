{ lib, ... }:
{
  options.hnk = {
    # Labels from Hetzner
    labels = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
    };
    baseImage = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        If this is a baseImage we don't enable all software
      '';
    };
    server = {
      id = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
    k8s = {
      dist = lib.mkOption {
        type = lib.types.enum [
          "none"
          "k3s"
          "rke2"
        ];
        default = "k3s";
      };
      role = lib.mkOption {
        type = lib.types.str;
      };
    };
  };
}
