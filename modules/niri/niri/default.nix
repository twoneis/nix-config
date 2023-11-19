{ lib
, rustPlatform
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
    mesa # libgbm
  ];

  runtimeDependencies = [
    wayland
    mesa
    libglvnd
  ];

  meta = with lib; {
    description = "A scrollable-tiling Wayland compositor";
    homepage = "https://github.com/YaLTeR/niri";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ iogamaster ];
    mainProgram = "niri";
    inherit (wayland.meta) platforms;
  };
}
