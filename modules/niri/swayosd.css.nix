{ config, ... }: let
    background = config.theme.overlay;
    muted = config.theme.muted;
    font = config.theme.text;
in {
    style = ''
        window#osd {
            border-radius: 8px;
            border: none;
            background: ${background};
        }

        image,
        label {
            color: ${font};
        }

        progressbar {
            background: ${muted};
        }

        progress:disabled {
            background: ${font};
        }

        progress {
            background: ${font};
        }
    '';
}
