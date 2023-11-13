{ ... }: {
  programs.thunderbird = {
    enable = true;
    profiles."twoneis".isDefault = true;
  };
}
