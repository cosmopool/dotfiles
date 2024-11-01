{
  description = "cosmopool's Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages =
        [
          pkgs.neovim
          pkgs.mkalias
          pkgs.ripgrep
          pkgs.git
          pkgs.fzf
          pkgs.spotify
          pkgs.kitty
          pkgs.vesktop
          pkgs.starship
          pkgs.mas
          pkgs.qbittorrent
          pkgs.zig
          pkgs.fish
          pkgs.atuin
          pkgs.cocoapods
          pkgs.tree-sitter # needed to finish swift configuration in neovim. can be commented out after everything is finished
          pkgs.go
        ];

      fonts.packages = with pkgs; [
        office-code-pro
        (pkgs.nerdfonts.override {
          fonts = [
            "Hack"
            "Meslo"
          ];
        })
      ];

      homebrew = {
        enable = true;
        casks = [
          "karabiner-elements"
          "thunderbird"
          "firefox"
          "nikitabobko/tap/aerospace"
          "stremio"
        ];
        brews = [
          "fvm"
          # "nodejs" # needed for installing lots of languages servers in neovim. comment again after everything is installed.
        ];
        taps = [
          "leoafarias/fvm"
        ];
        masApps = {
          "Xcode" = 497799835;
          "Whatsapp" = 310633997;
          "Telegram" = 747648890;
        };
        onActivation.cleanup = "zap";
      };

      system.activationScripts.setFishAsShell.text = ''
        dscl . -create /Users/arrow UserShell /run/current-system/sw/bin/fish
      '';

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        # set shortcuts for GUI apps installed via nix (homebrew casks don't need it)
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';

      system.defaults = {
      	dock.autohide = true;
        dock.show-recents = false;
        dock.persistent-apps = [
          "${pkgs.kitty}/Applications/Kitty.app"
          "/Applications/Firefox.app"
          "/Applications/Xcode.app"
          "/Applications/Thunderbird.app"
          "${pkgs.spotify}/Applications/Spotify.app"
          "${pkgs.vesktop}/Applications/Vesktop.app"
          "/Applications/Telegram.app"
          "/Applications/Whatsapp.app"
        ];

        # disable hot corners
        dock.wvous-tl-corner = 1;
        dock.wvous-bl-corner = 1;
        dock.wvous-tr-corner = 1;
        dock.wvous-br-corner = 1;

        #mouse
        NSGlobalDomain."com.apple.swipescrolldirection" = false;

        #keyboard F1~F12 as default
        NSGlobalDomain = {
          AppleKeyboardUIMode = 3;
          "com.apple.keyboard.fnState" = true;
        };
        
        #wm
        WindowManager.EnableStandardClickToShowDesktop = false;
      };
	
      system.keyboard = {
        enableKeyMapping = true;
	      remapCapsLockToEscape = true;
      };

      # services.defaults = {
      #   enable = true;
      #   "com.apple.dock.mru-spaces" = {
      #     type = "bool";
      #     value = false;
      #   };
      # };
      # services.dock.restart = true;

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;
      programs.fish.enable = true;
      users.users = {
        arrow = {
          home = "/Users/arrow";
          shell = pkgs.fish;
        };
      };
      environment.shells = [pkgs.fish];
      # programs.bash = {
      #   interactiveShellInit = ''
      #     if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      #     then
      #       shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      #       exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      #     fi
      #   '';
      # };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";
    };
  in
  {
    # Build darwin flake using:
    darwinConfigurations."macos" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            user = "arrow";
          };
        }
	    ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macos".pkgs;
  };
}
