// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace namespace_dbc1018dd2e067e;

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e
// Size: 0x6c
function function_fe852f92145c24a6() {
    function_ac97a4f2ab8c2d53("loot", "tryAssignTask", &function_1a86afc387820604);
    function_ac97a4f2ab8c2d53("loot", "onPlayerSelectTask", &onPlayerSelectTask);
    function_ac97a4f2ab8c2d53("loot", "onTaskEnd", &function_afaacbffddff4911);
    function_ac97a4f2ab8c2d53("loot", "tryBindObjective", &tryBindObjective);
    namespace_71073fa38f11492::registerbrgametypefunc("playerKioskUsed", &playerKioskUsed);
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x15
function function_1a86afc387820604(var_17953215dd7c5f9b) {
    thread function_78d7a14c7dfb37c4(var_17953215dd7c5f9b);
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0xae
function function_78d7a14c7dfb37c4(var_17953215dd7c5f9b) {
    level endon("game_ended");
    var_17953215dd7c5f9b endon("task_end");
    while (1) {
        flag = var_17953215dd7c5f9b.info.subcategory + "_" + var_17953215dd7c5f9b.team;
        instance = value = player = level waittill(flag);
        if (var_17953215dd7c5f9b.info.subcategory == "open_loot_box") {
            function_dc3e112cadb47514(instance);
        }
        if (isdefined(player)) {
            player function_89b8bce3baa45edc(var_17953215dd7c5f9b, value);
        }
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x70
function function_afaacbffddff4911(var_17953215dd7c5f9b) {
    foreach (player in getteamdata(var_17953215dd7c5f9b.team, "players")) {
        player onPlayerSelectTask(var_17953215dd7c5f9b, 0);
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359
// Size: 0x3f
function onPlayerSelectTask(var_17953215dd7c5f9b, selected) {
    if (var_17953215dd7c5f9b.info.subcategory == "buy_station_cash_spent") {
        self setclientomnvar("ui_champion_br_task_buy_station_hint", selected);
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f
// Size: 0x21
function function_8e36f666c0242fe6(var_17953215dd7c5f9b, kiosk) {
    return !istrue(kiosk.disabled);
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c8
// Size: 0x46
function function_44b2e353a03c56a5(var_17953215dd7c5f9b, var_36b81911e31bb387) {
    partname = var_36b81911e31bb387 function_ec5f4851431f3382();
    state = var_36b81911e31bb387 getscriptablepartstate(partname, 1);
    return isdefined(state) && state == "closed_usable";
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416
// Size: 0x7a
function tryBindObjective(var_17953215dd7c5f9b) {
    switch (var_17953215dd7c5f9b.info.subcategory) {
    case #"hash_4245429f5ab3bc91":
        function_2e55101ffd0d483c(var_17953215dd7c5f9b, level.br_armory_kiosk.scriptables, &function_8e36f666c0242fe6);
        break;
    case #"hash_c66674337f5f82a6":
        function_2e55101ffd0d483c(var_17953215dd7c5f9b, function_3525b317dc93f4e9(), &function_44b2e353a03c56a5);
        break;
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x497
// Size: 0x69
function playerKioskUsed(kiosk) {
    if (isdefined(self.var_b8abadd2c4d56fd8) && isdefined(self.var_b8abadd2c4d56fd8.item.type) && self.var_b8abadd2c4d56fd8.item.type == "br_plunder_box") {
        removeObjectiveInfo();
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x507
// Size: 0x91
function function_dc3e112cadb47514(var_36b81911e31bb387) {
    if (!isdefined(var_36b81911e31bb387)) {
        return;
    }
    foreach (player in level.players) {
        if (isdefined(player.var_b8abadd2c4d56fd8) && player.var_b8abadd2c4d56fd8.item == var_36b81911e31bb387) {
            player function_8fd21242a694aa72();
        }
    }
}

// Namespace namespace_dbc1018dd2e067e/namespace_587d60d37119a29f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f
// Size: 0x3d
function function_3525b317dc93f4e9() {
    var_510c132b62d77d0a = [0:"br_loot_cache", 1:"br_loot_cache_lege", 2:"br_reusable_loot_cache"];
    return getlootscriptablearrayinradius(var_510c132b62d77d0a, undefined, self.origin, 10000);
}
