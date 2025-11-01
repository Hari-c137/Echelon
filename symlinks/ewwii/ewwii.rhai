import "api::linux" as linux;
import "std::command" as cmd;

// pass cpufreq, mem
let k = linux::get_gpu_info();
let kk = k[0].memory_kb;

fn bar(hour,min, memused, cpufreq, kk) {
  return box(#{ orientation: "v" }, [
    workspaces(), 
    mid(hour, min),
    btm(memused, cpufreq, kk),
  ]);
}

fn btm(memused, cpufreq, kk) {

    return box(#{ 
    class: "btm",
    orientation: "v",
    space_evenly: false,
    valign: "end",
    spacing: 10,
    }, [    
    label(#{ text: memused }),
    label(#{ text: cpufreq }),
 //   label(#{ text: kk.to_string() }),
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


fn mid(hour, min) {
  return box(#{ class: "mid",
                orientation: "v",
                valign: "center",
                space_evenly: false}, [
    label(#{ text: hour }),
    label(#{ text: "- -" }),
    label(#{ text: min }),
  ]);
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
  poll("memused", #{ 
      interval: "30s", 
      cmd: "free -h --mega | awk '/Mem:/ {print $3}'",
      initial: "" 
  }),
  poll("cpufreq", #{ 
      interval: "10s", 
      cmd: "free -h --mega | awk '/Mem:/ {print $3}'",
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
  }, bar(hour, min, memused, cpufreq, kk)),
]);


// todo() {
//  
//  niri-workspace() [x]
//  time [x]
//  ram[]
//  cpu[]
//  wifi[]
// }
