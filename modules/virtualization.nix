{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;

      # UEFI firmware for modern operating systems
      ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };

      # TPM 2.0 (required for Windows 11)
      swtpm.enable = true;
    };
  };

  # Virt-Manager GUI
  programs.virt-manager.enable = true;

  # Add your user to the libvirt group
  users.users.dinzz.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    qemu
    swtpm
  ];
}
