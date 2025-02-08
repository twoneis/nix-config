{ ... }: {
  conf = {
    ssh.enable = true;
    nginx.enable = true;
    website.enable = true;
    fedi.enable = false; # Currently broken
    matrix.enable = true;
    git.enable = true;

    stateVersion = "25.05";
    hmStateVersion = "25.05";
  };
}
