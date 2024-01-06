{ ... }: {
  virtualisation.docker.enable = true;
  users.users.twoneis.extraGroups = [ "docker" ];
}
