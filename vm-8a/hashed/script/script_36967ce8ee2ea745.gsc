#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;

#namespace namespace_495d1b5a786a2174;

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7
// Size: 0x13
function main() {
    function_c0b3ddc9a6bdcc46("veh9_jltv_mg", &function_ae4e7f00c8115b31);
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c2
// Size: 0x65
function private function_ae4e7f00c8115b31() {
    if (!function_9697379150687859("veh9_jltv_mg")) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &function_8801494dff845e4f;
    callbacks["enterEnd"] = &function_bb30116f3fd6e9e0;
    callbacks["exitEnd"] = &function_fdc839bb6fc50c34;
    callbacks["reenter"] = &function_6ed911ad6f6df408;
    function_8497e7e46b5e397("veh9_jltv_mg", callbacks);
    function_9752aacd99a363ca();
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22f
// Size: 0x6f
function private function_9752aacd99a363ca() {
    var_e2818ad39a3341b4 = vehomn_getleveldataforvehicle("veh9_jltv_mg", 1);
    var_e2818ad39a3341b4.rotationids[0] = 0;
    var_e2818ad39a3341b4.rotationids[1] = 1;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["driver"][function_f921e95b80e8afae()] = 0;
    var_e2818ad39a3341b4.rotationrefsbyseatandweapon["gunner"][function_f921e95b80e8afae()] = 1;
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a6
// Size: 0x3a
function private function_f921e95b80e8afae() {
    mapname = getdvar(@"hash_687fb8f9b7a23245");
    if (iscp() && mapname == "cp_lone") {
        return "iw9_mg_jltv_cp";
    }
    return "iw9_mg_jltv_mp";
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e9
// Size: 0x53
function private function_8801494dff845e4f(spawndata, faildata) {
    vehicle = function_bba34cf920370ff4("veh9_jltv_mg", spawndata, faildata);
    turret = function_b6f99331f7cc8aae(vehicle, spawndata);
    vehicle_registerturret(vehicle, turret, makeweapon(function_f921e95b80e8afae()));
    return vehicle;
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x345
// Size: 0x87
function private function_bb30116f3fd6e9e0(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (istrue(data.success)) {
        thread function_3ad4a8a755341361(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
        return;
    }
    if (!istrue(data.playerdisconnect) && !istrue(data.playerdeath)) {
        if (seatid == "gunner") {
            thread vehicle_occupancy_taketurret(player, vehicle, function_f921e95b80e8afae(), data, 1);
        }
    }
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d4
// Size: 0x81
function private function_3ad4a8a755341361(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    if (seatid == "gunner") {
        level thread vehicle_occupancy_disablefirefortime(player, ter_op(istrue(vehicle.var_ecc491f42aaceaf4), 850, 2200));
        player thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_giveturret(player, vehicle, function_f921e95b80e8afae());
        vehicle.var_ecc491f42aaceaf4 = 1;
    }
    vehomn_updateomnvarsonseatenter(vehicle, var_fc7c7a874b43a31a, seatid, player);
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x45d
// Size: 0x46
function private function_fdc839bb6fc50c34(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (istrue(data.success)) {
        function_a3417b548967a91d(vehicle, seatid, var_7558f98f3236963d, player, data);
    }
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x12d
function private function_a3417b548967a91d(vehicle, seatid, var_7558f98f3236963d, player, data) {
    if (seatid == "gunner") {
        turret = vehicle_getturretbyweapon(vehicle, function_f921e95b80e8afae());
        if (!istrue(data.playerdisconnect)) {
            player enableturretdismount();
            player controlturretoff(turret);
            thread vehicle_occupancy_cleardisablefirefortime(player, data.playerdeath);
            if (!istrue(data.playerdeath)) {
                thread vehicle_occupancy_taketurret(player, vehicle, function_f921e95b80e8afae(), data, 1);
            }
        }
        turret.owner = undefined;
        turret setotherent(undefined);
        turret setentityowner(undefined);
        turret setsentryowner(undefined);
    }
    if (!istrue(data.playerdisconnect)) {
        success = vehicle_occupancy_moveplayertoexit(vehicle, seatid, var_7558f98f3236963d, player, data);
        if (!success) {
            if (issharedfuncdefined("vehicle_occupancy", "handleSuicideFromVehicles")) {
                [[ getsharedfunc("vehicle_occupancy", "handleSuicideFromVehicles") ]](player);
            } else {
                player suicide();
            }
        }
    }
    vehomn_updateomnvarsonseatexit(vehicle, seatid, var_7558f98f3236963d, player);
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e0
// Size: 0x4e
function private function_6ed911ad6f6df408(vehicle, var_9de41f2ee77c33ba, var_3f68c37bafd38606, player, data) {
    if (isdefined(var_3f68c37bafd38606) && var_3f68c37bafd38606 == "gunner") {
        thread vehicle_occupancy_taketurret(player, vehicle, function_f921e95b80e8afae(), data, 1);
    }
}

// Namespace namespace_495d1b5a786a2174 / namespace_65ad5249b19d5d41
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x636
// Size: 0xbe
function private function_b6f99331f7cc8aae(vehicle, spawndata) {
    turret = spawnturret("misc_turret", vehicle gettagorigin("tag_turret"), function_f921e95b80e8afae(), 0);
    turret linkto(vehicle, "tag_turret", (0, 0, 0), (0, 0, 0));
    turret setmodel("veh9_mil_lnd_jltv_turret_gun");
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret makeunusable();
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    return turret;
}
