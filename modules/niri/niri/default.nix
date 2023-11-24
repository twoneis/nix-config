{ pkgs, ... }:
pkgs.rustPlatform.buildRustPackage {
  pname = "niri";
  version = "unstable-2023-11-21";

  src = pkgs.fetchFromGitHub {
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

  nativeBuildInputs = with pkgs; [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = with pkgs; [
    libxkbcommon
    pipewire
    seatd
    udev
    wayland
    libinput
    mesa
    libglvnd
  ];

  RUSTFLAGS = map (a: "-C link-arg=${a}") [
    "-Wl,--push-state,--no-as-needed"
    "-lEGL"
    "-lwayland-client"
    "-Wl,--pop-state"
  ];
}
