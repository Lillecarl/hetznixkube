{ ... }:
{
  services.cloud-init = {
    enable = true;
    btrfs.enable = false;
    ext4.enable = false;
    network.enable = false;
    xfs.enable = false;
  };
}
