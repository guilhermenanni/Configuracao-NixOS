{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/aliases.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/trashclean.nix
    ./modules/users.nix
  ];

  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  # network
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # time
  time.timeZone = "America/Sao_Paulo";

  # locale
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # desktop
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb.layout = "br";
  console.keyMap = "br-abnt2";

  # touchpad
  services.libinput.enable = true;

  # audio
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # firmware
  hardware.enableRedistributableFirmware = true;

  # unfree
  nixpkgs.config.allowUnfree = true;

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # state
  system.stateVersion = "25.05";
}
