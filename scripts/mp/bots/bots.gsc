// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_killstreaks.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\flags.gsc;
#using script_3f8889c16399185c;
#using script_3bdadfff7554ceba;
#using scripts\mp\bots\bots_gametype_war.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\hostmigration.gsc;
#using script_4c9bd9a3bf3f8cf7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\menus.gsc;
#using script_72af5a878a9d3397;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\dev.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\door.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\trace.gsc;

#namespace bots;

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc16
// Size: 0xbc
function main() {
    if (isdefined(level.createfx_enabled) && level.createfx_enabled) {
        return;
    }
    if (getdvarint(@"hash_e6afce2cf5cf7515")) {
        return;
    }
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    namespace_2c19af30dc7a566c::init();
    setup_callbacks();
    setup_personalities();
    level.badplace_cylinder_func = &badplace_cylinder;
    level.badplace_delete_func = &badplace_delete;
    if (isdefined(level.bot_killstreak_setup_func)) {
        [[ level.bot_killstreak_setup_func ]]();
    } else {
        bot_killstreak_setup();
    }
    level thread init();
    level.var_33463503caca4795 = 1;
    level.var_3342bd64cdf4b028 = 1;
    /#
        thread function_dc85300e25bf3deb();
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd9
// Size: 0x9b
function function_dc85300e25bf3deb() {
    /#
        level endon("bot_think_tactical_goals");
        while (getdvarint(@"hash_d46f7bf3970382f9") == 0) {
            wait(1);
        }
        while (1) {
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
            if (getdvarint(@"hash_d46f7bf3970382f9") != 0 && isdefined(level.players) && isdefined(level.players[0])) {
                function_d59ab5740c283ae3(level.players[0].origin);
            }
            wait(0.05);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd7b
// Size: 0x1b2
function draw_box(pos, color, angles, size, alpha, depthtest) {
    /#
        if (!isdefined(size)) {
            size = 32;
        }
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        forward = anglestoforward(angles);
        right = anglestoright(angles);
        up = anglestoup(angles);
        start = pos + forward * size * 0.5;
        start = start + right * size * 0.5;
        points = [];
        points[points.size] = start;
        points[points.size] = points[points.size - 1] + forward * size * -1;
        points[points.size] = points[points.size - 1] + right * size * -1;
        points[points.size] = points[points.size - 1] + forward * size;
        offset = size * up;
        for (i = 0; i < points.size; i++) {
            line(points[i], points[i] + offset, color, alpha, depthtest);
            if (i == points.size - 1) {
                line(points[i], points[0], color, alpha, depthtest);
                line(points[i] + offset, points[0] + offset, color, alpha, depthtest);
            } else {
                line(points[i], points[i + 1], color, alpha, depthtest);
                line(points[i] + offset, points[i + 1] + offset, color, alpha, depthtest);
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf34
// Size: 0x57
function function_5dc3e3b6874be148(pos, color, angles, size, alpha, depthtest) {
    /#
        pos = (pos[0], pos[1], pos[2] - size / 2);
        draw_box(pos, color, angles, size, alpha, depthtest);
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf92
// Size: 0x204
function function_bcc5e2c3e16c7934(var_65aa68f5910e096) {
    /#
        var_d9d64c0994a5a7f6 = 0;
        var_ee8eede6b32d80ab = getclosestpointonnavmesh(self.origin);
        if (abs(var_ee8eede6b32d80ab[2] - self.origin[2]) > 32 || distance2d(var_ee8eede6b32d80ab, self.origin) > 32) {
            var_d9d64c0994a5a7f6 = 1;
        }
        endnode = undefined;
        if (isdefined(self.target)) {
            endnode = getnode(self.target, "iw9_me_knife");
        }
        if (isdefined(endnode)) {
            var_ee8eede6b32d80ab = getclosestpointonnavmesh(self.origin);
            if (abs(var_ee8eede6b32d80ab[2] - self.origin[2]) > 32 || distance2d(var_ee8eede6b32d80ab, self.origin) > 32) {
                var_d9d64c0994a5a7f6 = 1;
            }
        }
        if (istrue(var_65aa68f5910e096) && !var_d9d64c0994a5a7f6) {
            return;
        }
        color = (0, 1, 0);
        if (var_d9d64c0994a5a7f6) {
            print3d(self.origin + (0, 0, 32), self.animscript + "game_ended", (1, 0, 0), 1);
            color = (1, 0, 0);
        } else {
            print3d(self.origin + (0, 0, 32), self.animscript, (1, 1, 1), 1);
        }
        function_5dc3e3b6874be148(self.origin, color, (0, 0, 0), 32, 1, 0);
        if (isdefined(endnode)) {
            line(self.origin, endnode.origin, color, 1, 0);
            function_5dc3e3b6874be148(endnode.origin, (0.5, 0.5, 0.5), (0, 0, 0), 32, 1, 1);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119d
// Size: 0xe3
function function_d59ab5740c283ae3(origin) {
    /#
        var_fb2fb6eb30927421 = getdvarint(@"hash_d46f7bf3970382f9");
        var_65aa68f5910e096 = 0;
        if (var_fb2fb6eb30927421 == -1) {
            var_65aa68f5910e096 = 1;
        }
        var_f04e715a0d2ee220 = getnodecount();
        for (i = 0; i < var_f04e715a0d2ee220; i++) {
            node = getnodebyindex(i);
            if (!isdefined(node)) {
                continue;
            }
            if (var_fb2fb6eb30927421 != 1 && !var_65aa68f5910e096) {
                dist = distance(node.origin, origin);
                jumpiffalse(dist > var_fb2fb6eb30927421) LOC_000000aa;
            } else {
            LOC_000000aa:
                if (!isdefined(node.animscript) || node.animscript == "class_select") {
                    continue;
                }
                node function_bcc5e2c3e16c7934(var_65aa68f5910e096);
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1287
// Size: 0x32b
function setup_callbacks() {
    level.bot_funcs = [];
    level.bot_funcs["bots_spawn"] = &spawn_bots;
    level.bot_funcs["bots_add_scavenger_bag"] = &bot_add_scavenger_bag;
    level.bot_funcs["bots_add_to_level_targets"] = &bot_add_to_bot_level_targets;
    level.bot_funcs["bots_remove_from_level_targets"] = &bot_remove_from_bot_level_targets;
    level.bot_funcs["think"] = &bot_think;
    level.bot_funcs["on_killed"] = &on_bot_killed;
    level.bot_funcs["should_do_killcam"] = &bot_should_do_killcam;
    level.bot_funcs["get_attacker_ent"] = &bot_get_known_attacker;
    level.bot_funcs["should_pickup_weapons"] = &bot_should_pickup_weapons;
    level.bot_funcs["on_damaged"] = &bot_damage_callback;
    level.bot_funcs["gametype_think"] = &default_gametype_think;
    level.bot_funcs["leader_dialog"] = &bot_leader_dialog;
    level.bot_funcs["player_spawned"] = &bot_player_spawned;
    level.bot_funcs["should_start_cautious_approach"] = &should_start_cautious_approach_default;
    level.bot_funcs["know_enemies_on_start"] = &bot_know_enemies_on_start;
    level.bot_funcs["bot_get_rank_xp"] = &bot_get_rank_xp;
    level.bot_funcs["ai_3d_sighting_model"] = &bot_3d_sighting_model;
    level.bot_funcs["dropped_weapon_think"] = &bot_think_seek_dropped_weapons;
    level.bot_funcs["dropped_weapon_cancel"] = &should_stop_seeking_weapon;
    level.bot_funcs["crate_can_use"] = &crate_can_use_always;
    level.bot_funcs["crate_low_ammo_check"] = &crate_low_ammo_check;
    level.bot_funcs["crate_should_claim"] = &crate_should_claim;
    level.bot_funcs["crate_wait_use"] = &crate_wait_use;
    level.bot_funcs["crate_in_range"] = &crate_in_range;
    level.bot_funcs["post_teleport"] = &bot_post_teleport;
    level.bot_funcs["bot_set_difficulty"] = &namespace_c52269d70f989750::bot_set_difficulty;
    level.bot_funcs["bot_set_personality"] = &namespace_c52269d70f989750::bot_set_personality;
    level.bot_funcs["bot_think_watch_enemy"] = &bot_think_watch_enemy;
    level.bot_funcs["bot_think_tactical_goals"] = &namespace_53c9077460dd0cb1::bot_think_tactical_goals;
    level.bot_funcs["bot_bots_enabled_or_added"] = &namespace_c52269d70f989750::bot_bots_enabled_or_added;
    level.bot_funcs["revive_think"] = &bot_think_revive;
    level.bot_random_path_function = &bot_random_path_default;
    level.bot_find_defend_node_func["capture"] = &find_defend_node_capture;
    level.bot_find_defend_node_func["capture_zone"] = &find_defend_node_capture_zone;
    level.bot_find_defend_node_func["protect"] = &find_defend_node_protect;
    level.bot_find_defend_node_func["protect_zone"] = &find_defend_node_protect_zone;
    level.bot_find_defend_node_func["bodyguard"] = &find_defend_node_bodyguard;
    level.bot_find_defend_node_func["patrol"] = &find_defend_node_patrol;
    namespace_52715711bf01a187::setup_callbacks();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b9
// Size: 0x4a
function codecallback_leaderdialog(dialog, location) {
    if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["leader_dialog"])) {
        self [[ level.bot_funcs["leader_dialog"] ]](dialog, location);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160a
// Size: 0x8d
function init() {
    if (getdvarint(@"hash_abe45e35ef030a56") == 0) {
        thread monitor_smoke_grenades();
    }
    thread bot_triggers();
    initbotlevelvariables();
    /#
        level thread function_cfe352958059570a();
        level thread function_13012f2ebb78e1ab();
        level thread function_fbc3db3d21bb0677();
        level thread function_361fab20102e6557();
        level thread function_c71139dd1c600b64();
        level thread function_8c79a04b049a7ea2();
    #/
    if (!shouldspawnbots()) {
        return;
    }
    refresh_existing_bots();
    setmatchdata("hasBots", 1);
    level thread bot_connect_monitor();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169e
// Size: 0xca
function initbotlevelvariables() {
    if (!isdefined(level.crateownerusetime)) {
        level.crateownerusetime = 500;
    }
    if (!isdefined(level.cratenonownerusetime)) {
        level.cratenonownerusetime = 3000;
    }
    level.bot_out_of_combat_time = 3000;
    level.bot_respawn_launcher_name = "iw6_panzerfaust3";
    level.bot_fallback_weapon = "iw9_me_knife";
    level.zonecount = getzonecount();
    level.bot_light_volumes = getentarray("bot_light_area", "targetname");
    level.bot_dark_volumes = getentarray("bot_dark_area", "targetname");
    initbotmapextents();
    level.bot_variables_initialized = 1;
    createthreatbiasgroup("Bots");
    setthreatbias("Killstreak_Static", "Bots", -200);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176f
// Size: 0x22c
function initbotmapextents() {
    if (isdefined(level.teleportgetactivenodesfunc)) {
        var_c6736586ae30f7ea = [[ level.teleportgetactivenodesfunc ]]();
        level.bot_map_min_x = 0;
        level.bot_map_max_x = 0;
        level.bot_map_min_y = 0;
        level.bot_map_max_y = 0;
        level.bot_map_min_z = 0;
        level.bot_map_max_z = 0;
        if (var_c6736586ae30f7ea.size > 1) {
            level.bot_map_min_x = var_c6736586ae30f7ea[0].origin[0];
            level.bot_map_max_x = var_c6736586ae30f7ea[0].origin[0];
            level.bot_map_min_y = var_c6736586ae30f7ea[0].origin[1];
            level.bot_map_max_y = var_c6736586ae30f7ea[0].origin[1];
            level.bot_map_min_z = var_c6736586ae30f7ea[0].origin[2];
            level.bot_map_max_z = var_c6736586ae30f7ea[0].origin[2];
            for (i = 1; i < var_c6736586ae30f7ea.size; i++) {
                var_ca5534a90f13a4d4 = var_c6736586ae30f7ea[i].origin;
                if (var_ca5534a90f13a4d4[0] < level.bot_map_min_x) {
                    level.bot_map_min_x = var_ca5534a90f13a4d4[0];
                }
                if (var_ca5534a90f13a4d4[0] > level.bot_map_max_x) {
                    level.bot_map_max_x = var_ca5534a90f13a4d4[0];
                }
                if (var_ca5534a90f13a4d4[1] < level.bot_map_min_y) {
                    level.bot_map_min_y = var_ca5534a90f13a4d4[1];
                }
                if (var_ca5534a90f13a4d4[1] > level.bot_map_max_y) {
                    level.bot_map_max_y = var_ca5534a90f13a4d4[1];
                }
                if (var_ca5534a90f13a4d4[2] < level.bot_map_min_z) {
                    level.bot_map_min_z = var_ca5534a90f13a4d4[2];
                }
                if (var_ca5534a90f13a4d4[2] > level.bot_map_max_z) {
                    level.bot_map_max_z = var_ca5534a90f13a4d4[2];
                }
            }
        }
        level.bot_map_center = ((level.bot_map_min_x + level.bot_map_max_x) / 2, (level.bot_map_min_y + level.bot_map_max_y) / 2, (level.bot_map_min_z + level.bot_map_max_z) / 2);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a2
// Size: 0x29
function bot_post_teleport() {
    level.bot_variables_initialized = undefined;
    level.bot_initialized_remote_vehicles = undefined;
    initbotmapextents();
    level.bot_variables_initialized = 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d2
// Size: 0x5
function shouldspawnbots() {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19df
// Size: 0xaf
function refresh_existing_bots() {
    wait(1);
    foreach (player in level.players) {
        if (isbot(player)) {
            if (isalive(player)) {
                player.equipment_enabled = 1;
                player.bot_team = player.team;
                player.bot_spawned_this_round = 1;
                player thread [[ level.bot_funcs["think"] ]]();
                continue;
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a95
// Size: 0xe4
function function_cfe352958059570a() {
    /#
        level endon("bot_think_tactical_goals");
        setdevdvarifuninitialized(@"hash_f4c99c3f45339d3f", "class_select");
        while (1) {
            value = getdvar(@"hash_f4c99c3f45339d3f");
            if (value == "luinotifyserver") {
                setdevdvar(@"hash_f4c99c3f45339d3f", "class_select");
                var_7cd7a1678123ea91 = getdvarint(@"hash_d1ce2062f6b1971e");
                var_4155625a9c67e873 = getdvarint(@"hash_f6a053d208e8b550");
                setdvar(@"hash_d1ce2062f6b1971e", 0);
                setdvar(@"hash_f6a053d208e8b550", 0);
                wait(3);
                setdvar(@"hash_d1ce2062f6b1971e", var_7cd7a1678123ea91);
                setdvar(@"hash_f6a053d208e8b550", var_4155625a9c67e873);
                wait(3);
            }
            wait(0.05);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b80
// Size: 0x2b1
function function_13012f2ebb78e1ab() {
    /#
        level endon("bot_think_tactical_goals");
        setdevdvarifuninitialized(@"hash_57843b1c39f06368", "class_select");
        setdevdvarifuninitialized(@"hash_f7fec3f23eed8a03", 17);
        setdevdvarifuninitialized(@"hash_c45117ed6fbd7c31", 6);
        setdevdvarifuninitialized(@"hash_120407f488061ef3", 180);
        wait(8);
        while (1) {
            if (getdvarint(@"hash_57843b1c39f06368")) {
                bots = [];
                foreach (player in level.players) {
                    if (isdefined(player.connected) && player.connected && isbot(player)) {
                        bots[bots.size] = player;
                    }
                }
                var_53f4c70f8f3cb47a = getdvarint(@"hash_f7fec3f23eed8a03") - bots.size;
                setdvar(@"hash_3afcd248bf1a9cc1", var_53f4c70f8f3cb47a);
                var_b318e813255366ef = getdvarfloat(@"hash_c45117ed6fbd7c31");
                if (var_b318e813255366ef < 6) {
                    var_b318e813255366ef = 6;
                }
                var_a10cf459a45a646d = getdvarfloat(@"hash_120407f488061ef3");
                if (var_a10cf459a45a646d <= var_b318e813255366ef) {
                    var_a10cf459a45a646d = var_b318e813255366ef + 0.05;
                }
                time_to_wait = randomfloatrange(var_b318e813255366ef, var_a10cf459a45a646d);
                var_3e7539402ee4d0f1 = 0;
                while (var_3e7539402ee4d0f1 < time_to_wait && getdvarint(@"hash_57843b1c39f06368")) {
                    wait(0.5);
                    var_3e7539402ee4d0f1 = var_3e7539402ee4d0f1 + 0.5;
                }
                bots = [];
                foreach (player in level.players) {
                    if (isdefined(player.connected) && player.connected && isbot(player)) {
                        bots[bots.size] = player;
                    }
                }
                bots = array_randomize(bots);
                if (!getdvarint(@"hash_57843b1c39f06368")) {
                    var_64a2360a43f43d71 = bots.size - 1;
                } else {
                    var_64a2360a43f43d71 = randomint(bots.size);
                }
                for (i = 0; i <= var_64a2360a43f43d71; i++) {
                    bots[i] thread bot_drop();
                }
                wait(5);
            } else {
                wait(0.5);
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e38
// Size: 0x1b5
function function_fbc3db3d21bb0677() {
    /#
        level endon("bot_think_tactical_goals");
        while (!bot_bots_enabled_or_added()) {
            wait(1);
        }
        level.var_3d7b4a188d5de49e = [];
        for (i = 0; i < 10; i++) {
            level.var_3d7b4a188d5de49e[level.var_3d7b4a188d5de49e.size] = spawnstruct();
        }
        level.var_d65b83156825b08c = 0;
        setdevdvarifuninitialized(@"hash_886b3374b1579604", "class_select");
        for (;;) {
            for (;;) {
                if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                    wait(0.05);
                    continue;
                }
                var_f52bbde72992fec0 = getdvar(@"hash_2113a3b9387cd9f0");
                function_3b9730a04944204();
                if (var_f52bbde72992fec0 == "") {
                    function_16dc1bd6b6c0bc76();
                } else if (var_f52bbde72992fec0 == "bots") {
                    function_7403595c45dccd77();
                } else if (var_f52bbde72992fec0 == "spawned_player") {
                    function_16dc1bd6b6c0bc76();
                    function_7403595c45dccd77();
                } else if (var_f52bbde72992fec0 == "player" || var_f52bbde72992fec0 == "dropped_weapon") {
                    function_cabafea737e3a024(var_f52bbde72992fec0 == "player");
                } else if (var_f52bbde72992fec0 == "tactical_revive_override") {
                    function_d862b7eae98dfc13();
                }
                if (getdvar(@"hash_886b3374b1579604") != "class_select" && level.gametype == "trigger") {
                    setdevdvar(@"hash_886b3374b1579604", "class_select");
                    human = function_35d942f93b6a3cfe()[0];
                    if (isalive(human) && human.team != "disable_movement") {
                        level.var_e6522d43cff255f2 = human.origin;
                    }
                }
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff4
// Size: 0x86
function function_3b9730a04944204() {
    /#
        for (i = 0; i < level.var_d65b83156825b08c; i++) {
            struct = level.var_3d7b4a188d5de49e[i];
            if (isdefined(struct.var_e72915c4603e11e4) && struct.var_e72915c4603e11e4.classname != "<unknown string>") {
                botdebugdrawtrigger(0, struct.var_e72915c4603e11e4);
            }
        }
        level.var_d65b83156825b08c = 0;
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2081
// Size: 0x7db
function function_16dc1bd6b6c0bc76() {
    /#
        /#
            assert(level.var_d65b83156825b08c == 0);
        #/
        foreach (player in level.participants) {
            if (!isdefined(player.team)) {
                continue;
            }
            if (player.health > 0 && isai(player) && player bot_is_defending()) {
                var_c54a6a4164e65b87 = undefined;
                for (i = 0; i < level.var_d65b83156825b08c; i++) {
                    struct = level.var_3d7b4a188d5de49e[i];
                    var_92f6621ac1937d99 = struct.var_89c86e7d10c8ade0 == player.bot_defending_type;
                    var_c88166399eb8890f = isdefined(struct.var_5a3fa171f3e8949e) && isdefined(player.bot_defending_radius) && struct.var_5a3fa171f3e8949e == player.bot_defending_radius;
                    var_57b6c8a85ada07f7 = isdefined(struct.var_e72915c4603e11e4) && isdefined(player.bot_defending_trigger) && struct.var_e72915c4603e11e4 == player.bot_defending_trigger;
                    if (var_92f6621ac1937d99 && (var_c88166399eb8890f || var_57b6c8a85ada07f7)) {
                        if (bot_vectors_are_equal(struct.var_bfe91fc610bd0ed1, player.bot_defending_center)) {
                            var_c54a6a4164e65b87 = struct;
                            break;
                        }
                    }
                }
                if (isdefined(var_c54a6a4164e65b87)) {
                    if (var_c54a6a4164e65b87.var_c52e1e7d3cd357f1 != player.team) {
                        var_c54a6a4164e65b87.var_bef7798fc2c56363 = (1, 0, 1);
                    }
                    var_c54a6a4164e65b87.bots = array_add(var_c54a6a4164e65b87.bots, player);
                } else {
                    var_f5ba03ba3a641936 = level.var_3d7b4a188d5de49e[level.var_d65b83156825b08c];
                    level.var_d65b83156825b08c++;
                    if (player.team == "<unknown string>") {
                        var_f5ba03ba3a641936.var_bef7798fc2c56363 = (0, 0, 1);
                    } else if (player.team == "<unknown string>") {
                        var_f5ba03ba3a641936.var_bef7798fc2c56363 = (1, 0, 0);
                    }
                    var_f5ba03ba3a641936.var_c52e1e7d3cd357f1 = player.team;
                    var_f5ba03ba3a641936.var_89c86e7d10c8ade0 = player.bot_defending_type;
                    var_f5ba03ba3a641936.var_5a3fa171f3e8949e = player.bot_defending_radius;
                    var_f5ba03ba3a641936.var_e72915c4603e11e4 = player.bot_defending_trigger;
                    var_f5ba03ba3a641936.var_bfe91fc610bd0ed1 = player.bot_defending_center;
                    var_f5ba03ba3a641936.var_971a7e1177116065 = player.bot_defending_nodes;
                    var_f5ba03ba3a641936.bots = [];
                    var_f5ba03ba3a641936.bots = array_add(var_f5ba03ba3a641936.bots, player);
                }
            }
        }
        var_f41212488bbec5cd = [];
        for (i = 0; i < level.var_d65b83156825b08c; i++) {
            struct = level.var_3d7b4a188d5de49e[i];
            if (isdefined(struct.var_971a7e1177116065)) {
                foreach (node in struct.var_971a7e1177116065) {
                    bot_draw_cylinder(node.origin, 10, 10, 0.05, undefined, struct.var_bef7798fc2c56363, 1, 4);
                }
            }
            if (isdefined(struct.var_e72915c4603e11e4)) {
                if (struct.var_e72915c4603e11e4.classname != "<unknown string>") {
                    botdebugdrawtrigger(1, struct.var_e72915c4603e11e4, struct.var_bef7798fc2c56363, 1);
                } else {
                    bot_draw_cylinder(struct.var_bfe91fc610bd0ed1, struct.var_e72915c4603e11e4.radius, struct.var_e72915c4603e11e4.height, 0.05, undefined, struct.var_bef7798fc2c56363, 1);
                }
            }
            if (isdefined(struct.var_5a3fa171f3e8949e)) {
                bot_draw_cylinder(struct.var_bfe91fc610bd0ed1, struct.var_5a3fa171f3e8949e, 75, 0.05, undefined, struct.var_bef7798fc2c56363, 1);
            }
            foreach (bot in struct.bots) {
                line_color = undefined;
                if (bot.team == "<unknown string>") {
                    line_color = (0, 0, 1);
                } else if (bot.team == "<unknown string>") {
                    line_color = (1, 0, 0);
                }
                lineend = bot.origin + (0, 0, 25);
                if (isdefined(struct.var_bfe91fc610bd0ed1)) {
                    linestart = struct.var_bfe91fc610bd0ed1 + (0, 0, 25);
                    line(linestart, lineend, line_color, 1, 1, 1);
                }
                if (isdefined(bot.bot_defending_override_origin_node)) {
                    var_4a775464ae4eabc0 = (max(line_color[0], 0.3), max(line_color[1], 0.3), max(line_color[2], 0.3));
                    line(bot.bot_defending_override_origin_node.origin, lineend, var_4a775464ae4eabc0, 1, 1, 1);
                    var_d526945f82690b9d = undefined;
                    foreach (var_4e6cf23076d4ce18 in var_f41212488bbec5cd) {
                        if (var_4e6cf23076d4ce18.node == bot.bot_defending_override_origin_node) {
                            var_d526945f82690b9d = var_4e6cf23076d4ce18;
                        }
                    }
                    if (isdefined(var_d526945f82690b9d)) {
                        if (var_d526945f82690b9d.team != bot.team) {
                            var_d526945f82690b9d.color = (1, 0.3, 1);
                        }
                    } else {
                        var_1f57a365cc453f38 = spawnstruct();
                        var_1f57a365cc453f38.node = bot.bot_defending_override_origin_node;
                        var_1f57a365cc453f38.team = bot.team;
                        var_1f57a365cc453f38.color = var_4a775464ae4eabc0;
                        var_f41212488bbec5cd[var_f41212488bbec5cd.size] = var_1f57a365cc453f38;
                    }
                }
            }
        }
        foreach (struct in var_f41212488bbec5cd) {
            bot_draw_cylinder(struct.node.origin, 7.5, 10, 0.05, undefined, struct.color, 1, 4);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2863
// Size: 0x37c
function function_7403595c45dccd77() {
    /#
        foreach (player in level.participants) {
            if (player.health > 0 && isai(player) && isdefined(player.watch_nodes)) {
                var_66b46cc5042b4175 = (0, 0, player getplayerviewheight());
                foreach (node in player.watch_nodes) {
                    watch_node_chance = node.watch_node_chance[player.entity_number];
                    var_95b639563ed7f85f = (1 - watch_node_chance, 1, 1 - watch_node_chance);
                    if (watch_node_chance <= 0.05) {
                        alpha = 0.1;
                        bot_draw_cylinder(node.origin + (0, 0, 30), 10, 10, 0.05, undefined, var_95b639563ed7f85f, 1, 8, alpha);
                    } else {
                        alpha = 1;
                        bot_draw_cylinder(node.origin + (0, 0, 30), 10, 10, 0.05, undefined, var_95b639563ed7f85f, 1, 4, alpha);
                    }
                    line(player.origin + var_66b46cc5042b4175, node.origin + (0, 0, 35), var_95b639563ed7f85f, alpha, 1, 1);
                    if (isdefined(node.var_b0429a1dfba19038)) {
                        print3d(node.origin, int(node.var_b0429a1dfba19038[player.team]), (0, 0, 1), alpha, 1.1);
                        print3d(node.origin + (0, 0, 10), int(node.var_b0429a1dfba19038[getotherteam(player.team)]), (1, 0, 0), alpha, 1.1);
                    }
                }
                if (isdefined(player.var_bfc743b5b4029ae3)) {
                    offset = (0, 0, 60);
                    playerstance = player getstance();
                    if (playerstance == "<unknown string>") {
                        offset = (0, 0, 40);
                    } else if (playerstance == "<unknown string>") {
                        offset = (0, 0, 11);
                    }
                    print3d(player.origin + offset, int(player.var_bfc743b5b4029ae3[player.team]), (0, 0, 1), 1, 1.1);
                    print3d(player.origin + offset + (0, 0, 10), int(player.var_bfc743b5b4029ae3[getotherteam(player.team)]), (1, 0, 0), 1, 1.1);
                }
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2be6
// Size: 0x2cc
function function_cabafea737e3a024(var_2f4e4b921733b189) {
    /#
        if (!isdefined(level.entrance_indices) || !isdefined(level.entrance_points)) {
            return;
        }
        var_66b46cc5042b4175 = (0, 0, 11);
        var_a39946ce0ae0bf5 = (0, 0, 55);
        var_a2106b5d045f6d6d = (0, 0, 40);
        var_9a0552027241e9d = (0, 0, 15);
        var_c531a6aa175eb24b = (0, 1, 0);
        var_af1aede5178be415 = (1, 0, 0);
        var_736b8f08656c7cbd = var_c531a6aa175eb24b;
        var_39f2bf7b185b408f = var_af1aede5178be415;
        var_cd14fc7af6a7c061 = 13;
        for (i = 0; i < level.entrance_indices.size; i++) {
            if (level.entrance_indices.size > 5) {
                var_9bcbffa52ef127db = i % 5 * 50 / 256;
                var_736b8f08656c7cbd = (var_c531a6aa175eb24b[0] + var_9bcbffa52ef127db, var_c531a6aa175eb24b[1], var_c531a6aa175eb24b[2] + var_9bcbffa52ef127db);
                var_39f2bf7b185b408f = (var_af1aede5178be415[0], var_af1aede5178be415[1] + var_9bcbffa52ef127db, var_af1aede5178be415[2] + var_9bcbffa52ef127db);
            }
            var_59fe947bedc89f84 = level.entrance_points[level.entrance_indices[i]];
            for (j = 0; j < var_59fe947bedc89f84.size; j++) {
                bot_draw_cylinder(var_59fe947bedc89f84[j].origin + var_66b46cc5042b4175, 10, var_cd14fc7af6a7c061, 0.05, undefined, var_736b8f08656c7cbd, 1, 4);
                line(level.entrance_origin_points[i] + var_a39946ce0ae0bf5, var_59fe947bedc89f84[j].origin + var_66b46cc5042b4175 + (0, 0, var_cd14fc7af6a7c061 / 2), var_736b8f08656c7cbd, 1, 1, 1);
                if (var_2f4e4b921733b189) {
                    var_aa19f0e10be1075c = var_39f2bf7b185b408f;
                    if (var_59fe947bedc89f84[j].crouch_visible_from[level.entrance_indices[i]]) {
                        var_aa19f0e10be1075c = var_736b8f08656c7cbd;
                    }
                    line(level.entrance_origin_points[i] + var_a2106b5d045f6d6d, var_59fe947bedc89f84[j].origin + var_66b46cc5042b4175 + (0, 0, var_cd14fc7af6a7c061 / 2), var_aa19f0e10be1075c, 1, 1, 1);
                    var_aa19f0e10be1075c = var_39f2bf7b185b408f;
                    if (var_59fe947bedc89f84[j].prone_visible_from[level.entrance_indices[i]]) {
                        var_aa19f0e10be1075c = var_736b8f08656c7cbd;
                    }
                    line(level.entrance_origin_points[i] + var_9a0552027241e9d, var_59fe947bedc89f84[j].origin + var_66b46cc5042b4175 + (0, 0, var_cd14fc7af6a7c061 / 2), var_aa19f0e10be1075c, 1, 1, 1);
                }
            }
            bot_draw_cylinder(level.entrance_origin_points[i], 10, 75, 0.05, undefined, (1, 1, 1), 1, 8);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb9
// Size: 0x372
function function_d862b7eae98dfc13() {
    /#
        if (!isdefined(level.entrance_indices) || !isdefined(level.precalculated_paths)) {
            return;
        }
        var_86e78c60b435a882 = [0:(1, 0, 0), 1:(0, 1, 0), 2:(0, 0, 1), 3:(1, 0, 1), 4:(1, 1, 0), 5:(0, 1, 1), 6:(1, 0.6, 0.6), 7:(0.6, 1, 0.6), 8:(0.6, 0.6, 1), 9:(0.1, 0.1, 0.1)];
        if (!isdefined(level.var_c5e41ba5e2338276)) {
            level.var_6ef6870b0f3a0309 = level.entrance_indices.size - 2;
            level.var_931a3a0c7c522adf = level.entrance_indices.size - 1;
            level.var_c5e41ba5e2338276 = gettime() - 1;
            level.var_3f28269bf89bd1aa = 15000;
        }
        if (gettime() > level.var_c5e41ba5e2338276) {
            var_6d53aae606df92e6 = 1;
            while (var_6d53aae606df92e6) {
                if (level.var_931a3a0c7c522adf == level.entrance_indices.size - 1) {
                    if (level.var_6ef6870b0f3a0309 == level.entrance_indices.size - 2) {
                        level.var_6ef6870b0f3a0309 = 0;
                        level.var_f2fd482e96c1d49c = -1;
                    } else {
                        level.var_6ef6870b0f3a0309++;
                    }
                    level.var_931a3a0c7c522adf = level.var_6ef6870b0f3a0309 + 1;
                } else {
                    level.var_931a3a0c7c522adf++;
                }
                var_6d53aae606df92e6 = !isdefined(level.precalculated_paths[level.entrance_indices[level.var_6ef6870b0f3a0309]][level.entrance_indices[level.var_931a3a0c7c522adf]]);
            }
            level.var_f2fd482e96c1d49c = (level.var_f2fd482e96c1d49c + 1) % var_86e78c60b435a882.size;
            level.var_c5e41ba5e2338276 = gettime() + level.var_3f28269bf89bd1aa;
        }
        bot_draw_cylinder(level.entrance_origin_points[level.var_6ef6870b0f3a0309], 10, 75, 0.05, undefined, (1, 1, 1), 1, 8);
        bot_draw_cylinder(level.entrance_origin_points[level.var_931a3a0c7c522adf], 10, 75, 0.05, undefined, (1, 1, 1), 1, 8);
        foreach (node in level.precalculated_paths[level.entrance_indices[level.var_6ef6870b0f3a0309]][level.entrance_indices[level.var_931a3a0c7c522adf]]) {
            /#
                assert(node node_is_on_path_from_labels(level.entrance_indices[level.var_6ef6870b0f3a0309], level.entrance_indices[level.var_931a3a0c7c522adf]));
            #/
            bot_draw_cylinder(node.origin, 10, 13, 0.05, undefined, var_86e78c60b435a882[level.var_f2fd482e96c1d49c], 1, 4);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3232
// Size: 0x4e
function bot_player_spawned() {
    if (istrue(self.pers[#"hash_c2cf97cc1cced6a1"])) {
        function_8e439247eeca6302();
    }
    if (isdefined(level.bot_funcs["player_spawned_gamemode"])) {
        self [[ level.bot_funcs["player_spawned_gamemode"] ]]();
    }
    bot_set_loadout_class();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3287
// Size: 0xde
function bot_set_loadout_class() {
    if (!isdefined(self.bot_class)) {
        if (!bot_gametype_chooses_class()) {
            while (!isdefined(level.var_cebc8cc0640fe57) || !isdefined(level.var_cebc8cc0640fe57.initialized)) {
                wait(0.05);
            }
            /#
                var_f1d617089782c904 = getdvar(@"hash_f126b40c4dd6c2c9", "class_select");
                if (isdefined(var_f1d617089782c904) && var_f1d617089782c904 != "class_select") {
                    self.bot_class = var_f1d617089782c904;
                    return;
                }
            #/
            if (isdefined(self.override_class_function)) {
                self.bot_class = [[ self.override_class_function ]]();
            } else {
                self.bot_class = bot_setup_callback_class();
            }
        } else {
            self.bot_class = self.class;
        }
    }
    self.class = self.bot_class;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336c
// Size: 0x6c
function watch_players_connecting() {
    while (1) {
        player = level waittill("connected");
        if (!isai(player) && level.players.size > 0) {
            level.players_waiting_to_join = array_add(level.players_waiting_to_join, player);
            childthread bots_notify_on_spawn(player);
            childthread bots_notify_on_disconnect(player);
            childthread bots_remove_from_array_on_notify(player);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33df
// Size: 0x37
function bots_notify_on_spawn(player) {
    player endon("bots_human_disconnected");
    while (!array_contains(level.players, player)) {
        wait(0.05);
    }
    player notify("bots_human_spawned");
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x341d
// Size: 0x23
function bots_notify_on_disconnect(player) {
    player endon("bots_human_spawned");
    player waittill("disconnect");
    player notify("bots_human_disconnected");
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3447
// Size: 0x37
function bots_remove_from_array_on_notify(player) {
    player waittill_any_2("bots_human_spawned", "bots_human_disconnected");
    level.players_waiting_to_join = array_remove(level.players_waiting_to_join, player);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3485
// Size: 0x4a
function monitor_pause_spawning() {
    level.players_waiting_to_join = [];
    childthread watch_players_connecting();
    while (1) {
        if (level.players_waiting_to_join.size > 0) {
            level.pausing_bot_connect_monitor = 1;
        } else {
            level.pausing_bot_connect_monitor = 0;
        }
        wait(0.5);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34d6
// Size: 0x35
function bot_can_join_team(team) {
    if (matchmakinggame()) {
        return 1;
    }
    if (!level.teambased) {
        return 1;
    }
    if (namespace_6d8da2b47f878104::getjointeampermissions(team)) {
        return 1;
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3513
// Size: 0x3d
function bot_allowed_to_switch_teams() {
    if (isdefined(level.bots_disable_team_switching) && level.bots_disable_team_switching) {
        return 0;
    }
    if (isdefined(level.matchrules_switchteamdisabled) && level.matchrules_switchteamdisabled) {
        return 0;
    }
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3558
// Size: 0x2b0
function bot_connect_monitor() {
    level endon("game_ended");
    self notify("bot_connect_monitor");
    self endon("bot_connect_monitor");
    level.pausing_bot_connect_monitor = 0;
    childthread monitor_pause_spawning();
    childthread bot_monitor_team_limits();
    var_41e7dc4fa58ee542 = 1.5;
    var_29e1cb7568f77e66 = isdefined(level.var_7b37b2193f163b9b);
    function_9241a75cb048508d();
    for (;;) {
        /#
            if (getdvarint(@"hash_955d9d2c8102c6bc", -1) != -1) {
                error("<unknown string>");
            }
            if (getdvar(@"hash_9e5da81386e98d36", "<unknown string>") != "<unknown string>") {
                error("<unknown string>");
            }
        #/
        if (level.pausing_bot_connect_monitor) {
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(var_41e7dc4fa58ee542);
        } else {
            function_824881e424da15b4();
            namespace_c50b30148766aa59::function_cde96c5b28cc69f6();
            var_1a2d84a633e11e8c = function_2ce39e65a48d5ec0(var_29e1cb7568f77e66);
            for (i = 0; i < var_1a2d84a633e11e8c.size; i++) {
                if (var_1a2d84a633e11e8c[i].team == "free") {
                    var_1a2d84a633e11e8c[i].bot.bot_team = "autoassign";
                } else {
                    var_1a2d84a633e11e8c[i].bot.bot_team = var_1a2d84a633e11e8c[i].team;
                }
                if (namespace_36f464722d326bbe::function_ba5574c7f287c587() || namespace_36f464722d326bbe::function_6910a4c65560c44b()) {
                    var_5be31bbf808e8d4c = var_1a2d84a633e11e8c[i].squad;
                    var_1a2d84a633e11e8c[i].bot.var_b5517a8d74ed63a3 = var_5be31bbf808e8d4c;
                }
                if (var_1a2d84a633e11e8c[i].istestclient) {
                    var_1a2d84a633e11e8c[i].bot namespace_99ac021a7547cae3::spawnspectator();
                    var_1a2d84a633e11e8c[i].bot.btestclient = 1;
                    var_1a2d84a633e11e8c[i].bot namespace_e5ed2f5a5ee8410e::autoassign();
                    class = "class" + randomint(3);
                    var_1a2d84a633e11e8c[i].bot notify("loadout_class_selected", class);
                    var_1a2d84a633e11e8c[i].bot notify("luinotifyserver", "class_select");
                } else {
                    var_1a2d84a633e11e8c[i].bot.equipment_enabled = 1;
                    var_1a2d84a633e11e8c[i].bot thread [[ level.bot_funcs["think"] ]]();
                }
                var_1a2d84a633e11e8c[i].bot namespace_92443376a63aa4bd::function_3283fdac29887de();
                var_1a2d84a633e11e8c[i].bot function_81c6c4218188e7d8();
            }
            if (var_1a2d84a633e11e8c.size > 0) {
                level notify("spawned_bots");
            }
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(var_41e7dc4fa58ee542);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x380f
// Size: 0x94
function function_81c6c4218188e7d8() {
    if (isdefined(self.xuid) && self.xuid != "") {
        return;
    }
    if (isdefined(self.var_5876cd9fc14af731) && isdefined(self.var_5876cd9fc14af731.xuid) && self.var_5876cd9fc14af731.xuid != "") {
        self.xuid = self.var_5876cd9fc14af731.xuid;
    } else {
        self.xuid = self function_7a32b0201993d7f7();
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38aa
// Size: 0x147
function bot_monitor_team_limits() {
    level endon("game_ended");
    self notify("bot_monitor_team_limits");
    self endon("bot_monitor_team_limits");
    level.bot_max_players_on_team["allies"] = 0;
    level.bot_max_players_on_team["axis"] = 0;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.5);
    var_41e7dc4fa58ee542 = 1.5;
    if (!istrue(level.var_e6628286205f2ea7)) {
        return;
    }
    while (1) {
        if (istrue(level.hasbots)) {
            level.bot_max_players_on_team["allies"] = 0;
            level.bot_max_players_on_team["axis"] = 0;
            foreach (player in level.players) {
                if (isdefined(player.team) && (player.team == "allies" || player.team == "axis")) {
                    level.bot_max_players_on_team[player.team]++;
                }
            }
            update_max_players_from_team_agents();
        }
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(var_41e7dc4fa58ee542);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f8
// Size: 0xd4
function update_max_players_from_team_agents() {
    if (isdefined(level.agentarray) && istrue(level.var_96df914b8abdd34f)) {
        foreach (agent in level.agentarray) {
            if (agent.isactive && isteamparticipant(agent) && isdefined(agent.team) && (agent.team == "allies" || agent.team == "axis")) {
                level.bot_max_players_on_team[agent.team]++;
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad3
// Size: 0x3e
function bot_get_player_team() {
    if (isdefined(self.team)) {
        return self.team;
    }
    if (isdefined(self.pers["team"])) {
        return self.pers["team"];
    }
    return undefined;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b19
// Size: 0x71
function bot_get_host_team() {
    foreach (player in level.players) {
        if (!isai(player) && player ishost()) {
            return player bot_get_player_team();
        }
    }
    return "spectator";
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b92
// Size: 0xb0
function bot_get_human_picked_team() {
    var_e4a4f27e84b49281 = 0;
    var_3b278e62e61b9ec6 = 0;
    var_7cd77eec8870208d = 0;
    foreach (player in level.players) {
        if (!isai(player)) {
            if (player ishost()) {
                var_e4a4f27e84b49281 = 1;
            }
            if (player_picked_team(player)) {
                var_3b278e62e61b9ec6 = 1;
                if (player ishost()) {
                    var_7cd77eec8870208d = 1;
                }
            }
        }
    }
    return var_7cd77eec8870208d || var_3b278e62e61b9ec6 && !var_e4a4f27e84b49281;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4a
// Size: 0x86
function player_picked_team(player) {
    if (isdefined(player.team) && player.team != "spectator") {
        return 1;
    }
    if (isdefined(player.spectating_actively) && player.spectating_actively) {
        return 1;
    }
    if (player iscodcaster() && isdefined(player.team) && player.team == "spectator") {
        return 1;
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd8
// Size: 0xb5
function bot_get_human_picked_class() {
    var_e4a4f27e84b49281 = 0;
    var_3b278e62e61b9ec6 = 0;
    var_7cd77eec8870208d = 0;
    foreach (player in level.players) {
        if (!isai(player)) {
            if (player ishost()) {
                var_e4a4f27e84b49281 = 1;
            }
            if (isdefined(player.class)) {
                var_3b278e62e61b9ec6 = 1;
                if (player ishost()) {
                    var_7cd77eec8870208d = 1;
                }
            }
        }
    }
    return var_7cd77eec8870208d || var_3b278e62e61b9ec6 && !var_e4a4f27e84b49281;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d95
// Size: 0xda
function bot_client_counts() {
    var_490f043a11393f46 = [];
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (isdefined(player) && isdefined(player.team)) {
            var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, "all");
            var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, player.team);
            if (isbot(player)) {
                var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, "bots");
                var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, "bots_" + player.team);
            } else {
                var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, "humans");
                var_490f043a11393f46 = cat_array_add(var_490f043a11393f46, "humans_" + player.team);
            }
        }
    }
    return var_490f043a11393f46;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e77
// Size: 0x33
function cat_array_add(var_a743a347c001ca06, category) {
    if (!isdefined(var_a743a347c001ca06)) {
        var_a743a347c001ca06 = [];
    }
    if (!isdefined(var_a743a347c001ca06[category])) {
        var_a743a347c001ca06[category] = 0;
    }
    var_a743a347c001ca06[category] = var_a743a347c001ca06[category] + 1;
    return var_a743a347c001ca06;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb2
// Size: 0x27
function cat_array_get(var_a743a347c001ca06, category) {
    if (!isdefined(var_a743a347c001ca06)) {
        return 0;
    }
    if (!isdefined(var_a743a347c001ca06[category])) {
        return 0;
    }
    return var_a743a347c001ca06[category];
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee1
// Size: 0x11a
function move_bots_from_team_to_team(count, var_5a1ef08a70766e60, var_616570b6419a659, difficulty) {
    foreach (player in level.players) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (isdefined(player.connected) && player.connected && isbot(player) && player.team == var_5a1ef08a70766e60) {
            player.bot_team = var_616570b6419a659;
            if (isdefined(difficulty)) {
                player bot_set_difficulty(difficulty);
            }
            player notify("luinotifyserver", "team_select");
            wait(0.05);
            player notify("loadout_class_selected", player.bot_class);
            count--;
            if (count <= 0) {
                break;
            } else {
                wait(0.1);
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4002
// Size: 0xc0
function bots_update_difficulty(team, difficulty) {
    foreach (player in level.players) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (isdefined(player.connected) && player.connected && isbot(player) && player.team == team) {
            if (difficulty != player botgetdifficulty()) {
                player bot_set_difficulty(difficulty);
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c9
// Size: 0x3e
function bot_drop() {
    /#
        assert(isbot(self));
    #/
    /#
        assert(self.connected);
    #/
    kick(self.entity_number, "EXE/PLAYERKICKED_BOT_BALANCE");
    wait(0.1);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410e
// Size: 0x138
function drop_bots(count, team) {
    bots = [];
    foreach (player in level.players) {
        if (isdefined(player.connected) && player.connected && isbot(player) && (!isdefined(team) || isdefined(player.team) && player.team == team)) {
            bots[bots.size] = player;
        }
    }
    for (i = bots.size - 1; i >= 0; i--) {
        if (count <= 0) {
            break;
        }
        if (!bots[i] namespace_f8065cafc523dba5::_isalive()) {
            bots[i] bot_drop();
            bots = array_remove(bots, bots[i]);
            count--;
        }
    }
    for (i = bots.size - 1; i >= 0; i--) {
        if (count <= 0) {
            break;
        }
        bots[i] bot_drop();
        count--;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424d
// Size: 0x49
function bot_lui_convert_team_to_int(var_a3bf560b25c4a33e) {
    if (var_a3bf560b25c4a33e == "axis") {
        return 0;
    } else if (var_a3bf560b25c4a33e == "allies") {
        return 1;
    } else if (var_a3bf560b25c4a33e == "autoassign" || var_a3bf560b25c4a33e == "random") {
        return 2;
    } else {
        return 3;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429d
// Size: 0x161
function spawn_bot_latent(team, var_46c357e31a65af85, connecting) {
    var_f1b03ffe289c1025 = gettime() + 60000;
    while (!self canspawnbotortestclient()) {
        if (gettime() >= var_f1b03ffe289c1025) {
            kick(self.entity_number, "EXE/PLAYERKICKED_BOT_BALANCE");
            connecting.abort = 1;
            /#
                println("<unknown string>");
            #/
            return;
        }
        wait(0.05);
        if (!isdefined(self)) {
            connecting.abort = 1;
            /#
                println("<unknown string>");
            #/
            return;
        }
    }
    if (!isdefined(self)) {
        connecting.abort = 1;
        /#
            println("<unknown string>");
        #/
        return;
    }
    self spawnbotortestclient();
    self.equipment_enabled = 1;
    self.bot_team = team;
    self.var_b5517a8d74ed63a3 = connecting.var_b5517a8d74ed63a3;
    if (isdefined(connecting.difficulty)) {
        bot_set_difficulty(connecting.difficulty);
    }
    if (isdefined(connecting.var_e2055bf088954e86)) {
        self.var_e2055bf088954e86 = connecting.var_e2055bf088954e86;
    }
    if (isdefined(var_46c357e31a65af85)) {
        self [[ var_46c357e31a65af85 ]]();
    }
    self thread [[ level.bot_funcs["think"] ]]();
    connecting.ready = 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4405
// Size: 0x30b
function spawn_bots(var_103a2009f383a1a, team, var_46c357e31a65af85, var_a018df45312ba50f, var_dfc67eaaf62bc0, difficulty, var_4f9efd61abf87fb0) {
    level.var_9bb484946bcc49b2 = 1;
    var_f1b03ffe289c1025 = gettime() + 15000;
    var_821516dc10ec00f0 = [];
    var_a29729da6b538c22 = var_821516dc10ec00f0.size;
    while (level.players.size < bot_get_client_limit() && var_821516dc10ec00f0.size < var_103a2009f383a1a && gettime() < var_f1b03ffe289c1025) {
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.05);
        bot = undefined;
        if (isbotmatchmakingenabled()) {
            if (level.teambased) {
                bot = addmpbottoteam(team);
            } else {
                bot = addmpbottoteam("none");
            }
        } else {
            bot = addbot("");
        }
        if (!isdefined(bot)) {
            /#
                if (gettime() >= var_f1b03ffe289c1025) {
                    println("<unknown string>");
                } else {
                    println("<unknown string>");
                }
            #/
            if (isdefined(var_a018df45312ba50f) && var_a018df45312ba50f) {
                if (isdefined(var_dfc67eaaf62bc0)) {
                    self notify(var_dfc67eaaf62bc0);
                }
                return;
            }
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
            continue;
        } else {
            connecting = spawnstruct();
            connecting.bot = bot;
            connecting.ready = 0;
            connecting.abort = 0;
            connecting.index = var_a29729da6b538c22;
            connecting.difficulty = difficulty;
            var_821516dc10ec00f0[var_821516dc10ec00f0.size] = connecting;
            if (isdefined(var_4f9efd61abf87fb0)) {
                bot.pers[#"hash_c2cf97cc1cced6a1"] = 1;
                bot.pers[#"hash_b4e62d7caafad3be"] = var_4f9efd61abf87fb0.origin;
                bot.pers[#"hash_36e3a9fa37a8b454"] = var_4f9efd61abf87fb0.angles;
                if (!isdefined(level.var_6d4b0d324eef7492)) {
                    level.var_6d4b0d324eef7492 = [];
                }
                level.var_6d4b0d324eef7492[level.var_6d4b0d324eef7492.size] = bot;
            }
            connecting.bot thread spawn_bot_latent(team, var_46c357e31a65af85, connecting);
            var_a29729da6b538c22++;
        }
    }
    /#
        if (gettime() >= var_f1b03ffe289c1025) {
            println("<unknown string>");
        }
    #/
    var_65c7bcbb8685efc3 = 0;
    var_f1b03ffe289c1025 = gettime() + 60000;
    while (var_65c7bcbb8685efc3 < var_821516dc10ec00f0.size && gettime() < var_f1b03ffe289c1025) {
        var_65c7bcbb8685efc3 = 0;
        foreach (connecting in var_821516dc10ec00f0) {
            if (connecting.ready || connecting.abort) {
                var_65c7bcbb8685efc3++;
            }
        }
        wait(0.05);
    }
    if (isdefined(var_dfc67eaaf62bc0)) {
        self notify(var_dfc67eaaf62bc0);
    }
    level.var_9bb484946bcc49b2 = undefined;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4717
// Size: 0x58
function bot_gametype_chooses_team() {
    if (matchmakinggame() && self.sessionteam != "none") {
        var_74703aa01e7c9b48 = 0;
    } else if (!matchmakinggame() && !denysystemicteamchoice() && doesmodesupportplayerteamchoice()) {
        var_74703aa01e7c9b48 = 1;
    } else {
        var_74703aa01e7c9b48 = 0;
    }
    return !var_74703aa01e7c9b48;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4777
// Size: 0xd
function bot_gametype_chooses_class() {
    return istrue(level.bots_gametype_handles_class_choice);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478c
// Size: 0x1d
function bot_is_ready_to_spawn() {
    if (!isdefined(self.classcallback)) {
        if (!bot_gametype_chooses_class()) {
            return 0;
        }
    }
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47b1
// Size: 0xa3
function function_f26d8ba8bde6c241(bot, botteam) {
    var_a4b90ad02e7922ad = getdvarvector(@"hash_70d05793de60eab8");
    var_593888405d9ebb4d = 12;
    var_b16a9b795934518f = 40;
    switch (botteam) {
    case #"hash_5f54b9bf7583687f":
        bot setorigin(var_a4b90ad02e7922ad + (bot.var_5ce930ab383b8a15 * var_b16a9b795934518f * -1, 0, var_593888405d9ebb4d));
        break;
    case #"hash_7c2d091e6337bf54":
        bot setorigin(var_a4b90ad02e7922ad + (bot.var_5ce930ab383b8a15 * var_b16a9b795934518f, 0, var_593888405d9ebb4d));
        break;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x485b
// Size: 0x145
function function_84fead845cc1c1ff(var_c9176bb4dce2c995) {
    /#
        hostplayer = function_35d942f93b6a3cfe()[0];
        var_4d71ac90487ba0d7 = 0;
        var_d64c19fba9e3b2 = var_c9176bb4dce2c995 getcurrentweapon();
        playerweapon = hostplayer getcurrentweapon();
        if (isdefined(playerweapon) && var_d64c19fba9e3b2 != playerweapon) {
            if (var_c9176bb4dce2c995 isreloading()) {
                wait(3);
                var_c9176bb4dce2c995 takeallweapons();
                var_c9176bb4dce2c995 namespace_d19129e4fa5d176::loadout_updateplayer(hostplayer.var_240e299e201c6a39, hostplayer.classstruct, hostplayer.class, var_4d71ac90487ba0d7, 0);
            } else {
                var_c9176bb4dce2c995 takeallweapons();
                var_c9176bb4dce2c995 namespace_d19129e4fa5d176::loadout_updateplayer(hostplayer.var_240e299e201c6a39, hostplayer.classstruct, hostplayer.class, var_4d71ac90487ba0d7, 0);
            }
        }
        if (getdvarint(@"hash_17bb7ff71c139bfe")) {
            var_c0afad358ef6d08 = hostplayer.operatorcustomization.skinref;
            setdvar(@"hash_803cefdbe23f6bfe", var_c0afad358ef6d08);
        } else {
            var_c0afad358ef6d08 = getdvar(@"hash_803cefdbe23f6bfe");
        }
        if (var_c9176bb4dce2c995.operatorcustomization.skinref != var_c0afad358ef6d08) {
            var_c9176bb4dce2c995 namespace_6d8da2b47f878104::createoperatorcustomization();
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a7
// Size: 0x8a5
function function_214bc4c1c6c204d2(var_c9176bb4dce2c995) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        hostplayer = function_35d942f93b6a3cfe()[0];
        level.var_f55a78de40f16b44 = 1;
        function_9a9702fa32785f74(var_c9176bb4dce2c995);
        var_649e3918e5a21d31 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>"];
        switch (var_649e3918e5a21d31[(var_c9176bb4dce2c995.var_5ce930ab383b8a15 - 1) % 7]) {
        case #"hash_f0b12bd1282d46ee":
            if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                var_c9176bb4dce2c995 setorigin((-978, -638, 132));
            } else {
                var_c9176bb4dce2c995 setorigin((-1140, -638, 132));
            }
            break;
        case #"hash_f4e2152a6151d486":
            if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                var_c9176bb4dce2c995 setorigin((-569, -518, 132));
            } else {
                var_c9176bb4dce2c995 setorigin((-500, -518, 132));
            }
            break;
        case #"hash_f07871b4fc312ea4":
            if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                var_c9176bb4dce2c995 setorigin((-425, -518, 132));
            } else {
                var_c9176bb4dce2c995 setorigin((-350, -518, 132));
            }
            break;
        case #"hash_86607b8541f5dee5":
            if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                var_c9176bb4dce2c995 setorigin((-1575, 279, 130));
            } else {
                var_c9176bb4dce2c995 setorigin((-290, -518, 132));
            }
            break;
        case #"hash_36b8a15fa0645e0f":
            if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                var_c9176bb4dce2c995 setorigin((-1675, 279, 130));
            }
            break;
        }
        while (1) {
            wait(3);
            var_4d71ac90487ba0d7 = 0;
            var_d64c19fba9e3b2 = var_c9176bb4dce2c995 getcurrentweapon();
            playerweapon = hostplayer getcurrentweapon();
            function_84fead845cc1c1ff(var_c9176bb4dce2c995);
            switch (var_649e3918e5a21d31[(var_c9176bb4dce2c995.var_5ce930ab383b8a15 - 1) % 7]) {
            case #"hash_f0b12bd1282d46ee":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    var_c9176bb4dce2c995 givemaxammo(var_d64c19fba9e3b2);
                    var_c9176bb4dce2c995 setweaponammostock(var_d64c19fba9e3b2, 300, 1);
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>");
                    var_c9176bb4dce2c995 forcereloading();
                } else {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 givemaxammo(var_d64c19fba9e3b2);
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>", 30);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                }
                break;
            case #"hash_f4e2152a6151d486":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    wait(3);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                } else {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    wait(3);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                }
                break;
            case #"hash_f07871b4fc312ea4":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>");
                } else {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>");
                }
                break;
            case #"hash_86607b8541f5dee5":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    wait(1);
                    objweapon = hostplayer.offhandweapon.basename;
                    var_c9176bb4dce2c995 giveandfireoffhand(objweapon);
                    wait(2);
                    var_56bf136cd6aec447 = level.superglobals.staticsuperdata[hostplayer.loadoutfieldupgrade1].weapon;
                    if (!isdefined(var_56bf136cd6aec447)) {
                        var_56bf136cd6aec447 = "<unknown string>";
                    }
                    var_641083e829d5514c = makeweapon(var_56bf136cd6aec447);
                    var_c9176bb4dce2c995 namespace_727d2aa1d6c72038::perkpackage_givedebug("<unknown string>");
                    if (isdefined(var_c9176bb4dce2c995.super)) {
                        if (!isnullweapon(var_641083e829d5514c) && var_641083e829d5514c.basename != "<unknown string>") {
                            var_c9176bb4dce2c995 function_f19f8b4cf085ecbd(var_641083e829d5514c);
                        }
                        var_c9176bb4dce2c995 thread namespace_85d036cb78063c4a::trysuperusebegin(var_641083e829d5514c);
                    }
                } else {
                    var_c9176bb4dce2c995 setplayerangles((0, 90, 0));
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>", 2.5);
                }
                break;
            case #"hash_c74bdb650448859e":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    waitframe();
                    var_c9176bb4dce2c995 botsetscriptgoal((359, -421, 130), 5, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                    var_c9176bb4dce2c995 botlookatpoint((361, -531, 130), 3);
                    var_c9176bb4dce2c995 forcemantle();
                    wait(1);
                    var_c9176bb4dce2c995 botsetscriptgoal((363, -483, 170), 10, "<unknown string>", undefined, undefined);
                } else {
                    var_c9176bb4dce2c995 botsetflag("<unknown string>", 1);
                    var_c9176bb4dce2c995 botsetflag("<unknown string>", 1);
                    var_c9176bb4dce2c995 botsetscriptgoal((-867, 355, 130), 10, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                    var_c9176bb4dce2c995 botsetscriptgoal((-540, 355, 130), 10, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                }
                break;
            case #"hash_284de335e850af7a":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    var_c9176bb4dce2c995 botsetscriptgoal((969, -198, 130), 10, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                    var_c9176bb4dce2c995 botlookatpoint((1054, -200, 266), 3);
                    var_c9176bb4dce2c995 botsetscriptgoal((1027, -201, 266), 10, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                } else {
                    var_c9176bb4dce2c995 setorigin((1012, 358, 130));
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    var_c9176bb4dce2c995 botlookatpoint((1008, 438, 130), 3);
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>", 2);
                    wait(3);
                    var_c9176bb4dce2c995 botlookatpoint((1007, 350, 378), 3);
                    var_c9176bb4dce2c995 botpressbutton("<unknown string>", 2);
                    wait(3);
                }
                break;
            case #"hash_36b8a15fa0645e0f":
                if (var_c9176bb4dce2c995.bot_team == "<unknown string>") {
                    wait(1);
                    var_b7bf1df77c86ad25 = hostplayer.offhandinventory[1].basename;
                    var_c9176bb4dce2c995 giveandfireoffhand(var_b7bf1df77c86ad25);
                } else {
                    var_c9176bb4dce2c995 allowprone(1);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    var_c9176bb4dce2c995 botsetscriptgoal((-867, 199, 130), 10, "<unknown string>", undefined, undefined);
                    wait(1);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    wait(0.5);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                    var_c9176bb4dce2c995 botsetscriptgoal((-540, 199, 130), 10, "<unknown string>", undefined, undefined);
                    var_c9176bb4dce2c995 botsetflag("<unknown string>", 1);
                    wait(1);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    wait(0.5);
                    var_c9176bb4dce2c995 botsetstance("<unknown string>");
                    var_c9176bb4dce2c995 waittill_any_2("<unknown string>", "<unknown string>");
                }
                break;
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5253
// Size: 0x6
function function_6a932d3bcaaa7623() {
    /#
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5260
// Size: 0xa1
function function_9a9702fa32785f74(bot) {
    /#
        bot setplayerangles((0, 266, 0));
        bot endon("<unknown string>");
        bot botsetflag("<unknown string>", 1);
        bot botsetflag("<unknown string>", 1);
        bot botsetawareness(0);
        bot botsetflag("<unknown string>", 1);
        bot botsetflag("<unknown string>", 1);
        bot.personality_update_function = &function_6a932d3bcaaa7623;
        setdvar(@"hash_91a24c408f08888b", 1);
        setdvar(@"hash_e39c6d129db1722", 1);
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5308
// Size: 0x48e
function bot_think() {
    self notify("bot_think");
    self endon("bot_think");
    self endon("disconnect");
    while (!isdefined(self.pers["team"])) {
        wait(0.05);
    }
    level.hasbots = 1;
    if (bot_gametype_chooses_team()) {
        self.bot_team = self.pers["team"];
    }
    team = self.bot_team;
    if (!isdefined(team)) {
        team = self.pers["team"];
    }
    self.entity_number = self getentitynumber();
    firstspawn = 0;
    if (!isdefined(self.bot_spawned_this_round)) {
        firstspawn = 1;
        self.bot_spawned_this_round = 1;
        if (!bot_gametype_chooses_team()) {
            var_4ec7f123b211e7be = self.pers["team"] != "spectator" && !isdefined(self.bot_team);
            if (!var_4ec7f123b211e7be) {
                var_e7fe0e101285e7e2 = isdefined(self.bot_team) && self.bot_team != self.pers["team"];
                if (var_e7fe0e101285e7e2) {
                    self notify("luinotifyserver", "team_select");
                }
                wait(0.5);
                if (self.pers["team"] == "spectator") {
                    bot_drop();
                    return;
                }
            }
        }
    }
    while (1) {
        bot_set_difficulty(self botgetdifficulty());
        self.difficulty = self botgetdifficulty();
        var_631a8deab6ab2901 = self botgetdifficultysetting("advancedPersonality");
        if (firstspawn && isdefined(var_631a8deab6ab2901) && var_631a8deab6ab2901 != 0) {
            bot_balance_personality();
        }
        /#
            function_70008d3ab47d171d();
        #/
        bot_assign_personality_functions();
        self.enemyselector = %"hash_7508743687e8fab9";
        if (firstspawn) {
            if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["class_select_override"])) {
                self [[ level.bot_funcs["class_select_override"] ]]();
            } else {
                bot_set_loadout_class();
                if (!bot_gametype_chooses_class()) {
                    if (isdefined(self.connecttime) && self.connecttime == gettime()) {
                        waittillframeend();
                        waittillframeend();
                    }
                    self notify("loadout_class_selected", self.bot_class);
                }
            }
            if (self.health == 0) {
                self.bwaitingforteamselect = 1;
                self notify("bot_ready_to_spawn");
                self waittill("spawned_player");
                self.bwaitingforteamselect = undefined;
                self.bot_team = team;
            }
            if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() || namespace_36f464722d326bbe::function_6910a4c65560c44b()) {
                var_27eb9f95564a944d = "botsight_mgl_br";
            } else {
                var_27eb9f95564a944d = "botsight";
            }
            self function_95d5375059c2a022(var_27eb9f95564a944d, 1);
            self setthreatbiasgroup("Bots");
            if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["know_enemies_on_start"])) {
                self thread [[ level.bot_funcs["know_enemies_on_start"] ]]();
            }
            firstspawn = 0;
            self.var_5ce930ab383b8a15 = 1;
            if (getdvarint(@"hash_ab7104a863537e0a") > 0) {
                if (team == "axis") {
                    self.var_5ce930ab383b8a15 = level.var_33463503caca4795;
                    level.var_33463503caca4795++;
                } else {
                    self.var_5ce930ab383b8a15 = level.var_3342bd64cdf4b028;
                    level.var_3342bd64cdf4b028++;
                }
            }
            if (!istrue(gameflag("prematch_done")) && getdvarint(@"hash_565e6fa77cc5f394") > 0) {
                level waittill("prematch_over");
                function_f26d8ba8bde6c241(self, team);
                /#
                    if (getdvarint(@"hash_8d557dac00cc7997") > 0) {
                        function_214bc4c1c6c204d2(self);
                    }
                #/
            }
        }
        bot_modify_behavior_from_tweakables();
        bot_restart_think_threads();
        wait(0.1);
        if (isalive(self)) {
            self waittill("death");
        }
        if (isdefined(level.bot_funcs) && isdefined(level.bot_funcs["post_death_func"])) {
            self [[ level.bot_funcs["post_death_func"] ]]();
        }
        respawn_watcher();
        self waittill("spawned_player");
        if (getdvarint(@"hash_565e6fa77cc5f394") > 0) {
            function_f26d8ba8bde6c241(self, team);
            /#
                if (getdvarint(@"hash_8d557dac00cc7997") > 0) {
                    function_214bc4c1c6c204d2(self);
                }
            #/
        }
        /#
            if (getdvarint(@"hash_f5a9982eaa189f7b") > 0) {
                namespace_e6eafa63d63ab54d::function_6033c33f117d9dc4(self);
            }
        #/
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x579d
// Size: 0x24
function bot_modify_behavior_from_tweakables() {
    if (namespace_775507ba36294dfb::gettweakablevalue("game", "onlyheadshots")) {
        self botsetflag("only_headshots", 1);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57c8
// Size: 0x36
function function_70008d3ab47d171d() {
    /#
        var_3226a7e0e3e88fe7 = getdvar(@"hash_ef7ffe5706136ad9", "<unknown string>");
        if (var_3226a7e0e3e88fe7 != "<unknown string>") {
            bot_set_personality(var_3226a7e0e3e88fe7);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5805
// Size: 0x88
function respawn_watcher() {
    self endon("started_spawnPlayer");
    while (!self.waitingtospawn) {
        wait(0.05);
    }
    if (namespace_99ac021a7547cae3::needsbuttontorespawn()) {
        while (self.waitingtospawn) {
            if (self.sessionstate == "spectator") {
                if (getdvarint(@"hash_2af11f031cb3d1f5") == 0 || self.pers["lives"] > 0) {
                    self botpressbutton("use", 0.5);
                }
            }
            wait(1);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5894
// Size: 0xd7
function bot_get_rank_xp() {
    difficulty = self botgetdifficulty();
    var_d37b56802ac19d52 = "bot_rank_" + difficulty;
    if (isdefined(self.pers[var_d37b56802ac19d52]) && self.pers[var_d37b56802ac19d52] > 0) {
        return self.pers[var_d37b56802ac19d52];
    }
    var_d65ccfcb7c5ca290 = bot_random_ranks_for_difficulty(difficulty);
    rank = var_d65ccfcb7c5ca290["rank"];
    prestige = var_d65ccfcb7c5ca290["prestige"];
    minxp = getrankinfominxp(rank);
    maxxp = minxp + getrankinfoxpamt(rank);
    rankxp = randomintrange(minxp, maxxp + 1);
    self.pers[var_d37b56802ac19d52] = rankxp;
    return rankxp;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5973
// Size: 0x15
function bot_3d_sighting_model(var_f297583b09b3d29c) {
    thread bot_3d_sighting_model_thread(var_f297583b09b3d29c);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x598f
// Size: 0x9d
function bot_3d_sighting_model_thread(var_f297583b09b3d29c) {
    var_f297583b09b3d29c endon("disconnect");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        if (isalive(self) && !self botcanseeentity(var_f297583b09b3d29c) && within_fov(self.origin, self getplayerangles(), var_f297583b09b3d29c.origin, self botgetfovdot())) {
            self botgetimperfectenemyinfo(var_f297583b09b3d29c, var_f297583b09b3d29c.origin);
        }
        wait(0.1);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a33
// Size: 0x279
function bot_random_ranks_for_difficulty(difficulty) {
    result = [];
    result["rank"] = 0;
    result["prestige"] = 0;
    if (difficulty == "default") {
        return result;
    }
    if (!isdefined(level.bot_rnd_rank)) {
        level.bot_rnd_rank = [];
        level.bot_rnd_rank["recruit"][0] = 0;
        level.bot_rnd_rank["recruit"][1] = 1;
        level.bot_rnd_rank["regular"][0] = 3;
        level.bot_rnd_rank["regular"][1] = 18;
        level.bot_rnd_rank["hardened"][0] = 22;
        level.bot_rnd_rank["hardened"][1] = 38;
        level.bot_rnd_rank["veteran"][0] = 40;
        level.bot_rnd_rank["veteran"][1] = 54;
    }
    /#
        assertex(level.bot_rnd_rank["veteran"][1] == level.var_e0e30c15f736bd96, "Max level has changed, please adjust values in bot_random_ranks_for_difficulty()");
    #/
    if (!isdefined(level.bot_rnd_prestige)) {
        level.bot_rnd_prestige = [];
        level.bot_rnd_prestige["recruit"][0] = 0;
        level.bot_rnd_prestige["recruit"][1] = 0;
        level.bot_rnd_prestige["regular"][0] = 0;
        level.bot_rnd_prestige["regular"][1] = 0;
        level.bot_rnd_prestige["hardened"][0] = 0;
        level.bot_rnd_prestige["hardened"][1] = 0;
        level.bot_rnd_prestige["veteran"][0] = 0;
        level.bot_rnd_prestige["veteran"][1] = 9;
    }
    /#
        assert(isdefined(level.bot_rnd_rank[difficulty][0]) && isdefined(level.bot_rnd_rank[difficulty][1]));
    #/
    result["rank"] = randomintrange(level.bot_rnd_rank[difficulty][0], level.bot_rnd_rank[difficulty][1] + 1);
    /#
        assert(isdefined(level.bot_rnd_prestige[difficulty][0]) && isdefined(level.bot_rnd_prestige[difficulty][1]));
    #/
    result["prestige"] = randomintrange(level.bot_rnd_prestige[difficulty][0], level.bot_rnd_prestige[difficulty][1] + 1);
    return result;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cb4
// Size: 0xe
function function_9bd84cede4fe8f24(crate) {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cca
// Size: 0x35
function crate_can_use_always(crate) {
    if (isagent(self) && !isdefined(crate.boxtype)) {
        return 0;
    }
    if (!function_9bd84cede4fe8f24(crate)) {
        return 0;
    }
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d07
// Size: 0x9f
function get_human_player() {
    result = undefined;
    players = getentarray("player", "classname");
    if (isdefined(players)) {
        for (index = 0; index < players.size; index++) {
            if (isdefined(players[index]) && isdefined(players[index].connected) && players[index].connected && !isai(players[index]) && (!isdefined(result) || result.team == "spectator")) {
                result = players[index];
            }
        }
    }
    return result;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dae
// Size: 0x83
function function_35d942f93b6a3cfe() {
    /#
        humans = [];
        foreach (player in level.players) {
            if (player.connected && !isai(player)) {
                humans = array_add(humans, player);
            }
        }
        return humans;
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e38
// Size: 0x84
function function_9ea1b3409311f518() {
    /#
        humans = function_35d942f93b6a3cfe();
        var_66912d0bac49d73d = [];
        foreach (player in humans) {
            if (player.team == "disable_movement") {
                var_66912d0bac49d73d[var_66912d0bac49d73d.size] = player;
            }
        }
        return var_66912d0bac49d73d;
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec3
// Size: 0x159
function bot_damage_callback(eattacker, idamage, smeansofdeath, sweapon, einflictor, shitloc, vpoint, var_1da1a66b5c6a06a7) {
    if (!isdefined(var_1da1a66b5c6a06a7)) {
        var_1da1a66b5c6a06a7 = 0;
    }
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_SUICIDE") {
        return;
    }
    if (idamage <= 0 && var_1da1a66b5c6a06a7 <= 0) {
        return;
    }
    if (!isdefined(einflictor)) {
        if (!isdefined(eattacker)) {
            return;
        }
        einflictor = eattacker;
    }
    if (isdefined(einflictor)) {
        if (isdefined(self.fnbotdamagecallback)) {
            self [[ self.fnbotdamagecallback ]](eattacker, idamage, smeansofdeath, sweapon, einflictor, shitloc, vpoint, var_1da1a66b5c6a06a7);
        }
        if (level.teambased) {
            if (isdefined(einflictor.team) && einflictor.team == self.team) {
                return;
            } else if (isdefined(eattacker) && isdefined(eattacker.team) && eattacker.team == self.team) {
                return;
            }
        }
        var_e57f2aa2d1c68284 = bot_get_known_attacker(eattacker, einflictor);
        if (isdefined(var_e57f2aa2d1c68284)) {
            self botsetattacker(var_e57f2aa2d1c68284);
        }
    }
    if (isagent(self)) {
        self notify("agentDamage");
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6023
// Size: 0x161
function on_bot_killed(einflictor, attacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    self botclearscriptenemy();
    self botclearscriptgoal();
    var_e57f2aa2d1c68284 = bot_get_known_attacker(attacker, einflictor);
    if (isdefined(var_e57f2aa2d1c68284) && (var_e57f2aa2d1c68284.classname == "script_vehicle" || var_e57f2aa2d1c68284.classname == "script_model") && isdefined(var_e57f2aa2d1c68284.helitype)) {
        var_848eb2baf17f6e78 = self botgetdifficultysetting("launcherRespawnChance");
        if (randomfloat(1) < var_848eb2baf17f6e78) {
            self.respawn_with_launcher = 1;
        }
    }
    /#
        if (isdefined(level.var_27adcb3791e65677) && level.var_27adcb3791e65677 == self && isdefined(self.menu) && isdefined(self.var_81d330e02eced419)) {
            var_e95d77032a6f554e = gettime() - self.var_81d330e02eced419;
            self.menu["<unknown string>"] setvalue(function_c89ed1840c8d0f0f(var_e95d77032a6f554e));
            self.var_81d330e02eced419 = undefined;
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x618b
// Size: 0x121
function bot_should_do_killcam() {
    if (istrue(game["isLaunchChunk"])) {
        return 1;
    }
    /#
        var_66912d0bac49d73d = function_9ea1b3409311f518();
        foreach (human in var_66912d0bac49d73d) {
            var_342ef8334ecfd02a = human getspectatingplayer();
            if (isdefined(var_342ef8334ecfd02a) && var_342ef8334ecfd02a == self) {
                return 0;
            }
        }
        if (getdvarint(@"hash_e125675f281d4f47", 0) == 1) {
            return 0;
        }
    #/
    var_6e08093b6ffe655f = 0;
    bot_difficulty = self botgetdifficulty();
    if (bot_difficulty == "recruit") {
        var_6e08093b6ffe655f = 0.1;
    } else if (bot_difficulty == "regular") {
        var_6e08093b6ffe655f = 0.4;
    } else if (bot_difficulty == "hardened") {
        var_6e08093b6ffe655f = 0.7;
    } else if (bot_difficulty == "veteran") {
        var_6e08093b6ffe655f = 1;
    }
    return randomfloat(1) < 1 - var_6e08093b6ffe655f;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b4
// Size: 0x5
function bot_should_pickup_weapons() {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c1
// Size: 0x9e
function bot_restart_think_threads() {
    self thread [[ level.bot_funcs["bot_think_watch_enemy"] ]]();
    self thread [[ level.bot_funcs["bot_think_tactical_goals"] ]]();
    self thread [[ level.bot_funcs["dropped_weapon_think"] ]]();
    self thread [[ level.bot_funcs["revive_think"] ]]();
    thread bot_think_crate();
    thread bot_think_crate_blocking_path();
    thread bot_think_usable_objects();
    thread bot_think_killstreak();
    thread bot_think_watch_aerial_killstreak();
    thread bot_think_gametype();
    thread bot_think_dynamic_doors();
    thread bot_think_nvg();
    /#
        thread function_85449d9e699cd4cd();
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6366
// Size: 0xd2
function function_85449d9e699cd4cd() {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        level endon("bot_think_tactical_goals");
        while (1) {
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
            if (isdefined(level.var_e6522d43cff255f2)) {
                bot_disable_tactical_goals();
                self.ignoreall = 1;
                self botsetstance("<unknown string>");
                if (!self bothasscriptgoal()) {
                    self botsetscriptgoal(level.var_e6522d43cff255f2, 0, "<unknown string>");
                } else {
                    goal = self botgetscriptgoal();
                    if (!bot_vectors_are_equal(goal, level.var_e6522d43cff255f2)) {
                        self botsetscriptgoal(level.var_e6522d43cff255f2, 0, "<unknown string>");
                    }
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643f
// Size: 0x47
function sortdoorsbydistance(var_a74f7efb3166d264, door2) {
    return distancesquared(var_a74f7efb3166d264.origin, self.closestdoorpos) < distancesquared(door2.origin, self.closestdoorpos);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x648e
// Size: 0xd1
function bot_think_dynamic_doors() {
    self notify("bot_think_dynamic_doors");
    self endon("bot_think_dynamic_doors");
    self endon("bot_suspended");
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        doorpos = self getmodifierlocationonpath("door", 64);
        if (isdefined(doorpos)) {
            self.closestdoorpos = doorpos;
            var_2a1bd16b401bcc79 = getentarrayinradius("dynamic_door", "targetname", doorpos, 64);
            if (var_2a1bd16b401bcc79.size > 0) {
                var_2a1bd16b401bcc79 = array_sort_with_func(var_2a1bd16b401bcc79, &sortdoorsbydistance);
                door = var_2a1bd16b401bcc79[0];
                if (isdefined(door.state) && door namespace_66efdc90612cfc0a::door_can_open_check()) {
                    door thread namespace_66efdc90612cfc0a::cheapopen(self);
                }
            }
            self.closestdoorpos = undefined;
        }
        wait(0.05);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6566
// Size: 0x19a
function bot_think_nvg() {
    self notify("bot_think_nvg");
    self endon("bot_think_nvg");
    self endon("bot_suspended");
    self endon("death");
    self endon("disconnect");
    level endon("game_ended");
    isnightmap = namespace_36f464722d326bbe::isnightmap();
    while (1) {
        indarkvolume = 0;
        var_9d8167bedff899c8 = 0;
        if (isdefined(level.bot_light_volumes)) {
            foreach (vol in level.bot_light_volumes) {
                if (self istouching(vol)) {
                    var_9d8167bedff899c8 = 1;
                    break;
                }
            }
        }
        if (isdefined(level.bot_dark_volumes)) {
            foreach (vol in level.bot_dark_volumes) {
                if (self istouching(vol)) {
                    indarkvolume = 1;
                    break;
                }
            }
        }
        if (istrue(self.inmotionlight)) {
            var_9d8167bedff899c8 = 1;
        }
        if (indarkvolume || isnightmap && !var_9d8167bedff899c8) {
            self botsetflag("dark_area", 1);
            self.indarkarea = 1;
        } else if (!indarkvolume && istrue(self.indarkarea)) {
            self botsetflag("dark_area", 0);
            self.indarkarea = 0;
        }
        wait(0.25);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6707
// Size: 0xb6
function bot_think_watch_enemy(var_ac75e1599d0c626b) {
    var_33942f6950bf3f15 = "spawned_player";
    if (isdefined(var_ac75e1599d0c626b) && var_ac75e1599d0c626b) {
        var_33942f6950bf3f15 = "death";
    }
    self notify("bot_think_watch_enemy");
    self endon("bot_think_watch_enemy");
    self endon("bot_suspended");
    self endon(var_33942f6950bf3f15);
    self endon("disconnect");
    level endon("game_ended");
    self.last_enemy_sight_time = 0;
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        if (isdefined(self.enemy)) {
            if (self botcanseeentity(self.enemy)) {
                self.last_enemy_sight_time = gettime();
            }
        }
        wait(0.05);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c4
// Size: 0x277
function bot_think_seek_dropped_weapons() {
    self notify("bot_think_seek_dropped_weapons");
    self endon("bot_think_seek_dropped_weapons");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_7ba262cc7ab5e283 = "throwingknife_mp";
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        var_6fe7e4707cd33327 = 0;
        if (bot_out_of_ammo()) {
            if (self [[ level.bot_funcs["should_pickup_weapons"] ]]() && !bot_is_remote_or_linked()) {
                dropped_weapons = getentarray("dropped_weapon", "targetname");
                var_6ac6ee221e4d7361 = get_array_of_closest(self.origin, dropped_weapons);
                if (var_6ac6ee221e4d7361.size > 0) {
                    dropped_weapon = var_6ac6ee221e4d7361[0];
                    bot_seek_dropped_weapon(dropped_weapon);
                }
            }
        }
        if (!bot_in_combat() && !bot_is_remote_or_linked() && self botgetdifficultysetting("strategyLevel") > 0) {
            var_4b40839ad49e4f31 = self hasweapon(var_7ba262cc7ab5e283);
            var_82086a598c0ce6f9 = var_4b40839ad49e4f31 && self getammocount(var_7ba262cc7ab5e283) == 0;
            if (var_82086a598c0ce6f9) {
                if (isdefined(self.going_for_knife)) {
                    wait(5);
                    continue;
                }
                var_908f2e093410ee48 = getentarray("dropped_knife", "targetname");
                var_d22a29017f63ae78 = get_array_of_closest(self.origin, var_908f2e093410ee48);
                foreach (knife in var_d22a29017f63ae78) {
                    if (!isdefined(knife)) {
                        continue;
                    }
                    if (!isdefined(knife.calculated_closest_point)) {
                        result = bot_queued_process("BotGetClosestNavigablePoint", &func_bot_get_closest_navigable_point, knife.origin, 32, self);
                        if (isdefined(knife)) {
                            knife.closest_point_on_grid = result;
                            knife.calculated_closest_point = 1;
                            goto LOC_0000021c;
                        }
                    } else if (isdefined(knife.closest_point_on_grid)) {
                        self.going_for_knife = 1;
                        bot_seek_dropped_weapon(knife);
                    }
                }
            } else if (var_4b40839ad49e4f31) {
                self.going_for_knife = undefined;
            }
        }
        wait(randomfloatrange(0.25, 0.75));
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a42
// Size: 0x133
function bot_seek_dropped_weapon(dropped_weapon) {
    if (bot_has_tactical_goal("seek_dropped_weapon", dropped_weapon) == 0) {
        action_thread = undefined;
        if (dropped_weapon.targetname == "dropped_weapon") {
            var_661c34ec270a10 = 1;
            heldweapons = self getweaponslistprimaries();
            foreach (var_ce408e508dcc5197 in heldweapons) {
                if (dropped_weapon.model == getweaponmodel(var_ce408e508dcc5197)) {
                    var_661c34ec270a10 = 0;
                }
            }
            if (var_661c34ec270a10) {
                action_thread = &bot_pickup_weapon;
            }
        }
        var_4f3b05e382bb8c7c = spawnstruct();
        var_4f3b05e382bb8c7c.object = dropped_weapon;
        var_4f3b05e382bb8c7c.script_goal_radius = 12;
        var_4f3b05e382bb8c7c.should_abort = level.bot_funcs["dropped_weapon_cancel"];
        var_4f3b05e382bb8c7c.action_thread = action_thread;
        bot_new_tactical_goal("seek_dropped_weapon", dropped_weapon.origin, 100, var_4f3b05e382bb8c7c);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b7c
// Size: 0x1d
function bot_pickup_weapon(goal) {
    self botpressbutton("use", 2);
    wait(2);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ba0
// Size: 0x80
function should_stop_seeking_weapon(goal) {
    if (!isdefined(goal.object)) {
        return 1;
    }
    if (goal.object.targetname == "dropped_weapon") {
        if (!bot_out_of_ammo()) {
            return 1;
        }
    } else if (goal.object.targetname == "dropped_knife") {
        if (bot_in_combat()) {
            self.going_for_knife = undefined;
            return 1;
        }
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c28
// Size: 0x53
function crate_in_range(crate) {
    if (!isdefined(crate.owner) || crate.owner != self) {
        if (distancesquared(self.origin, crate.origin) > 4194304) {
            return 0;
        }
    }
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c83
// Size: 0x1ee
function bot_crate_valid(crate) {
    if (!isdefined(crate)) {
        return 0;
    }
    var_16d0e355715fad81 = self [[ level.bot_funcs["crate_can_use"] ]](crate);
    if (!var_16d0e355715fad81) {
        if (getgametype() == "grnd") {
            var_16d0e355715fad81 = 1;
        }
    }
    /#
        assertex(isdefined(var_16d0e355715fad81), "crate_can_use callback is undefined, bots will not pickup crates in this mode");
    #/
    if (!var_16d0e355715fad81) {
        return 0;
    }
    if (!crate_landed_and_on_path_grid(crate)) {
        return 0;
    }
    if (level.teambased && isdefined(crate.bomb) && isdefined(crate.team) && crate.team == self.team) {
        return 0;
    }
    if (!self [[ level.bot_funcs["crate_in_range"] ]](crate)) {
        return 0;
    }
    if (isdefined(crate.boxtype)) {
        if (isdefined(level.boxsettings) && isdefined(level.boxsettings[crate.boxtype]) && ![[ level.boxsettings[crate.boxtype].canusecallback ]]()) {
            return 0;
        }
        if (isdefined(crate.disabled_use_for) && isdefined(crate.disabled_use_for[self getentitynumber()]) && crate.disabled_use_for[self getentitynumber()]) {
            return 0;
        }
        /#
            if (isdefined(level.bot_can_use_box_by_type) && !isdefined(level.bot_can_use_box_by_type[crate.boxtype])) {
                /#
                    assertmsg("<unknown string>" + crate.boxtype + "<unknown string>");
                #/
                return 0;
            }
        #/
        if (!isdefined(level.bot_can_use_box_by_type) || !self [[ level.bot_can_use_box_by_type[crate.boxtype] ]](crate)) {
            return 0;
        }
    } else if (bot_has_streak_in_crate(crate)) {
        return 0;
    }
    return isdefined(crate);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e79
// Size: 0xd
function bot_has_streak_in_crate(crate) {
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e8e
// Size: 0x3c
function crate_landed_and_on_path_grid(crate) {
    /#
        assert(isdefined(crate));
    #/
    if (!crate_has_landed(crate)) {
        return 0;
    }
    /#
        assert(isdefined(crate));
    #/
    if (!crate_is_on_path_grid(crate)) {
        return 0;
    }
    return isdefined(crate);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed2
// Size: 0x83
function crate_has_landed(crate) {
    if (isdefined(crate.boxtype)) {
        return (gettime() > crate.birthtime + 1000);
    } else {
        if (isdefined(crate.droppingtoground)) {
            return !crate.droppingtoground;
        }
        if (isdefined(crate.animname)) {
            return 0;
        }
        if (isdefined(crate.avlinvel)) {
            return (crate.avlinvel < 0.01);
        }
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f5d
// Size: 0x44
function crate_is_on_path_grid(crate) {
    /#
        assert(crate_has_landed(crate));
    #/
    if (!isdefined(crate.on_path_grid)) {
        crate_calculate_on_path_grid(crate);
    }
    return isdefined(crate) && crate.on_path_grid;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fa9
// Size: 0x100
function node_within_use_radius_of_crate(node, crate) {
    if (isdefined(crate.boxtype) && crate.boxtype == "scavenger_bag") {
        return (abs(node.origin[0] - crate.origin[0]) < 36 && abs(node.origin[0] - crate.origin[0]) < 36 && abs(node.origin[0] - crate.origin[0]) < 18);
    } else {
        var_ebd58f81541d9efb = getdvarfloat(@"hash_a62badf83a03d925");
        var_e9b1f8e9e674c72c = distancesquared(crate.origin, node.origin + (0, 0, 40));
        return (var_e9b1f8e9e674c72c <= var_ebd58f81541d9efb * var_ebd58f81541d9efb);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70b0
// Size: 0x242
function crate_calculate_on_path_grid(crate) {
    /#
        assert(!isdefined(crate.nearest_nodes));
    #/
    /#
        assert(!isdefined(crate.on_path_grid));
    #/
    crate thread crate_monitor_position();
    crate.on_path_grid = 0;
    var_bc2fb8699d6785aa = undefined;
    var_c6100808b5487220 = undefined;
    if (isdefined(crate.forcedisconnectuntil)) {
        var_bc2fb8699d6785aa = crate.forcedisconnectuntil;
        var_c6100808b5487220 = gettime() + 30000;
        crate.forcedisconnectuntil = var_c6100808b5487220;
        crate notify("path_disconnect");
    }
    wait(0.05);
    if (!isdefined(crate)) {
        return;
    }
    nearest_nodes = crate_get_nearest_valid_nodes(crate);
    if (!isdefined(crate)) {
        return;
    }
    if (isdefined(nearest_nodes) && nearest_nodes.size > 0) {
        crate.nearest_nodes = nearest_nodes;
        crate.on_path_grid = 1;
    } else {
        var_ebd58f81541d9efb = getdvarfloat(@"hash_a62badf83a03d925");
        var_9bde6ceb27bc4985 = getnodesinradiussorted(crate.origin, var_ebd58f81541d9efb * 2, 0)[0];
        var_46de623fb65654b7 = crate getpointinbounds(0, 0, -1);
        var_d00b3f12e88aee18 = undefined;
        if (isdefined(crate.boxtype) && crate.boxtype == "scavenger_bag") {
            if (bot_point_is_on_pathgrid(crate.origin, var_ebd58f81541d9efb)) {
                var_d00b3f12e88aee18 = crate.origin;
            }
        } else {
            var_d00b3f12e88aee18 = botgetclosestnavigablepoint(crate.origin, var_ebd58f81541d9efb);
        }
        if (isdefined(var_9bde6ceb27bc4985) && !var_9bde6ceb27bc4985 nodeisdisconnected() && isdefined(var_d00b3f12e88aee18) && abs(var_9bde6ceb27bc4985.origin[2] - var_46de623fb65654b7[2]) < 30) {
            crate.nearest_points = [0:var_d00b3f12e88aee18];
            crate.nearest_nodes = [0:var_9bde6ceb27bc4985];
            crate.on_path_grid = 1;
        }
    }
    if (isdefined(crate.forcedisconnectuntil)) {
        if (crate.forcedisconnectuntil == var_c6100808b5487220) {
            crate.forcedisconnectuntil = var_bc2fb8699d6785aa;
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f9
// Size: 0x253
function crate_get_nearest_valid_nodes(crate) {
    nodes = getnodesinradiussorted(crate.origin, 256, 0);
    for (i = nodes.size; i > 0; i--) {
        nodes[i] = nodes[i - 1];
    }
    nodes[0] = getclosestnodeinsight(crate.origin);
    var_f0c46916118d97cd = undefined;
    if (isdefined(crate.forcedisconnectuntil)) {
        var_f0c46916118d97cd = getnodecount();
    }
    var_a4a22899c4c3c751 = [];
    var_6ae00cccc4c48924 = 1;
    if (!isdefined(crate.boxtype)) {
        var_6ae00cccc4c48924 = 2;
    }
    for (i = 0; i < nodes.size; i++) {
        node = nodes[i];
        if (!isdefined(node) || !isdefined(crate)) {
            continue;
        }
        if (node nodeisdisconnected()) {
            continue;
        }
        if (!node_within_use_radius_of_crate(node, crate)) {
            if (i == 0) {
                continue;
            } else {
                break;
            }
        }
        wait(0.05);
        if (!isdefined(crate)) {
            break;
        }
        if (sighttracepassed(crate.origin, node.origin + (0, 0, 55), 0, crate)) {
            wait(0.05);
            if (!isdefined(crate)) {
                break;
            }
            if (!isdefined(crate.forcedisconnectuntil)) {
                var_a4a22899c4c3c751[var_a4a22899c4c3c751.size] = node;
                if (var_a4a22899c4c3c751.size == var_6ae00cccc4c48924) {
                    return var_a4a22899c4c3c751;
                    goto LOC_000001a7;
                }
            } else {
            LOC_000001a7:
                var_b4a4e2c4f49b95df = undefined;
                var_ac2425641a3964f5 = 0;
                while (!isdefined(var_b4a4e2c4f49b95df) && var_ac2425641a3964f5 < 100) {
                    var_ac2425641a3964f5++;
                    var_498acc2540d38c2c = randomint(var_f0c46916118d97cd);
                    var_1b82b6f689a2283d = getnodebyindex(var_498acc2540d38c2c);
                    if (isdefined(var_1b82b6f689a2283d) && distancesquared(node.origin, var_1b82b6f689a2283d.origin) > 250000) {
                        var_b4a4e2c4f49b95df = var_1b82b6f689a2283d;
                    }
                }
                if (isdefined(var_b4a4e2c4f49b95df)) {
                    path = bot_queued_process("GetNodesOnPathCrate", &func_get_nodes_on_path, node.origin, var_b4a4e2c4f49b95df.origin);
                    if (isdefined(path)) {
                        var_a4a22899c4c3c751[var_a4a22899c4c3c751.size] = node;
                        if (var_a4a22899c4c3c751.size == var_6ae00cccc4c48924) {
                            return var_a4a22899c4c3c751;
                        } else {
                            continue;
                        }
                    }
                }
            }
        }
    }
    return undefined;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7554
// Size: 0xbe
function crate_get_bot_target(crate) {
    if (isdefined(crate.nearest_points)) {
        return crate.nearest_points[0];
    }
    if (isdefined(crate.nearest_nodes) && crate.nearest_nodes.size > 0) {
        if (crate.nearest_nodes.size > 1) {
            nodes_sorted = array_reverse(self botnodescoremultiple(crate.nearest_nodes, "node_exposed"));
            return random_weight_sorted(nodes_sorted).origin;
        } else {
            return crate.nearest_nodes[0].origin;
        }
    }
    /#
        assertmsg("unreachable");
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7619
// Size: 0x63
function crate_get_bot_target_check_distance(crate, var_8c96767f296d03f3) {
    var_dbe8b001ddd1337e = crate_get_bot_target(crate);
    var_dbe8b001ddd1337e = getclosestpointonnavmesh(var_dbe8b001ddd1337e, self);
    var_d12fabbdd91ec827 = var_8c96767f296d03f3 * 0.9;
    var_d12fabbdd91ec827 = var_d12fabbdd91ec827 * var_d12fabbdd91ec827;
    if (distancesquared(crate.origin, var_dbe8b001ddd1337e) <= var_d12fabbdd91ec827) {
        return var_dbe8b001ddd1337e;
    } else {
        return undefined;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7683
// Size: 0x7a0
function bot_think_crate() {
    self notify("bot_think_crate");
    self endon("bot_think_crate");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_ebd58f81541d9efb = getdvarfloat(@"hash_a62badf83a03d925");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait_time = randomfloatrange(2, 4);
        waittill_notify_or_timeout("new_crate_to_take", wait_time);
        if (isdefined(self.boxes) && self.boxes.size == 0) {
            self.boxes = undefined;
        }
        var_dc8533e12089b719 = level.carepackages;
        if (!bot_in_combat() && isdefined(self.boxes)) {
            var_dc8533e12089b719 = array_combine(var_dc8533e12089b719, self.boxes);
        }
        if (isdefined(level.bot_scavenger_bags) && _hasperk("specialty_scavenger")) {
            var_dc8533e12089b719 = array_combine(var_dc8533e12089b719, level.bot_scavenger_bags);
        }
        if (isdefined(level.cratedata)) {
            foreach (crate in level.cratedata.crates) {
                if (isdefined(crate)) {
                    var_dc8533e12089b719[var_dc8533e12089b719.size] = crate;
                }
            }
        }
        var_dc8533e12089b719 = array_removeundefined(var_dc8533e12089b719);
        if (var_dc8533e12089b719.size == 0) {
            continue;
        }
        if (bot_has_tactical_goal("airdrop_crate") || self botgetscriptgoaltype() == "tactical" || bot_is_remote_or_linked()) {
            continue;
        }
        var_9e543bde5d2a2496 = [];
        foreach (crate in var_dc8533e12089b719) {
            if (bot_crate_valid(crate)) {
                var_9e543bde5d2a2496[var_9e543bde5d2a2496.size] = crate;
            }
        }
        var_9e543bde5d2a2496 = array_remove_duplicates(var_9e543bde5d2a2496);
        if (var_9e543bde5d2a2496.size == 0) {
            continue;
        }
        var_9e543bde5d2a2496 = get_array_of_closest(self.origin, var_9e543bde5d2a2496);
        var_b6f1deb8e946e67c = self getnearestnode();
        if (!isdefined(var_b6f1deb8e946e67c)) {
            continue;
        }
        ammolow = self [[ level.bot_funcs["crate_low_ammo_check"] ]]();
        var_ec5d6613e0b30ab7 = (ammolow || randomint(100) < 50) && !namespace_5a51aa78ea0b1b9f::is_empd();
        var_afa0f45bb9027fde = undefined;
        foreach (crate in var_9e543bde5d2a2496) {
            var_10256e13fb6f7945 = 0;
            if ((!isdefined(crate.owner) || crate.owner != self) && !isdefined(crate.boxtype)) {
                var_2df5bad592ba26ac = [];
                foreach (player in level.players) {
                    if (!isdefined(player.team)) {
                        continue;
                    }
                    if (!isai(player) && level.teambased && player.team == self.team) {
                        if (distancesquared(player.origin, crate.origin) < 490000) {
                            var_2df5bad592ba26ac[var_2df5bad592ba26ac.size] = player;
                        }
                    }
                }
                if (var_2df5bad592ba26ac.size > 0) {
                    var_f8b50191af8c5b3c = var_2df5bad592ba26ac[0] getnearestnode();
                    if (isdefined(var_f8b50191af8c5b3c)) {
                        var_10256e13fb6f7945 = 0;
                        foreach (node in crate.nearest_nodes) {
                            var_10256e13fb6f7945 = var_10256e13fb6f7945 || nodesvisible(var_f8b50191af8c5b3c, node, 1);
                        }
                    }
                }
            }
            if (!var_10256e13fb6f7945) {
                var_1cdea334d6287f87 = isdefined(crate.bots) && isdefined(crate.bots[self.team]) && crate.bots[self.team] > 0;
                var_539c5e6b72fb319 = 0;
                foreach (node in crate.nearest_nodes) {
                    var_539c5e6b72fb319 = var_539c5e6b72fb319 || nodesvisible(var_b6f1deb8e946e67c, node, 1);
                }
                if (var_539c5e6b72fb319 || var_ec5d6613e0b30ab7 && !var_1cdea334d6287f87) {
                    var_afa0f45bb9027fde = crate;
                    break;
                }
            }
        }
        if (isdefined(var_afa0f45bb9027fde)) {
            if (self [[ level.bot_funcs["crate_should_claim"] ]]()) {
                if (!isdefined(var_afa0f45bb9027fde.boxtype)) {
                    if (!isdefined(var_afa0f45bb9027fde.bots)) {
                        var_afa0f45bb9027fde.bots = [];
                    }
                    var_afa0f45bb9027fde.bots[self.team] = 1;
                }
            }
            var_4f3b05e382bb8c7c = spawnstruct();
            var_4f3b05e382bb8c7c.object = var_afa0f45bb9027fde;
            var_4f3b05e382bb8c7c.start_thread = &watch_bot_died_during_crate;
            var_4f3b05e382bb8c7c.should_abort = &crate_picked_up;
            var_b91af5af9f61959 = undefined;
            if (isdefined(var_afa0f45bb9027fde.boxtype)) {
                if (isdefined(var_afa0f45bb9027fde.boxtouchonly) && var_afa0f45bb9027fde.boxtouchonly) {
                    var_4f3b05e382bb8c7c.script_goal_radius = 16;
                    var_4f3b05e382bb8c7c.action_thread = undefined;
                    var_b91af5af9f61959 = var_afa0f45bb9027fde.origin;
                } else {
                    var_4f3b05e382bb8c7c.script_goal_radius = 50;
                    var_4f3b05e382bb8c7c.action_thread = &use_box;
                    var_e1fe7ee9b032b76f = crate_get_bot_target_check_distance(var_afa0f45bb9027fde, var_ebd58f81541d9efb);
                    if (!isdefined(var_e1fe7ee9b032b76f)) {
                        continue;
                    }
                    var_e1fe7ee9b032b76f = var_e1fe7ee9b032b76f - var_afa0f45bb9027fde.origin;
                    scale = length(var_e1fe7ee9b032b76f) * randomfloat(1);
                    var_b91af5af9f61959 = var_afa0f45bb9027fde.origin + vectornormalize(var_e1fe7ee9b032b76f) * scale + (0, 0, 12);
                }
            } else {
                var_4f3b05e382bb8c7c.action_thread = &use_crate;
                var_4f3b05e382bb8c7c.end_thread = &stop_using_crate;
                var_b91af5af9f61959 = crate_get_bot_target_check_distance(var_afa0f45bb9027fde, var_ebd58f81541d9efb);
                if (!isdefined(var_b91af5af9f61959)) {
                    continue;
                }
                var_4f3b05e382bb8c7c.script_goal_radius = var_ebd58f81541d9efb - distance(var_afa0f45bb9027fde.origin, var_b91af5af9f61959 + (0, 0, 40));
                var_b91af5af9f61959 = var_b91af5af9f61959 + (0, 0, 24);
            }
            if (isdefined(var_4f3b05e382bb8c7c.script_goal_radius)) {
                /#
                    assert(var_4f3b05e382bb8c7c.script_goal_radius >= 0);
                #/
            }
            var_afa0f45bb9027fde notify("path_disconnect");
            wait(0.05);
            if (!isdefined(var_afa0f45bb9027fde)) {
                continue;
            }
            bot_new_tactical_goal("airdrop_crate", var_b91af5af9f61959, 30, var_4f3b05e382bb8c7c);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e2a
// Size: 0xe
function bot_should_use_ballistic_vest_crate(crate) {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e40
// Size: 0x5
function crate_should_claim() {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4d
// Size: 0x4
function crate_low_ammo_check() {
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e59
// Size: 0x3e
function bot_should_use_ammo_crate(crate) {
    if (getcompleteweaponname(self getcurrentweapon()) == level.boxsettings[crate.boxtype].minigunweapon) {
        return 0;
    }
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e9f
// Size: 0x22
function bot_pre_use_ammo_crate(crate) {
    _switchtoweapon(self.secondaryweapon);
    wait(1);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ec8
// Size: 0x27
function bot_post_use_ammo_crate(crate) {
    _switchtoweapon(nullweapon());
    self.secondaryweapon = self getcurrentweapon();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef6
// Size: 0x97
function bot_should_use_scavenger_bag(crate) {
    if (bot_get_low_on_ammo(0.66)) {
        var_b6f1deb8e946e67c = self getnearestnode();
        if (isdefined(crate.nearest_nodes) && isdefined(crate.nearest_nodes[0]) && isdefined(var_b6f1deb8e946e67c)) {
            if (nodesvisible(var_b6f1deb8e946e67c, crate.nearest_nodes[0], 1)) {
                if (within_fov(self.origin, self getplayerangles(), crate.origin, self botgetfovdot())) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f95
// Size: 0x72
function bot_should_use_grenade_crate(crate) {
    var_e45d691f05eaa114 = self getweaponslistoffhands();
    foreach (weapon in var_e45d691f05eaa114) {
        if (self getweaponammostock(weapon) == 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x800f
// Size: 0xe
function bot_should_use_juicebox_crate(crate) {
    return 1;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8025
// Size: 0x79
function crate_monitor_position() {
    self notify("crate_monitor_position");
    self endon("crate_monitor_position");
    self endon("death");
    level endon("game_ended");
    while (1) {
        lastpos = self.origin;
        wait(0.5);
        if (!isdefined(self)) {
            return;
        }
        if (!bot_vectors_are_equal(self.origin, lastpos)) {
            self.on_path_grid = undefined;
            self.nearest_nodes = undefined;
            self.nearest_points = undefined;
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80a5
// Size: 0x9
function crate_wait_use() {
    wait(0.5);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80b5
// Size: 0x1f
function crate_picked_up(goal) {
    if (!isdefined(goal.object)) {
        return 1;
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80dc
// Size: 0x1aa
function use_crate(goal) {
    if (isagent(self)) {
        val::function_c9d0b43701bdba00("agent_use");
        goal.object enableplayeruse(self);
        wait(0.05);
    }
    self [[ level.bot_funcs["crate_wait_use"] ]]();
    if (isdefined(goal.object.owner) && goal.object.owner == self) {
        time = level.crateownerusetime / 1000 + 0.5;
    } else {
        time = level.cratenonownerusetime / 1000 + 1;
    }
    self botpressbutton("use", time);
    while (time > 0 && isdefined(goal.object)) {
        wait(0.05);
        time = time - 0.05;
    }
    if (time > 0) {
        wait(randomfloatrange(0.05, 0.5));
    }
    if (isagent(self)) {
        val::set("agent_use", "usability", 0);
        if (isdefined(goal.object)) {
            goal.object disableplayeruse(self);
        }
    }
    if (isdefined(goal.object)) {
        if (!isdefined(goal.object.bots_used)) {
            goal.object.bots_used = [];
        }
        goal.object.bots_used[goal.object.bots_used.size] = self;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828d
// Size: 0x16c
function use_box(goal) {
    if (isagent(self)) {
        val::function_c9d0b43701bdba00("agent_use");
        goal.object enableplayeruse(self);
        wait(0.05);
    }
    if (isdefined(goal.object) && isdefined(goal.object.boxtype)) {
        boxtype = goal.object.boxtype;
        if (isdefined(level.bot_pre_use_box_of_type[boxtype])) {
            self [[ level.bot_pre_use_box_of_type[boxtype] ]](goal.object);
        }
        if (isdefined(goal.object)) {
            time = level.boxsettings[goal.object.boxtype].usetime / 1000 + 0.5;
            self botpressbutton("use", time);
            wait(time);
            if (isdefined(level.bot_post_use_box_of_type[boxtype])) {
                self [[ level.bot_post_use_box_of_type[boxtype] ]](goal.object);
            }
        }
    }
    if (isagent(self)) {
        val::set("agent_use", "usability", 0);
        if (isdefined(goal.object)) {
            goal.object disableplayeruse(self);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8400
// Size: 0x1f
function watch_bot_died_during_crate(goal) {
    thread bot_watch_for_death(goal.object);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8426
// Size: 0x3c
function stop_using_crate(goal) {
    if (isdefined(goal.object)) {
        goal.object.bots[self.team] = 0;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8469
// Size: 0x51
function bot_watch_for_death(object) {
    object endon("death_or_disconnect");
    object endon("revived");
    level endon("game_ended");
    var_d0c86817ad6633c8 = self.team;
    self waittill("death_or_disconnect");
    if (isdefined(object)) {
        object.bots[var_d0c86817ad6633c8] = 0;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c1
// Size: 0x16f
function bot_think_crate_blocking_path() {
    self notify("bot_think_crate_blocking_path");
    self endon("bot_think_crate_blocking_path");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    radius = getdvarfloat(@"hash_a62badf83a03d925");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait(3);
        if (self usebuttonpressed()) {
            continue;
        }
        if (isusingremote()) {
            continue;
        }
        crates = level.carepackages;
        for (i = 0; i < crates.size; i++) {
            crate = crates[i];
            if (!isdefined(crate)) {
                continue;
            }
            var_c5d3d8ff129f88ba = self getplayeruseentity();
            if (!isdefined(var_c5d3d8ff129f88ba) || var_c5d3d8ff129f88ba != crate) {
                continue;
            }
            if (distancesquared(self.origin, crate.origin) < radius * radius) {
                if (!bot_has_streak_in_crate(crate)) {
                    if (isdefined(crate.owner) && crate.owner == self) {
                        self botpressbutton("use", level.crateownerusetime / 1000 + 0.5);
                    } else {
                        self botpressbutton("use", level.cratenonownerusetime / 1000 + 0.5);
                    }
                }
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8637
// Size: 0xb5
function bot_think_usable_objects() {
    self notify("bot_think_usable_objects");
    self endon("bot_think_usable_objects");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait(2);
        if (self usebuttonpressed()) {
            continue;
        }
        if (isusingremote()) {
            continue;
        }
        var_c5d3d8ff129f88ba = self getplayeruseentity();
        if (isdefined(var_c5d3d8ff129f88ba)) {
            if (isdefined(var_c5d3d8ff129f88ba.equipmentref) && var_c5d3d8ff129f88ba.equipmentref == "equip_tac_insert") {
                self botpressbutton("use", 1);
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86f3
// Size: 0x452
function bot_think_revive() {
    self notify("bot_think_revive");
    self endon("bot_think_revive");
    self endon("bot_suspended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!level.teambased) {
        return;
    }
    if (!islaststandenabled() && !isteamreviveenabled()) {
        return;
    }
    while (1) {
        waittime = 2;
        var_199a5ebbb9ca9fa2 = getentarray("revive_trigger", "targetname");
        var_2b6486bbc80874ad = level.revivetriggers;
        var_6ef961eea0a186a4 = array_combine(var_199a5ebbb9ca9fa2, var_2b6486bbc80874ad);
        if (var_6ef961eea0a186a4.size > 0) {
            waittime = 0.05;
        }
        level waittill_notify_or_timeout("player_last_stand", waittime);
        if (!bot_can_revive()) {
            self.isbotmedicrole = 0;
            continue;
        }
        var_199a5ebbb9ca9fa2 = getentarray("revive_trigger", "targetname");
        var_2b6486bbc80874ad = level.revivetriggers;
        var_6ef961eea0a186a4 = array_combine(var_199a5ebbb9ca9fa2, var_2b6486bbc80874ad);
        if (var_6ef961eea0a186a4.size == 0) {
            continue;
        }
        var_10f56a3597f09ae = 1;
        var_557d59ebff7d41b2 = namespace_54d20dd0dd79277f::getteamdata(self.team, "teamCount");
        if (var_557d59ebff7d41b2 < 4) {
            var_10f56a3597f09ae = 0;
        }
        if (var_6ef961eea0a186a4.size > var_10f56a3597f09ae) {
            var_6ef961eea0a186a4 = sortbydistance(var_6ef961eea0a186a4, self.origin);
            if (isdefined(self.owner)) {
                for (i = 0; i < var_6ef961eea0a186a4.size; i++) {
                    if (var_6ef961eea0a186a4[i].owner != self.owner) {
                        continue;
                    }
                    if (i == 0) {
                        break;
                    }
                    var_65a9dcf5e2e9fc21 = var_6ef961eea0a186a4[i];
                    var_6ef961eea0a186a4[i] = var_6ef961eea0a186a4[0];
                    var_6ef961eea0a186a4[0] = var_65a9dcf5e2e9fc21;
                    break;
                }
            }
        }
        foreach (revive_trigger in var_6ef961eea0a186a4) {
            player = revive_trigger.owner;
            if (!isdefined(player)) {
                continue;
            }
            if (player == self) {
                continue;
            }
            if (islaststandenabled() && (!isalive(player) || isdefined(player.fauxdead) || istrue(player.delayedspawnedplayernotify))) {
                continue;
            }
            if (player.team != self.team) {
                continue;
            }
            if (islaststandenabled() && (!isdefined(player.inlaststand) || !player.inlaststand) && !namespace_cd0b2d039510b38d::isteamreviveenabled()) {
                continue;
            }
            if (isdefined(player.bots) && isdefined(player.bots[self.team]) && player.bots[self.team] > 0) {
                continue;
            }
            if (islaststandenabled()) {
                var_9c78936fdf29bd66 = player.origin;
            } else {
                var_9c78936fdf29bd66 = revive_trigger.origin;
            }
            if (distancesquared(self.origin, var_9c78936fdf29bd66) < 4194304) {
                var_4f3b05e382bb8c7c = spawnstruct();
                var_4f3b05e382bb8c7c.object = revive_trigger;
                var_4f3b05e382bb8c7c.script_goal_radius = 64;
                if (isdefined(self.last_revive_fail_time) && gettime() - self.last_revive_fail_time < 1000) {
                    var_4f3b05e382bb8c7c.script_goal_radius = 32;
                }
                var_4f3b05e382bb8c7c.start_thread = &watch_bot_died_during_revive;
                var_4f3b05e382bb8c7c.end_thread = &stop_reviving;
                var_4f3b05e382bb8c7c.should_abort = &player_revived_or_dead;
                var_4f3b05e382bb8c7c.action_thread = &revive_player;
                var_8669bec9aa3b0fc4 = 60;
                if (namespace_54d20dd0dd79277f::getteamdata(self.team, "aliveCount") == 1) {
                    var_8669bec9aa3b0fc4 = 100;
                }
                bot_new_tactical_goal("revive", var_9c78936fdf29bd66, var_8669bec9aa3b0fc4, var_4f3b05e382bb8c7c);
                self.isbotmedicrole = 1;
                player.bots[self.team] = 1;
                break;
            }
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b4c
// Size: 0x32
function watch_bot_died_during_revive(goal) {
    if (islaststandenabled()) {
        thread bot_watch_for_death(goal.object.owner);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b85
// Size: 0x50
function stop_reviving(goal) {
    if (isdefined(goal.object.owner)) {
        goal.object.owner.bots[self.team] = 0;
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bdc
// Size: 0xe1
function player_revived_or_dead(goal) {
    if (islaststandenabled()) {
        if (!isdefined(goal.object.owner) || goal.object.owner.health <= 0) {
            return 1;
        }
        if (!isdefined(goal.object.owner.inlaststand) || !goal.object.owner.inlaststand) {
            return 1;
        }
    } else if (!isdefined(goal.object.owner) || isreallyalive(goal.object.owner)) {
        return 1;
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc5
// Size: 0x21d
function revive_player(goal) {
    if (isdefined(goal.object.owner)) {
        goal.object.owner.bots[self.team] = 1;
    }
    if (islaststandenabled()) {
        var_e7072356f2fbfc24 = goal.object.owner.origin;
    } else {
        var_e7072356f2fbfc24 = goal.object.origin;
    }
    if (distancesquared(self.origin, var_e7072356f2fbfc24) > 4900) {
        self.last_revive_fail_time = gettime();
        return;
    }
    if (isagent(self)) {
        val::function_c9d0b43701bdba00("agent_use");
        goal.object enableplayeruse(self);
        wait(0.05);
    }
    var_d0c86817ad6633c8 = self.team;
    if (islaststandenabled()) {
        use_time = level.laststandrevivetimer;
    } else if (isdefined(goal.object.usetime)) {
        use_time = goal.object.usetime / 1000;
    } else {
        use_time = 3;
    }
    self botlookatpoint(goal.object.origin, use_time + 1, "script_forced");
    wait(0.5);
    self botpressbutton("use", use_time + 0.5);
    wait(use_time + 1.5);
    if (isdefined(goal.object.owner)) {
        goal.object.owner.bots[var_d0c86817ad6633c8] = 0;
    }
    if (isagent(self)) {
        val::set("agent_use", "usability", 0);
        if (isdefined(goal.object)) {
            goal.object disableplayeruse(self);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ee9
// Size: 0xf3
function bot_can_revive() {
    if (isdefined(self.laststand) && self.laststand == 1) {
        return 0;
    }
    if (bot_has_tactical_goal("revive")) {
        return 0;
    }
    if (bot_is_remote_or_linked()) {
        return 0;
    }
    if (bot_is_bodyguarding()) {
        return 1;
    }
    if (isdefined(level.bot_funcs["tactical_revive_override"])) {
        result = self [[ level.bot_funcs["tactical_revive_override"] ]]();
        if (result) {
            self.isbotmedicrole = 0;
            return 1;
        }
    }
    var_8635a138f0ba2a2a = self botgetscriptgoaltype();
    if (var_8635a138f0ba2a2a == "none" || var_8635a138f0ba2a2a == "hunt" || var_8635a138f0ba2a2a == "guard") {
        return 1;
    }
    if (var_8635a138f0ba2a2a == "objective") {
        goal = self botgetscriptgoal();
        if (distance(self.origin, goal) > 500) {
            return 1;
        }
    }
    return 0;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fe4
// Size: 0x3b
function revive_watch_for_finished(player) {
    self endon("death_or_disconnect");
    self endon("bad_path");
    self endon("goal");
    player waittill_any_2("death", "revived");
    self notify("bad_path");
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9026
// Size: 0x137
function bot_know_enemies_on_start() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (gettime() > 15000) {
        return;
    }
    while (!gamehasstarted() || !namespace_4b0406965e556711::gameflag("prematch_done")) {
        wait(0.05);
    }
    var_5ff5b48fd903f4f5 = undefined;
    var_ea273c648ae678dc = undefined;
    for (var_6b22d0e7bbdc2dee = 0; var_6b22d0e7bbdc2dee < level.players.size; var_6b22d0e7bbdc2dee++) {
        otherplayer = level.players[var_6b22d0e7bbdc2dee];
        if (isdefined(otherplayer) && isdefined(self.team) && isdefined(otherplayer.team) && !isalliedsentient(self, otherplayer)) {
            if (!isdefined(otherplayer.bot_start_known_by_enemy)) {
                var_5ff5b48fd903f4f5 = otherplayer;
            }
            if (isai(otherplayer) && !isdefined(otherplayer.bot_start_know_enemy)) {
                var_ea273c648ae678dc = otherplayer;
            }
        }
    }
    if (isdefined(var_5ff5b48fd903f4f5)) {
        self.bot_start_know_enemy = 1;
        var_5ff5b48fd903f4f5.bot_start_known_by_enemy = 1;
        self getenemyinfo(var_5ff5b48fd903f4f5);
    }
    if (isdefined(var_ea273c648ae678dc)) {
        var_ea273c648ae678dc.bot_start_know_enemy = 1;
        self.bot_start_known_by_enemy = 1;
        var_ea273c648ae678dc getenemyinfo(self);
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9164
// Size: 0x5d
function bot_think_gametype() {
    self notify("bot_think_gametype");
    self endon("bot_think_gametype");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_5076db025cbed16e = 0;
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_5076db025cbed16e = 1;
    }
    if (!var_5076db025cbed16e) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    self thread [[ level.bot_funcs["gametype_think"] ]]();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91c8
// Size: 0x3
function default_gametype_think() {
    
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91d2
// Size: 0x86
function monitor_smoke_grenades() {
    level.bot_smoke_sight_clip_large = getent("smoke_grenade_sight_clip_256", "targetname");
    if (!isdefined(level.bot_smoke_sight_clip_large)) {
        /#
            assertmsg("Missing script_brushmodel with targetname '" + "smoke_grenade_sight_clip_256" + "'.  Make sure the 'care_package' prefab is included in this map.");
        #/
        return;
    }
    while (1) {
        objweapon = grenade = level waittill("smoke");
        if (objweapon.basename == "smoke_grenade_mp") {
            grenade thread handle_smoke();
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x925f
// Size: 0x2e
function handle_smoke() {
    self endon("late_death");
    thread smoke_grenade_late_death();
    var_7ca9d4ee7d70f3e2 = self waittill("explode");
    thread create_smoke_occluder(var_7ca9d4ee7d70f3e2);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9294
// Size: 0x6c
function create_smoke_occluder(origin, var_7afde3d639286931) {
    occluder = spawn("script_model", origin);
    occluder show();
    wait(1);
    occluder clonebrushmodeltoscriptmodel(level.bot_smoke_sight_clip_large);
    occluder setmovertransparentvolume();
    duration = 8.75;
    if (isdefined(var_7afde3d639286931)) {
        duration = var_7afde3d639286931;
    }
    wait(duration);
    occluder delete();
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9307
// Size: 0x1b
function smoke_grenade_late_death() {
    self endon("explode");
    self waittill("death");
    waittillframeend();
    self notify("late_death");
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9329
// Size: 0x13f
function bot_add_scavenger_bag(dropbag) {
    added = 0;
    dropbag.boxtype = "scavenger_bag";
    dropbag.boxtouchonly = 1;
    if (!isdefined(level.bot_scavenger_bags)) {
        level.bot_scavenger_bags = [];
    }
    foreach (index, var_d5d33ef6554b62ce in level.bot_scavenger_bags) {
        if (!isdefined(var_d5d33ef6554b62ce)) {
            added = 1;
            level.bot_scavenger_bags[index] = dropbag;
            break;
        }
    }
    if (!added) {
        level.bot_scavenger_bags[level.bot_scavenger_bags.size] = dropbag;
    }
    foreach (var_d7836ab41dca3e4a in level.participants) {
        if (isai(var_d7836ab41dca3e4a) && var_d7836ab41dca3e4a _hasperk("specialty_scavenger")) {
            var_d7836ab41dca3e4a notify("new_crate_to_take");
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946f
// Size: 0xa8
function bot_triggers() {
    var_750831cedcd7f13e = getentarray("bot_flag_set", "targetname");
    foreach (trigger in var_750831cedcd7f13e) {
        if (!isdefined(trigger.script_noteworthy)) {
            /#
                assertmsg("Bot Flag trigger at " + trigger.origin + " is missing script_noteworthy flag name.");
            #/
        } else {
            trigger thread bot_flag_trigger(trigger.script_noteworthy);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951e
// Size: 0x56
function bot_flag_trigger(flag_name) {
    self endon("death");
    while (1) {
        bot = self waittill("trigger");
        if (namespace_36f464722d326bbe::isaigameparticipant(bot)) {
            bot notify("flag_trigger_set_" + flag_name);
            bot botsetflag(flag_name, 1);
            bot thread bot_flag_trigger_clear(flag_name);
        }
    }
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x957b
// Size: 0x2e
function bot_flag_trigger_clear(flag_name) {
    self endon("flag_trigger_set_" + flag_name);
    self endon("death_or_disconnect");
    level endon("game_ended");
    waitframe();
    waittillframeend();
    self botsetflag(flag_name, 0);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95b0
// Size: 0x1fe
function function_361fab20102e6557() {
    /#
        level endon("bot_think_tactical_goals");
        while (1) {
            var_c2985b5ae5fee336 = getdvarint(@"hash_d2c1e13b48beed87", 0);
            if (var_c2985b5ae5fee336) {
                setdvar(@"hash_d2c1e13b48beed87", 0);
                host = namespace_e6eafa63d63ab54d::devfindhost();
                if (!isdefined(host)) {
                    continue;
                }
                spawnorigin = function_b771795f421ef637(host);
                if (!isdefined(spawnorigin)) {
                    continue;
                }
                spawnorigin = getclosestpointonnavmesh(spawnorigin);
                var_93bed5aae5070beb = host getplayerangles();
                spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
                if (var_c2985b5ae5fee336 == 2) {
                    setdvar(@"hash_5e767ceb6b77e053", -2);
                } else {
                    setdvar(@"hash_5e767ceb6b77e053", -3);
                }
                setdvar(@"hash_2d5236cbe9894aff", 1);
                player = level waittill("<unknown string>");
                player setorigin(spawnorigin);
                player setplayerangles(spawnangles);
                setdvar(@"hash_5e767ceb6b77e053", 0);
            }
            var_e9b4a948c50db028 = getdvarint(@"hash_39a9059930f4ca30", 0);
            if (var_e9b4a948c50db028) {
                setdvar(@"hash_39a9059930f4ca30", 0);
                host = namespace_e6eafa63d63ab54d::devfindhost();
                if (!isdefined(host)) {
                    continue;
                }
                if (var_e9b4a948c50db028 == 2) {
                    team = host.team;
                } else {
                    team = namespace_3c37cb17ade254d::get_enemy_team(host.team);
                }
                spawnorigin = function_b771795f421ef637(host);
                if (!isdefined(spawnorigin)) {
                    continue;
                }
                var_93bed5aae5070beb = host getplayerangles();
                spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
                var_4f9efd61abf87fb0 = spawnstruct();
                var_4f9efd61abf87fb0.origin = spawnorigin;
                var_4f9efd61abf87fb0.angles = spawnangles;
                level thread [[ level.bot_funcs["<unknown string>"] ]](1, team, undefined, undefined, undefined, undefined, var_4f9efd61abf87fb0);
            }
            waitframe();
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97b5
// Size: 0x172
function function_c71139dd1c600b64() {
    /#
        level endon("bot_think_tactical_goals");
        while (1) {
            var_80037671e3f2ed57 = getdvarint(@"hash_8cd9f80a99bccf2f", 0);
            if (var_80037671e3f2ed57) {
                setdvar(@"hash_8cd9f80a99bccf2f", 0);
                if (!isdefined(level.var_6d4b0d324eef7492)) {
                    continue;
                }
                switch (var_80037671e3f2ed57) {
                case 1:
                    var_9369cf0d229589 = "<unknown string>";
                    var_7d14e075a8fac17e = 999;
                    break;
                case 2:
                    var_9369cf0d229589 = "<unknown string>";
                    var_7d14e075a8fac17e = 999;
                    break;
                case 3:
                    var_9369cf0d229589 = "<unknown string>";
                    var_7d14e075a8fac17e = 999;
                    break;
                default:
                    var_9369cf0d229589 = "<unknown string>";
                    var_7d14e075a8fac17e = 1;
                    break;
                }
                foreach (bot in level.var_6d4b0d324eef7492) {
                    if (var_7d14e075a8fac17e <= 0) {
                        break;
                    }
                    if (var_9369cf0d229589 == "<unknown string>" || var_9369cf0d229589 == bot.team) {
                        kick(bot getentitynumber());
                    }
                    var_7d14e075a8fac17e--;
                }
                level.var_6d4b0d324eef7492 = array_removeundefined(level.var_6d4b0d324eef7492);
            }
            waitframe();
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x992e
// Size: 0xc1
function function_b771795f421ef637(player) {
    angles = player getplayerangles();
    fwd = anglestoforward(angles);
    eye = player geteye();
    end = eye + fwd * 10000;
    traces = namespace_2a184fc4902783dc::ray_trace_get_all_results(eye, end);
    foreach (trace in traces) {
        if (!isdefined(trace["entity"])) {
            return trace["position"];
        }
    }
    return undefined;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99f7
// Size: 0xa7
function function_8e439247eeca6302() {
    self botsetflag("disable_movement", 1);
    self botsetflag("disable_rotation", 1);
    self botsetflag("disable_attack", 1);
    self.ignoreall = 1;
    origin = getclosestpointonnavmesh(function_53c4c53197386572(self.pers[#"hash_b4e62d7caafad3be"], self.origin));
    angles = function_53c4c53197386572(self.pers[#"hash_36e3a9fa37a8b454"], self.angles);
    self setorigin(origin);
    self setplayerangles(angles);
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa5
// Size: 0x3e
function function_22577987c6639704(neworigin, newangles) {
    self.pers[#"hash_b4e62d7caafad3be"] = neworigin;
    self.pers[#"hash_36e3a9fa37a8b454"] = newangles;
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9aea
// Size: 0x191
function function_8c79a04b049a7ea2() {
    /#
        level endon("bot_think_tactical_goals");
        while (1) {
            var_a074ce85487e9da0 = getdvarint(@"hash_670fcefaa6d8a693", 0);
            if (var_a074ce85487e9da0) {
                setdvar(@"hash_670fcefaa6d8a693", 0);
                if (var_a074ce85487e9da0 == 3 && isdefined(level.var_27adcb3791e65677)) {
                    kick(level.var_27adcb3791e65677 getentitynumber());
                    level.var_27adcb3791e65677 = undefined;
                    continue;
                }
                host = namespace_e6eafa63d63ab54d::devfindhost();
                if (!isdefined(host)) {
                    continue;
                }
                team = namespace_3c37cb17ade254d::get_enemy_team(host.team);
                if (var_a074ce85487e9da0 == 1) {
                    spawnorigin = function_b771795f421ef637(host);
                    if (!isdefined(spawnorigin)) {
                        continue;
                    }
                    var_93bed5aae5070beb = host getplayerangles();
                    spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
                } else {
                    results = level function_5723f098aabd9836(host);
                    if (!isdefined(results)) {
                        continue;
                    }
                    spawnorigin = results["<unknown string>"];
                    spawnangles = results["<unknown string>"];
                }
                if (isdefined(level.var_27adcb3791e65677)) {
                    level function_6ff6a20ce4521fa9(spawnorigin, spawnangles);
                    continue;
                }
                var_4f9efd61abf87fb0 = spawnstruct();
                var_4f9efd61abf87fb0.origin = spawnorigin;
                var_4f9efd61abf87fb0.angles = spawnangles;
                level thread [[ level.bot_funcs["<unknown string>"] ]](1, team, &function_8af1863f5e7ade4a, undefined, undefined, undefined, var_4f9efd61abf87fb0);
            }
            waitframe();
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c82
// Size: 0x17
function function_8af1863f5e7ade4a() {
    /#
        level.var_27adcb3791e65677 = self;
        function_5188aadb27d72a11();
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9ca0
// Size: 0x75
function function_6ff6a20ce4521fa9(origin, angles) {
    /#
        level.var_27adcb3791e65677.pers[#"hash_b4e62d7caafad3be"] = origin;
        level.var_27adcb3791e65677.pers[#"hash_36e3a9fa37a8b454"] = angles;
        level.var_27adcb3791e65677 setorigin(origin);
        level.var_27adcb3791e65677 setplayerangles(angles);
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d1c
// Size: 0x70
function function_5188aadb27d72a11() {
    /#
        host = namespace_e6eafa63d63ab54d::devfindhost();
        if (!isdefined(self.hud)) {
            function_e53f5c23f0a7a78f(host);
        }
        self.var_2fc19f3a438f03a5 = 0;
        self.var_b0ab2dca24bfe60a = 0;
        self.var_81d330e02eced419 = undefined;
        self.fnbotdamagecallback = &function_b09b8c00320b91e;
        thread function_6e65c3faa4356411();
        thread function_c87dcea241ae074d();
        thread function_51da8c98ef44eceb();
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x9d93
// Size: 0x247
function function_b09b8c00320b91e(eattacker, idamage, smeansofdeath, objweapon, einflictor, shitloc, vpoint, var_1da1a66b5c6a06a7) {
    /#
        if (!isdefined(var_1da1a66b5c6a06a7)) {
            var_1da1a66b5c6a06a7 = 0;
        }
        host = namespace_e6eafa63d63ab54d::devfindhost();
        if (!isdefined(host) || eattacker != host) {
            return;
        }
        self.var_2fc19f3a438f03a5++;
        self.var_b0ab2dca24bfe60a = self.var_b0ab2dca24bfe60a + idamage + var_1da1a66b5c6a06a7;
        if (!isdefined(self.var_81d330e02eced419)) {
            self.var_81d330e02eced419 = gettime();
        }
        if (eattacker == einflictor) {
            goto LOC_00000107;
        }
        source_pos = self.origin;
        range = distance(source_pos, vpoint);
        var_929c84236ae82a56 = strtok(getcompleteweaponname(objweapon), "<unknown string>");
        weap_name = "class_select";
        foreach (tok in var_929c84236ae82a56) {
            weap_name = weap_name + tok + "<unknown string>";
        }
        if (isdefined(self.armorhealth)) {
            self.menu["<unknown string>"] setvalue(self.armorhealth);
        }
        self.menu["<unknown string>"] setvalue(self.health);
        self.menu["<unknown string>"] setvalue(idamage + var_1da1a66b5c6a06a7);
        self.menu["<unknown string>"] setvalue(self.var_b0ab2dca24bfe60a);
        self.menu["<unknown string>"] setvalue(self.var_2fc19f3a438f03a5);
        self.menu["<unknown string>"] setvalue(range);
        self.menu["<unknown string>"] setdevtext(shitloc);
        self.menu["<unknown string>"] setdevtext(weap_name);
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe1
// Size: 0x5a
function function_6e65c3faa4356411() {
    /#
        self endon("<unknown string>");
        for (;;) {
            waitframe();
            if (isdefined(self.armorhealth)) {
                self.menu["<unknown string>"] setvalue(self.armorhealth);
            }
            self.menu["<unknown string>"] setvalue(self.health);
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa042
// Size: 0x71
function function_c87dcea241ae074d() {
    /#
        self waittill("<unknown string>");
        self.hud destroy();
        foreach (menu in self.menu) {
            menu destroy();
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0ba
// Size: 0x31
function function_51da8c98ef44eceb() {
    /#
        self endon("<unknown string>");
        while (1) {
            self waittill("<unknown string>");
            self.var_2fc19f3a438f03a5 = 0;
            self.var_b0ab2dca24bfe60a = 0;
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f2
// Size: 0xd9
function function_5723f098aabd9836(host) {
    /#
        host endon("<unknown string>");
        host endon("<unknown string>");
        placementmodel = spawn("<unknown string>", (0, 0, 0));
        placementmodel setmodel("<unknown string>");
        for (;;) {
            waitframe();
            spawnorigin = function_b771795f421ef637(host);
            if (!isdefined(spawnorigin)) {
                continue;
            }
            var_93bed5aae5070beb = host getplayerangles();
            spawnangles = (0, var_93bed5aae5070beb[1] + 180, 0);
            placementmodel.origin = spawnorigin;
            placementmodel.angles = spawnangles;
            if (host usebuttonpressed()) {
                results = [];
                results["<unknown string>"] = spawnorigin;
                results["<unknown string>"] = spawnangles;
                placementmodel delete();
                return results;
            }
        }
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1d2
// Size: 0x2f8
function function_e53f5c23f0a7a78f(host) {
    /#
        x = -40;
        y = 145;
        scale = 0.9;
        self.hud = host function_829a24c34a7fda26("<unknown string>", x, y, scale, 0.6, 10);
        menu = [];
        var_1d5331a045a8371a = x + 5;
        if (isdefined(host.armorhealth)) {
            menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        }
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        menu[menu.size] = host function_829a24c34a7fda26("<unknown string>", var_1d5331a045a8371a, y + 10 * (menu.size + 1), scale);
        var_1d5331a045a8371a = x + 85;
        var_2e1ce198700f793c = menu.size;
        if (isdefined(host.armorhealth)) {
            menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        }
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        menu["<unknown string>"] = host function_829a24c34a7fda26("class_select", var_1d5331a045a8371a, y + 10 * (menu.size + 1 - var_2e1ce198700f793c), scale);
        self.menu = menu;
    #/
}

// Namespace bots/namespace_e4a5fcd525f0b19b
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa4d1
// Size: 0x124
function function_829a24c34a7fda26(text, x, y, scale, alpha, sort) {
    /#
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(scale)) {
            scale = 1;
        }
        if (!isdefined(sort)) {
            sort = 20;
        }
        hudelem = newclienthudelem(self);
        hudelem.elemtype = "<unknown string>";
        hudelem.alpha = alpha;
        hudelem.font = "<unknown string>";
        hudelem.fontscale = scale;
        hudelem.basefontscale = scale;
        hudelem.sort = sort;
        hudelem.x = x;
        hudelem.y = y;
        hudelem.archived = 0;
        hudelem.foreground = 1;
        hudelem.hidewhendead = 1;
        hudelem.hidewheninmenu = 1;
        if (isdefined(text) && text.size > 0) {
            hudelem setdevtext(text);
        }
        return hudelem;
    #/
}

