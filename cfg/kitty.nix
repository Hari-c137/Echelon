{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    settings = {
      shell = "fish";
      editor = "nvim";
    };
    font = {
      name = "BlexMono";
      size = 11.5;
    };
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      scrollback_lines = 500;
      enable_audio_bell = "no";
      cursor_shape = "beam";
      cursor_trail = 1;
      show_hyperlink_targets = "yes";
      repaint_delay = 7;
      input_delay = 2;
      sync_to_monitor = "yes";
      tab_bar_edge = "bottom";
      tab_bar_margin_width = 1.0;
      tab_bar_align = "right";
      active_tab_foreground = "#000";
      active_tab_background = "#73D216";
      active_tab_font_style = "bold-itaLic";
      inactive_tab_foreground = "#444";
      inactive_tab_background = "#999";
      inactive_tab_font_style = "normal";
      background = "#222222";
      foreground = "#c2c2b0";
      cursor = "#c7c7c7";
      selection_background = "#e4c47a";
      selection_foreground = "#000000";
      color0 = "#000000";
      color1 = "#685742";
      color2 = "#5f875f";
      color3 = "#b36d43";
      color4 = "#78824b";
      color5 = "#bb7744";
      color6 = "#c9a554";
      color7 = "#d7c483";
      color8 = "#666666";
      color9 = "#685742";
      color10 = "#5f875f";
      color11 = "#b36d43";
      color12 = "#78824b";
      color13 = "#bb7744";
      color14 = "#c9a554";
      color15 = "#d7c483";
    };
  };
}
