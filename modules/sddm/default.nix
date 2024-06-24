{ pkgs, lib, config, ... }: lib.mkIf(config.withNiri or config.withPlasma or config.withGnome){
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
      compositor = "kwin";
    };
    theme = "where_is_my_sddm_theme";
  };

  environment.systemPackages = [ (pkgs.where-is-my-sddm-theme.override ({ themeConfig = builtins.readFile ./sddm-theme.conf; })) ];
}
