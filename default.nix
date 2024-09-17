{ pkgs, ... }:

let
  USER = "raf";
in
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-tour
      gnome-connections
    ])
    ++ (with pkgs.gnome; [
      epiphany
      geary
      evince
    ]);

  environment.systemPackages = with pkgs.gnomeExtensions; [ pop-shell ];

  home-manager.users.${USER} = {
    home = {
      dconf.enable = true;
    };
  };
}
