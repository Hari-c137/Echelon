{ inputs, ... }:

{

  imports = [ inputs.walker.homeManagerModules.default ];
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
    	click_to_close = true;
	close_when_open = true;
	debug = false;
	disable_mouse = false;
	exact_search_prefix  = "'";
	force_keyboard_focus = false;
	global_argument_delimiter = "#";
	selection_wrap = false;
	theme = "default";

      keybinds = {
	close = ["Escape"];
	next = ["Down"];
	previous = ["Up"];
	quick_activate = ["F1" "F2" "F3" "F4"];
	resume_last_query = ["ctrl r"];
	toggle_exact = ["ctrl e"];
      };

      placeholders = {

      default = {
      input = "Search";
      list = "No Results";
      };









      };
    };
  };

}
