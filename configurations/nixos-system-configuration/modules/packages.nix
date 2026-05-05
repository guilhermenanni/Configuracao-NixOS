{ config, pkgs, ... }:

let
  basePkgs = with pkgs; [
    wget zsh curl nano btop fastfetch openssh libreoffice unzip zip gnutar ghostty
  ];

  devPkgs = with pkgs; [
    vscode docker docker-compose nodejs postman dbeaver-bin postgresql
  ];

  netPkgs = with pkgs; [
    iproute2 dnsutils traceroute wireshark
  ];

  dailyPkgs = with pkgs; [
    firefox discord wasistlos copyq easyeffects
  ];

  systemPkgs = with pkgs; [
    ntfs3g exfat
  ];

  gamingPkgs = with pkgs; [
    steam
  ];

  gnomePkgs = with pkgs; [
    gnome-tweaks
    gnome-themes-extra

    # Extensions
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.just-perfection
    gnomeExtensions.appindicator
  ];

  themePkgs = with pkgs; [
    sassc
    glib

    papirus-icon-theme
    bibata-cursors

    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

in
{
  environment.systemPackages =
    basePkgs
    ++ devPkgs
    ++ netPkgs
    ++ dailyPkgs
    ++ systemPkgs
    ++ gamingPkgs
    ++ gnomePkgs
    ++ themePkgs;

  programs.git.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    cheese
    epiphany
    seahorse
    xterm
  ];
}