{ options, config, lib, pkgs, ... }:

let
  addPrefix = name: "./" + name;
in
{
  options.yomaq.users.users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "admin" ];
      description = "List of usernames";
    };
  imports = builtins.map addPrefix config.yomaq.users.users;
}