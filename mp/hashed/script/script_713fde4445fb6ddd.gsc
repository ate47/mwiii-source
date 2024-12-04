#using script_58f20490049af6ac;
#using script_64acb6ce534155b7;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_lootcache;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_quest_util;
#using scripts\mp\outofbounds;
#using scripts\mp\utility\points;
#using scripts\mp\utility\teams;
#using scripts\mp\vehicles\damage;
#using scripts\mp\weapons;

#namespace namespace_334ec991babd91b6;

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x5f9
// Size: 0x18
function autoexec main() {
    scripts\engine\utility::registersharedfunc("spy_drones", "get_contract_data", &get_contract_data);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x619
// Size: 0x637
function get_contract_data(data) {
    data.funcs["onInit"] = &on_init;
    data.funcs["onTeamAssigned"] = &function_af6a5c04fc885a4d;
    data.funcs["onTimerExpired"] = &function_5863139a72088b70;
    data.funcs["onCancel"] = &on_cancel;
    data.funcs["onPlayerDisconnect"] = &on_player_disconnect;
    data.funcs["onPlayerKilled"] = &on_player_killed;
    data.funcs["onMarkPlayerAsEliminated"] = &function_6dc61b7571555571;
    data.funcs["circleTick"] = &function_a78f24ba9aac3cd5;
    data.funcs["onFinishContract"] = &function_ee646c1d9d674584;
    level.var_dc53645ad882c8f2 = spawnstruct();
    level.var_dc53645ad882c8f2.vehiclename = "spy_drone";
    level.var_dc53645ad882c8f2.contracttime = getdvarint(@"hash_97a0696c063a004c", 0);
    level.var_dc53645ad882c8f2.var_6bf3038b9d262642 = getdvarint(@"hash_c73da0a654de8430", 6500);
    level.var_dc53645ad882c8f2.var_427f06854232670f = getdvarint(@"hash_e359f8d9f40f5fb7", 16000);
    level.var_dc53645ad882c8f2.var_370ad2e4039d00b9 = getdvarint(@"hash_af022b1ef968cc83", 450);
    level.var_dc53645ad882c8f2.droptime = getdvarint(@"hash_1ed93fcd383baa41", 10);
    level.var_dc53645ad882c8f2.var_9464da243b27fc = getdvarint(@"hash_223b6de7453982e3", 30);
    level.var_dc53645ad882c8f2.var_7e11f30ecaba3c2c = getdvarint(@"hash_c1f4605f4d534d4a", 12);
    level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e = getdvarint(@"hash_2cc7dbc9d32728d", 7);
    level.var_dc53645ad882c8f2.var_3d741ef8d5214272 = getdvarint(@"hash_afd77622d1b63c7b", 300);
    level.var_dc53645ad882c8f2.var_9724cd8c777a6103 = getdvarint(@"hash_7ca35f006d8580b3", 1500);
    level.var_dc53645ad882c8f2.speed = getdvarfloat(@"hash_d182cb7ada456cc", 45);
    level.var_dc53645ad882c8f2.var_5416ef1fdf377938 = getdvarfloat(@"hash_cd1616eed5dd4409", 30);
    level.var_dc53645ad882c8f2.accel = getdvarfloat(@"hash_d692997169c00a97", 25);
    level.var_dc53645ad882c8f2.var_5b48dcda7b72fc1b = getdvarfloat(@"hash_48d3c6a2e7403cea", 15);
    level.var_dc53645ad882c8f2.inactivetime = getdvarfloat(@"hash_577bbbed4c20a3a8", 120);
    level.var_dc53645ad882c8f2.var_eb3c475f74f5d11b = getdvarint(@"hash_88cf6935eb16f1b3", 1);
    level.var_dc53645ad882c8f2.hoverradius = getdvarint(@"hash_85c6dce18c60610", 45);
    level.var_dc53645ad882c8f2.var_4e9df5e4d1c7d66f = getdvarint(@"hash_517aee82eddb5494", 1);
    level.var_dc53645ad882c8f2.var_37143a4776fd671a = getdvarint(@"hash_e271d94d2c80cc71", 5);
    level.var_dc53645ad882c8f2.var_f0b6500ab0c9ccd4 = getdvarint(@"hash_2972f454837e984d", 750);
    level.var_dc53645ad882c8f2.var_6b07b5001bfb6bdd = getdvarint(@"hash_a9135dada6cbfc45", 1);
    level.var_dc53645ad882c8f2.var_c90aee48e8bbef34 = getdvarint(@"hash_bab89af7e7ed3335", 1);
    level.var_dc53645ad882c8f2.var_7c1beb33b75dcd22 = getdvarint(@"hash_e562667a19968b4a", 1);
    level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 = getdvarint(@"hash_a1dae6220b47dfba", 240);
    level.var_dc53645ad882c8f2.var_b4c111452c8a17c7 = getdvarint(@"hash_6421db0b97efb51d", 0);
    level.var_dc53645ad882c8f2.var_2acf733fef4b661d = getdvarfloat(@"hash_b6fdcff9878ebb74", 5);
    level.var_dc53645ad882c8f2.var_656b373748c79d2b = getdvarfloat(@"hash_77bd3b2d0835a1a", 8);
    level.var_dc53645ad882c8f2.var_eaee16945de09051 = getdvarint(@"hash_efc819376ad05131", 10);
    level.var_dc53645ad882c8f2.var_5941676f3b051afb = getdvarint(@"hash_9d71c588ce0a129f", 2);
    level.var_dc53645ad882c8f2.var_79deb552a64787b8 = getdvarint(@"hash_3e423a1e80e07bd7", 3);
    level.var_dc53645ad882c8f2.var_6a998167254575bc = getdvarfloat(@"hash_1ded6da45aaa9b60", 5);
    level.var_dc53645ad882c8f2.var_d2121d8d1550f4cc = [#"hash_336289015889ab4f", #"hash_da1a4a4971ee6567", #"hash_da1a494971ee63b4", #"hash_105b9440e7c3705e"];
    level.var_dc53645ad882c8f2.var_3ee437c870237781 = getdvarfloat(@"hash_a3411010080554fa", 0.25);
    if (level.var_dc53645ad882c8f2.contracttime > 0) {
        data.basetime = level.var_dc53645ad882c8f2.contracttime;
    } else {
        data.basetime = namespace_1eb3c4e0e28fac71::function_ea591c2a379e3424("spy_drones");
    }
    function_ed24376a19a1b0fe();
    /#
        level thread debug_init();
    #/
    return true;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc59
// Size: 0x4
function on_init() {
    return true;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc66
// Size: 0x87
function function_ed24376a19a1b0fe() {
    game["dialog"]["spyd_grav_msns"] = "spyd_grav_msns";
    game["dialog"]["spyd_grav_enac"] = "spyd_grav_enac";
    game["dialog"]["spyd_grav_enco"] = "spyd_grav_enco";
    game["dialog"]["spyd_grav_remi"] = "spyd_grav_remi";
    game["dialog"]["spyd_grav_msnc"] = "spyd_grav_msnc";
    game["dialog"]["spyd_grav_retr"] = "spyd_grav_retr";
    game["dialog"]["spyd_grav_mifa"] = "spyd_grav_mifa";
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5
// Size: 0xb
function function_a3e7d456c9513ece() {
    return #"hash_a468b6bbf3ba3b66";
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd09
// Size: 0x3d3
function function_af6a5c04fc885a4d() {
    self.category = "spy_drones";
    if (!isdefined(self.var_d154ac2657c5f44)) {
        return;
    }
    time = level.var_dc53645ad882c8f2.contracttime > 0 ? level.var_dc53645ad882c8f2.contracttime : namespace_1eb3c4e0e28fac71::function_ea591c2a379e3424(self.category);
    time = function_9b6275085fbcb8f4(time);
    namespace_1eb3c4e0e28fac71::function_5a15174d34f0670c(time, 0);
    radius = randomintrange(2500, 3500);
    angle = randomfloat(360);
    self.var_10c5be9ea8f4c46e = self.var_d154ac2657c5f44 getorigin();
    safecircleradius = scripts\mp\gametypes\br_circle::getsafecircleradius();
    var_add4fd7502a75a8a = scripts\mp\gametypes\br_circle::getsafecircleorigin();
    spawnpoint = function_e969d8de0451b131(angle, radius);
    for (step = 0; step < 360; step += 45) {
        if (!function_e23523569a77acd5(spawnpoint, level.br_level.br_mapcenter, &scripts\mp\outofbounds::ispointinoutofbounds) && !function_e23523569a77acd5(spawnpoint, var_add4fd7502a75a8a, &function_ef4bf1bc5b6710e4)) {
            break;
        }
        angle -= 45;
        spawnpoint = function_e969d8de0451b131(angle, radius);
    }
    if (function_e23523569a77acd5(spawnpoint, var_add4fd7502a75a8a, &function_ef4bf1bc5b6710e4) || function_e23523569a77acd5(spawnpoint, level.br_level.br_mapcenter, &scripts\mp\outofbounds::ispointinoutofbounds)) {
        if (safecircleradius <= level.var_dc53645ad882c8f2.var_9724cd8c777a6103) {
            spawnpoint = scripts\mp\gametypes\br_circle::getrandompointinsafecircle();
        } else {
            var_3d7881fa3b0d3b9e = min(radius + level.var_dc53645ad882c8f2.var_9724cd8c777a6103, safecircleradius);
            var_a322004e57e1b5d1 = function_89a8eac2c864a128(self.var_10c5be9ea8f4c46e, var_add4fd7502a75a8a, safecircleradius, var_3d7881fa3b0d3b9e);
            var_3d7881fa3b0d3b9e -= level.var_dc53645ad882c8f2.var_9724cd8c777a6103;
            assert(var_3d7881fa3b0d3b9e > 0);
            spawnpoint = scripts\common\utility::function_c62375923163b86c(var_a322004e57e1b5d1, var_3d7881fa3b0d3b9e);
        }
    }
    scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("SpyDrones_Br", spawnpoint, level.var_dc53645ad882c8f2.var_9724cd8c777a6103);
    if (getdvarint(@"hash_cf71a0cb04519608", 0) == 1) {
        scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
    } else {
        teamplayers = scripts\mp\utility\teams::getteamdata(self.teams[0], "players");
        foreach (player in teamplayers) {
            scripts\cp_mp\utility\game_utility::function_cfd53c8f6878014f(player);
        }
    }
    splashref = function_4bcd7c36b22b9bec("br_spy_drones_quest_start_team");
    namespace_1eb3c4e0e28fac71::displayteamsplash(self.teams[0], splashref);
    namespace_1eb3c4e0e28fac71::displaysquadmessagetoteam(self.teams[0], self.var_d154ac2657c5f44, 6, namespace_1eb3c4e0e28fac71::getquestindex("spy_drones"));
    self.drones = [];
    spawn_drones();
    self.var_f1ca51112a318561 = level.var_dc53645ad882c8f2.var_eaee16945de09051;
    self.var_9dd4c2b54544f5f3 = level.var_dc53645ad882c8f2.var_79deb552a64787b8;
    self.var_a8b35ed9bf00396c = 0;
    self.var_9b08ab39d372b35d = 1;
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_msns", self.teams[0], 1, 0, undefined, undefined);
    thread function_acad5b6746ae352e();
    namespace_1eb3c4e0e28fac71::function_e2aa45e2c6b5dec1(level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e - self.drones.size);
    thread function_1b8fe45856358d18();
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10e4
// Size: 0x52
function function_e969d8de0451b131(angle, radius) {
    offset = (radius * cos(angle), radius * sin(angle), 0);
    spawnpoint = self.var_10c5be9ea8f4c46e + offset;
    spawnpoint = (spawnpoint[0], spawnpoint[1], 0);
    return spawnpoint;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x113f
// Size: 0x15
function function_ef4bf1bc5b6710e4(spawnpoint) {
    return namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(spawnpoint) < 40;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x115d
// Size: 0x81
function function_e23523569a77acd5(spawnpoint, var_fed685492f4d3233, var_a738d4e998ff1dba) {
    if ([[ var_a738d4e998ff1dba ]](spawnpoint)) {
        return true;
    }
    directionvector = vectornormalize2(spawnpoint - var_fed685492f4d3233);
    offset = (level.var_dc53645ad882c8f2.var_9724cd8c777a6103 * directionvector[0], level.var_dc53645ad882c8f2.var_9724cd8c777a6103 * directionvector[1], 0);
    if ([[ var_a738d4e998ff1dba ]](spawnpoint + offset)) {
        return true;
    }
    return false;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11e7
// Size: 0x61
function function_89a8eac2c864a128(var_fcc155683618f7c9, var_dd92012e24bc0731, safecircleradius, var_3d7881fa3b0d3b9e) {
    directionvector = vectornormalize2(var_fcc155683618f7c9 - var_dd92012e24bc0731);
    var_6e4e364dd66c73e2 = safecircleradius - var_3d7881fa3b0d3b9e;
    assert(var_6e4e364dd66c73e2 > 0);
    var_f5f06d1d20d64a08 = var_dd92012e24bc0731 + directionvector * var_6e4e364dd66c73e2;
    return var_f5f06d1d20d64a08;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1251
// Size: 0x14
function function_ca8b1c15ad409ef7(data) {
    self notify("death", data);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126d
// Size: 0x368
function function_f16989f55836eb5f(drone) {
    level endon("game_ended");
    drone endon("entitydeleted");
    killer = undefined;
    drone waittill("death", data);
    killer = data.attacker;
    self.drones = arrayremove(self.drones, drone);
    namespace_1eb3c4e0e28fac71::function_e2aa45e2c6b5dec1(level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e - self.drones.size);
    scripts\mp\weapons::function_1a33bd42949ccbda(drone);
    drone setscriptablepartstate("scan", "off");
    drone setscriptablepartstate("blink", "off");
    drone setscriptablepartstate("exit", "on");
    var_7087d9795dffce4d = isdefined(killer) && isdefined(killer.team) && isdefined(level.contractmanager.var_b6fae9c9655c73bf[killer.team]) && level.contractmanager.var_b6fae9c9655c73bf[killer.team] == self;
    if (!var_7087d9795dffce4d && !istrue(self.var_a8b35ed9bf00396c) && self.drones.size > 0) {
        self.var_a8b35ed9bf00396c = 1;
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_enac", self.teams[0], 1, 0, undefined, undefined);
    }
    if (var_7087d9795dffce4d) {
        self.var_9b08ab39d372b35d = 0;
    }
    thread award_xp(killer);
    items = [];
    if (self.var_f1ca51112a318561 > 0) {
        var_8b26223da6a3ae38 = int(min(self.var_f1ca51112a318561, randomint(level.var_dc53645ad882c8f2.var_5941676f3b051afb) + 1));
        for (i = 0; i < var_8b26223da6a3ae38; i++) {
            items[items.size] = "brloot_armor_plate";
        }
        self.var_f1ca51112a318561 -= var_8b26223da6a3ae38;
    }
    if (self.var_9dd4c2b54544f5f3 > 0) {
        var_211417dbf8a951b2 = self.drones.size == 0 ? self.var_9dd4c2b54544f5f3 : self.var_9dd4c2b54544f5f3 / self.drones.size;
        if (var_211417dbf8a951b2 < 1) {
            var_211417dbf8a951b2 = randomfloat(1) < var_211417dbf8a951b2 ? 1 : 0;
        } else {
            var_211417dbf8a951b2 = floor(var_211417dbf8a951b2);
        }
        for (i = 0; i < var_211417dbf8a951b2; i++) {
            items[items.size] = "brloot_super_personal_redeploy_drone";
        }
        self.var_9dd4c2b54544f5f3 -= var_211417dbf8a951b2;
    }
    if (self.drones.size == 0) {
        var_d05d337940662e04 = spawnstruct();
        var_d05d337940662e04.origin = drone.origin;
        var_d05d337940662e04.angles = drone.angles;
        on_end(var_7087d9795dffce4d, var_d05d337940662e04, killer, items);
    } else {
        drone drop_items(items);
    }
    if (isdefined(drone)) {
        if (isdefined(data.inflictor) && data.inflictor.classname == "rocket") {
            data.inflictor waittill_any_return_1("explode");
        }
        waitframe();
        scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(drone);
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x15dd
// Size: 0x1ef
function on_end(var_7087d9795dffce4d, var_d05d337940662e04, var_13dc3b5519c135bd, var_d544c62ea2bc64b) {
    level endon("game_ended");
    endstate = "fail";
    var_5e671fc71e72d5e8 = undefined;
    if (istrue(self.ended)) {
        return;
    }
    self.ended = 1;
    if (isdefined(var_13dc3b5519c135bd)) {
        var_5e671fc71e72d5e8 = var_13dc3b5519c135bd.team;
        var_5cf607a8b578aacf = isdefined(var_d05d337940662e04);
        if (var_5cf607a8b578aacf) {
            items = getscriptcachecontents("br_quest_spdr", 0);
            if (isdefined(var_d544c62ea2bc64b) && var_d544c62ea2bc64b.size > 0) {
                items = scripts\engine\utility::array_combine(items, var_d544c62ea2bc64b);
            }
            scripts\mp\gametypes\br_quest_util::questrewarddropitems(var_5e671fc71e72d5e8, items, var_d05d337940662e04.origin, var_d05d337940662e04.angles, 0, undefined, undefined);
            if (getdvarint(@"hash_eb0811ead28c4f53", 0)) {
            }
        }
        splashref = function_4bcd7c36b22b9bec("br_spy_drones_quest_complete_team");
        if (var_7087d9795dffce4d) {
            endstate = "success";
            namespace_1eb3c4e0e28fac71::displaysquadmessagetoteam(var_5e671fc71e72d5e8, var_13dc3b5519c135bd, 8, namespace_1eb3c4e0e28fac71::getquestindex("spy_drones"));
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_msnc", self.teams[0], 1, 0, undefined, undefined);
        } else {
            endstate = "poached";
            splashref = "br_spy_drones_quest_poached_team";
            if (var_5cf607a8b578aacf) {
                namespace_1eb3c4e0e28fac71::function_6ddd1eecbe562acf("spy_drones_poached", self.teams[0], var_d05d337940662e04);
            }
            level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_enco", self.teams[0], 1, 0, undefined, undefined);
        }
        namespace_1eb3c4e0e28fac71::displayteamsplash(self.teams[0], splashref);
        if (!isdefined(var_d05d337940662e04)) {
            var_d05d337940662e04 = var_13dc3b5519c135bd;
        }
        namespace_1eb3c4e0e28fac71::function_d212a5e7a40d7c8d("spy_drones", var_5e671fc71e72d5e8, var_d05d337940662e04, self);
    }
    self.var_50b1df2d20db660c = undefined;
    namespace_1eb3c4e0e28fac71::endcontract(ter_op(endstate == "success", self.teams[0], undefined), undefined, undefined, endstate);
    thread delete_circle();
    self notify("task_ended");
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d4
// Size: 0x13
function on_player_disconnect(player) {
    function_6061d3e3727b4a0f(player);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ef
// Size: 0x1b
function on_player_killed(attacker, victim) {
    function_6061d3e3727b4a0f(victim);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1812
// Size: 0x13
function function_6dc61b7571555571(player) {
    function_6061d3e3727b4a0f(player);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182d
// Size: 0x69
function function_6061d3e3727b4a0f(player) {
    if (player.team == self.teams[0]) {
        filter = namespace_1eb3c4e0e28fac71::function_94a8dc26f5353759(player, level.contractmanager.defaultfilter);
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.teams[0], filter)) {
            function_5863139a72088b70(1);
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189e
// Size: 0x1d
function delete_circle() {
    if (!scripts\mp\flags::levelflag("game_over")) {
        wait 1;
    }
    scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c3
// Size: 0x23d
function spawn_drones() {
    var_2c48f74fe5c701df = scripts\cp_mp\utility\game_utility::function_d9583306c5a171e4();
    assertex(level.var_dc53645ad882c8f2.var_9724cd8c777a6103 > level.var_dc53645ad882c8f2.var_3d741ef8d5214272, "<dev string:x1c>");
    var_391c13efd58f5e76 = scripts\common\utility::function_c62375923163b86c(var_2c48f74fe5c701df, level.var_dc53645ad882c8f2.var_9724cd8c777a6103 - level.var_dc53645ad882c8f2.var_3d741ef8d5214272);
    if (level.var_dc53645ad882c8f2.var_eb3c475f74f5d11b == 1) {
        var_391c13efd58f5e76 = var_2c48f74fe5c701df;
    }
    groundposition = function_65b4f543fd133009(var_391c13efd58f5e76);
    self.var_391c13efd58f5e76 = (var_391c13efd58f5e76[0], var_391c13efd58f5e76[1], level.var_dc53645ad882c8f2.var_370ad2e4039d00b9 + groundposition[2]);
    var_84726d127497c82d = 0;
    var_aef2ed11d202fab7 = 360 / level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e;
    radius = level.var_dc53645ad882c8f2.var_3d741ef8d5214272;
    var_b74b263847d7c048 = groundposition[2] + level.var_dc53645ad882c8f2.var_6bf3038b9d262642;
    for (i = 0; i < level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e; i++) {
        var_b74b283847d7c4ae = radius * cos(var_84726d127497c82d) + var_391c13efd58f5e76[0];
        var_b74b293847d7c6e1 = radius * sin(var_84726d127497c82d) + var_391c13efd58f5e76[1];
        spawnpoint = (var_b74b283847d7c4ae, var_b74b293847d7c6e1, var_b74b263847d7c048);
        spawnangles = vectortoangles(spawnpoint - var_391c13efd58f5e76);
        drone = spawn_drone(spawnpoint, spawnangles);
        if (isdefined(drone)) {
            thread drone_drop(drone, level.var_dc53645ad882c8f2.var_370ad2e4039d00b9, groundposition[2]);
            thread function_f16989f55836eb5f(drone);
            thread function_b4456927b2084de8(drone);
            drone.var_84726d127497c82d = var_84726d127497c82d;
            var_84726d127497c82d += var_aef2ed11d202fab7;
            self.drones[self.drones.size] = drone;
        }
    }
    thread function_d47839ee3ce653dc();
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b08
// Size: 0x204
function function_d47839ee3ce653dc() {
    self endon("task_ended");
    self endon("flee");
    var_978288d2e912ce07 = 1;
    while (true) {
        if (!istrue(self.var_50b1df2d20db660c)) {
            wait 1;
            continue;
        }
        if (istrue(var_978288d2e912ce07)) {
            var_978288d2e912ce07 = 0;
            waittime = randomfloatrange(level.var_dc53645ad882c8f2.var_2acf733fef4b661d, level.var_dc53645ad882c8f2.var_656b373748c79d2b);
            thread function_489eaaeafa77dbde(waittime);
            wait waittime;
        }
        function_9610fe687f77b1f();
        translationoffset = undefined;
        waittime = 0.05;
        var_3b4e7ab7e6a61a55 = randomintrange(1, 4);
        /#
            if (getdvarint(@"hash_3f60762c6d72f8e8", 0) == 1) {
                var_3b4e7ab7e6a61a55 = getdvarint(@"hash_9fa6c5a4c0e40c8c", 1);
            }
        #/
        if (var_3b4e7ab7e6a61a55 == 1 || var_3b4e7ab7e6a61a55 == 3) {
            if (level.var_dc53645ad882c8f2.var_6b07b5001bfb6bdd) {
                clockwise = randomint(2) == 0;
                function_dd9bdd215fe08636(clockwise);
            }
        }
        if (var_3b4e7ab7e6a61a55 == 2 || var_3b4e7ab7e6a61a55 == 3) {
            if (level.var_dc53645ad882c8f2.var_7c1beb33b75dcd22) {
                direction = randomintrange(1, 3);
                /#
                    if (getdvarint(@"hash_3be38535e2f1992b", 0) == 1) {
                        direction = getdvarint(@"hash_be73562595947f97", 2);
                    }
                #/
                translationoffset = function_e9b50da39c7991a5(direction);
            }
        }
        if (!function_d70e70300ee6ea8c(translationoffset) && function_ce1465f6e226d2ea()) {
            waittime = randomfloatrange(level.var_dc53645ad882c8f2.var_2acf733fef4b661d, level.var_dc53645ad882c8f2.var_656b373748c79d2b);
            function_e6f301e018da281f();
            if (isdefined(translationoffset)) {
                self.var_391c13efd58f5e76 += translationoffset;
            }
            if (!istrue(self.var_50b1df2d20db660c)) {
                self waittill("manoeuvre_ready");
            }
            thread function_489eaaeafa77dbde(waittime);
        }
        wait waittime;
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d14
// Size: 0x19c
function function_dd9bdd215fe08636(clockwise) {
    var_aef2ed11d202fab7 = 360 / level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e;
    if (!istrue(clockwise)) {
        var_aef2ed11d202fab7 *= -1;
    }
    if (level.var_dc53645ad882c8f2.var_c90aee48e8bbef34) {
        max = int(level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e / 2) - 1;
        if (level.var_dc53645ad882c8f2.var_8d64c1e526cb3c9e > 2 && max > 1) {
            var_aef2ed11d202fab7 *= randomintrange(1, max);
        }
    }
    radius = level.var_dc53645ad882c8f2.var_3d741ef8d5214272;
    foreach (drone in self.drones) {
        var_84726d127497c82d = drone.var_84726d127497c82d + var_aef2ed11d202fab7;
        drone.var_84726d127497c82d = var_84726d127497c82d;
        var_96adb3b62681329 = radius * cos(var_84726d127497c82d) + self.var_391c13efd58f5e76[0];
        var_96ada3b626810f6 = radius * sin(var_84726d127497c82d) + self.var_391c13efd58f5e76[1];
        destination = (var_96adb3b62681329, var_96ada3b626810f6, drone.origin[2]);
        drone.destination = destination;
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb8
// Size: 0x17f
function function_e9b50da39c7991a5(direction) {
    offsetx = 0;
    offsety = 0;
    offsetz = 0;
    if (direction == 2 || direction == 3) {
        up = randomint(2) == 0;
        offsetz = up ? level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 : level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 * -1;
    }
    if (direction == 3 || direction == 1) {
        angle = randomfloat(360);
        offsetx = level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 * cos(angle);
        offsety = level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 * sin(angle);
    }
    offset = (offsetx, offsety, offsetz);
    foreach (drone in self.drones) {
        if (isdefined(drone.destination)) {
            drone.destination += offset;
            continue;
        }
        drone.destination = drone.origin + offset;
    }
    return offset;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2040
// Size: 0x1b3
function function_ce1465f6e226d2ea() {
    contents = physics_createcontents(["physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_ainosight"]);
    ignorelist = self.drones;
    foreach (drone in self.drones) {
        if (!isdefined(drone) || !isdefined(drone.origin)) {
            continue;
        }
        if (!isdefined(drone.destination)) {
            return false;
        }
        if (scripts\engine\utility::function_6c71c72547bb931(drone.destination) || scripts\mp\outofbounds::ispointinoutofbounds((drone.destination[0], drone.destination[1], 0))) {
            return false;
        }
        hits = physics_spherecast(drone.destination, drone.origin, 50 + level.var_dc53645ad882c8f2.hoverradius, contents, ignorelist, "physicsquery_closest");
        /#
            if (level.var_dc53645ad882c8f2.var_b4c111452c8a17c7) {
                for (i = 0; i < 10; i++) {
                    physics_spherecast(drone.destination, drone.origin, 50 + level.var_dc53645ad882c8f2.hoverradius, contents, ignorelist, "<dev string:x78>");
                    waitframe();
                }
            }
        #/
        if (isdefined(hits) && hits.size > 0) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21fc
// Size: 0x141
function function_d70e70300ee6ea8c(translationoffset) {
    if (!isdefined(translationoffset) || translationoffset[2] == 0) {
        return false;
    }
    drone = self.drones[0];
    radius = level.var_dc53645ad882c8f2.var_3d741ef8d5214272;
    var_84726d127497c82d = drone.var_84726d127497c82d;
    self.var_391c13efd58f5e76 = (drone.origin[0] - radius * cos(var_84726d127497c82d), drone.origin[1] - radius * sin(var_84726d127497c82d), self.var_391c13efd58f5e76[2]);
    var_98df157cbb48db26 = self.var_391c13efd58f5e76 + translationoffset;
    groundposition = function_65b4f543fd133009(var_98df157cbb48db26);
    if (var_98df157cbb48db26[2] > groundposition[2] + level.var_dc53645ad882c8f2.var_370ad2e4039d00b9 + level.var_dc53645ad882c8f2.var_b2e7d09f60c71a95 && translationoffset[2] > 0) {
        return true;
    } else if (var_98df157cbb48db26[2] < groundposition[2] + level.var_dc53645ad882c8f2.var_370ad2e4039d00b9 && translationoffset[2] < 0) {
        return true;
    }
    return false;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2346
// Size: 0x81
function function_e6f301e018da281f() {
    self.var_50b1df2d20db660c = undefined;
    foreach (drone in self.drones) {
        if (isdefined(drone) && isdefined(drone.destination)) {
            thread move_drone(drone, drone.destination);
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23cf
// Size: 0x250
function spawn_drone(spawnpoint, spawnangles) {
    spawndata = spawnstruct();
    spawndata.origin = spawnpoint;
    spawndata.angles = spawnangles;
    spawndata.modelname = "veh9_mil_air_drone_spy_large_mp_02";
    spawndata.vehicletype = "veh_spy_drone_br";
    spawndata.targetname = "spy_drone";
    spawndata.cannotbesuspended = 1;
    faildata = spawnstruct();
    drone = scripts\cp_mp\vehicles\vehicle_tracking::_spawnvehicle(spawndata, faildata);
    if (!isdefined(drone)) {
        return undefined;
    }
    drone.vehiclename = level.var_dc53645ad882c8f2.vehiclename;
    drone.var_aa6fe6af4cbbdd47 = &function_b19606cac271f026;
    drone.var_51427fea41863faa = &function_a3e7d456c9513ece;
    drone.var_a56f03607bdf0735 = 1;
    drone.team = self.teams[0] + "_spy_drones";
    scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_registerinstance(drone);
    drone.health = 20;
    drone.maxhealth = 20;
    drone setcandamage(1);
    scripts\mp\vehicles\damage::set_death_callback(drone.vehiclename, &function_ca8b1c15ad409ef7);
    drone vehicle_setspeed(level.var_dc53645ad882c8f2.speed, level.var_dc53645ad882c8f2.accel);
    drone setmaxpitchroll(30, 30);
    drone sethoverparams(level.var_dc53645ad882c8f2.hoverradius, 20, 20);
    drone setturningability(0.5);
    drone setyawspeed(level.var_dc53645ad882c8f2.speed * 4, level.var_dc53645ad882c8f2.accel * 4);
    drone setneargoalnotifydist(60);
    scripts\mp\weapons::function_e00b77a9cb4d8322(drone);
    if (level.var_dc53645ad882c8f2.var_4e9df5e4d1c7d66f == 1) {
        drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_78b6097e094c44ce);
        if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
            drone [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_78b6097e094c44ce);
        }
    }
    return drone;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2628
// Size: 0xe9
function function_b4456927b2084de8(drone) {
    level endon("game_ended");
    self endon("task_ended");
    drone endon("entitydeleted");
    while (true) {
        drone waittill("touch", ent);
        if (!isdefined(ent)) {
            continue;
        }
        vehicle = undefined;
        if (ent scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            vehicle = ent;
        } else if (ent scripts\cp_mp\utility\player_utility::isinvehicle()) {
            vehicle = ent.vehicle;
        }
        if (!isdefined(vehicle)) {
            continue;
        }
        driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(vehicle);
        lastowner = vehicle.lastowner;
        if (!isdefined(driver)) {
            driver = lastowner;
        }
        attacker = driver;
        inflictor = vehicle;
        drone dodamage(drone.maxhealth, vehicle.origin, attacker, inflictor, "MOD_CRUSH");
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2719
// Size: 0xa5
function function_87e92a820b75042a(drone) {
    level endon("game_ended");
    self endon("task_ended");
    drone endon("entitydeleted");
    drone waittill("near_goal");
    drone.var_c3f0ba258d2b9698 = 1;
    foreach (spy in self.drones) {
        if (!istrue(spy.var_c3f0ba258d2b9698)) {
            return;
        }
    }
    self.var_50b1df2d20db660c = 1;
    self notify("manoeuvre_ready");
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27c6
// Size: 0x70
function move_drone(drone, destination) {
    level endon("game_ended");
    drone endon("entitydeleted");
    self endon("flee");
    delay = randomfloat(1);
    wait delay;
    drone.var_c3f0ba258d2b9698 = undefined;
    thread function_87e92a820b75042a(drone);
    drone setvehgoalpos(destination, 1);
    drone setgoalyaw(drone.var_84726d127497c82d - 180);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x283e
// Size: 0x50
function drone_drop(drone, var_dab9892c6da62c0d, var_911ec5f317af0665) {
    destination = (drone.origin[0], drone.origin[1], var_911ec5f317af0665 + var_dab9892c6da62c0d);
    thread move_drone(drone, destination);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2896
// Size: 0xe5
function function_489eaaeafa77dbde(var_128285595fc52486) {
    level endon("game_ended");
    self endon("task_ended");
    waittime = var_128285595fc52486 - 3.2;
    if (waittime > 0) {
        var_f60b7ee9b2dc160f = waittime * 0.33;
        var_f5e86ce9b2b5a6c1 = waittime * 0.66;
    }
    delay = 0;
    foreach (drone in self.drones) {
        if (randomfloat(1) < level.var_dc53645ad882c8f2.var_3ee437c870237781) {
            if (waittime > 0) {
                delay = randomfloatrange(var_f60b7ee9b2dc160f, var_f5e86ce9b2b5a6c1);
            }
            drone thread drone_scan(delay);
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2983
// Size: 0x43
function drone_scan(delay) {
    level endon("game_ended");
    self endon("entitydeleted");
    wait delay;
    self setscriptablepartstate("scan", "on");
    wait 3.2;
    self setscriptablepartstate("scan", "off");
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ce
// Size: 0x5b
function function_537fcb1037d3612b() {
    foreach (drone in self.drones) {
        if (isdefined(drone)) {
            scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(drone);
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a31
// Size: 0x74
function function_5863139a72088b70(var_b0441d6255b84cd1) {
    function_537fcb1037d3612b();
    namespace_1eb3c4e0e28fac71::displayteamsplash(self.teams[0], "br_spy_drones_quest_expired_team");
    if (istrue(var_b0441d6255b84cd1)) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_obj_circle_fail", self.teams[0], 1, 0, undefined, undefined);
    } else {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_mifa", self.teams[0], 1, 0, undefined, undefined);
    }
    on_end();
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aad
// Size: 0x9c
function function_acad5b6746ae352e() {
    level endon("game_ended");
    self endon("task_ended");
    self endon("task_oob");
    contracttime = level.var_dc53645ad882c8f2.contracttime > 0 ? level.var_dc53645ad882c8f2.contracttime : namespace_1eb3c4e0e28fac71::function_ea591c2a379e3424(self.category);
    wait contracttime - level.var_dc53645ad882c8f2.var_7e11f30ecaba3c2c;
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_retr", self.teams[0], 1, 0, undefined, undefined);
    thread function_293c5f2996b20987();
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b51
// Size: 0xe2
function function_293c5f2996b20987() {
    self notify("flee");
    foreach (drone in self.drones) {
        if (isdefined(drone)) {
            drone notify("stop_scan");
            destination = (drone.origin[0], drone.origin[1], level.var_dc53645ad882c8f2.var_427f06854232670f + drone.origin[2]);
            drone vehicle_setspeed(level.var_dc53645ad882c8f2.var_5416ef1fdf377938, level.var_dc53645ad882c8f2.var_5b48dcda7b72fc1b);
            thread move_drone(drone, destination);
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3b
// Size: 0x5e
function function_9610fe687f77b1f() {
    foreach (drone in self.drones) {
        if (isdefined(drone)) {
            drone.destination = undefined;
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca1
// Size: 0x85
function drop_items(items) {
    if (items.size > 0) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropinfo = spawnstruct();
        dropinfo.origin = self.origin;
        dropinfo.angles = self.angles;
        dropinfo.itemsdropped = 0;
        dropinfo scripts\mp\gametypes\br_lootcache::lootspawnitemlist(dropstruct, items, 0, undefined, undefined, undefined);
        return dropinfo.itemsdropped;
    }
    return 0;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2f
// Size: 0xfd
function award_xp(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player notify("stop_spy_drone_timer");
    waitframe();
    if (!isdefined(self.var_b50d63d6f7c2140a)) {
        self.var_b50d63d6f7c2140a = [];
    }
    playerentitynumber = player getentitynumber();
    self.var_b50d63d6f7c2140a[playerentitynumber] = isdefined(self.var_b50d63d6f7c2140a[playerentitynumber]) ? self.var_b50d63d6f7c2140a[playerentitynumber] + 1 : 0;
    player scripts\mp\utility\points::doScoreEvent(self.var_b50d63d6f7c2140a[playerentitynumber] > level.var_dc53645ad882c8f2.var_d2121d8d1550f4cc.size - 1 ? level.var_dc53645ad882c8f2.var_d2121d8d1550f4cc[level.var_dc53645ad882c8f2.var_d2121d8d1550f4cc.size - 1] : level.var_dc53645ad882c8f2.var_d2121d8d1550f4cc[self.var_b50d63d6f7c2140a[playerentitynumber]]);
    player thread start_timer(self);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e34
// Size: 0x5a
function start_timer(contract) {
    level endon("game_ended");
    contract endon("task_ended");
    self endon("stop_spy_drone_timer");
    self endon("death_or_disconnect");
    wait level.var_dc53645ad882c8f2.var_6a998167254575bc;
    playerentitynumber = self getentitynumber();
    contract.var_b50d63d6f7c2140a[playerentitynumber] = undefined;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e96
// Size: 0xb9
function function_65b4f543fd133009(position) {
    tracecontents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0);
    groundposition = scripts\engine\trace::sphere_trace(position + (0, 0, 5000), position + (0, 0, -20000), level.var_dc53645ad882c8f2.var_3d741ef8d5214272 + 50 + level.var_dc53645ad882c8f2.hoverradius, self.drones, tracecontents)["position"];
    waterheight = function_b81e710fd636efab(groundposition);
    if (isdefined(waterheight) && groundposition[2] < waterheight) {
        groundposition = (groundposition[0], groundposition[1], waterheight);
    }
    return groundposition;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f58
// Size: 0x90
function function_b19606cac271f026(var_91beb5c3a5ab6910) {
    level endon("game_ended");
    self endon("death");
    victim = var_91beb5c3a5ab6910.victim;
    attacker = var_91beb5c3a5ab6910.attacker;
    objweapon = var_91beb5c3a5ab6910.objweapon;
    inflictor = var_91beb5c3a5ab6910.inflictor;
    self dodamage(self.health, self.origin, attacker, inflictor, "MOD_ELEMENTAL_ELEC", objweapon);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff0
// Size: 0x4f
function function_1b8fe45856358d18() {
    level endon("game_ended");
    self endon("task_ended");
    wait level.var_dc53645ad882c8f2.inactivetime;
    if (istrue(self.var_9b08ab39d372b35d)) {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("spyd_grav_remi", self.teams[0], 1, 0, undefined, undefined);
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3047
// Size: 0x4a
function function_78b6097e094c44ce(data) {
    self dodamage(self.health, self.origin, data.attacker, data.inflictor, "MOD_ELEMENTAL_ELEC", data.objweapon);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3099
// Size: 0xa4
function function_a78f24ba9aac3cd5(var_819edacdacb810e4, var_52d59c928eb97c81) {
    level endon("game_ended");
    self endon("task_ended");
    if (istrue(self.var_df2a5e89c3bba966)) {
        return;
    }
    if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.var_391c13efd58f5e76, level.var_dc53645ad882c8f2.var_f0b6500ab0c9ccd4)) {
        if (!isdefined(self.var_ecab0c87adbf2d21)) {
            self.var_ecab0c87adbf2d21 = gettime() + function_a5b14435e3229bed(level.var_dc53645ad882c8f2.var_37143a4776fd671a);
        }
        if (gettime() >= self.var_ecab0c87adbf2d21) {
            thread function_4a9600443da06ce();
            return;
        }
    }
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3145
// Size: 0x37
function function_4a9600443da06ce() {
    level endon("game_ended");
    self endon("task_ended");
    self.var_df2a5e89c3bba966 = 1;
    self notify("task_oob");
    thread function_293c5f2996b20987();
    wait 5;
    function_5863139a72088b70(1);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3184
// Size: 0x14
function on_cancel(team) {
    function_5863139a72088b70(1);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31a0
// Size: 0x4d
function function_ee646c1d9d674584(contract, instance, team) {
    contract thread function_5f2cebb59cfad8f4(5);
    var_6b68ae780c4e4ebe = instance;
    if (!isdefined(var_6b68ae780c4e4ebe)) {
        var_6b68ae780c4e4ebe = function_6992f8b04542bb0f(team);
    }
    contract on_end(1, undefined, var_6b68ae780c4e4ebe);
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31f5
// Size: 0x58
function function_6992f8b04542bb0f(team) {
    validplayer = undefined;
    aliveplayers = scripts\mp\utility\teams::getteamdata(team, "alivePlayers");
    players = scripts\mp\utility\teams::getteamdata(team, "players");
    players = array_combine_unique(aliveplayers, players);
    validplayer = function_6b8f0b7f0578b450(players);
    return validplayer;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3256
// Size: 0x57
function function_6b8f0b7f0578b450(player_list) {
    foreach (player in player_list) {
        if (isdefined(player)) {
            return player;
        }
    }
    return undefined;
}

// Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b6
// Size: 0x1c
function function_5f2cebb59cfad8f4(var_bd2ff1792216d885) {
    thread function_293c5f2996b20987();
    wait var_bd2ff1792216d885;
    function_537fcb1037d3612b();
}

/#

    // Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x32da
    // Size: 0x3f
    function debug_init() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x90>");
        function_a2fe753948998c89("<dev string:xae>", "<dev string:xbb>");
        scripts\common\devgui::function_fe953f000498048f();
        scripts\engine\utility::registersharedfunc("<dev string:xf8>", "<dev string:x100>", &function_f1406ad583f64a73);
    }

    // Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3321
    // Size: 0xe7
    function function_f1406ad583f64a73(args) {
        if (args.size == 0) {
            return;
        }
        command = args[0];
        host = scripts\mp\gamelogic::gethostplayer();
        foreach (team in level.teamswithplayers) {
            if (team != host.team) {
                enemyplayer = scripts\mp\utility\teams::getteamdata(team, "<dev string:x112>")[0];
                break;
            }
        }
        switch (command) {
        case #"hash_bd35a08e196ab228":
            level thread function_b38f29311fcfe0c0(host, enemyplayer);
            break;
        case #"hash_36839a6c261ac073":
            level thread function_29dd01d8eecaab0b(host);
            break;
        }
    }

    // Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x3410
    // Size: 0xe0
    function function_b38f29311fcfe0c0(host, enemyplayer) {
        var_fabace5602f197f5 = level.contractmanager.var_b6fae9c9655c73bf[host.team];
        assert(isdefined(var_fabace5602f197f5), "<dev string:x12d>");
        if (var_fabace5602f197f5.category == "<dev string:x14a>") {
            if (isdefined(enemyplayer)) {
                foreach (drone in var_fabace5602f197f5.drones) {
                    drone dodamage(drone.maxhealth, drone.origin, enemyplayer, undefined, "<dev string:x158>");
                    wait 0.25;
                }
            }
        }
    }

    // Namespace namespace_334ec991babd91b6 / namespace_97c4a3fbd372837b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x34f8
    // Size: 0x64
    function function_29dd01d8eecaab0b(host) {
        var_fabace5602f197f5 = level.contractmanager.var_b6fae9c9655c73bf[host.team];
        level endon("<dev string:x169>");
        var_fabace5602f197f5 endon("<dev string:x177>");
        if (var_fabace5602f197f5.category == "<dev string:x14a>") {
            var_fabace5602f197f5 thread function_4a9600443da06ce();
        }
    }

#/
