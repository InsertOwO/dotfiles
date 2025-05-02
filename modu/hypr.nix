{pkgs, ...}:

{
  programs.hyprland.enable = true;
  environment.systemPackages = (import ./wm/screenshot.nix {inherit pkgs;});
}
