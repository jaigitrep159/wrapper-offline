// wrapper offline rich presence and a core part of wrapper offline
const RPC = require("discord-rpc");
require("./server");

// discord rpc
const rpc = new RPC.Client({
    transport: "ipc"
  });
  
   rpc.on("ready", () => {
    rpc.setActivity({
      details: "Version 1.2.3 (Build 56)",
      startTimestamp: new Date(),
      largeImageKey: "icon",
      largeImageText: "Wrapper Offline 1.2.3 (Build 56)",
      smallImageKey: "Wrapper Offline 1.2.3 (Build 56)",
      smallImagetext: "Wrapper Offline 1.2.3 (Build 56)",
    });
  
  
    console.log("Rich presence is on!")
  });
  rpc.login({
    clientId: "791123556984422411"
  });

