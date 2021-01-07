let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    rev = "749cf73308d30b825fcd1259482e58a90adb7fad";
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
