{ pkgs, ... }:

{
  programs.helix = {
    enable = false; # change theme, set line higlight and bracket
    settings = {
      theme = "papercolor-dark";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor = {
        line-number = "relative";
        mouse = false;
        auto-completion = true;
        auto-save = true;
        auto-format = true;

        lsp = {
          enable = true;
          auto-signature-help = true;
          display-messages = true;
        };
      };
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
    ];
  };
}
