{ inputs, ... }:

{

  imports = [ inputs.vicinae.homeManagerModules.default ];
  services.vicinae = {
    enable = false;
    autoStart = true;
    settings = {
      faviconService = "twenty"; # twenty | google | none
      font.size = 11;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "ayu-dark";
      window = {
        csd = true;
        opacity = 0.95;
        rounding = 10;
      };
    };
  };

}
