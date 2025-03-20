{ root, ... }:
{
  services.openssh = {
    enable = true;

    openFirewall = true;

    settings = {
      PermitRootLogin = "prohibit-password";
      PasswordAuthentication = false;
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [
    (builtins.readFile "${root}/ssh-pub.key")
  ];
}
