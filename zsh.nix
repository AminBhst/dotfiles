{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 5000;
      save = 5000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      df = "df -h";
      free = "free -m";

      j = "z";
      f = "zi";
      zz = "__zoxide_z";
      zzi = "__zoxide_zi";

      psmem = "ps auxf | sort -nr -k 4 | head -5";
      pscpu = "ps auxf | sort -nr -k 3 | head -5";

      brightness = "brightnessctl set";
      volume-max = "amixer sset Master 100%";

      shutdown = "shutdown now";
      list_systemctl = "systemctl list-unit-files --state=enabled";
    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }
    ];

    initExtraBeforeCompInit = ''
      # pywal
      [ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)
      [ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences
      [ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

      # completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    '';

    initExtra = ''
      # keybindings
      bindkey -s '^o' 'ranger\n'
      bindkey -s '^f' 'zzi\n'
      bindkey -s '^v' 'nvim\n'
      bindkey -s '^g' 'lazygit\n'
      bindkey -s '^z' 'zi\n'
      bindkey '^[[P' delete-char
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "pure";
  };

  home.packages = with pkgs; [
    ranger
    lazygit
    brightnessctl
  ];
}
