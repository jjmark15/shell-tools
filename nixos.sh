quick-update-nixos() {
    nix-channel --update nixpkgs && nix-env -u '*' && nix-collect-garbage -d
}