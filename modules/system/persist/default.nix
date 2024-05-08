{ ... }: {
  users.mutableUsers = false;
  users.users.twoneis.initialHashedPassword = "$y$j9T$0pmWE8A2JWcr2BDqqZ2u./$Km7K1hml9Gy0fc9DzBsDTvpyCKZ9DW0GOkD.lDcyYw0";
  users.users.root.initialHashedPassword = "$y$j9T$U8fvYSDoZxqVrkjlZM2Db.$qvkT9GIbVJ23EtB7KcqyI8u7RKJ99pYSXNu8IhVcDx9";
  environment.persistence."/persist" = {
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
    ];
    files = [
      "/etc/machine-id"
    ];
    user.twoneis = {
      directories = [
        "Documents"
        "uni"
        "code"
        # a lot of firefox settings that can't/aren't currently declared properly
        ".mozilla"
      ];
    };
  };
}
