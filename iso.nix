{config, pkgs, ...}:
let
  themelios = pkgs.writeScriptBin "themelios" ''
    bash <(curl https://raw.githubusercontent.com/a-schaefers/themelios/master/themelios) $@
  '';
in {
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma5.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];
  boot.supportedFilesystems = [ "zfs" ];
  environment.systemPackages = with pkgs; [ git themelios ];
}
