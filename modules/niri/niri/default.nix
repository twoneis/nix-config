{ rustPlatform
, fetchFromGitHub
, pkg-config
, libxkbcommon
, pipewire
, systemd
, seatd
, udev
, wayland
, libinput
, mesa
, libglvnd
}:

rustPlatform.buildRustPackage {
  pname = "niri";
  version = "unstable-2023-11-17";

  src = fetchFromGitHub {
    owner = "YaLTeR";
    repo = "niri";
    rev = "19cafffe0f3f1eefc6984dc446134b0fd93d1e28";
    hash = "sha256-mDeJh3N6Zt3FNpyFmRkY8zOLIBad3CoV45WjB+RUkhA=";
  };


  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "smithay-0.3.0" = "sha256-1BEJEdmGCt6jtPEcBt4R1d/LdKWLLJYJpcOn4SbvkRk=";
    };
  };

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    libxkbcommon
    pipewire
    systemd
    seatd
    udev
    wayland
    libinput
    libglvnd
    mesa # libgbm
  ];

  RUSTFLAGS = map (a: "-C link-arg=${a}") [
    "-Wl,--push-state,--no-as-needed"
    "-lEGL"
    "-lwayland-client"
    "-Wl,--pop-state"
  ];

  postInstall =
  let
    niriSession = ''
      [Desktop Entry]
      Name=niri
      Comment=Scrolling wayland compositor
      Exec=niri
      Type=Application
      '';
    niriPortals = ''
      [preferred]
      default=gnome;gtk;      
    '';
  in ''
      mkdir -p $out/share/wayland-sessions
      echo "${niriSession}" > $out/share/wayland-sessions/niri.desktop
      mkdir -p $out/xdg-desktop-portal
      echo "${niriPortals}" > $out/share/wayland-sessions/niri-portals.conf
    '';

  passthru.providedSessions = [ "niri" ];
}
