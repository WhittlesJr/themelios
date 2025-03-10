# Themelios configuration.sh example

use_sgdisk_clear="true"     # use sgdisk --clear
use_wipefs_all="true"       # use wipefs --all
use_zero_disks="false"      # use dd if=/dev/zero ...
install_arguments=""        # any extra arguments to nixos-install, like --no-root-passwd
zfs_pool_name="rpool"
zfs_pool_disks=(
	"/dev/disk/by-id/nvme-WD_BLACK_SN850X_HS_2000GB_24120D800169"
	"/dev/disk/by-id/nvme-CT2000T500SSD8_240646EA4ECB_1"
	) # Note: using /dev/disk/by-id is also preferable.
zfs_pool_type="mirror"            # use "" for single, or "mirror", "raidz1", etc.
zfs_encrypt_home="true"    # only set to true if you are using a nixos ISO with ZFS 0.8 or higher.
zfs_auto_snapshot=("$zfs_pool_name/HOME" "$zfs_pool_name/ROOT") # datasets to be set with com.sun:auto-snapshot=true
nix_top_level_configuration="hosts/vm-example" # Your top-level nix file to be bootstrapped
nix_zfs_configuration_extra_enabled="true" # uncomment below if set to true
nix_zfs_extra_auto_scrub="true"
nix_zfs_extra_auto_snapshot_enabled="true" # Enable the ZFS auto-snapshotting service
nix_zfs_extra_auto_snapshot_frequent="8"
nix_zfs_extra_auto_snapshot_hourly="24"
nix_zfs_extra_auto_snapshot_daily="0"
nix_zfs_extra_auto_snapshot_weekly="0"
nix_zfs_extra_auto_snapshot_monthly="0"
nix_zfs_extra_auto_optimise_store="true"
nix_zfs_extra_gc_automatic="true"
nix_zfs_extra_gc_dates="weekly"
nix_zfs_extra_gc_options="--delete-older-than 7d"
nix_zfs_extra_clean_tmp_dir="true"
