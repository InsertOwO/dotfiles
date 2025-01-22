{config, pkgs, ...}:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        text = "Logout";
        action = "loginctl terminate-user $USER";
      }

      {
        text = "Sleep";
	action = "systemctl sleep";
      }

      {
        text = "Shutdown";
	action = "systemctl poweroff";
      }
    ];

    style = ''
      * {
        button {
	  border-radius: 25;
          background-color: #${config.color.priCol};
	}

	button:hover {
          background-color: #${config.color.secCol};
	}
    '';
  };
}
