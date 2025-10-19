fn bar(hour,min) {
  return box(#{ orientation: "v" }, [
    workspaces(), 
    time(hour, min),
  ]);
}

fn system() {
}

fn time(hour, min) {
  return box(#{ class: "time", orientation: "v", space_evenly: false}, [
    label(#{ text: hour }),
    label(#{ text: "- -" }),
    label(#{ text: min }),
  ]);
}

fn workspaces() {
  let buttons = [];

  // looping and creating buttons
  for n in 0..5 {
    buttons.push(
        button(#{ 
            onclick: "niri msg action focus-workspace " + (n + 1), 
            label: (n + 1).to_string() 
        })
    );
  }

  return box(#{
    class: "workspaces",
    orientation: "v",
    space_evenly: false,
    halign: "center",
    spacing: 37,
  }, buttons);
}

enter([
  poll("hour", #{ 
      interval: "55m", 
      cmd: "date '+%H'",
      initial: "" 
  }),
  poll("min", #{ 
      interval: "55s", 
      cmd: "date '+%M'",
      initial: "" 
  }),

  defwindow("bar", #{
      monitor: 0,
      windowtype: "dock",
      stacking: "fg",
      geometry: #{
          x: "5",
          y: "0",
          width: "3%",
          height: "98%",
          anchor: "center left",
      },
      exclusive: true,
      reserve: #{ side: "top", distance: "4%" }
  }, bar(hour, min)),
]);
