{ config, lib, pkgs, inputs, ... }:
{
  imports =[
    # import custom modules
    inputs.self.nixosModules.yomaq
    # import users
    (inputs.self + /users/admin)
    (inputs.self + /users/carln)
  ];
  config = {
    networking.hostName = "green";
    system.stateVersion = "23.05";
    networking.useDHCP = lib.mkDefault true;

    yomaq = {
      autoUpgrade.enable = true;
      primaryUser.users = [ "admin" ];
      _1password.enable = true;
      tailscale = {
        enable = true;
      };
    };
  };
}
