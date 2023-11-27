{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      "default" = {
        id = 0;

        search.default = "Startpage";
        search.privateDefault = "DuckDuckGo";
        search.engines = {
          "Startpage" = {
            urls = [{
              template = "https://startpage.com/do/search";
              params = [
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "@sp" ];
          };
          "DuckDuckGo" = {
            urls = [{
              template = "https://duckduckgo.com/";
              params = [
                { name = "q"; value = "{searchTerms}"; }
              ];
            }];
            definedAliases = [ "@ddg" ];
          };
          "Google" = {
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
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
          };
        };
        search.force = true;
        search.order = [
          "Startpage"
          "DuckDuckGo"
          "Google"
          "Wikipedai"
          "YouTube"
          "Nix Packages"
        ];

        bookmarks = { };

        settings = {
          "browser.startup.blankWindow" = true;
          "browser.startup.page" = 0;
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
          "extensions.pictureinpicture.enable_picture_in_picture_overrides" = false;
        };

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
