{ config, ... }: let
  base = config.theme.base;
  surface = config.theme.surface;
  text = config.theme.text;
in {
  style = ''
    [General]
    # Password mask character
    passwordCharacter=*
    # Mask password characters or not ("true" or "false")
    passwordMask=true
    # value "1" is all display width, "0.5" is a half of display width etc.
    passwordInputWidth=0.5
    # Background color of password input
    passwordInputBackground=${surface}
    # Radius of password input corners
    passwordInputRadius=8
    # "true" for visible cursor, "false"
    passwordInputCursorVisible=false
    # Font size of password (in points)
    passwordFontSize=96
    passwordCursorColor=${text}
    passwordTextColor=

    # Show or not sessions choose label
    showSessionsByDefault=false
    # Font size of sessions choose label (in points).
    sessionsFontSize=24

    # Show or not users choose label
    showUsersByDefault=false
    # Font size of users choose label (in points)
    usersFontSize=48

    # Path to background image
    background=
    # Or use just one color
    backgroundFill=${base}
    backgroundFillMode=aspect

    # Default text color for all labels
    basicTextColor=${text}

    # Radius of background blur
    blurRadius=
  '';
}
