{ config, pkgs, ... }:
{
environment.shellAliases = {

  #Sistema
  nix-ready = "sudo nix-channel --update && sudo nixos-rebuild switch --upgrade && sudo nix-collect-garbage -d && sudo nix-store --optimise";
  nix-update = "sudo nix-channel --update && sudo nixos-rebuild switch --upgrade";
  nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";
  nix-test = "sudo nixos-rebuild test";
  nix-roll = "sudo nixos-rebuild switch --rollback";

  #portas
  db-open = "sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT";
  db-close = "sudo iptables -D INPUT -p tcp --dport 5432 -j ACCEPT";

  #SSH
  ssh-open = "sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT";
  ssh-close = "sudo iptables -D INPUT -p tcp --dport 22 -j ACCEPT";

  #Desenvolvimento
  dev-open = "sudo iptables -A INPUT -p tcp -m multiport --dports 8080,5173,5174,5175 -j ACCEPT";
  dev-close = "sudo iptables -D INPUT -p tcp -m multiport --dports 8080,5173,5174,5175 -j ACCEPT";

  #Abrir/fechar todas
  ports-open = "db-open && ssh-open && dev-open";
  ports-close = "db-close && ssh-close && dev-close";


};
}
