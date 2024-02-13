{ ... }: {
  services.calibre-server = {
    enable = true;
    libraries = [
      "/home/twoneis/calibre-lib/uni"
      "/home/twoneis/calibre-lib/pol"
      "/home/twoneis/calibre-lib/fic"
      "/home/twoneis/calibre-lib/sci"
    ];
    user = "twoneis";
  };
}
