{ pkgs }: {
  deps = [
    pkgs.objconv
    pkgs.pkg-config
    pkgs.rustup
    pkgs.cargo
    pkgs.nasm
    pkgs.bashInteractive
    pkgs.nodePackages.bash-language-server
    pkgs.man
  ];
}