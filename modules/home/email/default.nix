{ ... }: {
  programs.thunderbird = {
    enable = true;
    profiles = [ "default" ];
  };
}
