{ ... }: {
  home.file = {
    ".gef.rc" = {
      source = ./gef-for-c;
      # source = ./gef-for-asm;
    };
    ".gdbinit" = {
      source = ./gdb-for-c;
      # source = ./gdb-for-asm;
    };
  };
}
