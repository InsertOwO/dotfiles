{config, pkgs, ...}:

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
        rofi-wayland
        swaybg
        swayidle
        swaylock
        brightnessctl
      ];
    };

    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pwvucontrol
    mpv
    nemo
    unrar
    unzip
  ];

  fonts.packages = with pkgs; [
    font-awesome
    source-code-pro
  ];
}
