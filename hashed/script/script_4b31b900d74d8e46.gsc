// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace namespace_bac291bbcfb102fc;

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0xa4
function function_5688f09df31647c() {
    level notify("testbotvehicles_monitor_singleton");
    level endon("testbotvehicles_monitor_singleton");
    setdvarifuninitialized(@"hash_22242920a0122649", 0);
    setdvarifuninitialized(@"hash_c2abbfaf6092dd2e", 0);
    while (1) {
        wait(1);
        var_af7e6cf77c6eb49c = getdvarint(@"hash_22242920a0122649", 0);
        if (var_af7e6cf77c6eb49c > 0) {
            function_b552a0e1fd9d5fab(var_af7e6cf77c6eb49c, 100);
            setdvar(@"hash_22242920a0122649", 0);
        }
        var_2243d74333538fbb = getdvarint(@"hash_c2abbfaf6092dd2e", 0);
        if (var_2243d74333538fbb > 0) {
            function_b552a0e1fd9d5fab(var_2243d74333538fbb, 5);
        }
    }
}

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0xde
function private function_4580d561379dbeed() {
    var_8c33e181f5ddae3c = [];
    if (isdefined(level.vehicle)) {
        foreach (vehicles in level.vehicle.instances) {
            foreach (vehicle in vehicles) {
                if (isdefined(vehicle) && istrue(vehicle_interact_vehiclecanbeused(vehicle)) && !isdefined(vehicle_occupancy_getdriver(vehicle))) {
                    var_8c33e181f5ddae3c[var_8c33e181f5ddae3c.size] = vehicle;
                }
            }
        }
    }
    return var_8c33e181f5ddae3c;
}

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d5
// Size: 0xc9
function private function_b552a0e1fd9d5fab(var_9b3d64d7164bb5bc, var_afb49cc35a7dbe58) {
    if (!isdefined(level.players)) {
        return;
    }
    var_b5ed09d48080e3df = [];
    foreach (player in level.players) {
        if (!isbot(player) && isalive(player)) {
            var_b5ed09d48080e3df[var_b5ed09d48080e3df.size] = player;
        }
    }
    if (var_b5ed09d48080e3df.size == 0) {
        return;
    }
    selectedplayer = var_b5ed09d48080e3df[randomint(var_b5ed09d48080e3df.size)];
    function_bc551c20e35ce094(selectedplayer.origin, 800, var_9b3d64d7164bb5bc, var_afb49cc35a7dbe58);
}

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0xb7
function private function_bc551c20e35ce094(position, radius, var_9b3d64d7164bb5bc, var_afb49cc35a7dbe58) {
    var_aec07bbc0287654b = function_4580d561379dbeed();
    if (!isdefined(var_aec07bbc0287654b) || var_aec07bbc0287654b.size == 0) {
        return;
    }
    var_aec07bbc0287654b = array_randomize(var_aec07bbc0287654b);
    if (!isdefined(var_9b3d64d7164bb5bc) || var_9b3d64d7164bb5bc > var_aec07bbc0287654b.size) {
        var_9b3d64d7164bb5bc = var_aec07bbc0287654b.size;
    }
    var_4096fdeec6de7c61 = getrandomnavpoints(position, radius, var_9b3d64d7164bb5bc);
    if (!isdefined(var_4096fdeec6de7c61) || var_4096fdeec6de7c61.size <= 0) {
        var_4096fdeec6de7c61 = [0:position];
    }
    for (vehicleindex = 0; vehicleindex < var_9b3d64d7164bb5bc; vehicleindex++) {
        var_aec07bbc0287654b[vehicleindex] thread testbotvehicles_movetoposition(var_4096fdeec6de7c61[randomint(var_4096fdeec6de7c61.size)], var_afb49cc35a7dbe58);
    }
}

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x563
// Size: 0x14a
function private testbotvehicles_movetoposition(position, var_afb49cc35a7dbe58, debugdraw) {
    self notify("testbotvehicles_movetoposition");
    self endon("testbotvehicles_movetoposition");
    self endon("death_or_disconnect");
    self endon("near_goal");
    function_7f0c1e61a13ca16e(self);
    for (var_4a492273c7f70ccc = 0; var_4a492273c7f70ccc < var_afb49cc35a7dbe58; var_4a492273c7f70ccc++) {
        var_34bb55fbc59c2e1d = isnavmeshloaded("vehicle_large");
        var_a8c9b5fffa6387d = isnavmeshloaded("zombie_large");
        var_eefdc14dd5275fd0 = ter_op(var_34bb55fbc59c2e1d, "vehicle_large", ter_op(var_a8c9b5fffa6387d, "zombie_large", undefined));
        var_7db6235a7408e42f = self function_187aaba5fbba21d0(self.origin, position, 150, 250, 100, anglestoforward(self.angles), (0, 0, 0), 300, 0.8, 0, 1, undefined, 0, 1);
        if (isdefined(var_7db6235a7408e42f) && istrue(debugdraw)) {
            /#
                thread namespace_3bb9da687f15383d::function_68d5232181fec390(var_7db6235a7408e42f, ter_op(isdefined(var_eefdc14dd5275fd0), (1, 1, 1), (1, 0, 0)));
                thread namespace_3bb9da687f15383d::function_2a708e9755fc798b(var_eefdc14dd5275fd0, 500);
            #/
        }
        waittill_any_2("navspline_interrupted", "path_blocked");
    }
}

// Namespace namespace_bac291bbcfb102fc/namespace_42d2620e5c90a424
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b4
// Size: 0x1c3
function private function_7f0c1e61a13ca16e(vehicle) {
    if (!vehicle function_1e8542a707a8002("p2p")) {
        vehicle function_d2e41c7603ba7697("p2p");
    }
    if (!vehicle function_1e8542a707a8002("path")) {
        vehicle function_d2e41c7603ba7697("path");
    }
    if (!vehicle function_1e8542a707a8002("animator")) {
        vehicle function_d2e41c7603ba7697("animator");
    }
    vehicle function_77320e794d35465a("p2p", "checkStuck", 0);
    vehicle function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    vehicle function_77320e794d35465a("p2p", "automaticNormal", 1);
    vehicle function_77320e794d35465a("p2p", "brakeOnGoalGasbrake", 1);
    vehicle function_77320e794d35465a("p2p", "goalPoint", vehicle.origin);
    vehicle function_77320e794d35465a("p2p", "goalThreshold", 200);
    vehicle function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
    vehicle function_77320e794d35465a("p2p", "throttleSpeedThreshold", 1);
    vehicle function_77320e794d35465a("p2p", "automaticFastTopspeedFraction", 1);
    vehicle function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 1);
    vehicle function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 4);
    vehicle function_77320e794d35465a("p2p", "throttleSpeedClose", 2);
    vehicle function_77320e794d35465a("p2p", "gasToStopMovement", 0.9);
    vehicle function_77320e794d35465a("p2p", "steeringMultiplier", 2);
    vehicle function_77320e794d35465a("path", "radiusToStep", 300);
    vehicle.stopping = 0;
    vehicle namespace_b479ac682b93cd92::vehicle_disable_navobstacles();
    var_bfe90410fad38aaa = mph_to_ips(vehicle vehicle_gettopspeedforward(1));
    vehicle function_77320e794d35465a("p2p", "manualSpeed", var_bfe90410fad38aaa);
}

