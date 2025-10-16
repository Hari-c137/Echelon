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
    };
  };
}
