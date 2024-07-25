{ config, ... }: let
    background = config.theme.base;
    font = config.theme.text;
    charging = config.theme.pine;
    warning = config.theme.rose;
    critical = config.theme.love;
in {
    style = ''
        * {
            border: none;
            font-family: FiraCodeNerdFont;
            font-size: 18px;
            color: ${font};
            border-radius: 20px;
        }

        window#waybar {
            background: rgba(0, 0, 0, 0);
        }

        /*-----module groups----*/
        .modules-right {
            background-color: ${background};
            margin: 2px 10px 0 0;
        }
        .modules-center {
            background-color: ${background};
            margin: 2px 0 0 0;
        }
        .modules-left {
            margin: 2px 0 0 10px;
            background-color: ${background};
        }

        #clock,
        #battery,
        #memory,
        #network,
        #temperature,
        #wireplumber {
            padding: 0 15px;
        }

        #cpu {
            padding: 0 0 0 15px;
        }

        /*-----Indicators----*/
        #battery.charging {
            color: ${charging};
        }
        #battery.warning:not(.charging) {
        	color: ${warning};
        }
        #battery.critical:not(.charging) {
            color: ${critical};
        }

        #temperature.critical {
            color: ${critical};
        }
    '';
}
