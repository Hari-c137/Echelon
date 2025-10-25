{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = false;
    settings = {
      #      theme = "gruvbox";
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
