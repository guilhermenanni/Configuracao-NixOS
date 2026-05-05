{ config, pkgs, ... }:

{
  # SSH
  services.openssh.enable = false;

  # Impressão
  services.printing.enable = false;

  # Docker
  virtualisation.docker.enable = false;

  # Firmware proprietário 
  hardware.enableRedistributableFirmware = true;
  

  # Serviços opcionais (ativar apenas quando necessário)
  services.postgresql.enable = false;
  services.mysql.enable = false;
  services.httpd.enable = false;

  # Flatpak
  services.flatpak.enable = true;

  #Suporte para gnome extensions
  services.gnome.gnome-browser-connector.enable = true;

}
