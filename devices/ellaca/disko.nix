{
  disko.devices = {
    disk = {
      vda = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "128M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              end = "-16G";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  "/rootfs" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/";
                  };
                  "/home" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/home";
                  };
                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };
                };
                swap = {
                  swapfile = {
                    size = "16G";
                  };
                };
              };
            };
          };
        };
      };
      vdb = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  "/ext" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/ext";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
