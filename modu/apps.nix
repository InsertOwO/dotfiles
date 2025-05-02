{pkgs, ...}:

{
  # Enable needed services.
  services = {
    # Audio.
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Automount new storage devices.
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    # Display manager.
    displayManager.ly.enable = true;

    # Transfer files from phone and printing.
    gvfs.enable = true;
    printing.enable = true;
  };

  programs = {  
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl

    # Screenshot stuff.
    grim
    libnotify
    wl-clipboard
    slurp
    jq

    pwvucontrol
    nautilus
    mpv
    unrar
    unzip
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.sauce-code-pro
  ];
}
