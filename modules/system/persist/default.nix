{ ... }: {
  environment.persistence."/persist" = {
    files = [
      "/etc/shadow"
      "/etc/passwd"
    ];
  };
}
