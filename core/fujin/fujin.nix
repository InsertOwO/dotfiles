{...}:

{
  # Enable networking.
  networking.hostName = "fujin";

  # Import stuff.
  imports = [
    ./hw-fujin.nix 
    ../config.nix
    ../../modu/sway.nix
  ];
}
