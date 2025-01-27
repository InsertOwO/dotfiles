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

    blueman.enable = true;
    gvfs.enable = true;
    printing.enable = true;
  };

  programs = {  
    sway = {
      enable = true;
      extraPackages = with pkgs; [
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

    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (import ./wm/screenshot.nix {inherit pkgs;})
    kdePackages.dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-extras
    libsForQt5.kservice
    pwvucontrol
    mpv
    swayimg
    unrar
    unzip
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.sauce-code-pro
  ];
}
