#!/usr/bin/env -S nu --stdin

let effect = [ "grow" "wave" ] | shuffle | first
let image = (ls ~/code/echelon/walls | where type == "file" | get name | shuffle | first)

swww img -t $effect --transition-duration 2 $image
