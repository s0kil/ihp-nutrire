let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    rev = "3f3ddb53a60e8358ddaa41ba03b663e1bd38bb1a";
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
