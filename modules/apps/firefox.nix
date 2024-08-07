{ inputs, lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.apps.enable {
  nixpkgs.overlays = [ inputs.nur.overlay ];
  home-manager.users.${conf.username} = {
    programs.firefox = {
      enable = true;
      profiles = {
        "default" = {
          id = 0;

          search.default = "Googlee";
          search.privateDefault = "Googlee";
          search.engines = {
            "DuckDuckGo".metaData.hidden = true;
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
            "Startpage" = {
              urls = [{
                template = "https://startpage.com/sp/search";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@sp" ];
            };
            "DuckDuckGoo" = {
              urls = [{
                template = "https://duckduckgo.com/";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@ddg" ];
            };
            "Googlee" = {
              urls = [{
                template = "https://google.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@g" ];
            };
            "Wikipedia" = {
              urls = [{
                template = "https://en.wikipedia.org/wiki/Special:Search";
                params = [
                  { name = "search"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@wiki" ];
            };
            "YouTube" = {
              urls = [{
                template = "https://youtube.com/results";
                params = [
                  { name = "search_query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@yt" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@no" ];
            };
            "Arch Wiki" = {
              urls = [{
                template = "https://wiki.archlinux.org/index.php";
                params = [
                  { name = "search"; value = "{searchTerms}"; }
                  { name = "fulltext"; value = "1"; }
                ];
              }];
              definedAliases = [ "@aw" ];
            };
            "Github" = {
              urls = [{
                template = "https://github.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                  { name = "type"; value = "repositories"; }
                ];
              }];
              definedAliases = [ "@gh" ];
            };
          };
          search.force = true;
          search.order = [
            "Startpage"
            "DuckDuckGoo"
            "Googlee"
            "Wikipedia"
            "YouTube"
            "Nix Packages"
            "Nix Options"
            "Github"
          ];

          bookmarks = { };

          settings = {
            "browser.startup.blankWindow" = true;
            "browser.startup.page" = 3;
            "extensions.pocket.enabled" = false;
            "identity.fxaccounts.enabled" = false;
            "browser.tabs.closeWindowWithLastTab" = false;
            "browser.bookmarks.addedImportButton" = false;
            "dom.security.https_only_mode" = true;
            "browser.newtabpage.enabled" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "signon.rememberSignons" = false;
            "browser.preferences.moreFromMozilla" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "media.videocontrols.picture-in-picture.enabled" = false;
            "browser.translation.enable" = false;
            "media.cache_readhead_limit" = 9999;
            "media.cache_resume_threshold" = 9999;
          };

          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            sponsorblock
            ublock-origin
            pronoundb
            youtube-nonstop
            enhancer-for-youtube
            firefox-color
          ];
        };
      };
    };
  };
}
