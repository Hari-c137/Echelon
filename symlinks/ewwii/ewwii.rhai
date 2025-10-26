import "api::linux" as linux;
import "std::command" as cmd;

fn bar(hour,min) {
  return box(#{ orientation: "v" }, [
    workspaces(), 
    time(hour, min),
    system(),
  ]);
}

fn workspaces() {
  let buttons = [];
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


fn time(hour, min) {
  return box(#{ class: "time", orientation: "v", space_evenly: false}, [
    label(#{ text: hour }),
    label(#{ text: "- -" }),
    label(#{ text: min }),
  ]);
}

fn system() {
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
          x: "8",
          y: "0",
          width: "1",
          height: "98%",
          anchor: "center left",
      },
      exclusive: true,
  }, bar(hour, min)),
]);
