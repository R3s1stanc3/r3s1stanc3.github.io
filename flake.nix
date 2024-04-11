{
  description = "r3s1stanc3.github.io";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
    (system:

     let
      pkgs = nixpkgs.legacyPackages.${system};
      name = "r3s1stanc3";
      email = "r3s1stanc3@riseup.net";
     in
     {
      devShell = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          gnumake
          nodejs
          zola
        ];

        # overwrite git parameters for anonymity
        GIT_AUTHOR_NAME = name;
        GIT_AUTHOR_EMAIL =  email;
        GIT_COMMITTER_NAME = name;
        GIT_COMMITTER_EMAIL = email;
        GIT_SSH_COMMAND = "ssh -i ~/.ssh/id_ed25519_r3s";

        GIT_COMMIT_GPGSIGN = "false";
        GIT_CONFIG_COUNT = 1;
        GIT_CONFIG_KEY_0 = "commit.gpgSign";
        GIT_CONFIG_VALUE_0 = "false";
      };
     }
    );
}
#devShells.default = import ./shell.nix { inherit pkgs; };
