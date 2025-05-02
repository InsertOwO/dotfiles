{pkgs, ...}:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [
      (import ./wm/screenshot.nix {inherit pkgs;})
    ];
  };
}
