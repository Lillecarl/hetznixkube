{ ... }:
{
  # Disables warnings about filesystems and whatever
  boot.isContainer = true;
  # Whatever
  system.stateVersion = "25.05";
  # Something that shows up in result/etc/test so we can see things working
  environment.etc."test".text = ''
    etctest
  '';
}
