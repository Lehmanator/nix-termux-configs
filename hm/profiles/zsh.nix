{ inputs
, config, lib, pkgs
, ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    package = pkgs.zsh;
    autocd = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#ff00ff,bg=cyan,bold,underline";
      strategy = ["match_prev_cmd" "completion"];
    };
    cdpath = [];
    defaultKeymap = "viins";
    dirHashes = {
      docs  = "$HOME/storage/shared/Documents";
      vids  = "$HOME/storage/shared/Videos";
      dl    = "$HOME/storage/shared/Downloads";
    };
    dotDir = config.xdg.configHome + "/zsh";
    # Extra commands that should be added to .zshenv.
    # envExtra = ''
    # '';
    history = {
      append = true;
      extended = true;
      ignoreDups = true;
      ignorePatterns = [ "rm *" "pkill *" ];
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      save = 100000;
      share = true;
      size = 100000;
    };
    historySubstringSearch = {
      enable = true;
      searchDownKey = [  "^[[B"];  # $terminfo[kcud1]
      searchUpKey   = [  "^[[A"];  # $terminfo[kcuu1]
    };
    # Extra commands that should be added to .zshrc.
    # initExtra = '''';
    # Extra commands that should be added to .zshrc before compinit.
    # initExtraBeforeCompInit = '''';
    # Commands that should be added to top of .zshrc.
    # initExtraFirst = '''';
    # Extra local variables defined at the top of .zshrc.
    # localVariables = { POWERLEVEL9K_LEFT_PROMPT_ELEMENTS = ["dir" "vcs"]; };
    # loginExtra=""; logoutExtra="";
    # plugins =[
    #   {}
    # ];
    shellGlobalAliases = {
    };
    syntaxHighlighting.enable = true;
    zprof.enable = true;
    zsh-abbr = { 
      enable = true;
      abbreviations = {
        g = "git";
        n = "nix";
        mkd = "mkdir -p";
      };
    };
  };
}
