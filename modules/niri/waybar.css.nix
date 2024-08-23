{ config, ... }: let
    best = config.theme.pine;
    better = config.theme.foam;
    good = config.theme.iris;
    bad = config.theme.rose;
    worse = config.theme.gold;
    worst = config.theme.love;
    charging = config.theme.highlight-high;
in {
    style = ''
        * {
            font-size: 1px;
        }

        window#waybar {
            background: rgba(0, 0, 0, 0);
        }

        #battery {
            border: none;
            border-radius: 4px;
            min-height: 4px;
            min-width: 720px;
            margin: 2px;
            background: ${best};
        }
        #battery.better {
            background: ${better};
        }
        #battery.good {
            background: ${good};
        }
        #battery.bad {
            background: ${bad};
        }
        #battery.worse {
            background: ${worse};
        }
        #battery.worst {
            background: ${worst};
        }

        #battery.charging {
            background: linear-gradient(0deg, ${charging}, ${best});
        }
        #battery.better.charging {
            background: linear-gradient(0deg, ${best}, ${better});
        }
        #battery.good.charging {
            background: linear-gradient(0deg, ${better}, ${good});
        }
        #battery.bad.charging {
            background: linear-gradient(0deg, ${good}, ${bad});
        }
        #battery.worse.charging {
            background: linear-gradient(0deg, ${bad}, ${worse});
        }
        #battery.worst.charging {
            background: linear-gradient(0deg, ${worse}, ${worst});
        }
    '';
}
