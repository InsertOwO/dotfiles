{...}:

{
  # Enable networking.
  networking.hostName = "fujin";

  # Import stuff.
  imports = [./hw-fujin. ../config.nix];
}
