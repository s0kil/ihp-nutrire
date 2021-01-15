let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    rev = "b35b5c9b856e472e3345ab1d7417e93793f3ea77";
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
