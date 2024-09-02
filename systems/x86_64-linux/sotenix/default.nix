{ pkgs, lib, ... }:

{
  imports = [ ./hardware.nix ];

  # Bootloader.
  boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 5;
      editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.supportedFilesystems = [ "ntfs" ];

  # networking.hostName = "sotenix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;



  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.sote = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  chrunk = { 
    base_utils.enable = true;
    fish.enable = true;
    neovim.enable = true;
    games.enable = true;
  };

  system.stateVersion = "23.05";
}
