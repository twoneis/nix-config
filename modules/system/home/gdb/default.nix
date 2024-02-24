{ ... }: {
  home.file = {
    ".gdbinit" = {
      source = ./gdbinit;
    };
  };
}
