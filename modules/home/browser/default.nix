{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      "default" = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          sponsorblock
          ublock-origin
          consent-o-matic
          pronoundb
        ];
      };
    };
  };
}
