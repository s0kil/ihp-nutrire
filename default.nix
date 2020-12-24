let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    rev = "7c9205ddf52ae35f371a1164a905445b5b85af0a";
    ref = "*";
  };
  haskellEnv = import "${ihp}/NixSupport/default.nix" {
    ihp = ihp;
    haskellDeps = p: with p; [
      cabal-install
      base
      wai
      text
      hlint
      p.ihp
    ];
    otherDeps = p: with p; [
      # Native dependencies, e.g. imagemagick
      nodejs
      entr
    ];
    projectPath = ./.;
  };
in
haskellEnv
