{ ... }: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    extraHosts = 
    ''
      10.10.11.245 surveillance.htb
    '';
  };
}
