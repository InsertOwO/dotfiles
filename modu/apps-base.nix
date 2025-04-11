{pkgs, ...}:

{
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    displayManager.ly.enable = true;

    gvfs.enable = true;
    printing.enable = true;
  };

  programs = {  
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        nautilus
        swaybg
        swayidle
        swaylock
        brightnessctl
        jq
        grim
        slurp
        swappy
      ];
    };

    hyprland.enable = true;

    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (import ./wm/screenshot.nix {inherit pkgs;})
    pwvucontrol
    mpv
    swayimg
    unrar
    unzip
    nnn
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.sauce-code-pro
  ];
}
