{pkgs, ...}:

{
  # Steam cannot be enabled for a singular user.
  programs.steam.enable = true;

  # Other games.
  users.users.insert.packages = with pkgs; [
    steamcontroller
    prismlauncher
    pcsx2
    dsda-doom
    gzdoom
    # If im gaming, I'm most likely also using this.
    discord
  ];
}
