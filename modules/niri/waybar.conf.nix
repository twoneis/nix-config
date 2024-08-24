{ ... }: {
  mainBar = {
    layer = "top";
    position = "top";
    modules-center = [
      "battery"
    ];

    "battery" = {
      states = {
        better = 75;
        good = 50;
        bad = 25;
        worse = 10;
        worst = 5;
      };
      format = " ";
      format-alt = " ";
      tooltip = false;
    };
  };
}
