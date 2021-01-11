let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    rev = "4eae10b6d8024d58139e2ca5016e3f72312937a2";
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
