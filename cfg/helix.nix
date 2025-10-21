{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = false;
    settings = {
      theme = "gruvbox-darker";
      editor = {
        line-number = "relative";
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };
    };
  };
}
