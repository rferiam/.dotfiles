{
  description = "rferiam nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
    let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
          aerospace
          alacritty
          arc-browser
          bat
          eza
          fd
          fnm
          fzf
          go
          iperf3
          jankyborders
          jq
          lf
          mosh
          neovim
          nmap
          pnpm
          qmk
          raycast
          ripgrep
          starship
          stow
          tmux
          tree-sitter
          zoxide
          zsh-autosuggestions
          zsh-syntax-highlighting
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.hack
      ];


      homebrew = {
        enable = true;
        brews = [
          "tpm"
        ];
        masApps = { 
          "WireGuard" = 1451685025; 
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      system.defaults = {
        dock.autohide = true;
        loginwindow.GuestEnabled = false;
      };

      programs.zsh = {
        enable = true;
        enableSyntaxHighlighting = true;
        enableCompletion = true;
        enableFzfCompletion = true;
        enableFzfGit = true;
        enableFzfHistory = true;
        interactiveShellInit = ''
          source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
          source ${pkgs.fzf}/share/fzf/key-bindings.zsh
          source ${pkgs.fzf}/share/fzf/completion.zsh
        '';
      };


      nix.settings.experimental-features = "nix-command flakes";

      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;

      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;
    };
  in
  {
# $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "rferiam";
          };
        }
      ];
    };
  };
}
