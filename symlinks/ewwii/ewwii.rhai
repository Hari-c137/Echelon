fn bar(time) {
  return box(#{ orientation: "h" }, [
    workspaces(), 
    sidestuff(time),
  ]);
}

fn sidestuff(time) {
  return box(#{ class: "sidestuff", orientation: "h", space_evenly: false, halign: "end"}, [
    label(#{ text: time })
  ]);
}

fn workspaces() {
  let buttons = [];

  // looping and creating buttons
  for n in 0..9 {
    buttons.push(
        button(#{ 
            onclick: "niri msg action focus-workspace " + (n + 1), 
            label: (n + 1).to_string() 
        })
    );
  }

  return box(#{
    class: "workspaces",
    orientation: "h",
    space_evenly: true,
    halign: "start",
    spacing: 10,
  }, buttons);
}

enter([
  poll("time", #{ 
      interval: "10s", 
      cmd: "date '+%H:%M %b %d, %Y'",
      initial: "" 
  }),

  defwindow("bar", #{
      monitor: 0,
      windowtype: "dock",
      exclusive: true,
      geometry: #{
          x: "0%",
          y: "0%",
          width: "100%",
          height: "10px",
          anchor: "top center",
      },
      reserve: #{ side: "top", distance: "4%" }
  }, bar(time)),
]);
