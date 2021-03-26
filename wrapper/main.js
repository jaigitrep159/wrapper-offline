// Core part of Wrapper: Offline
const RPC = require("discord-rpc");
require("./server");

// Discord rich presence
const rpc = new RPC.Client({
	transport: "ipc"
});
let bld = "68";
rpc.on("ready", () => {
	rpc.setActivity({
		// state: "Video List",
		// disabled until automatic rpc status is done
		details: "Version 1.2.3, build " + bld,
		startTimestamp: new Date(),
		largeImageKey: "icon",
		largeImageText: "Wrapper Offline 1.2.3, build " + bld,
		smallImageKey: "Wrapper Offline 1.2.3",
		smallImagetext: "Wrapper Offline 1.2.3",
	});
	console.log("Rich presence is on!")
});
rpc.login({
	clientId: "791123556984422411"
});

