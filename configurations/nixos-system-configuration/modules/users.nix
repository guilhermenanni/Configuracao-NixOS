{ config, pkgs, ... }:

{
  users.users.gui-nanni = {
    isNormalUser = true;
    description = "gui-nanni";

    extraGroups = [
      "networkmanager"
      "wheel"
      "wireshark"
      "docker"
    ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}