// mwiii decomp prototype
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
#using scripts\cp_mp\vehicles\customization\battle_tracks.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace namespace_a53e1309bce2ad2c;

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f0
// Size: 0x14
function main() {
    function_c0b3ddc9a6bdcc46("veh9_patrol_boat", &function_29e4f7f70ca401cd);
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0xa8
function private function_29e4f7f70ca401cd() {
    if (!function_9697379150687859("veh9_patrol_boat") && getstructarray("rallyPointArmoredBoat", "targetname").size == 0) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &function_a9f9f7c43bc42523;
    callbacks["delete"] = &function_ca15fc21efe0fe30;
    callbacks["enterEnd"] = &function_856261b9790625f4;
    callbacks["exitEnd"] = &function_2815d461ca70ad30;
    callbacks["exitExternalTurret"] = &function_9f3f1229cc69710e;
    if (vehicle_spawn_gamemodesupportsabandonedtimeout(0)) {
        callbacks["onStartRiding"] = &function_7c412bafa5521937;
        callbacks["onEndRiding"] = &function_c3aa4b60c1e04c3a;
    }
    function_8497e7e46b5e397("veh9_patrol_boat", callbacks);
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0xe6
function private function_a9f9f7c43bc42523(spawndata, var_ee8da5624236dc89) {
    vehicle = function_bba34cf920370ff4("veh9_patrol_boat", spawndata, var_ee8da5624236dc89);
    var_42691f43db8e6783 = function_79be42ca62b707df();
    frontturret = function_48f6de7ccb60b042(vehicle, "iw9_mg_patrol_boat_front_mp", "veh9_mil_sea_armored_patrol_boat_turret", var_42691f43db8e6783.tag, var_42691f43db8e6783.tagoffset, var_42691f43db8e6783.var_7862c7c7ade2b42e);
    vehicle_registerturret(vehicle, frontturret, makeweapon("iw9_mg_patrol_boat_front_mp"));
    var_42691f43db8e6783 = function_2d2c1e3cc60d4363();
    var_536a5c2e42582b98 = function_48f6de7ccb60b042(vehicle, "iw9_mg_patrol_boat_back_mp", "veh9_mil_sea_armored_patrol_boat_turret", var_42691f43db8e6783.tag, var_42691f43db8e6783.tagoffset, var_42691f43db8e6783.var_7862c7c7ade2b42e);
    vehicle_registerturret(vehicle, var_536a5c2e42582b98, makeweapon("iw9_mg_patrol_boat_back_mp"));
    return vehicle;
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0x57
function private function_79be42ca62b707df() {
    var_42691f43db8e6783 = spawnstruct();
    var_42691f43db8e6783.tag = "tag_turret_front";
    var_42691f43db8e6783.tagoffset = (0, 0, 0);
    var_42691f43db8e6783.var_7862c7c7ade2b42e = (138, 0, 16.5);
    return var_42691f43db8e6783;
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x507
// Size: 0x57
function private function_2d2c1e3cc60d4363() {
    var_42691f43db8e6783 = spawnstruct();
    var_42691f43db8e6783.tag = "tag_turret_back";
    var_42691f43db8e6783.tagoffset = (0, 0, 0);
    var_42691f43db8e6783.var_7862c7c7ade2b42e = (-100, 0, 6.9);
    return var_42691f43db8e6783;
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x566
// Size: 0x186
function private function_48f6de7ccb60b042(vehicle, turret_weapon, var_76ba9e808a42f81, var_7fd2fb13f979337c, var_f7c8fc384585fa86, var_721f077d971e21d5) {
    turret = spawnturret("misc_turret", vehicle gettagorigin(var_7fd2fb13f979337c), turret_weapon, 0);
    turret linkto(vehicle, var_7fd2fb13f979337c, var_f7c8fc384585fa86, (0, 0, 0));
    turret setmodel(var_76ba9e808a42f81);
    turret makeunusable();
    turret setmode("sentry_offline");
    turret setdefaultdroppitch(30);
    turret setturretmodechangewait(1);
    var_963953c3478bf4fe = turret gettagorigin("j_trigger");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("vehicle", "createHint")) {
        turret.useobject = [[ namespace_3c37cb17ade254d::getsharedfunc("vehicle", "createHint") ]](var_963953c3478bf4fe, "HINT_BUTTON", undefined, "VEHICLES_HINTS/USE_TURRET", -1, "duration_none", "show", 75, undefined, 75);
    }
    turret.useobject linkto(turret, "j_trigger");
    turret thread function_c9de15b664d15414(turret.useobject, vehicle, turret_weapon, var_7fd2fb13f979337c);
    turret.angles = vehicle.angles;
    turret.vehicle = vehicle;
    turret.maxhealth = 400;
    turret.health = turret.maxhealth;
    turret.exit = var_721f077d971e21d5;
    return turret;
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f4
// Size: 0x213
function private function_c9de15b664d15414(var_ef5d5141fdb51174, vehicle, turretweapon, var_7fd2fb13f979337c) {
    self endon("kill_turret");
    level endon("game_ended");
    foreach (player in level.players) {
        var_ef5d5141fdb51174 enableplayeruse(player);
    }
    thread function_e1aafdf0a17a411(var_ef5d5141fdb51174);
    while (1) {
        player = var_ef5d5141fdb51174 waittill("trigger");
        if (istrue(self.inuse)) {
            continue;
        }
        if (player isonladder() || !player isonground() || player ismantling() || istrue(player.isjuggernaut)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("VEHICLES/CANNOT_ENTER_TURRET");
            }
            continue;
        }
        self.inuse = 1;
        var_ef5d5141fdb51174 function_dfb78b3e724ad620(0);
        vehicle vehicle_spawn_stopwatchingabandoned();
        namespace_1fbd40990ee60ede::vehicle_occupancy_hidecashbag(vehicle, undefined, player);
        player function_5847240c0f9900f2(0);
        weapon = undefined;
        if (turretweapon == "iw9_mg_patrol_boat_front_mp") {
            weapon = "iw9_mg_patrol_boat_front_mp";
        } else {
            weapon = "iw9_mg_patrol_boat_back_mp";
        }
        namespace_1fbd40990ee60ede::vehicle_occupancy_deleteseatcorpse(vehicle, var_7fd2fb13f979337c, 1);
        function_160ef1c877c69ab1(player, vehicle, self, var_7fd2fb13f979337c);
        namespace_84cff6185e39aa66::function_d2d9c09551d91164(vehicle, player);
        turret = vehicle_getturretbyweapon(vehicle, weapon);
        level thread vehicle_occupancy_disablefirefortime(player, ter_op(istrue(turret.var_ecc491f42aaceaf4), 850, 2200));
        turret.var_ecc491f42aaceaf4 = 1;
        thread namespace_1fbd40990ee60ede::vehicle_occupancy_giveturret(player, vehicle, weapon);
        namespace_6c0d09f1e6fc2bc5::battle_tracks_onentervehicle(vehicle, player);
        turret thread function_3f2282eb0126c0c0(player);
        turret thread function_7b4c271e2969f029(player, vehicle);
        turret thread function_919347c984dc1ced(player, vehicle);
        turret thread function_9d875e9cd4a8b235(player, vehicle);
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90e
// Size: 0x42
function private function_e1aafdf0a17a411(useobj) {
    if (isdefined(self)) {
        self endon("kill_turret");
    }
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        useobj enableplayeruse(player);
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x957
// Size: 0x8e
function private function_7b4c271e2969f029(player, vehicle) {
    self endon("kill_turret");
    player endon("end_turret_use");
    player endon("disconnect");
    level endon("game_ended");
    var_71982e9b7e15c211 = 10000;
    if (isdefined(self.moving_platform)) {
        var_71982e9b7e15c211 = 10000;
    }
    while (1) {
        if (player isinexecutionvictim() || distancesquared(self.origin, player.origin) >= var_71982e9b7e15c211) {
            thread function_9f3f1229cc69710e(player, vehicle);
            break;
        }
        waitframe();
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x5c
function private function_919347c984dc1ced(player, vehicle) {
    self endon("kill_turret");
    player endon("end_turret_use");
    player endon("disconnect");
    level endon("game_ended");
    while (player usebuttonpressed()) {
        waitframe();
    }
    while (1) {
        if (player usebuttonpressed()) {
            thread function_9f3f1229cc69710e(player, vehicle);
            break;
        }
        waitframe();
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4f
// Size: 0x45
function private function_9d875e9cd4a8b235(player, vehicle) {
    self endon("kill_turret");
    player endon("end_turret_use");
    level endon("game_ended");
    player waittill_any_2("death_or_disconnect", "last_stand_start");
    thread function_9f3f1229cc69710e(player, vehicle);
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa9b
// Size: 0x40
function private function_3f2282eb0126c0c0(player) {
    self endon("kill_turret");
    player endon("end_turret_use");
    player endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self.lastuserangles = player getplayerangles();
        waitframe();
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae2
// Size: 0x130
function private function_9f3f1229cc69710e(player, vehicle) {
    self.inuse = 0;
    if (isdefined(player)) {
        player notify("end_turret_use");
        namespace_1fbd40990ee60ede::vehicle_occupancy_showcashbag(vehicle, undefined, player);
        player function_5847240c0f9900f2(1);
    }
    namespace_6c0d09f1e6fc2bc5::battle_tracks_onexitvehicle(vehicle, player);
    function_4d2324450a951b2b(player, vehicle);
    vehicle thread vehicle_spawn_watchabandoned();
    self.useobject function_dfb78b3e724ad620(1);
    if (isdefined(player)) {
        player enableturretdismount();
        player controlturretoff(self);
        thread vehicle_occupancy_taketurret(player, vehicle, self.objweapon.basename, spawnstruct(), 0);
        namespace_84cff6185e39aa66::function_5211953231a09ed5(vehicle, player);
    }
    self.owner = undefined;
    self setotherent(undefined);
    self setentityowner(undefined);
    if (isdefined(player) && player _isalive()) {
        player function_a055801da45d769(rotatevector(self.exit + (randomfloatrange(-15, 20), randomfloatrange(-15, 20), 0), vehicle.angles) + vehicle.origin, vehicle);
        player setplayerangles(self.lastuserangles);
        thread vehicle_preventplayercollisiondamagefortimeafterexit(vehicle, player);
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc19
// Size: 0xa5
function private function_c1a88f4ca33e1836() {
    foreach (turret in vehicle_getturrets(self)) {
        turret notify("kill_turret");
        if (isdefined(turret.owner)) {
            turret thread function_9f3f1229cc69710e(turret.owner, self);
        }
        vehicle_deregisterturret(self, turret.objweapon);
        turret.useobject delete();
        turret delete();
    }
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc5
// Size: 0x13
function private function_ca15fc21efe0fe30(vehicle) {
    function_c1a88f4ca33e1836();
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x13
function private function_7c412bafa5521937(player) {
    vehicle_spawn_stopwatchingabandoned();
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf9
// Size: 0x14
function private function_c3aa4b60c1e04c3a(player) {
    thread vehicle_spawn_watchabandoned();
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd14
// Size: 0x198
function private function_856261b9790625f4(vehicle, seatid, var_fc7c7a874b43a31a, player, data) {
    namespace_1fbd40990ee60ede::function_43c2c433b8b9b12d(vehicle, seatid, var_fc7c7a874b43a31a, player, data);
    if (!istrue(data.success) || istrue(data.playerdisconnect) || !isdefined(player) || !istrue(vehicle.israllypointvehicle)) {
        return;
    }
    foreach (plr in level.players) {
        if (istrue(vehicle.revealed) || is_equal(plr.team, vehicle.team)) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, plr);
        }
    }
    foreach (occupant in vehicle.occupants) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(vehicle.marker.objidnum, occupant);
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(vehicle.marker.objidnum, player);
}

// Namespace namespace_a53e1309bce2ad2c/namespace_29f407445e2b0d95
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb3
// Size: 0x8c
function private function_2815d461ca70ad30(vehicle, seatid, var_7558f98f3236963d, player, data) {
    function_857bf4201a249a99(vehicle, seatid, var_7558f98f3236963d, player, data);
    if (!istrue(data.success) || istrue(data.playerdisconnect) || !isdefined(player) || !istrue(vehicle.israllypointvehicle)) {
        return;
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
}
