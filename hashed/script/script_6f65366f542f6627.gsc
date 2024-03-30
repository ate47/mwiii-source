// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\points.gsc;
#using script_41387eecc35b88bf;
#using script_6bffae1b97f70547;
#using script_485622d93fa7e4cf;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_64316dc775e91122;
#using script_2669878cf5a1b6bc;
#using script_398835140857d740;
#using script_7edf952f8921aa6b;
#using script_639bf783929acf9b;
#using script_7c40fa80892a721;
#using script_62a4f7a62643fe8;
#using script_2f11ea014b8bb8eb;
#using scripts\mp\globallogic.gsc;
#using script_749ff6f56673a813;
#using script_55221d469e7b320e;
#using script_58be75c518bf0d40;
#using script_220d0eb95a8fab7d;
#using scripts\mp\hud_message.gsc;
#using script_2707474774db34b;
#using script_638d701d263ee1ed;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_4e6e58ab5d96c2b0;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\scoreboard.gsc;
#using script_7c875a4a27280806;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\ob.gsc;
#using script_76cc264b397db9cb;
#using script_6fc415ff6a905dc1;
#using script_600b944a95c3a7bf;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_4a6760982b403bad;

#namespace ob_exfil;

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e7
// Size: 0x166
function function_3afebc739584a9a() {
    level.var_7cc298fa98ce0c7a = "SHARED_HINTSTRINGS/EXFIL_START_USE_OB";
    level.var_132e390bddaa01b5 = &scripts/mp/globallogic::blank;
    level.var_3a96331857b5f453 = "EXFIL_OB";
    level.var_f823a30649b48284 = "exfil_activity_ob_definition";
    namespace_9f6a961447bab709::init_exfil();
    thread namespace_bbc151ced3ff8d46::function_751a7af62e6ae0c7();
    level.var_9f9cd6f82b781bde = &function_8b3122340fe584c7;
    level.var_78e0845802741355 = &function_161a9b230a5d1a5e;
    level.var_d8b6115a502e7e76 = &function_9c4759ff6fd51461;
    level.var_35aa4c6db25e81ae = &function_5cef4bea938b2113;
    level.var_38452d51edfb282c = &function_c33400a035a1225d;
    level.var_8873839ca6498959 = &function_22fb8021077168e4;
    level.var_5924b0bd99878b50 = &function_57d6dd6c67840c1f;
    level.var_8c38c7d9dbe77e4 = throttle_initialize("ob_exfil_player", 1, level.framedurationseconds * 3);
    level.var_40e72101aaba1098 = 1;
    callback::add("on_exfil_player_joined", &function_15b6a0884be537b);
    callback::add("on_exfil_player_failure", &function_7d4d9ab56ec899d4);
    callback::add("on_exfil_player_available", &function_8bde2e5e6f81bef5);
    callback::add("on_exfil_ai_spawned", &on_exfil_ai_spawned);
    callback::add("on_exfil_vehicle_spawned", &on_exfil_vehicle_spawned);
    utility::registersharedfunc("instanceInventory", "isMapToMapExfil", &function_9487b6b2ba44f9db);
    function_8b5b2a3392fc7e2a("ActivityBegin", &function_e2ccdedfebf9e5b1, "REV_OB_EXFIL");
    /#
        level thread function_9a3a196103b06cb2();
    #/
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa54
// Size: 0x3b
function function_9a3a196103b06cb2() {
    /#
        flag_wait(" jumped out of exfil vehicle for ");
        function_6e7290c8ee4f558b("prone");
        function_a9a864379a098ad6("primary", "<unknown string>", &function_4d67fac937774abe);
        function_fe953f000498048f();
    #/
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa96
// Size: 0x3a
function function_4d67fac937774abe(params) {
    /#
        var_a3ed94a321cc4d1a = getdvarint(@"hash_bc321023e9100f4", 0);
        setdvar(@"hash_bc321023e9100f4", !var_a3ed94a321cc4d1a);
    #/
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0x13
function function_57d6dd6c67840c1f() {
    return getdvarint(@"hash_d74ba37ba5c227b0", 1);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2
// Size: 0x1b0
function function_c33400a035a1225d(var_751df20fceaee5, var_985e82f034f67960) {
    var_c9b69aecc5c631ed = var_985e82f034f67960 namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
    var_751df20fceaee5.var_953c0bb9dec80174 = [var_985e82f034f67960];
    foreach (squad_member in var_c9b69aecc5c631ed) {
        if (isdefined(squad_member.var_751df20fceaee5) && isdefined(squad_member.var_751df20fceaee5.var_18da16a5ee3e8314)) {
            if (squad_member == var_985e82f034f67960) {
                var_985e82f034f67960 namespace_9f6a961447bab709::function_f246f550360cbdbb();
                var_751df20fceaee5.var_953c0bb9dec80174 = function_6d6af8144a5131f1(var_751df20fceaee5.var_953c0bb9dec80174, var_985e82f034f67960);
            }
            continue;
        }
        var_751df20fceaee5.var_953c0bb9dec80174 = function_6d6af8144a5131f1(var_751df20fceaee5.var_953c0bb9dec80174, squad_member);
    }
    var_751df20fceaee5.var_c9164736baf0694a = var_751df20fceaee5.var_953c0bb9dec80174;
    foreach (player in var_751df20fceaee5.var_c9164736baf0694a) {
        namespace_d886885225a713a7::function_bbdcd857d0c2a65e(var_751df20fceaee5.var_18da16a5ee3e8314, player);
        player.var_751df20fceaee5 = var_751df20fceaee5;
    }
    callback::callback("on_exfil_player_available", var_751df20fceaee5);
    array_thread(var_751df20fceaee5.var_c9164736baf0694a, &scripts/mp/hud_message::showsplash, "cp_mp_exfil_inbound");
    wait(2);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca9
// Size: 0x215
function function_22fb8021077168e4(var_2fb66334569ccc48) {
    if (getdvarint(@"hash_3dd989b5ea61ba6f", 1) == 0) {
        return [[ level.var_c383b967aa7e551b ]]("exfil", var_2fb66334569ccc48);
    }
    utility::flag_wait("aether_storm_initialized");
    if (level.aether_storm.var_719deb8a1a45bb85) {
        return [[ level.var_c383b967aa7e551b ]]("exfil", var_2fb66334569ccc48);
    }
    var_37b57f82052b28fe = namespace_faa32e45e1d64c2::function_7bf6e6f83216f4bd();
    var_8d1fe1927c807ad3 = (level.aether_storm.expansion_radius - level.aether_storm.starting_radius) / level.aether_storm.var_3f24322be8ae1969;
    var_6a210603df7a6c21 = level.aether_storm.var_647bf2cbf73994dd;
    var_6a210603df7a6c21 = var_6a210603df7a6c21 - level.aether_storm.var_be0e041e85848a6d;
    var_6a210603df7a6c21 = var_6a210603df7a6c21 - getdvarint(@"hash_eb873c5e99093d11", 50);
    var_6a210603df7a6c21 = var_6a210603df7a6c21 - getdvarint(@"hash_346baccb7a031727", 7);
    var_1f64da304df07bac = [];
    foreach (var_751df20fceaee5 in var_2fb66334569ccc48) {
        if (var_751df20fceaee5 == var_37b57f82052b28fe) {
            continue;
        }
        var_9c0939a3d83555cf = distance2d(var_751df20fceaee5.origin, level.aether_storm.starting_origin);
        var_a70ff023d1ffa590 = (var_9c0939a3d83555cf - level.aether_storm.starting_radius) / var_8d1fe1927c807ad3;
        if (var_a70ff023d1ffa590 >= var_6a210603df7a6c21) {
            continue;
        }
        if (isdefined(var_751df20fceaee5.script_parameters) && var_751df20fceaee5.script_parameters == "disabled") {
            continue;
        }
        var_1f64da304df07bac[var_1f64da304df07bac.size] = var_751df20fceaee5;
    }
    return [[ level.var_c383b967aa7e551b ]]("exfil", var_1f64da304df07bac);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec6
// Size: 0xdd
function function_9c4759ff6fd51461(player) {
    if (isdefined(self.var_751df20fceaee5) && istrue(self.var_751df20fceaee5.b_disabled)) {
        return false;
    }
    if (getdvarint(@"hash_bc321023e9100f4", 0) || namespace_9f6a961447bab709::function_8d3b8265c47a2223()) {
        return true;
    }
    if (!namespace_cde84ab88f41f1a5::function_6152021549f1836b(player)) {
        return false;
    }
    var_5ba582db1213daa8 = namespace_cde84ab88f41f1a5::function_1c121cfcda39970d(player);
    var_7f92c5f0b69fd724 = 0;
    foreach (var_180e04406de3e180 in var_5ba582db1213daa8) {
        if (istrue(var_180e04406de3e180.success)) {
            var_7f92c5f0b69fd724++;
        }
    }
    if (var_7f92c5f0b69fd724 > 0) {
        return true;
    }
    return false;
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfab
// Size: 0x27a
function function_5cef4bea938b2113(var_751df20fceaee5, var_6d94a1f3678a98a6) {
    if (getdvarint(@"hash_37e686acc7d62c47", 0)) {
        return undefined;
    }
    str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(var_751df20fceaee5.var_55b9fdf7eacf9572.origin);
    var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e(var_751df20fceaee5);
    if (istrue(var_6d94a1f3678a98a6)) {
        switch (str_difficulty) {
        case #"hash_7bb2cd766703d463":
        case #"hash_a1e09f51896088fb":
        default:
            var_751df20fceaee5.var_1d39d0784b73d713 = 1;
            var_751df20fceaee5.var_2744fe7a1690ec17 = 1;
            return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_a015d197dcc7df7);
        case #"hash_af83e47edfa8900a":
            var_751df20fceaee5.var_1d39d0784b73d713 = 2;
            var_751df20fceaee5.var_2744fe7a1690ec17 = 1;
            return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_b5560d38a020358c);
        case #"hash_5343b465e56ec9a4":
            var_751df20fceaee5.var_1d39d0784b73d713 = 3;
            var_751df20fceaee5.var_2744fe7a1690ec17 = 2;
            return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_595400899d6d9546);
        case #"hash_651f76c0ad6741ec":
            var_751df20fceaee5.var_1d39d0784b73d713 = 3;
            var_751df20fceaee5.var_2744fe7a1690ec17 = 2;
            return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_20e1f41a589541eb);
        }
        return;
    }
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463":
    case #"hash_a1e09f51896088fb":
    default:
        var_751df20fceaee5.var_1d39d0784b73d713 = 1;
        var_751df20fceaee5.var_2744fe7a1690ec17 = 1;
        return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_558ecf015b891ba2);
    case #"hash_af83e47edfa8900a":
        var_751df20fceaee5.var_1d39d0784b73d713 = 2;
        var_751df20fceaee5.var_2744fe7a1690ec17 = 1;
        return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_d4e9b427c8b60937);
    case #"hash_5343b465e56ec9a4":
        var_751df20fceaee5.var_1d39d0784b73d713 = 3;
        var_751df20fceaee5.var_2744fe7a1690ec17 = 2;
        return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_6df3a308b274e929);
    case #"hash_651f76c0ad6741ec":
        var_751df20fceaee5.var_1d39d0784b73d713 = 3;
        var_751df20fceaee5.var_2744fe7a1690ec17 = 2;
        return ("ai_flood_fill_encounter:" + var_cad2ff0bf935f3d4.var_6e4ab8cd1b3d7322);
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122c
// Size: 0x19
function function_8b3122340fe584c7() {
    if (percent_chance(10)) {
        return "actor_jup_spawner_zombie_base_armored_heavy";
    }
    return "actor_jup_spawner_zombie_base";
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x138
function on_exfil_ai_spawned(params) {
    new_health = getdvarint(@"hash_30b03a2625dd852c", -1);
    if (new_health > 0) {
        self.health = new_health;
    }
    if (self.basearchetype == "zombie_base") {
        str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.origin);
        switch (str_difficulty) {
        case #"hash_7bb2cd766703d463":
            if (percent_chance(20)) {
                str_speed = "sprint";
            }
            break;
        case #"hash_af83e47edfa8900a":
            if (percent_chance(35)) {
                str_speed = "sprint";
            }
            break;
        default:
            break;
        }
        if (isdefined(str_speed)) {
            function_f1e5805da192a1ef(str_speed, "exfil", 24);
        }
        if (isplayer(self.exfil_player) && isalive(self.exfil_player) && !scripts/mp/utility/player::isinlaststand(self.exfil_player)) {
            self aieventlistenerevent("combat", self.exfil_player, self.exfil_player.origin);
        }
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138c
// Size: 0x2c
function on_exfil_vehicle_spawned(params) {
    if (getdvarint(@"hash_37aa7620b893be20", 1) != 0) {
        self.var_102945aa439b7b3d = 1;
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bf
// Size: 0x51d
function function_161a9b230a5d1a5e(player, var_83212420e39bdbc2) {
    if (!isdefined(var_83212420e39bdbc2)) {
        var_83212420e39bdbc2 = 0;
    }
    player endon("disconnect");
    /#
        assertex(!isdefined(player.exfilpos), "This player has already exfiled!");
    #/
    var_751df20fceaee5 = player.var_751df20fceaee5;
    var_576f57af0204c38c = isdefined(player.var_751df20fceaee5.var_576f57af0204c38c) ? player.var_751df20fceaee5.var_576f57af0204c38c : player.var_cac91eb6521df629;
    player val::set("exfil", "damage", 0);
    player.var_65be3afaddfe3a79 = 1;
    if (!istrue(player.var_764da0de2a46452c)) {
        wait(2.5);
        if (namespace_9f6a961447bab709::function_18a23b9f6568641e() && isdefined(var_576f57af0204c38c)) {
            wait(getdvarfloat(@"hash_1862302145751eaf", 13));
        }
    }
    var_751df20fceaee5 notify("exfil_vehicle_gone");
    player.var_65be3afaddfe3a79 = undefined;
    if (isdefined(var_576f57af0204c38c) && !istrue(player.var_68b9486f4adbcb62)) {
        logstring("==OB EXFIL: " + player.name + " jumped out of exfil vehicle for " + var_751df20fceaee5.name + " after vehicle started leaving");
        player.var_f52eb40ba99ffa4c = undefined;
        player.var_f7b106ebc7f3abf0 = undefined;
        player.var_764da0de2a46452c = undefined;
        player val::reset("exfil", "damage");
        player setplayermusicstate("");
        if (scripts/mp/outofbounds::isoobimmune(player)) {
            scripts/mp/outofbounds::disableoobimmunity(player);
        }
        return;
    }
    var_1a32758b940764f4 = 1;
    foreach (other_player in level.players) {
        if (!istrue(other_player.var_f52eb40ba99ffa4c) && ob_laststand::function_f3645fa4bfb45a97(other_player)) {
            var_1a32758b940764f4 = 0;
            break;
        }
    }
    player callback::callback("ob_exfil_success", var_751df20fceaee5);
    var_a6b3fae0395f75c3 = "none";
    if (var_83212420e39bdbc2) {
        var_a6b3fae0395f75c3 = "rift_run";
    } else if (isdefined(var_751df20fceaee5.instance) && isdefined(var_751df20fceaee5.instance.script_noteworthy)) {
        var_a6b3fae0395f75c3 = var_751df20fceaee5.instance.script_noteworthy;
    }
    function_46f56bf948599140(player, var_a6b3fae0395f75c3);
    if (isdefined(var_751df20fceaee5.instance) && is_equal(var_751df20fceaee5.instance.script_noteworthy, "quest_exfil")) {
        logstring("quest exfil checking for players");
        var_16e8ded086d83144 = player namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
        foreach (squad_member in var_16e8ded086d83144) {
            if (isdefined(var_751df20fceaee5.str_mission) && namespace_bbc151ced3ff8d46::function_587db41e9361a424(squad_member, var_751df20fceaee5.str_mission) && var_576f57af0204c38c namespace_bbc151ced3ff8d46::function_c80b9a252474413b(squad_member)) {
                player.var_ec0caef5c0691992 = 1;
                if (!array_contains(level.var_9ec4962076db301b[var_751df20fceaee5.str_mission].eligible_players, player)) {
                    level.var_9ec4962076db301b[var_751df20fceaee5.str_mission].eligible_players[level.var_9ec4962076db301b[var_751df20fceaee5.str_mission].eligible_players.size] = player;
                }
            }
        }
    }
    if (isdefined(var_751df20fceaee5.instance) && is_equal(var_751df20fceaee5.instance.script_noteworthy, "quest_exfil") && istrue(player.var_ec0caef5c0691992)) {
        if (function_7bfb1ccacdacfd26()) {
            mapname = scripts/cp_mp/utility/game_utility::getmapname();
            logstring("quest exfil initiated in map " + mapname);
            player thread namespace_b3f32c8cb80b8124::function_5751d00ce46557da(1, 1);
            player ob::function_865b1a5a62c49d7(1);
            params = spawnstruct();
            params.player = player;
            params.exfil_chopper = var_576f57af0204c38c;
            params.var_751df20fceaee5 = var_751df20fceaee5;
            level callback::callback("quest_exfil_complete", params);
            function_f9a207358d70923c(getdvarint(@"hash_337167177f9034b4", 8), ["exfil_fully_completed"], &function_a5426cbe311426c0, player, var_751df20fceaee5, var_1a32758b940764f4);
            return;
        } else {
            logstring("Trying to quest exfil from " + (isdefined(var_751df20fceaee5.name) ? var_751df20fceaee5.name : "") + " but ob_map_transition_playlist dvar is disabled!");
        }
    }
    thread function_a5426cbe311426c0(player, var_751df20fceaee5, var_1a32758b940764f4);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e3
// Size: 0x572
function function_a5426cbe311426c0(player, var_751df20fceaee5, var_1a32758b940764f4) {
    if (!isdefined(player)) {
        return;
    }
    player endon("disconnect");
    player thread namespace_b3f32c8cb80b8124::function_5751d00ce46557da(1);
    level thread scripts/cp_mp/utility/game_utility::fadetoblackforplayer(player, 1, 0.25);
    player.exfilpos = player.origin;
    wait(0.25);
    throttle::function_f632348cbb773537(level.var_8c38c7d9dbe77e4, player);
    if (isdefined(level.var_db80981879714f15)) {
        player.exfilpos = player [[ level.var_db80981879714f15 ]]();
    }
    player val::set("exfil", "crouch", 0);
    player val::set("exfil", "gesture", 0);
    player val::set("exfil", "allow_jump", 0);
    player val::set("exfil", "killstreaks", 0);
    player val::set("exfil", "melee", 0);
    player val::set("exfil", "offhand_weapons", 0);
    player val::set("exfil", "prone", 0);
    player val::set("exfil", "sprint", 0);
    player val::set("exfil", "supers", 0);
    player val::set("exfil", "usability", 0);
    player val::set("exfil", "weapon", 0);
    player val::set("exfil", "allow_movement", 0);
    player val::set("exfil", "fire", 0);
    player val::set("exfil", "weapon_switch", 0);
    player val::set("exfil", "ignoreme", 1);
    player freezecontrols(1);
    player playerhide();
    player function_30f809c426b6a126();
    function_edff661c569fa3bc(player);
    ob::function_4ce64226f67749c4(player);
    if (isdefined(level.var_4b90dae6c1d817ee) && istrue(level.var_4b90dae6c1d817ee[player.team])) {
        player setclientomnvar("ui_dmz_extract_successful", 2);
    } else {
        fullyextracted = 1;
        var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers();
        foreach (squad_member in var_c9b69aecc5c631ed) {
            if (!istrue(squad_member.var_f52eb40ba99ffa4c)) {
                fullyextracted = 0;
                break;
            }
        }
        if (fullyextracted) {
            if (!isdefined(level.var_4b90dae6c1d817ee)) {
                level.var_4b90dae6c1d817ee = [];
            }
            level.var_4b90dae6c1d817ee[player.team] = 1;
            player setclientomnvar("ui_dmz_extract_successful", 2);
        } else {
            player setclientomnvar("ui_dmz_extract_successful", 1);
        }
    }
    waitframe();
    if (function_a6172e49f7313fd8()) {
        player function_6aa0d0467dfd4624(1);
        player function_80c587026fbc6e0d();
    } else {
        player function_f34b9a983ed02221();
        player namespace_feea61bc660e9e0f::function_389d4cd85d174957();
    }
    waitframe();
    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
            function_3f2ab7272697e5b8(player);
        }
    }
    player ob::function_865b1a5a62c49d7(1);
    player callback::callback("exfil_success");
    scripts/mp/gamelogic::processlobbydataforclient(player);
    scripts/mp/scoreboard::processcommonplayerdataforplayer(player);
    processlobbydata();
    player namespace_7177e11e3871c8f4::function_1b6b6e760a1bdd78();
    level.skipplaybodycountsound = 1;
    spawnpoint = spawnstruct();
    spawnpoint.origin = player.exfilpos;
    spawnpoint.angles = player.angles;
    player scripts/mp/playerlogic::removefromalivecount(1);
    scripts/mp/utility/teams::validatealivecount("extract", player.team, player);
    if (isdefined(level.var_4b90dae6c1d817ee) && istrue(level.var_4b90dae6c1d817ee[player.team])) {
        if (isdefined(player.exfilpos)) {
            player scripts/mp/playerlogic::spawnintermission(spawnpoint, undefined, 0);
        } else {
            player scripts/mp/gametypes/br_spectate::spawnintermissionatplayer(player);
        }
    } else {
        player thread scripts/mp/playerlogic::spawnspectator(spawnpoint.origin, spawnpoint.angles, var_1a32758b940764f4);
    }
    var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers();
    var_16e8ded086d83144 = player namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
    if (!isdefined(var_16e8ded086d83144) || var_16e8ded086d83144.size == 0) {
        thread scripts/mp/gametypes/ob::onsquadeliminated(var_c9b69aecc5c631ed, !var_1a32758b940764f4);
    }
    level thread scripts/cp_mp/utility/game_utility::fadetoblackforplayer(player, 0, 1);
    player setclientomnvar("ui_br_squad_eliminated_active", 1);
    player setclientomnvar("ui_round_end_title", game["round_end"]["victory"]);
    player setclientomnvar("ui_round_end_reason", game["end_reason"]["objective_completed"]);
    if (isdefined(player.matchbonus)) {
        player setclientomnvar("ui_round_end_match_bonus", player.matchbonus);
    }
    player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
    if (getdvarint(@"hash_c68e810840841e3a", 0)) {
        player thread function_a7b7a88c16c74042();
    }
    player notify("exfil_fully_completed");
    self notify("exfil_fully_completed");
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5c
// Size: 0x26
function function_a7b7a88c16c74042() {
    self endon("disconnect");
    wait(2);
    namespace_9bb409deb69fb31d::leavesquad(self.team, self.sessionsquadid);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e89
// Size: 0xc
function function_15b6a0884be537b(var_751df20fceaee5) {
    
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9c
// Size: 0xc
function function_7d4d9ab56ec899d4(var_751df20fceaee5) {
    
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eaf
// Size: 0xc
function function_8bde2e5e6f81bef5(var_751df20fceaee5) {
    
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec2
// Size: 0x4b
function processlobbydata() {
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        if (matchmakinggame() && !privatematch()) {
            setclientmatchdata("isPublicMatch", 1);
        } else {
            setclientmatchdata("isPublicMatch", 0);
        }
        sendclientmatchdata();
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f14
// Size: 0x116
function function_30f809c426b6a126() {
    backpacksize = function_1b35b10884bd8d67();
    backpackweapon = function_e2b4c63cab73c1f1();
    weaponslist = self getweaponslistprimaries();
    for (i = 0; i < backpacksize; i++) {
        lootid = function_d870b2c45335bd88(i);
        params = spawnstruct();
        params.lootid = lootid;
        callback::callback("item_exfiled", params);
    }
    foreach (weapon in weaponslist) {
        if (isweapon(weapon)) {
            lootid = weapon::function_89a83ae9a4c4142a(weapon);
            if (isdefined(lootid)) {
                params = spawnstruct();
                params.weapon = weapon;
                params.lootid = lootid;
                callback::callback("weapon_exfiled", params);
            }
        }
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2031
// Size: 0x2a4
function function_f34b9a983ed02221() {
    if (!isdefined(level.var_ee6237adc007b5f5)) {
        function_975c9e149cb01216();
    }
    backpacksize = function_1b35b10884bd8d67();
    backpackweapon = function_e2b4c63cab73c1f1();
    if (isdefined(backpackweapon)) {
        itembundle = function_2c85d7675de2e251(backpackweapon);
        if (isdefined(itembundle)) {
            lootid = function_6d15e119c2779a93(itembundle);
            function_d56bb02626a9d806(lootid);
        }
        if (isdefined(lootid) && lootid) {
            namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, 1);
        }
    }
    weaponslist = self getweaponslistprimaries();
    foreach (weapon in weaponslist) {
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        ref = rootname;
        if (variantid) {
            ref = rootname + "_v" + variantid;
        }
        lootid = function_2c836ad05e5f634c(ref);
        function_d56bb02626a9d806(lootid);
        if (isdefined(lootid) && lootid) {
            namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, 1);
        }
    }
    callbacks = function_cca8bbe88a39ad41("tactical");
    var_c00a346249963f1b = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a346249963f1b[1];
    itembundle = var_c00a346249963f1b[0];
    if (isdefined(itembundle)) {
        lootid = function_6d15e119c2779a93(itembundle);
        function_d56bb02626a9d806(lootid);
    }
    callbacks = function_cca8bbe88a39ad41("lethal");
    var_c00a336249963ce8 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a336249963ce8[1];
    itembundle = var_c00a336249963ce8[0];
    if (isdefined(itembundle)) {
        lootid = function_6d15e119c2779a93(itembundle);
        function_d56bb02626a9d806(lootid);
    }
    callbacks = function_cca8bbe88a39ad41("super");
    var_bffcba6249871e48 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcba6249871e48[1];
    itembundle = var_bffcba6249871e48[0];
    if (isdefined(itembundle)) {
        lootid = function_6d15e119c2779a93(itembundle);
        function_d56bb02626a9d806(lootid);
    }
    callbacks = function_cca8bbe88a39ad41("killstreak");
    var_bffcbb624987207b = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbb624987207b[1];
    itembundle = var_bffcbb624987207b[0];
    if (isdefined(itembundle)) {
        lootid = function_6d15e119c2779a93(itembundle);
        function_d56bb02626a9d806(lootid);
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22dc
// Size: 0x11a
function function_975c9e149cb01216() {
    var_c94ee5d51008bad0 = getscriptbundle("acquisitionlist:acquisition_list_jup_ob");
    if (!isdefined(var_c94ee5d51008bad0)) {
        return;
    }
    level.var_ee6237adc007b5f5 = [];
    level.var_b01c6db5b39665a3 = [];
    foreach (var_f4d29a9e1e5f7dde in var_c94ee5d51008bad0.var_c94ee5d51008bad0) {
        if (!isdefined(var_f4d29a9e1e5f7dde.itembundle)) {
            continue;
        }
        var_9a4ab95b2098db46 = getscriptbundle(var_f4d29a9e1e5f7dde.itembundle);
        var_dda2e1ef1d7c6e0d = function_6d15e119c2779a93(var_9a4ab95b2098db46);
        level.var_b01c6db5b39665a3[var_dda2e1ef1d7c6e0d] = var_9a4ab95b2098db46;
        if (!isdefined(var_9a4ab95b2098db46.var_a7141a24829dc197)) {
            continue;
        }
        var_3a11fa1c67269ca0 = getscriptbundle(var_9a4ab95b2098db46.var_a7141a24829dc197);
        var_6014c760d9adff2f = function_6d15e119c2779a93(var_3a11fa1c67269ca0);
        level.var_ee6237adc007b5f5[var_6014c760d9adff2f] = var_3a11fa1c67269ca0;
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fd
// Size: 0xa7
function function_d56bb02626a9d806(lootid) {
    if (!isdefined(lootid) || lootid < 1) {
        return;
    }
    if (!isdefined(level.var_b01c6db5b39665a3[lootid])) {
        return;
    }
    for (i = 0; i < 10; i++) {
        ownedid = self getplayerdata(level.outbreakdata, "rankedMatchData", "squadMembers", "ownedAcquisitionSetup", i, "lootID");
        if (!isdefined(ownedid) || ownedid == 0) {
            self setplayerdata(level.outbreakdata, "rankedMatchData", "squadMembers", "ownedAcquisitionSetup", i, "lootID", lootid);
            return;
        }
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ab
// Size: 0x20
function function_e2ccdedfebf9e5b1(var_b381b0883bcd4847) {
    activity = self;
    activity namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d2
// Size: 0xe1
function function_a9ef0214509af471() {
    if (!isdefined(level.var_ee6237adc007b5f5)) {
        function_975c9e149cb01216();
    }
    var_7838b9df983ad1ea = [];
    var_e41a3129bc5710b = [];
    var_a91c6541c62b2649 = [];
    for (backpackindex = 0; backpackindex < 10; backpackindex++) {
        lootid = common_inventory::function_d870b2c45335bd88(backpackindex);
        var_7838b9df983ad1ea[var_7838b9df983ad1ea.size] = lootid;
        if (isdefined(lootid) && lootid != 0) {
            itembundle = common_item::function_f4a303d532b044a7(lootid);
            if (isdefined(itembundle) && istrue(itembundle.var_72340ceb276c0f64)) {
                if (itembundle.type == "schematic") {
                    var_a91c6541c62b2649[var_a91c6541c62b2649.size] = lootid;
                    continue;
                }
                if (isdefined(level.var_ee6237adc007b5f5[lootid])) {
                    var_e41a3129bc5710b[var_e41a3129bc5710b.size] = lootid;
                }
            }
        }
    }
    return [var_7838b9df983ad1ea, var_e41a3129bc5710b, var_a91c6541c62b2649];
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25bb
// Size: 0x26d
function function_dd632640ede8012(var_a1fc16d2ea055338) {
    weapons = self getweaponslistall();
    foreach (weapon in weapons) {
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        ref = rootname;
        if (variantid) {
            ref = rootname + "_v" + variantid;
        }
        lootid = function_2c836ad05e5f634c(ref);
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    ref = scripts/mp/equipment::getcurrentequipment("primary");
    if (isdefined(ref)) {
        equipmentammo = scripts/mp/equipment::getequipmentslotammo("primary");
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    ref = scripts/mp/equipment::getcurrentequipment("secondary");
    if (isdefined(ref)) {
        equipmentammo = scripts/mp/equipment::getequipmentslotammo("secondary");
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    ref = scripts/mp/killstreaks/killstreaks::getkillstreakinslot(1);
    if (isdefined(ref)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref.streakname);
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    if (istrue(self.hasplatepouch)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("armor_satchel");
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    if (scripts/cp_mp/gasmask::hasgasmask(self)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("gas_mask");
        var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
    }
    itemname = self.equipment["health"];
    itemcount = scripts/mp/equipment::getequipmentslotammo("health");
    if (isdefined(itemname) && isdefined(itemcount) && itemcount > 0) {
        for (i = 0; i < itemcount; i++) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("armor_plate");
            var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
        }
    }
    if (self.var_bed158a6dfac230d > 1) {
        if (self.var_bed158a6dfac230d == 2) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_plate_carrier_2");
            var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
        } else if (self.var_bed158a6dfac230d == 3) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("brloot_plate_carrier_3");
            var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = lootid;
        }
    }
    return var_a1fc16d2ea055338;
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2830
// Size: 0x233
function function_46f56bf948599140(player, var_a6b3fae0395f75c3) {
    current_team = "unset";
    if (isdefined(player.sessionteam)) {
        current_team = player.sessionteam;
    }
    if (isdefined(player.team)) {
        current_team = player.team;
    }
    var_bffcc06249872b7a = player function_a9ef0214509af471();
    var_a91c6541c62b2649 = var_bffcc06249872b7a[2];
    var_e41a3129bc5710b = var_bffcc06249872b7a[1];
    var_7838b9df983ad1ea = var_bffcc06249872b7a[0];
    str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
    var_a1fc16d2ea055338 = [];
    var_a1fc16d2ea055338 = player function_dd632640ede8012(var_a1fc16d2ea055338);
    data = spawnstruct();
    data.player = player;
    data.current_team = current_team;
    data.x = player.origin[0];
    data.y = player.origin[1];
    data.z = player.origin[2];
    data.xrot = player.angles[0];
    data.yrot = player.angles[1];
    data.zrot = player.angles[2];
    data.matchtimeelapsed = int(getsecondspassed());
    data.extractiontype = "0";
    data.essence_total = player currency::function_15975e20bbd2c824("essence");
    data.backpackitems = var_7838b9df983ad1ea;
    data.acquisitionitems = var_e41a3129bc5710b;
    data.schematicitems = var_a91c6541c62b2649;
    data.loadoutitems = var_a1fc16d2ea055338;
    data.difficulty = str_difficulty;
    data.var_a6b3fae0395f75c3 = var_a6b3fae0395f75c3;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_ob_on_exfil", data);
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6a
// Size: 0x61e
function function_edff661c569fa3bc(player) {
    var_5ef3cbc8ae1f14da = currency::function_2e815a7b6d0bbcf6();
    if (!isdefined(var_5ef3cbc8ae1f14da) || !isdefined(isdefined(var_5ef3cbc8ae1f14da.var_fc0c0e46b333a0af))) {
        player points::doScoreEvent(#"hash_a664e407eb3e39d4", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        return;
    }
    var_38e0c8be67fbe5cc = undefined;
    foreach (conversioninfo in var_5ef3cbc8ae1f14da.var_fc0c0e46b333a0af) {
        if (conversioninfo.currency == %"hash_229c022abe3707c5") {
            var_38e0c8be67fbe5cc = conversioninfo;
            break;
        }
    }
    /#
        assertex(isdefined(var_38e0c8be67fbe5cc), "OB requires a currency value to XP conversion for the essence currency");
    #/
    var_bbf3fc2b4554bbf5 = 0;
    miscitemcount = player armor::function_600f6cf462e983f();
    var_f4dc9a7cc7dad020 = player currency::function_15975e20bbd2c824("essence");
    for (backpackindex = 0; backpackindex < player function_1b35b10884bd8d67(); backpackindex = backpackindex + 1) {
        lootid = player common_inventory::function_d870b2c45335bd88(backpackindex);
        if (!isdefined(lootid) || lootid == 0) {
            continue;
        }
        quantity = player common_inventory::function_5ce7fe3dca9c1a22(backpackindex);
        if (!isdefined(quantity) || quantity == 0) {
            continue;
        }
        bundle = common_item::function_f4a303d532b044a7(lootid);
        if (!isdefined(bundle) || !isdefined(bundle.ref)) {
            continue;
        }
        valueinfo = currency::function_3321003104b9507e(bundle.ref);
        if (isdefined(valueinfo) && isdefined(valueinfo.value)) {
            var_f4dc9a7cc7dad020 = var_f4dc9a7cc7dad020 + quantity * valueinfo.value;
            continue;
        }
        if (bundle.type == "schematic") {
            var_bbf3fc2b4554bbf5 = var_bbf3fc2b4554bbf5 + 1;
            continue;
        }
        if (!istrue(bundle.var_72340ceb276c0f64)) {
            miscitemcount = miscitemcount + (istrue(bundle.var_ec7430d9ed0b6e64) ? 1 : quantity);
        }
    }
    raritycount = 0;
    var_20a42653a534a1d8 = 0;
    packapunchcount = 0;
    wonderweaponcount = 0;
    primaryweaponobj = player common_item::function_2aeaf88105d3b617(0);
    if (isdefined(primaryweaponobj)) {
        if (weapon::iswonderweapon(primaryweaponobj)) {
            wonderweaponcount = wonderweaponcount + 1;
        } else {
            raritycount = raritycount + player namespace_736197e4d378b91b::function_75e73212bbe447d9(primaryweaponobj);
            packapunchcount = packapunchcount + player pack_a_punch::get_pap_level(primaryweaponobj);
            if (player ammo_mod::has_ammo_mod(primaryweaponobj)) {
                var_20a42653a534a1d8 = var_20a42653a534a1d8 + 1;
            }
        }
    }
    secondaryweaponobj = player common_item::function_2aeaf88105d3b617(1);
    if (isdefined(secondaryweaponobj)) {
        if (weapon::iswonderweapon(secondaryweaponobj)) {
            wonderweaponcount = wonderweaponcount + 1;
        } else {
            raritycount = raritycount + player namespace_736197e4d378b91b::function_75e73212bbe447d9(secondaryweaponobj);
            packapunchcount = packapunchcount + player pack_a_punch::get_pap_level(secondaryweaponobj);
            if (player ammo_mod::has_ammo_mod(secondaryweaponobj)) {
                var_20a42653a534a1d8 = var_20a42653a534a1d8 + 1;
            }
        }
    }
    activeperks = player zombie_perks::function_ad6e85c9533ac466();
    var_e476b408a8fec2e8 = activeperks.size;
    extractionxp = rank::getscoreinfoxp(#"hash_a664e407eb3e39d4");
    schematicxp = var_bbf3fc2b4554bbf5 * (isdefined(var_5ef3cbc8ae1f14da.schematicsxp) ? var_5ef3cbc8ae1f14da.schematicsxp : 0);
    var_80fdaf4b8fdc36d6 = miscitemcount * (isdefined(var_5ef3cbc8ae1f14da.miscXp) ? var_5ef3cbc8ae1f14da.miscXp : 0);
    rarityxp = raritycount * (isdefined(var_5ef3cbc8ae1f14da.rarityxp) ? var_5ef3cbc8ae1f14da.rarityxp : 0);
    ammomodxp = var_20a42653a534a1d8 * (isdefined(var_5ef3cbc8ae1f14da.ammomodxp) ? var_5ef3cbc8ae1f14da.ammomodxp : 0);
    packapunchxp = packapunchcount * (isdefined(var_5ef3cbc8ae1f14da.packapunchxp) ? var_5ef3cbc8ae1f14da.packapunchxp : 0);
    wonderweaponxp = wonderweaponcount * (isdefined(var_5ef3cbc8ae1f14da.wonderweaponxp) ? var_5ef3cbc8ae1f14da.wonderweaponxp : 0);
    perkacolaxp = var_e476b408a8fec2e8 * (isdefined(var_5ef3cbc8ae1f14da.perkacolaxp) ? var_5ef3cbc8ae1f14da.perkacolaxp : 0);
    essencexp = var_f4dc9a7cc7dad020 * (isdefined(var_38e0c8be67fbe5cc.ratio) ? var_38e0c8be67fbe5cc.ratio : 0);
    if (isdefined(var_38e0c8be67fbe5cc.max) && var_38e0c8be67fbe5cc.max != 0) {
        essencexp = int(min(essencexp, var_38e0c8be67fbe5cc.max));
    }
    player.var_520e914889cda77e = rarityxp + ammomodxp + packapunchxp;
    player points::doScoreEvent(#"hash_a664e407eb3e39d4", undefined, undefined, extractionxp + schematicxp + var_80fdaf4b8fdc36d6 + player.var_520e914889cda77e + wonderweaponxp + perkacolaxp + essencexp, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    player.var_e7faf08f327b0fb5 = int(var_f4dc9a7cc7dad020 * getdvarfloat(@"hash_eb99be1539a07c71", 0.1));
    if (namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
        for (i = 0; i < 3; i = i + 1) {
            player namespace_9571f642f38c8169::function_874d25a7167d2051(5, i, player.var_e7faf08f327b0fb5);
        }
        for (i = 0; i < 3; i = i + 1) {
            player namespace_9571f642f38c8169::function_874d25a7167d2051(6, i, player.var_e7faf08f327b0fb5);
        }
        if (getdvarint(@"hash_b0b8d806784726d0", 1)) {
            for (i = 0; i < 25; i = i + 1) {
                player namespace_9571f642f38c8169::function_874d25a7167d2051(11, i, player.var_e7faf08f327b0fb5);
            }
        }
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x308f
// Size: 0x19
function private function_7bfb1ccacdacfd26() {
    if (getdvarint(@"hash_4a06c2e18a26d17f", 0)) {
        return true;
    }
    return false;
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b0
// Size: 0xe5
function function_e229d89e0c38206d(players, playlistid) {
    if (function_7bfb1ccacdacfd26()) {
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            player callback::callback("map_to_map_transition");
            player.var_ded04cdd264a7e00 = 1;
            player.var_e763169cf4dfd7b2 = spawnstruct();
            if (namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
                player namespace_9571f642f38c8169::function_6aa0d0467dfd4624(1);
                player namespace_9571f642f38c8169::function_80c587026fbc6e0d();
            }
            logstring("quest exfil MapToMapMatchmaking called for player " + player.name + " entnum " + player getentitynumber() + " playlistID: " + playlistid);
        }
        function_d296788a307d5162(players, playlistid);
    }
}

// Namespace ob_exfil / namespace_cddd3ad399b210ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x319c
// Size: 0x37
function function_9487b6b2ba44f9db(player) {
    if (istrue(player.var_ded04cdd264a7e00)) {
        return true;
    }
    /#
        if (getdvarint(@"hash_f68809e89102fb57", 0)) {
            return true;
        }
    #/
    return false;
}

