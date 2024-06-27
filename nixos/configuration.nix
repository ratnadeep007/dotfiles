# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.systemPackages = with pkgs; [
    neovim
    git
    tmux
    zoxide
    fzf
    uv
    libgcc
    gcc
    volta
    direnv
    devenv
    colima
    cudatoolkit
    cudaPackages.cudatoolkit
    starship
    eza
    rbenv
    docker_26
    kubectl
    btop
  ];

  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  programs.nix-ld.enable = true;
  
  users.users.nixos.extraGroups = [ "docker" ];
  # environment.variables = {
  #   NIX_LD_LIBRARY_PATH = lib.makeLibraryPath [
  #     pkgs.stdenv.cc.cc
  #   ];
  #   NIX_LD = "${pkgs.glibc}/lib/ld-linux-x86-64.so.2";
  # };

  virtualisation.docker.enable = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
