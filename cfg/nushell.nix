{ ... }:

{
    programs.nushell = {
        enable = true;
        shellAliases = {
            gs = "git status";
            gp = "git push -u origin main";
        };
        // add config after reading nu docs
    };
}
