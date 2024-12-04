#using script_100adcc1cc11d2fa;
#using script_118c3165d7948d8b;
#using script_16ea1b94f0f381b3;
#using script_185660037b9236c1;
#using script_19c169a442d5975a;
#using script_1f97a44d1761c919;
#using script_21565d13199ed0b;
#using script_220d0eb95a8fab7d;
#using script_22f1701e151b9d12;
#using script_2583ee5680cf4736;
#using script_2590b7a7de3dfc79;
#using script_2b421d13744fcb7e;
#using script_2d81142fe75dc0c;
#using script_2e445b403a12d74d;
#using script_3559130ee2bb3a29;
#using script_398835140857d740;
#using script_3e2f8cc477d57433;
#using script_40d9a279bd1a1bf9;
#using script_41387eecc35b88bf;
#using script_43971bbeefd98f05;
#using script_46c7c73b1a7e4773;
#using script_482376d10f69832c;
#using script_485622d93fa7e4cf;
#using script_500cf9957a5c4ba7;
#using script_503dc616192c6c7b;
#using script_52e2837d89d8de06;
#using script_54be039c89fddc12;
#using script_5605739161b1abe1;
#using script_5640d32580c6bc7d;
#using script_58be75c518bf0d40;
#using script_600b944a95c3a7bf;
#using script_61afae50a53c3917;
#using script_6bffae1b97f70547;
#using script_6f65366f542f6627;
#using script_76cc264b397db9cb;
#using script_775b7cd25194ce83;
#using script_7b2517368c79e5bc;
#using script_7f9409b703dad400;
#using script_860bfdfe82326e3;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\hud_message;
#using scripts\mp\mp_agent;
#using scripts\mp\objidpoolmanager;

#namespace namespace_c2522520955f08d1;

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x1b65
// Size: 0x1d
function private autoexec __init__system__() {
    system::register(#"hash_db39fe7f0e24a3d", undefined, &__init__, &function_baf56f45f52c0901);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8a
// Size: 0x1d3
function __init__() {
    if (!getdvarint(@"hash_368966a08aa72516", 0)) {
        return;
    }
    level._effect["rift_gate_activated_easy"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_gate_low_power.vfx");
    level._effect["rift_gate_activated_hard"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_gate_high_power.vfx");
    level._effect["rift_pedestal_active_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_toxic.vfx");
    level._effect["rift_pedestal_active_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_elec.vfx");
    level._effect["rift_pedestal_active_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_fire.vfx");
    level._effect["rift_pedestal_active_ice"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_cryo.vfx");
    level._effect["rift_gate_item_fx_electric"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_elec.vfx");
    level._effect["rift_gate_item_fx_toxic"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_toxic.vfx");
    level._effect["rift_gate_item_fx_fire"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_fire.vfx");
    level._effect["rift_gate_item_fx_ice"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_cryo.vfx");
    level.var_bddbfe8bee6d6dc5 = [];
    level.var_f9fb033d5230ec9a = [];
    level.var_8b939fbe0ef2d56b = &on_item_drop;
    callback::add("player_spawned", &function_5defc56cf37dad61);
    callback::add("player_disconnect", &function_2186874d62832c93);
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("player_item_drop", &on_item_drop);
    callback::add("player_item_cleanup", &function_c6e77bc560720d11);
    callback::add("player_assimilated", &function_436b7bae8de567e7);
    if (function_3e9b5fc322cb6c83()) {
        callback::add("squad_created", &function_6d402ea224e021c2);
        namespace_af93597583d94051::function_b45f9d15a24dd4d0();
    }
    callback::add("spawn_s5_rift_pedestal_containers", &function_922a434697a632e3);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d65
// Size: 0xa1
function function_6d402ea224e021c2(sparams) {
    if (isdefined(sparams.team) && isdefined(sparams) && isdefined(level.squaddata) && isdefined(sparams.index)) {
        level.squaddata[sparams.team][sparams.index].properties["UnlockQuestPedestalsS5"] = [];
        level.squaddata[sparams.team][sparams.index].properties["UnlockQuestPedestalsCompleteS5"] = 0;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e0e
// Size: 0x5a
function private function_222b578c46e71445(player) {
    var_ac0eafb387bd7c4 = undefined;
    if (isdefined(player)) {
        if (function_3e9b5fc322cb6c83()) {
            var_ac0eafb387bd7c4 = namespace_af93597583d94051::function_b200e7001502a482(player.team, player.sessionsquadid, "s5");
        } else {
            var_ac0eafb387bd7c4 = player.var_f9fb033d5230ec9a;
        }
    }
    return var_ac0eafb387bd7c4;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1e71
// Size: 0x121
function private function_b200e7001502a482(team, sessionsquadid, var_6b0ee97314aed333) {
    var_ac0eafb387bd7c4 = undefined;
    if (isdefined(team) && isdefined(sessionsquadid)) {
        if (function_3e9b5fc322cb6c83()) {
            var_ac0eafb387bd7c4 = namespace_af93597583d94051::function_b200e7001502a482(team, sessionsquadid, "s5", var_6b0ee97314aed333);
        } else {
            squaddata = level.squaddata[team][sessionsquadid];
            if (isdefined(squaddata.players) && isdefined(squaddata) && isdefined(squaddata.players.size) && squaddata.players.size > 0) {
                foreach (squaddie in squaddata.players) {
                    if (isdefined(squaddie) && isdefined(squaddie.var_f9fb033d5230ec9a)) {
                        if (isdefined(var_6b0ee97314aed333) && squaddie == var_6b0ee97314aed333) {
                            continue;
                        }
                        var_ac0eafb387bd7c4 = squaddie.var_f9fb033d5230ec9a;
                        break;
                    }
                }
            }
        }
    }
    return var_ac0eafb387bd7c4;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x12
function private function_3e9b5fc322cb6c83() {
    return getdvarint(@"hash_e2e6cb525c537e6f", 1);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb6
// Size: 0xd8
function function_baf56f45f52c0901() {
    if (!getdvarint(@"hash_368966a08aa72516", 0)) {
        return;
    }
    thread function_87fc4dd30dbe9e7e();
    level flag_wait("ai_spawn_director_initialized");
    level.var_232491d3931d541f = getstruct("s5_rift_gate", "script_noteworthy");
    namespace_c98a99f5059a6b53::main();
    namespace_c2104fe5a0f18402::main();
    namespace_e1cfb5cd064ba0c4::main();
    if (isdefined(level.var_232491d3931d541f)) {
        function_5155042c35a3fdd2(level.var_232491d3931d541f);
        level thread function_9a8fd43ba8259335(level.var_232491d3931d541f);
        level thread function_ad319ef1312a4f2e(level.var_232491d3931d541f);
        function_a0856378b9181a73(level.var_232491d3931d541f, "ob_jup_items_keys_rift_gate_season5");
        function_1df61ac1719b72b8(level.var_232491d3931d541f, &function_6b436eac1a6da2b9);
    }
    thread function_4faa21d126f9a5a3();
    level flag_set("rift_gates_spawned");
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2096
// Size: 0x179
function function_87fc4dd30dbe9e7e() {
    level endon("game_ended");
    waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    if (level.mapname == "mp_jup_bigmap") {
        validplayers = [];
        foreach (player in level.players) {
            if (isdefined(player) && namespace_af93597583d94051::function_f0ae0bcc1d1be67c(player, "s5") == 0 && namespace_a29897b2574526c5::function_3296d5cb0ee5af26(player)) {
                validplayers[validplayers.size] = player;
            }
        }
        if (validplayers.size > 0) {
            var_2e2a4163dba53609 = requestobjectiveid();
            var_9df8672cb04d3bb9 = level.var_d930589c2bd20abd.origin + (0, 0, 200);
            objective_add_objective(var_2e2a4163dba53609, "current", var_9df8672cb04d3bb9, "jup_ui_map_icon_exfil_to_story");
            objective_playermask_hidefromall(var_2e2a4163dba53609);
            function_46822b25a91c60bc(validplayers);
            wait 65;
            thread namespace_446fc987a980892f::playconversation("STY_S5_5_STM_Mission_Infil", validplayers);
            foreach (validplayer in validplayers) {
                validplayer thread function_1cc31f82c0a48ab(var_2e2a4163dba53609);
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2217
// Size: 0x36
function function_1cc31f82c0a48ab(var_2e2a4163dba53609) {
    level endon("game_ended");
    self endon("death");
    self waittill("dx_ob_st55_stry_jans_missioninfilln4" + "_endon");
    if (!isdefined(self)) {
        return;
    }
    thread namespace_a29897b2574526c5::function_8b67e03b991ac60f(var_2e2a4163dba53609);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2255
// Size: 0x21d
function function_46822b25a91c60bc(var_249fdd086dd5b361) {
    level endon("game_ended");
    var_e2d6a6db83c58f1e = function_f159c10d5cf8f0b4("STM_VO_trigger_25", "targetname");
    var_5012d4a472077ea2 = function_f159c10d5cf8f0b4("STM_VO_trigger_50", "targetname");
    var_fc48514ad19859 = function_f159c10d5cf8f0b4("STM_VO_trigger_75", "targetname");
    assert(isdefined(var_e2d6a6db83c58f1e) && isarray(var_e2d6a6db83c58f1e));
    assert(isdefined(var_5012d4a472077ea2) && isarray(var_5012d4a472077ea2));
    assert(isdefined(var_fc48514ad19859) && isarray(var_fc48514ad19859));
    assert(var_e2d6a6db83c58f1e.size == 1);
    assert(var_5012d4a472077ea2.size == 1);
    assert(var_fc48514ad19859.size == 1);
    if (isarray(var_e2d6a6db83c58f1e) && var_e2d6a6db83c58f1e.size > 0) {
        foreach (var_59c14950df7ec219 in var_e2d6a6db83c58f1e) {
            if (isdefined(var_59c14950df7ec219)) {
                thread function_e0586ac65c340a5("STY_S5_5_STM_Travel_1", var_59c14950df7ec219, var_249fdd086dd5b361);
                break;
            }
        }
    }
    if (isarray(var_5012d4a472077ea2) && var_5012d4a472077ea2.size > 0) {
        foreach (var_82bc689486cbb8a5 in var_5012d4a472077ea2) {
            if (isdefined(var_82bc689486cbb8a5)) {
                thread function_e0586ac65c340a5("STY_S5_5_STM_Travel_2", var_82bc689486cbb8a5, var_249fdd086dd5b361);
                break;
            }
        }
    }
    if (isarray(var_fc48514ad19859) && var_fc48514ad19859.size > 0) {
        foreach (var_e1272462d0d7e730 in var_fc48514ad19859) {
            if (isdefined(var_e1272462d0d7e730)) {
                thread function_e0586ac65c340a5("STY_S5_5_STM_Ava_Ravnov_Portal_In", var_e1272462d0d7e730, var_249fdd086dd5b361);
                break;
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x247a
// Size: 0x16d
function function_e0586ac65c340a5(void, vo_trigger, var_249fdd086dd5b361) {
    level endon("game_ended");
    assert(isdefined(vo_trigger) && isdefined(void) && isdefined(var_249fdd086dd5b361));
    var_b1ab6fc982a31d2e = var_249fdd086dd5b361;
    while (var_b1ab6fc982a31d2e.size > 0) {
        vo_trigger waittill("trigger", var_42376ed54d25120a);
        if (isdefined(var_42376ed54d25120a)) {
            if (isplayer(var_42376ed54d25120a) && array_contains(var_b1ab6fc982a31d2e, var_42376ed54d25120a)) {
                thread namespace_446fc987a980892f::playconversation(void, [var_42376ed54d25120a]);
                var_b1ab6fc982a31d2e = array_remove(var_b1ab6fc982a31d2e, var_42376ed54d25120a);
            } else if (var_42376ed54d25120a scripts\cp_mp\vehicles\vehicle::isvehicle()) {
                var_a7415b218454162f = [];
                occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(var_42376ed54d25120a);
                if (isdefined(occupants) && isarray(occupants) && occupants.size > 0) {
                    foreach (occupant in occupants) {
                        if (isdefined(occupant) && isplayer(occupant) && array_contains(var_b1ab6fc982a31d2e, occupant)) {
                            var_a7415b218454162f[var_a7415b218454162f.size] = occupant;
                            var_b1ab6fc982a31d2e = array_remove(var_b1ab6fc982a31d2e, occupant);
                        }
                    }
                }
                if (var_a7415b218454162f.size > 0) {
                    thread namespace_446fc987a980892f::playconversation(void, var_a7415b218454162f);
                }
            }
        }
        var_b1ab6fc982a31d2e = array_removeundefined(var_b1ab6fc982a31d2e);
        wait 0.2;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ef
// Size: 0x43
function function_4faa21d126f9a5a3() {
    level endon("game_ended");
    level utility::flag_wait("ob_infil_completed");
    namespace_a04d40d58a5bc9d8::init();
    namespace_f2ba945007050131::init();
    namespace_cac4de77882bf23::init();
    function_f43d7ceee5ddd0ee();
    function_8aa8eb17ca1996b1();
    /#
        function_55258ffc4dcf9b4b();
    #/
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263a
// Size: 0x53
function on_item_pickup(params) {
    if (isdefined(params.item) && isdefined(params) && isdefined(params.item.var_d1c37d94e5043730)) {
        params.item.var_d1c37d94e5043730 delete();
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2695
// Size: 0x53
function function_c6e77bc560720d11(params) {
    if (isdefined(params.item) && isdefined(params) && isdefined(params.item.var_d1c37d94e5043730)) {
        params.item.var_d1c37d94e5043730 delete();
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26f0
// Size: 0x2fb
function function_436b7bae8de567e7(params) {
    player = params.player;
    oldsquadid = params.oldsquadindex;
    newsquadid = params.newsquadindex;
    oldteam = params.oldteam;
    newteam = params.newteam;
    if (!isdefined(player)) {
        return;
    }
    if (function_3e9b5fc322cb6c83()) {
        namespace_af93597583d94051::function_5121e154aabb5b05(player, oldteam, newteam, oldsquadid, newsquadid, "s5");
        return;
    }
    if (isdefined(level.squaddata[newteam][newsquadid]) && isdefined(level.squaddata[newteam][newsquadid].players)) {
        foreach (squaddie in level.squaddata[newteam][newsquadid].players) {
            if (isdefined(squaddie.var_f9fb033d5230ec9a) && squaddie != player) {
                if (isdefined(player.var_f9fb033d5230ec9a)) {
                    if (isdefined(oldsquadid)) {
                        oldteaminfo = level.squaddata[oldteam][oldsquadid];
                    }
                    if (isdefined(oldteaminfo)) {
                        a_oldteam = oldteaminfo.players;
                    }
                    if (isdefined(a_oldteam) && a_oldteam.size > 0) {
                        foreach (interact in player.var_f9fb033d5230ec9a) {
                            if (isdefined(interact)) {
                                interact disablescriptableplayeruse(player);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to disable undefined pedestal interacts");
                        }
                    } else {
                        foreach (interact in player.var_f9fb033d5230ec9a) {
                            if (isdefined(interact)) {
                                interact freescriptable();
                                level.var_f9fb033d5230ec9a = array_remove(level.var_f9fb033d5230ec9a, interact);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to clean up undefined pedestal interacts");
                        }
                    }
                }
                player.var_f9fb033d5230ec9a = squaddie.var_f9fb033d5230ec9a;
                foreach (interact in player.var_f9fb033d5230ec9a) {
                    if (isdefined(interact)) {
                        interact enablescriptableplayeruse(player);
                        continue;
                    }
                    logstring("OB RIFT GATE - player was assigned undefined pedestal interacts");
                }
                return;
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29f3
// Size: 0x14f
function on_item_drop(params) {
    if (isdefined(params) && isdefined(params.payload) && isarray(params.payload) && isdefined(params.payload[1]) && params.payload[1] == self getentitynumber() && issubstr(params.item.type, "ob_jup_scriptable_key_rift_gate_season5")) {
        a_squad = namespace_ca7b90256548aa40::getsquadmembers();
        if (a_squad.size > 1 && !isdefined(params.item.var_d1c37d94e5043730)) {
            level thread namespace_af93597583d94051::function_dc5d83d97e8f9e9c(params.item, params.itembundlename, self, self.team, self.sessionsquadid);
        }
        foreach (player in level.players) {
            if (!array_contains(a_squad, player)) {
                params.item disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4a
// Size: 0x5c
function function_694cb9e28beb0210(itembundlename) {
    if (issubstr(itembundlename, "giraffe")) {
        return "electric";
    }
    if (issubstr(itembundlename, "diary")) {
        return "fire";
    }
    if (issubstr(itembundlename, "drums")) {
        return "ice";
    }
    if (issubstr(itembundlename, "peeks")) {
        return "toxic";
    }
    return undefined;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2baf
// Size: 0x5c
function function_2966891996bfcca5(var_1d6aa90a9f946bbe) {
    if (issubstr(var_1d6aa90a9f946bbe, "aetherGiraffe")) {
        return "ice";
    }
    if (issubstr(var_1d6aa90a9f946bbe, "aetherDiary")) {
        return "ice";
    }
    if (issubstr(var_1d6aa90a9f946bbe, "aetherDrum")) {
        return "ice";
    }
    if (issubstr(var_1d6aa90a9f946bbe, "mrPeeks")) {
        return "ice";
    }
    return undefined;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c14
// Size: 0x1d
function function_2186874d62832c93(params) {
    if (isdefined(self)) {
        namespace_af93597583d94051::function_96b2f0429cd884b5(self, "s5");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c39
// Size: 0x1c3
function function_5defc56cf37dad61(params) {
    self endon("death_or_disconnect");
    self.var_ef36152f8d3d0f78 = undefined;
    function_a913db935a01a04c(self);
    level flag_wait("rift_gates_spawned");
    foreach (s_gate in level.var_bddbfe8bee6d6dc5) {
        if (s_gate.targetname != "s5_rift_gate") {
            continue;
        }
        if (isdefined(s_gate.var_39cfa415b2be8156)) {
            foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
                s_pedestal.mdl_pedestal showtoplayer(self);
            }
        }
        if (istrue(function_fa577f7324fdd05a(self))) {
            if (!isdefined(self.var_a98ca13545b6233d) && !namespace_af93597583d94051::function_50ab9eb71c85b240()) {
                namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s5");
                if (isdefined(self.var_a98ca13545b6233d)) {
                    self.var_a98ca13545b6233d showonlytoplayer(self);
                    self.var_a98ca13545b6233d setscriptablepartstate("reveal", "reveal_out");
                }
            }
            continue;
        }
        foreach (interact in level.var_f9fb033d5230ec9a) {
            if (isdefined(interact)) {
                interact disablescriptableplayeruse(self);
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e04
// Size: 0x454
function function_5155042c35a3fdd2(s_gate) {
    v_offset = (0, 0, 0);
    /#
        if (level.mapname == "<dev string:x1c>" || level.mapname == "<dev string:x37>") {
            v_offset = (2031, 8154, -1400);
        }
    #/
    s_gate.origin += v_offset;
    level.var_bddbfe8bee6d6dc5 = array_add(level.var_bddbfe8bee6d6dc5, s_gate);
    function_606642b946a01237("rift_gate_ambient_blocker", s_gate.origin, 1500, 1);
    s_gate.mdl_vortex = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate_vortex", 0, 0);
    s_gate.var_38b605adf8e926c8 = spawnscriptable("ob_jup_scriptable_rift_map_icon", s_gate.origin, s_gate.angles);
    s_gate.var_39cfa415b2be8156 = [];
    var_39cfa415b2be8156 = getstructarray("ob_rift_gate_pedestal", "script_noteworthy");
    foreach (s_pedestal in var_39cfa415b2be8156) {
        if (s_pedestal.target == s_gate.targetname) {
            s_pedestal.s_gate = s_gate;
            s_pedestal.origin += v_offset;
            var_65c5ea84d07a7527 = s_pedestal.targetname;
            var_18819ef03e6b0884 = var_65c5ea84d07a7527 + "::" + "jup_zm_rift_pedestal";
            var_93ef5ee002227bec = var_65c5ea84d07a7527 + "_on::" + "jup_zm_rift_pedestal";
            s_pedestal.mdl_pedestal = namespace_4164bc931714b00b::spawn_script_model(s_pedestal, var_18819ef03e6b0884, 1, 0);
            s_pedestal.mdl_pedestal_on = namespace_4164bc931714b00b::spawn_script_model(s_pedestal, var_93ef5ee002227bec, 1, 0);
            s_pedestal.mdl_pedestal hide();
            s_pedestal.mdl_pedestal_on hide();
            s_gate.var_39cfa415b2be8156 = array_add(s_gate.var_39cfa415b2be8156, s_pedestal);
        }
    }
    s_gate.var_a489feecfa0a74 = [];
    var_a489feecfa0a74 = getstructarray("ob_rift_token_prompt", "script_noteworthy");
    foreach (s_prompt in var_a489feecfa0a74) {
        if (s_prompt.target == s_gate.targetname) {
            s_prompt.origin += v_offset;
            s_gate.var_a489feecfa0a74 = array_add(s_gate.var_a489feecfa0a74, s_prompt);
        }
    }
    var_42d86aac2c64a360 = getstructarray("ob_rift_encounter", "script_noteworthy");
    foreach (s_encounter in var_42d86aac2c64a360) {
        if (s_encounter.target == s_gate.targetname) {
            s_encounter.origin += v_offset;
            s_gate.s_encounter = s_encounter;
            break;
        }
    }
    a_s_rewards = getstructarray("ob_rift_gate_reward", "script_noteworthy");
    foreach (s_reward in a_s_rewards) {
        if (s_reward.target == s_gate.targetname) {
            s_reward.origin += v_offset;
            s_gate.s_reward = s_reward;
            break;
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3260
// Size: 0x114
function private function_922a434697a632e3(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (!istrue(function_3e9b5fc322cb6c83())) {
        if (isdefined(params.player.var_f9fb033d5230ec9a)) {
            return;
        }
    }
    var_78e49555d76726c1 = function_b200e7001502a482(params.player);
    if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
        if (function_3e9b5fc322cb6c83()) {
            namespace_af93597583d94051::function_42a3e6a8375b53dc(params.player, 1, "s5");
        } else {
            params.player.var_f9fb033d5230ec9a = var_78e49555d76726c1;
            foreach (interact in var_78e49555d76726c1) {
                interact enablescriptableplayeruse(params.player);
            }
        }
        return;
    }
    level thread function_1383a22b72211d91(params.player);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x337c
// Size: 0x3b1
function private function_1383a22b72211d91(player) {
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    s_gate = level.var_232491d3931d541f;
    if (!isdefined(s_gate.var_39cfa415b2be8156)) {
        return;
    }
    foreach (squadmember in a_squad) {
        squadmember.var_f9fb033d5230ec9a = [];
        if (getdvarint(@"hash_c54774e05896cbd9", 0)) {
            thread function_fdb378f67f901e05(s_gate, squadmember);
        }
    }
    level.var_9d4abb4359bc4539 = default_to(level.var_9d4abb4359bc4539, 0);
    level.var_af952507d5302683 = default_to(level.var_af952507d5302683, 0);
    var_56f5775724510587 = [];
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        var_a3a5c8e4541d079f = anglestoforward(s_pedestal.angles) * -8;
        v_offset = anglestoup(s_pedestal.angles) * (16 + level.var_af952507d5302683) + anglestoforward(s_pedestal.angles) * level.var_9d4abb4359bc4539;
        v_spawn = s_pedestal.origin + v_offset + var_a3a5c8e4541d079f;
        var_8986997b27e850da = spawnscriptable("ob_jup_rift_gate_s5_pedestal_container", v_spawn);
        var_8986997b27e850da.s_pedestal = s_pedestal;
        var_8986997b27e850da.s_gate = s_gate;
        var_8986997b27e850da.noweaponslot = 1;
        var_8986997b27e850da.var_532eac3c428e5b9b = 1;
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("rift_gate_pedestal_container", &function_cf1b1f86951a9209);
        var_8986997b27e850da.var_55bb3585d29af1be = &function_359904b2a0fb09ed;
        var_8986997b27e850da callback::add("on_cache_closed", &function_1cf4569855afaa6b);
        var_8986997b27e850da.var_6978a4b328fd33b3 = &function_652b184a9e197fea;
        var_8986997b27e850da.containertype = 19;
        foreach (var_cd1b2eae3618a04d in level.players) {
            var_8986997b27e850da disablescriptableplayeruse(var_cd1b2eae3618a04d);
        }
        var_8986997b27e850da setscriptablepartstate("rift_gate_pedestal_container", "closed_usable");
        foreach (squadmember in a_squad) {
            if (!istrue(function_3e9b5fc322cb6c83())) {
                squadmember.var_f9fb033d5230ec9a = function_6d6af8144a5131f1(squadmember.var_f9fb033d5230ec9a, var_8986997b27e850da);
            }
            var_8986997b27e850da enablescriptableplayeruse(squadmember);
            namespace_af93597583d94051::function_ae472ac4d2ad5228(squadmember, var_8986997b27e850da, "s5");
        }
        var_56f5775724510587[var_56f5775724510587.size] = var_8986997b27e850da;
        level.var_f9fb033d5230ec9a = function_6d6af8144a5131f1(level.var_f9fb033d5230ec9a, var_8986997b27e850da);
    }
    if (function_3e9b5fc322cb6c83()) {
        if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
            namespace_9bb409deb69fb31d::function_a20a10ce593f692b(player.team, player.sessionsquadid, "UnlockQuestPedestalsS5", var_56f5775724510587);
        }
    }
    level.var_9d4abb4359bc4539++;
    level.var_af952507d5302683++;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3735
// Size: 0x13
function function_359904b2a0fb09ed(instance, player) {
    
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3750
// Size: 0x8f
function function_652b184a9e197fea(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    backpackquantity = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        backpackquantity = namespace_3883e3399f2870b5::function_8e5978971b5dcd16(player, itemindex);
    }
    backpackquantity = 1;
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype, itemindex, lootid, backpackquantity);
    return [lootid, noextract];
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37e8
// Size: 0x182
function function_ad319ef1312a4f2e(s_gate, player) {
    level endon("game_ended");
    old_players = [];
    var_70d983a2559807d6 = 0;
    while (true) {
        a_players = getplayersinradius(s_gate.origin, 2400, 2400);
        foreach (player in a_players) {
            if (!istrue(function_fa577f7324fdd05a(player))) {
                if (var_70d983a2559807d6 + 1 < gettime()) {
                    player earthquakeforplayer(0.15, 1, s_gate.origin, 2400);
                    player playrumbleonentity("light_1s_no_broadcast");
                    var_70d983a2559807d6 = gettime();
                }
                if (!player namespace_6c72573a48881070::function_8e888e08a6ab22d3("mp_jup_bigmap_storm")) {
                    player namespace_6c72573a48881070::function_27a921508cb04613("mp_jup_bigmap_storm", 3);
                    player setmovespeedscale(0.75);
                }
            }
        }
        foreach (old_player in old_players) {
            if (isdefined(old_player) && !array_contains(a_players, old_player)) {
                old_player namespace_6c72573a48881070::function_9a92ae402e209ecc("mp_jup_bigmap_storm", 1);
                player setmovespeedscale(1);
            }
        }
        old_players = a_players;
        wait 0.5;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3972
// Size: 0x164
function function_fdb378f67f901e05(s_gate, player) {
    if (!(isdefined(s_gate) && isdefined(s_gate.var_39cfa415b2be8156)) || s_gate.var_39cfa415b2be8156.size == 0) {
        return;
    }
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        if (isdefined(s_pedestal)) {
            var_5868b7d3b245cc07 = undefined;
            spawnpos = s_pedestal.origin + anglestoforward(s_pedestal.angles) * 0.5;
            switch (s_pedestal.targetname) {
            case #"hash_43c02a59c9eec85e":
                namespace_c8baf39126f1ef99::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season5_peeks_attuned", 1);
                break;
            case #"hash_2fe8e15e44ade2d7":
                namespace_c8baf39126f1ef99::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season5_diary_attuned", 1);
                break;
            case #"hash_49079fa46994eb6c":
                namespace_c8baf39126f1ef99::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season5_drum_attuned", 1);
                break;
            case #"hash_e4bebac3e7867ac8":
                namespace_c8baf39126f1ef99::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season5_giraffe_attuned", 1);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ade
// Size: 0x41f
function function_9a8fd43ba8259335(s_gate) {
    level endon("game_ended");
    if (getdvarint(@"hash_dd416fb0b3f6d71f", 1)) {
        var_3a9e259605bd2fd9 = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate_yellow", 0, 0);
        var_3a9e259605bd2fd9 hide();
        var_3a9e259605bd2fd9 notsolid();
        var_1446c6e912a6d70a = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate_red", 0, 0);
        var_1446c6e912a6d70a hide();
        var_1446c6e912a6d70a notsolid();
    }
    old_players = [];
    while (true) {
        level.var_3f1d8c79661d342d = getplayersinradius(s_gate.origin, 3600, 3600);
        /#
            if (getdvarint(@"hash_4ef4f84926f8d7ba", 0)) {
                thread scripts\cp_mp\utility\debug_utility::drawcylinder(s_gate.origin, 3600, 1050, 0.5, (0, 1, 0));
            }
        #/
        foreach (player in level.var_3f1d8c79661d342d) {
            if (!array_contains(old_players, player)) {
                if (getdvarint(@"hash_dd416fb0b3f6d71f", 1)) {
                    var_3a9e259605bd2fd9 function_af96f7c8819ae854(player, 3600);
                    var_1446c6e912a6d70a function_af96f7c8819ae854(player, 3600);
                }
                if (istrue(function_fa577f7324fdd05a(player))) {
                    player thread function_f6e92750f5fa5c30(s_gate);
                    continue;
                }
                var_78e49555d76726c1 = function_222b578c46e71445(player);
                if (isdefined(var_78e49555d76726c1) && isarray(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
                    foreach (scriptable in var_78e49555d76726c1) {
                        if (isdefined(scriptable)) {
                            scriptable setscriptablepartstate("rift_gate_pedestal_container", "closed_usable");
                        }
                    }
                    if (function_3e9b5fc322cb6c83() && !namespace_af93597583d94051::function_d71a760b0589b81d(player.team, player.sessionsquadid, "s5")) {
                        namespace_af93597583d94051::function_42a3e6a8375b53dc(player, "s5");
                    }
                    continue;
                }
                if (namespace_af93597583d94051::function_f0ae0bcc1d1be67c(player, "s5") && !namespace_af93597583d94051::function_d71a760b0589b81d(player.team, player.sessionsquadid, "s5")) {
                    params = spawnstruct();
                    params.player = player;
                    level callback::callback("spawn_s5_rift_pedestal_containers", params);
                }
            }
        }
        foreach (old_player in old_players) {
            var_ae894028b993ed0b = undefined;
            if (isdefined(old_player) && !array_contains(level.var_3f1d8c79661d342d, old_player)) {
                old_player thread function_bcd7ba129ebfbfb0(s_gate);
                old_player function_bab9acc2cf205a62();
                var_78e49555d76726c1 = function_222b578c46e71445(old_player);
                if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
                    a_squad = old_player namespace_ca7b90256548aa40::getsquadmembers();
                    foreach (squaddie in a_squad) {
                        if (utility::array_contains(level.var_3f1d8c79661d342d, squaddie)) {
                            var_ae894028b993ed0b = 1;
                            break;
                        }
                    }
                    if (!istrue(var_ae894028b993ed0b)) {
                        foreach (scriptable in var_78e49555d76726c1) {
                            if (isdefined(scriptable)) {
                                scriptable setscriptablepartstate("rift_gate_pedestal_container", "closed_unusable");
                            }
                        }
                    }
                }
            }
        }
        old_players = level.var_3f1d8c79661d342d;
        wait 0.5;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f05
// Size: 0x14d
function function_f6e92750f5fa5c30(s_gate) {
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self notify("proximity_visuals_s5");
        self endon("proximity_visuals_s5");
        while (namespace_af93597583d94051::function_1184fa6d41336bdc(self, "s5")) {
            wait 0.2;
        }
        if (!isdefined(self.var_a98ca13545b6233d)) {
            namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s5");
        }
        self.var_2103624e16ae7a7a = 1;
    } else {
        while (istrue(self.var_ef36152f8d3d0f78)) {
            wait 0.2;
        }
        self.var_ef36152f8d3d0f78 = 1;
    }
    s_gate.mdl_vortex hidefromplayer(self);
    if (isdefined(self.var_a98ca13545b6233d)) {
        self playsoundtoplayer("evt_rr_gate_reshape", self, self.var_a98ca13545b6233d);
    }
    wait 0.5;
    if (isdefined(self.var_a98ca13545b6233d)) {
        self.var_a98ca13545b6233d setscriptablepartstate("reveal", "reveal_in");
        if (istrue(self.var_7c4a2519f7b89e16)) {
            function_46df852b6f79b0ee([self], 1, 1, 0);
        } else if (istrue(self.var_9b65365d9058829d)) {
            function_46df852b6f79b0ee([self], 0, 1, 0);
        }
    }
    wait 2;
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_2103624e16ae7a7a = undefined;
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x405a
// Size: 0x16b
function function_bcd7ba129ebfbfb0(s_gate) {
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self notify("distant_visuals_s5");
        self endon("distant_visuals_s5");
        while (namespace_af93597583d94051::function_670ac099eac79d1b(self, "s5")) {
            wait 0.25;
        }
        self.var_16af86449bd5e7b4 = 1;
    } else {
        while (istrue(self.var_ef36152f8d3d0f78)) {
            wait 0.25;
        }
        self.var_ef36152f8d3d0f78 = 1;
    }
    s_gate.mdl_vortex showtoplayer(self);
    if (istrue(function_fa577f7324fdd05a(self))) {
        if (isdefined(self.var_a98ca13545b6233d)) {
            self playsoundtoplayer("evt_rr_gate_dissolve", self, self.var_a98ca13545b6233d);
        }
    }
    wait 0.5;
    if (isdefined(self.var_a98ca13545b6233d)) {
        self.var_a98ca13545b6233d setscriptablepartstate("reveal", "reveal_out");
        if (istrue(self.var_7c4a2519f7b89e16)) {
            function_46df852b6f79b0ee([self], 1, 0, 0);
            self.var_7c4a2519f7b89e16 = 1;
        } else if (istrue(self.var_9b65365d9058829d)) {
            function_46df852b6f79b0ee([self], 0, 0, 0);
            self.var_9b65365d9058829d = 1;
        }
    }
    wait 2;
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        if (isdefined(self.var_a98ca13545b6233d)) {
            namespace_af93597583d94051::function_96b2f0429cd884b5(self, "s5");
            self.var_16af86449bd5e7b4 = undefined;
        }
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41cd
// Size: 0x1ea
function function_e51836f1240c2b7a(s_gate) {
    if (s_gate.targetname != "s5_rift_gate") {
        println("<dev string:x4f>");
        return;
    }
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_e6e89f4ebf9ea3c3 = 1;
    }
    self.var_ef36152f8d3d0f78 = 1;
    s_gate.mdl_vortex hidefromplayer(self);
    namespace_6c72573a48881070::function_9a92ae402e209ecc("mp_jup_bigmap_storm", 2);
    self setmovespeedscale(1);
    self setclientomnvar("ob_rift_gate_formation", 1);
    wait 2;
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        s_pedestal.mdl_pedestal showtoplayer(self);
        s_pedestal.mdl_pedestal_on hidefromplayer(self);
    }
    wait 0.5;
    if (!isdefined(self.var_a98ca13545b6233d)) {
        namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s5");
        self.var_a98ca13545b6233d hide();
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "active");
    }
    wait 6.5;
    if (isdefined(self.var_a98ca13545b6233d)) {
        self.var_a98ca13545b6233d showonlytoplayer(self);
        self.var_a98ca13545b6233d setscriptablepartstate("reveal", "appear_instantly");
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "off");
    }
    self setclientomnvar("ob_rift_gate_formation", 0);
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_e6e89f4ebf9ea3c3 = undefined;
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43bf
// Size: 0x14d
function function_1df61ac1719b72b8(s_gate, var_6a6601f4d2fb4a0a) {
    foreach (s_prompt in s_gate.var_a489feecfa0a74) {
        s_prompt.interact = spawnscriptable("ob_jup_rift_gate_interact", s_prompt.origin, s_prompt.angles);
        s_prompt.interact setscriptablepartstate("interact", "usable");
        namespace_5775ad2badedbcaa::function_32645103f7520635(s_prompt.interact, var_6a6601f4d2fb4a0a);
        s_prompt.interact.s_gate = s_gate;
        s_prompt.interact.script_label = s_prompt.script_label;
        s_prompt.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_b0f9fa16a0345d2);
        s_gate.var_d1e2ce25ea15c51d = [];
        s_prompt.interact.var_8d4002c21d2cac70 = &function_46df852b6f79b0ee;
        s_prompt.interact.var_b83ca58b862b27e9 = &function_b83ca58b862b27e9;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4514
// Size: 0x6b
function function_b0f9fa16a0345d2(interact, player) {
    if (namespace_af93597583d94051::function_7b936b2474aa34c2(interact, player, "s5")) {
        var_bc65b6ae439a23ea = namespace_af93597583d94051::function_2911a407cdc7858(interact, player, "s5");
        if (isdefined(var_bc65b6ae439a23ea)) {
            return var_bc65b6ae439a23ea;
        }
    }
    player.var_9c6168187b815669 = undefined;
    return {#string:%, #type:"HINT_NOBUTTON"};
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4588
// Size: 0xa7
function function_6932962f514cd776(player) {
    var_32a6f9b3d487152d = activity_participation::function_553a690e1064cf0b(player);
    foreach (var_b2941d08f576eb6c in var_32a6f9b3d487152d) {
        var_6965880b974574a6 = var_b2941d08f576eb6c.instanceid;
        activityinstance = activity_common::function_1f3e343912ae15c5(var_6965880b974574a6);
        activitycategory = namespace_4fda5d7358015a06::function_511be8bcaede8b52(activityinstance);
        if (activitycategory == "Contract") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4638
// Size: 0x6e1
function function_a7a66cb92f56ae54(s_gate, a_squad, player) {
    level endon("game_ended");
    foreach (squadmember in a_squad) {
        thread namespace_446fc987a980892f::playevent("RFT_S5_5_RGUQ_Rift_Run_Gate_Unlocked", [squadmember]);
    }
    e_sound = namespace_4164bc931714b00b::spawn_script_model(s_gate, "tag_origin", 0, 0);
    var_78e49555d76726c1 = undefined;
    teamid = undefined;
    squadid = undefined;
    if (isdefined(player.team) && isdefined(player) && isdefined(player.sessionsquadid)) {
        var_78e49555d76726c1 = function_222b578c46e71445(player);
        teamid = player.team;
        squadid = player.sessionsquadid;
    }
    if (!isdefined(var_78e49555d76726c1) && isdefined(a_squad) && isarray(a_squad) && a_squad.size > 0) {
        foreach (squadmember in a_squad) {
            if (isdefined(squadmember.team) && isdefined(squadmember) && isdefined(squadmember.sessionsquadid)) {
                var_78e49555d76726c1 = function_222b578c46e71445(squadmember);
                teamid = squadmember.team;
                squadid = squadmember.sessionsquadid;
            }
        }
    }
    if (isdefined(level.squaddata[teamid][squadid]) && isdefined(level.squaddata[teamid]) && isdefined(level.squaddata) && isdefined(squadid) && isdefined(teamid) && isdefined(level.squaddata[teamid][squadid].properties)) {
        level.squaddata[teamid][squadid].properties["UnlockQuestPedestalsCompleteS5"] = 1;
    }
    if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
        foreach (var_8986997b27e850da in var_78e49555d76726c1) {
            var_8986997b27e850da setscriptablepartstate("rift_gate_pedestal_container", "closed_unusable");
            if (isdefined(var_8986997b27e850da.var_745e910fb84e7971)) {
                var_8986997b27e850da.var_745e910fb84e7971 setscriptablepartstate(var_8986997b27e850da.var_745e910fb84e7971.type, "complete");
            }
        }
    } else {
        println("<dev string:xb8>");
    }
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        if (isdefined(s_pedestal.mdl_pedestal_on)) {
            str_fx = function_2966891996bfcca5(s_pedestal.targetname);
            if (isdefined(str_fx)) {
                foreach (squaddie in a_squad) {
                    playfxontagforclients(level._effect["rift_pedestal_active_" + str_fx], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
                }
            }
        }
    }
    thread namespace_446fc987a980892f::playevent("quest_s5_rift_gate_unlock_gate_formation", a_squad, 0.75);
    if (isdefined(e_sound)) {
        foreach (sndplayer in a_squad) {
            sndplayer playsoundtoplayer("evt_rr_gate_form_preamble", sndplayer, e_sound);
        }
    }
    wait 5;
    while (istrue(s_gate.var_6188ee921621bc1)) {
        wait 0.25;
    }
    s_gate.var_6188ee921621bc1 = 1;
    foreach (sndplayer in a_squad) {
        if (isdefined(sndplayer) && isdefined(e_sound)) {
            sndplayer playsoundtoplayer("evt_rr_gate_form_start", sndplayer, e_sound);
        }
    }
    foreach (squaddie in a_squad) {
        if (isdefined(squaddie) && isalive(squaddie)) {
            squaddie.var_f9fb033d5230ec9a = undefined;
            squaddie thread function_e51836f1240c2b7a(s_gate);
        }
    }
    wait 8;
    foreach (squaddie in a_squad) {
        if (isdefined(squaddie) && isalive(squaddie)) {
            squaddie thread scripts\mp\hud_message::showsplash("ob_rift_portal_opened", undefined, undefined, undefined, 1, "splash_list_jup_ob");
        }
    }
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        if (isdefined(s_pedestal.mdl_pedestal_on)) {
            str_fx = function_2966891996bfcca5(s_pedestal.targetname);
            if (isdefined(str_fx)) {
                foreach (squaddie in a_squad) {
                    if (isdefined(squaddie)) {
                        stopfxontagforclients(level._effect["rift_pedestal_active_" + str_fx], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
                    }
                }
            }
        }
    }
    foreach (interact in var_78e49555d76726c1) {
        if (isdefined(interact)) {
            namespace_af93597583d94051::function_2ba47d2b2d7cadf3(interact);
            level.var_f9fb033d5230ec9a = array_remove(level.var_f9fb033d5230ec9a, interact);
        }
    }
    s_gate.var_6188ee921621bc1 = undefined;
    if (issubstr(s_gate.targetname, "s5")) {
        function_25759c51891d4f43(s_gate, a_squad);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x4d21
// Size: 0x2bb
function function_46df852b6f79b0ee(a_players, var_f0467a62f52ac9d6, b_on, var_af0f0d4f82488cd9, var_65b90d4bc595041b) {
    if (!isdefined(var_f0467a62f52ac9d6)) {
        var_f0467a62f52ac9d6 = 1;
    }
    if (!isdefined(b_on)) {
        b_on = 1;
    }
    if (!isdefined(var_af0f0d4f82488cd9)) {
        var_af0f0d4f82488cd9 = 1;
    }
    scriptable = level.var_232491d3931d541f.var_38b605adf8e926c8;
    if (var_f0467a62f52ac9d6) {
        var_8eb1b81b6b735b85 = 1;
        var_54ce063b16a5c3b1 = "portal_vfx_easy";
        str_model = "jup_zm_rift_gate_yellow";
    } else {
        var_8eb1b81b6b735b85 = 2;
        var_54ce063b16a5c3b1 = "portal_vfx_hard";
        str_model = "jup_zm_rift_gate_red";
    }
    a_players = utility::array_removeundefined(a_players);
    if (b_on) {
        foreach (player in a_players) {
            if (isdefined(scriptable)) {
                player setclientomnvar("ob_rift_gate_portal_vfx", var_8eb1b81b6b735b85);
                scriptable setscriptablepartstate(var_54ce063b16a5c3b1, "on");
            }
            player.var_7c4a2519f7b89e16 = var_f0467a62f52ac9d6;
            player.var_9b65365d9058829d = !var_f0467a62f52ac9d6;
            if (isdefined(player.var_a98ca13545b6233d)) {
                player playsoundtoplayer("evt_rr_gate_player_activate", player, player.var_a98ca13545b6233d);
                if (var_af0f0d4f82488cd9) {
                    player.var_a98ca13545b6233d setmodel(str_model);
                    if (array_contains(level.var_3f1d8c79661d342d, player)) {
                        player.var_a98ca13545b6233d setscriptablepartstate("reveal", "appear_instantly");
                    }
                }
            }
        }
        if (isdefined(var_65b90d4bc595041b)) {
            var_65b90d4bc595041b setmodel(str_model);
        }
        return;
    }
    foreach (player in a_players) {
        player setclientomnvar("ob_rift_gate_portal_vfx", 0);
        if (isdefined(scriptable)) {
            scriptable setscriptablepartstate(var_54ce063b16a5c3b1, "off");
        }
        if (istrue(var_f0467a62f52ac9d6)) {
            player.var_7c4a2519f7b89e16 = undefined;
        } else {
            player.var_9b65365d9058829d = undefined;
        }
        if (isdefined(player.var_a98ca13545b6233d)) {
            player playsoundtoplayer("evt_rr_gate_portal_end", player, player.var_a98ca13545b6233d);
            if (var_af0f0d4f82488cd9) {
                player.var_a98ca13545b6233d setmodel("jup_zm_rift_gate");
                if (array_contains(level.var_3f1d8c79661d342d, player)) {
                    player.var_a98ca13545b6233d setscriptablepartstate("reveal", "appear_instantly");
                }
            }
        }
        if (isdefined(var_65b90d4bc595041b)) {
            var_65b90d4bc595041b setmodel("jup_zm_rift_gate");
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4fe4
// Size: 0x268
function function_b83ca58b862b27e9(a_squad, var_f0467a62f52ac9d6) {
    self endon("game_ended");
    n_time_limit = 10;
    timer = namespace_26c5a699d7cb84a2::function_3eec8a169e8a0936(n_time_limit);
    waitframe();
    while (timer.progresscomplete != 1) {
        n_time_remaining = int(timer.var_621cb2c0d9b1cdae);
        foreach (squaddie in a_squad) {
            if (isalive(squaddie)) {
                squaddie setclientomnvar("ui_is_exfil_countdown", 1);
                squaddie setclientomnvar("ui_match_start_countdown", n_time_remaining);
            }
        }
        wait 0.5;
    }
    var_de86fccc00b662d7 = [];
    foreach (player in a_squad) {
        if (isalive(player) && player.sessionstate == "playing") {
            var_de86fccc00b662d7[var_de86fccc00b662d7.size] = player;
        }
    }
    a_squad = var_de86fccc00b662d7;
    foreach (player in a_squad) {
        player scripts\common\values::set("rift_gate_teleport", "ignoreme", 1);
        player scripts\common\values::set("rift_gate_teleport", "damage", 0);
        player thread namespace_cc781f142d33c074::function_2241b80779e319a0();
    }
    if (var_f0467a62f52ac9d6) {
        playlistid = 1014;
    } else {
        playlistid = 1015;
    }
    wait 5;
    a_squad = utility::array_removeundefined(a_squad);
    namespace_cddd3ad399b210ff::function_e229d89e0c38206d(a_squad, playlistid);
    wait 5;
    function_46df852b6f79b0ee(a_squad, var_f0467a62f52ac9d6, 0);
    wait 5;
    a_squad = utility::array_removeundefined(a_squad);
    foreach (player in a_squad) {
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 0, 0.1);
        player scripts\common\values::reset_all("rift_gate_teleport");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5254
// Size: 0x7b
function function_a913db935a01a04c(player) {
    if (istrue(function_fa577f7324fdd05a(player)) || player namespace_9571f642f38c8169::function_3bb8b73991355a1(20) || getdvarint(@"hash_7ccd48c8c0b4bd24", 0) == 1) {
        player.var_2123e95946a8122a = 1;
        return;
    }
    if (namespace_af93597583d94051::function_f0ae0bcc1d1be67c(player, "s5") && getdvarint(@"hash_7ccd48c8c0b4bd24", 0) == 0) {
        player.var_2123e95946a8122a = 0;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x52d7
// Size: 0x4ee
function private function_1cf4569855afaa6b(params) {
    player = params.opener;
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    payload = [#"teamselect", player getentitynumber()];
    v_spawn = self.s_pedestal.origin + anglestoup(self.s_pedestal.angles) * 38;
    var_a182c34120b242d6 = 0;
    var_20cd5ad23d2171c0 = undefined;
    if (isdefined(self.var_745e910fb84e7971)) {
        bundlename = function_2cdc55ba39d97d70(self.var_745e910fb84e7971.type);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        var_cd82fb26c2069ff4 = function_6d15e119c2779a93(itembundle);
    }
    foreach (index, item in self.contents) {
        if (!isdefined(item.lootid) || item.lootid == 0) {
            continue;
        }
        if (utility::is_equal(var_cd82fb26c2069ff4, item.lootid)) {
            var_561e6991ddb5c545 = 1;
            var_20cd5ad23d2171c0 = self.contents[index];
            break;
        }
    }
    foreach (index, item in self.contents) {
        if (!isdefined(item.lootid) || item.lootid == 0) {
            continue;
        }
        if (isdefined(var_20cd5ad23d2171c0) && self.contents[index] == var_20cd5ad23d2171c0) {
            continue;
        }
        var_95ad7ae43ca54e24 = array_contains(self.s_gate.var_3fa0ceb5fb31d6b, item.lootid);
        itembundlename = function_fc925a153c7fd55c(item.lootid);
        if (!isdefined(var_20cd5ad23d2171c0) && var_95ad7ae43ca54e24 && !istrue(var_a182c34120b242d6) && !istrue(var_561e6991ddb5c545)) {
            var_a182c34120b242d6 = 1;
            var_20cd5ad23d2171c0 = self.contents[index];
            var_5f598218fed720bd = itembundlename;
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        itembundle.spawncount = item.quantity;
        var_bb1364c9d2f4a253 = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, v_spawn, self.s_pedestal.angles, 0, 0, payload);
    }
    self.contents = [];
    if (isdefined(var_20cd5ad23d2171c0)) {
        self.contents[0] = var_20cd5ad23d2171c0;
    } else {
        s_empty = spawnstruct();
        s_empty.lootid = 0;
        s_empty.quantity = 0;
        self.contents[0] = s_empty;
    }
    if (isdefined(self.var_745e910fb84e7971) && !istrue(var_561e6991ddb5c545)) {
        namespace_af93597583d94051::function_da9dd315433f48fa();
        self.var_f8431b01820e31a8 = 0;
        foreach (squaddie in a_squad) {
            self.s_pedestal.mdl_pedestal showtoplayer(squaddie);
            self.s_pedestal.mdl_pedestal_on hidefromplayer(squaddie);
        }
    }
    if (istrue(var_a182c34120b242d6) && isdefined(var_5f598218fed720bd)) {
        namespace_af93597583d94051::function_aabd1ec8342d4794(var_5f598218fed720bd, player);
        self.var_f8431b01820e31a8 = function_69ce7040cf0dea2d(var_5f598218fed720bd, self.s_pedestal.targetname);
        namespace_af93597583d94051::function_fb77e77aa1cd3508(var_5f598218fed720bd, player, "s5");
        if (istrue(self.var_f8431b01820e31a8) && function_edbd89f85d943b54(self.s_gate, a_squad, player)) {
            thread overlord::playconversation("s5_rq_last_item_placed", level.players);
            level thread function_a7a66cb92f56ae54(self.s_gate, a_squad, player);
            foreach (squaddie in a_squad) {
                if (isdefined(squaddie) && isalive(squaddie)) {
                    squaddie zombie_challenges::function_f10f600ac4ee4c09("s5_rift_gate_unlock", 3);
                    squaddie.var_2123e95946a8122a = 1;
                    function_a913db935a01a04c(squaddie);
                }
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x57cd
// Size: 0x8d
function private function_7e5dc4e6619f88ac(var_50ad5fd315fa5a61) {
    var_c388bef108dd25df = "off";
    switch (var_50ad5fd315fa5a61) {
    case #"hash_e4bebac3e7867ac8":
        var_c388bef108dd25df = "giraffe";
        break;
    case #"hash_2fe8e15e44ade2d7":
        var_c388bef108dd25df = "diary";
        break;
    case #"hash_49079fa46994eb6c":
        var_c388bef108dd25df = "drum";
        break;
    case #"hash_43c02a59c9eec85e":
        var_c388bef108dd25df = "peeks";
        break;
    default:
        break;
    }
    return var_c388bef108dd25df;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5863
// Size: 0x8d
function private function_e5124f6804b81575(var_3725432276e15c1a) {
    var_e10b94bbc3201da = "";
    switch (var_3725432276e15c1a) {
    case #"hash_43c02a59c9eec85e":
        var_e10b94bbc3201da = "5_peeks_attuned";
        break;
    case #"hash_2fe8e15e44ade2d7":
        var_e10b94bbc3201da = "5_diary_attuned";
        break;
    case #"hash_49079fa46994eb6c":
        var_e10b94bbc3201da = "5_drum_attuned";
        break;
    case #"hash_e4bebac3e7867ac8":
        var_e10b94bbc3201da = "5_giraffe_attuned";
        break;
    default:
        break;
    }
    return var_e10b94bbc3201da;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x58f9
// Size: 0xb0
function private function_69ce7040cf0dea2d(var_f1043532a12f9008, var_3725432276e15c1a) {
    var_2f92513fdda1651f = ["5_diary_attuned", "5_giraffe_attuned", "5_drum_attuned", "5_peeks_attuned"];
    foreach (str_element in var_2f92513fdda1651f) {
        if (issubstr(var_f1043532a12f9008, str_element)) {
            var_ffbdc72ee3a1acb8 = function_e5124f6804b81575(var_3725432276e15c1a);
            if (issubstr(str_element, var_ffbdc72ee3a1acb8)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x59b2
// Size: 0xaa
function private function_edbd89f85d943b54(s_gate, a_squad, player) {
    n_correct = 0;
    a_info = [];
    var_78e49555d76726c1 = function_222b578c46e71445(player);
    if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
        foreach (var_8986997b27e850da in var_78e49555d76726c1) {
            if (istrue(var_8986997b27e850da.var_f8431b01820e31a8)) {
                n_correct++;
            }
        }
    }
    return n_correct > 3;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5a65
// Size: 0x27
function private function_fa577f7324fdd05a(player) {
    if (isdefined(player.var_2123e95946a8122a)) {
        return player.var_2123e95946a8122a;
    }
    return 0;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5a95
// Size: 0xe8
function private function_a0856378b9181a73(s_gate, var_421f1da1a7cf188f) {
    s_gate.var_3fa0ceb5fb31d6b = [];
    itemlistbundle = getscriptbundle("itemspawnlist:" + var_421f1da1a7cf188f);
    foreach (itementry in itemlistbundle.itementries) {
        itembundle = getscriptbundle("itemspawnentry:" + itementry.itemspawnentry);
        if (isdefined(itembundle)) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref(itembundle.ref);
            if (isdefined(lootid)) {
                s_gate.var_3fa0ceb5fb31d6b = array_add(s_gate.var_3fa0ceb5fb31d6b, lootid);
            }
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5b85
// Size: 0x70
function private function_b77c1cb2bc83c76e(player, var_bb3bd4b73cb79c9b) {
    var_f6898e71aa21712a = [];
    backpacksize = player namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        currentlootid = player namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (array_contains(var_bb3bd4b73cb79c9b, currentlootid)) {
            var_f6898e71aa21712a = array_add(var_f6898e71aa21712a, currentlootid);
        }
    }
    return var_f6898e71aa21712a;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5bfe
// Size: 0x36
function private function_6b436eac1a6da2b9(player) {
    tokenid = player.var_9c6168187b815669;
    if (isdefined(tokenid)) {
        thread namespace_af93597583d94051::function_f1db902e3af4f3c(tokenid, player, "s5");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5c3c
// Size: 0x194
function private function_25759c51891d4f43(s_gate, a_squad) {
    wait 2.5;
    function_46df852b6f79b0ee(a_squad, 1);
    v_spawn = getclosestpointonnavmesh(s_gate.s_encounter.origin);
    wait 6;
    var_3de7237dd5d85a28 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_abom_hvt", v_spawn, s_gate.s_encounter.angles, "team_two_hundred");
    var_3de7237dd5d85a28 thread function_35e8a48dc2442eb2(a_squad);
    var_55693951d06ad3dd = namespace_1c689dd3986a841c::spawn_request("ai_encounter:" + "s5_unlock_boss_encounter", s_gate.s_encounter.origin, s_gate.s_encounter.radius, 0, 1);
    function_fc38783a3da0bc71(var_55693951d06ad3dd, 1);
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_megabom_spawn", a_squad, 1);
    var_3de7237dd5d85a28 waittill("death");
    wait 1;
    utility::flag_clear("s5_gate_battle_active");
    function_46df852b6f79b0ee(a_squad, 1, 0);
    wait 1;
    reward_groups = [];
    foreach (player in a_squad) {
        reward_groups[reward_groups.size] = [player];
    }
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, s_gate.s_reward, &function_90db22df3aa5cf66);
    wait 2;
    thread namespace_446fc987a980892f::playconversation("RFT_S5_5_RGUQ_Rift_Run_Gate_Fully_Spawned", a_squad);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5dd8
// Size: 0xc2
function private function_35e8a48dc2442eb2(a_players) {
    self endon("death");
    level endon("game_ended");
    scripts\common\values::set("rift_gate_battle", "ignoreall", 1);
    wait 3;
    utility::ent_flag_clear("can_bull_charge_off_ledge");
    scripts\common\values::reset("rift_gate_battle", "ignoreall");
    while (a_players.size) {
        if (isdefined(self.target)) {
            self function_9322f3cb1cd4111a();
        } else {
            a_players = array_removedead(a_players);
            a_players = array_removeundefined(a_players);
            e_target = utility::getclosest(self.origin, a_players, 5000);
        }
        if (isdefined(e_target)) {
            self function_65cdab0fc78aba8f(e_target.origin, 512);
            wait 10;
            e_target = undefined;
            continue;
        }
        wait 1;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ea2
// Size: 0x47
function private function_90db22df3aa5cf66(params) {
    low_token = spawnstruct();
    low_token.lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_low");
    low_token.quantity = 1;
    return [low_token];
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x5ef2
// Size: 0xeb
function private function_4f8d08c0e60f4381(var_5529bba56857dfba, var_83026a0ea0ca549c, var_a57f6d79283a91de, var_6a6601f4d2fb4a0a, var_74bbfa96eae4cfe8) {
    if (!isdefined(level.var_451ca4e0326e67ee)) {
        level.var_451ca4e0326e67ee = [];
    }
    var_43fcb31914763f4f = spawnstruct();
    var_43fcb31914763f4f.interact = spawnscriptable("jup_season5_5_ob_meteorite_ee", var_83026a0ea0ca549c, var_a57f6d79283a91de);
    var_43fcb31914763f4f.interact setscriptablepartstate("meteor_interact", "interact");
    var_43fcb31914763f4f.interact setscriptablepartstate("interact", "usable");
    var_43fcb31914763f4f.interact.var_5529bba56857dfba = var_5529bba56857dfba;
    namespace_5775ad2badedbcaa::function_32645103f7520635(var_43fcb31914763f4f.interact, var_6a6601f4d2fb4a0a);
    var_43fcb31914763f4f.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(var_74bbfa96eae4cfe8);
    level.var_451ca4e0326e67ee[var_5529bba56857dfba] = var_43fcb31914763f4f;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5fe5
// Size: 0x243
function private function_f43d7ceee5ddd0ee() {
    var_7b7afe8feee86a65 = getstruct("s5_attunement_diary_starter", "script_noteworthy");
    if (isdefined(var_7b7afe8feee86a65)) {
        function_4f8d08c0e60f4381("diary", var_7b7afe8feee86a65.origin, var_7b7afe8feee86a65.angles, &function_d4d87c8e59aa0c06, &function_1aeb1f253eec27f1);
        level.var_451ca4e0326e67ee["diary"].targettrigger = function_f159c10d5cf8f0b4("s5_attunement_diary_jump_target_trigger", "targetname");
        level.var_451ca4e0326e67ee["diary"].var_fd6952b756caaad8 = getstruct("s5_attunement_diary_perk_spawn", "targetname");
        level.var_451ca4e0326e67ee["diary"].var_fc434db357cdf903 = [];
        for (spawnindex = 0; spawnindex < 6; spawnindex++) {
            level.var_451ca4e0326e67ee["diary"].var_fc434db357cdf903[spawnindex] = getstruct("s5_attunement_diary_jump_aethertear_exit_" + spawnindex + 1, "targetname");
        }
    }
    var_13de501a052efad2 = getstruct("s5_attunement_giraffe_starter", "script_noteworthy");
    if (isdefined(var_13de501a052efad2)) {
        function_4f8d08c0e60f4381("giraffe", var_13de501a052efad2.origin, var_13de501a052efad2.angles, &function_ad06a810f0513757, &function_1aeb1f253eec27f1);
    }
    var_ec758217e824596e = getstruct("s5_attunement_drum_starter", "script_noteworthy");
    if (isdefined(var_ec758217e824596e)) {
        function_4f8d08c0e60f4381("drum", var_ec758217e824596e.origin, var_ec758217e824596e.angles, &function_d15e9380e44592a9, &function_1aeb1f253eec27f1);
        level.var_451ca4e0326e67ee["drum"].var_806e83e4385baf71 = getstructarray("s5_attunement_drum_ammozombie_spawn", "targetname");
        level.var_451ca4e0326e67ee["drum"].var_da69543dcbd23671 = getstructarray("s5_attunement_drum_ammomod_spawn", "targetname");
        level.var_451ca4e0326e67ee["drum"].triggers = function_f159c10d5cf8f0b4("s5_attunement_drum_ammomod_trigger", "targetname");
        level.var_451ca4e0326e67ee["drum"].var_8488e9b63ccdc3e1 = getstructarray("s5_attunement_drum_ammomod_vfxspawn", "targetname");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6230
// Size: 0x114
function private function_8aa8eb17ca1996b1() {
    var_4ed9a05916b2aef6 = getstruct("zombie_setdressing_sat1", "script_noteworthy");
    var_4ed99f5916b2acc3 = getstruct("zombie_setdressing_sat2", "script_noteworthy");
    var_c1ce3c73049fe1e5 = getstruct("zombie_setdressing_hang", "script_noteworthy");
    if (isdefined(var_4ed9a05916b2aef6)) {
        var_1c750a613963f432 = spawnscriptable(var_4ed9a05916b2aef6.targetname, var_4ed9a05916b2aef6.origin, var_4ed9a05916b2aef6.angles);
        var_1c750a613963f432 setscriptablepartstate("base", "enabled");
    }
    if (isdefined(var_4ed99f5916b2acc3)) {
        var_1c750a613963f432 = spawnscriptable(var_4ed99f5916b2acc3.targetname, var_4ed99f5916b2acc3.origin, var_4ed99f5916b2acc3.angles);
        var_1c750a613963f432 setscriptablepartstate("base", "enabled");
    }
    if (isdefined(var_c1ce3c73049fe1e5)) {
        var_1c750a613963f432 = spawnscriptable(var_c1ce3c73049fe1e5.targetname, var_c1ce3c73049fe1e5.origin, var_c1ce3c73049fe1e5.angles);
        var_1c750a613963f432 setscriptablepartstate("base", "enabled");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x634c
// Size: 0x1b2
function private function_d4d87c8e59aa0c06(player) {
    var_541482c9d3f63f0f = loot::getlootidfromref("jup_rift_gate_key_season5_diary");
    hasitem = player namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(var_541482c9d3f63f0f, 1);
    if (!istrue(hasitem) || istrue(level.var_451ca4e0326e67ee["diary"].busy)) {
        return;
    }
    playersquad = player getsquadmembers();
    function_ec57858f51e80f6e("diary", playersquad, 1);
    foreach (player in playersquad) {
        thread namespace_446fc987a980892f::playconversation("RFT_S5_5_RGUQ_Relic_Attunement_Locked_Diary_Start", [player]);
        if (!player namespace_876b4362ef613d7a::has_perk("specialty_phd_flopper")) {
            player function_cb04e62d25a95419();
        }
    }
    player function_cb04e62d25a95419();
    function_fe78a5ed4951d415();
    /#
        draw_circle(level.var_451ca4e0326e67ee["<dev string:x13e>"].targettrigger[0].origin, 140, (1, 1, 0), 1, 1, 100000);
    #/
    foreach (member in level.var_451ca4e0326e67ee["diary"].activeplayers) {
        member callback::add("phd_flopper_explosion", &function_ffe7eaa27196205d);
        member thread function_e076d5cbfeb0b10();
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6506
// Size: 0x3aa
function private function_fe78a5ed4951d415() {
    var_a74cf3b2977d7108 = (-21813.3, 30401.6, 2742.36);
    var_93594ef6b6a7b5ae = getstruct("s5_attunement_diary_jump_aethertear_entrance", "targetname");
    var_7cac93178fe02713 = var_93594ef6b6a7b5ae.origin;
    aethertear = utility::spawn_model("jup_zm_aethertear_s1_quest_electric", var_7cac93178fe02713);
    aethertear hide();
    playersquad = level.var_451ca4e0326e67ee["diary"].activeplayers[0] namespace_ca7b90256548aa40::getsquadmembers();
    foreach (player in playersquad) {
        aethertear showtoplayer(player);
    }
    aethertear setscriptablepartstate("body_aethertear", "usable");
    aethertear setscriptablepartstate("entrance_vfx", "on");
    level.var_451ca4e0326e67ee["diary"].aethertear = aethertear;
    trigger_struct = spawnstruct();
    trigger_struct.origin = level.var_451ca4e0326e67ee["diary"].aethertear.origin - (0, 0, 15);
    trigger_struct.radius = 17;
    trigger_struct.height = 25;
    level.var_451ca4e0326e67ee["diary"].trigger = spawn("trigger_radius", trigger_struct.origin, 0, trigger_struct.radius, trigger_struct.height);
    level.var_451ca4e0326e67ee["diary"] thread function_8873296e64dd8ccd(level.var_451ca4e0326e67ee["diary"].trigger);
    var_7800e75a3da05d98 = getstruct("s5_attunement_diary_jump_aethertear_entrance_fail", "targetname");
    var_aed8c910ac4ee945 = var_7800e75a3da05d98.origin;
    var_c1dff7f2395492f9 = utility::spawn_model("jup_zm_aethertear_s1_quest_electric", var_aed8c910ac4ee945);
    var_c1dff7f2395492f9 hide();
    foreach (player in playersquad) {
        var_c1dff7f2395492f9 showtoplayer(player);
    }
    var_c1dff7f2395492f9 setscriptablepartstate("body_aethertear", "usable");
    var_c1dff7f2395492f9 setscriptablepartstate("entrance_vfx", "on");
    level.var_451ca4e0326e67ee["diary"].var_c1dff7f2395492f9 = var_c1dff7f2395492f9;
    retry_struct = spawnstruct();
    retry_struct.origin = level.var_451ca4e0326e67ee["diary"].var_c1dff7f2395492f9.origin - (0, 0, 15);
    retry_struct.radius = 17;
    retry_struct.height = 25;
    level.var_451ca4e0326e67ee["diary"].var_7e4a0d695ae49c1b = spawn("trigger_radius", retry_struct.origin, 0, retry_struct.radius, retry_struct.height);
    level.var_451ca4e0326e67ee["diary"] thread function_8873296e64dd8ccd(level.var_451ca4e0326e67ee["diary"].var_7e4a0d695ae49c1b);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x68b8
// Size: 0x108
function private function_8873296e64dd8ccd(trigger) {
    level endon("game_ended");
    self endon("attunement_ended");
    var_6ca9e51a7a341193 = 0;
    while (true) {
        trigger waittill("trigger", player);
        if (isplayer(player) && !player ent_flag("teleporting") && array_contains(level.var_451ca4e0326e67ee["diary"].activeplayers, player)) {
            if (!isdefined(player.var_3a5caad0651268f7)) {
                player.var_3a5caad0651268f7 = var_6ca9e51a7a341193;
                var_6ca9e51a7a341193++;
                var_6ca9e51a7a341193 = int(min(var_6ca9e51a7a341193, 5));
            }
            exitpoint = level.var_451ca4e0326e67ee["diary"].var_fc434db357cdf903[player.var_3a5caad0651268f7];
            level.var_451ca4e0326e67ee["diary"] thread function_b6fccb3311314978(player, exitpoint.origin, exitpoint.angles);
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x69c8
// Size: 0xe5
function private function_b6fccb3311314978(player, targetpos, targetangles) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    if (player scripts\cp_mp\utility\player_utility::isinvehicle() || istrue(player.inlaststand)) {
        return;
    }
    player val::set("aether_tear", "damage", 0);
    player ent_flag_set("teleporting");
    player playsoundevent("snd_aethertear_teleport_plr");
    player freezecontrols(1);
    playfx(getfx("aethertear_teleport_vfx"), player.origin);
    player thread namespace_5d8c3870222947b5::function_7669f67b44245f73(1.25);
    wait 1;
    player setorigin(targetpos);
    player setplayerangles(targetangles);
    player freezecontrols(0);
    player val::set("aether_tear", "damage", 1);
    wait 0.2;
    player ent_flag_clear("teleporting");
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6ab5
// Size: 0x89
function private function_cb04e62d25a95419() {
    itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_perk_phd_flopper");
    payload = [#"teamselect", self getentitynumber()];
    a_squad = namespace_ca7b90256548aa40::getsquadmembers();
    item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, level.var_451ca4e0326e67ee["diary"].var_fd6952b756caaad8.origin, undefined, 0, 1, payload);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6b46
// Size: 0xbd
function private function_ffe7eaa27196205d(params) {
    var_541482c9d3f63f0f = loot::getlootidfromref("jup_rift_gate_key_season5_diary");
    if (isdefined(params) && isdefined(level.var_451ca4e0326e67ee["diary"].targettrigger[0]) && params.var_b57d053d714f885f > 2200 && distance2dsquared(params.explosionorigin, level.var_451ca4e0326e67ee["diary"].targettrigger[0].origin) < squared(140)) {
        level.var_451ca4e0326e67ee["diary"] notify("attunement_ended", 1, params.explosionorigin);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6c0b
// Size: 0x1b3
function private function_e076d5cbfeb0b10() {
    level endon("game_ended");
    level.var_451ca4e0326e67ee["diary"] waittill("attunement_ended", success, spawnloc);
    foreach (var_f329842bc1d61932 in level.var_451ca4e0326e67ee["diary"].activeplayers) {
        var_f329842bc1d61932 callback::remove("phd_flopper_explosion", &function_ffe7eaa27196205d);
    }
    if (isdefined(level.var_451ca4e0326e67ee["diary"].trigger)) {
        level.var_451ca4e0326e67ee["diary"].trigger delete();
    }
    if (isdefined(level.var_451ca4e0326e67ee["diary"].var_7e4a0d695ae49c1b)) {
        level.var_451ca4e0326e67ee["diary"].var_7e4a0d695ae49c1b delete();
    }
    if (isdefined(level.var_451ca4e0326e67ee["diary"].aethertear)) {
        level.var_451ca4e0326e67ee["diary"].aethertear delete();
    }
    if (isdefined(level.var_451ca4e0326e67ee["diary"].var_c1dff7f2395492f9)) {
        level.var_451ca4e0326e67ee["diary"].var_c1dff7f2395492f9 delete();
    }
    level.var_451ca4e0326e67ee["diary"] function_caa6319dd9c1fbda("diary", &function_2d1324a75337af55, success, spawnloc);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6dc6
// Size: 0x107
function private function_d15e9380e44592a9(player) {
    level endon("game_ended");
    var_f8d70b2f9d6e95ce = loot::getlootidfromref("jup_rift_gate_key_season5_drum");
    hasitem = player namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(var_f8d70b2f9d6e95ce, 1);
    if (!istrue(hasitem) || istrue(level.var_451ca4e0326e67ee["drum"].busy)) {
        return;
    }
    playersquad = player getsquadmembers();
    function_ec57858f51e80f6e("drum", playersquad);
    level.var_e5eff1795ff9b7d7 = 0;
    level.var_9d040a2beeb197e5 = playersquad;
    level.var_451ca4e0326e67ee["drum"] thread function_32c7cc28517924ab();
    level.var_451ca4e0326e67ee["drum"] thread function_dd148c8a999e199c();
    level.var_451ca4e0326e67ee["drum"] thread function_1ec60fe1002e6a82();
    level.var_451ca4e0326e67ee["drum"] thread function_a75c049334aacd34();
    level.var_451ca4e0326e67ee["drum"] thread function_6e42737e668504de();
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6ed5
// Size: 0x76
function private function_a75c049334aacd34() {
    self.var_288baefd91a399f6 = spawn_request("ai_flood_fill_encounter:s5_relic_attunement_drum", self.interact.origin, 1000, 1, 1, 0);
    if (isdefined(self.var_288baefd91a399f6)) {
        function_606642b946a01237("drum_attunement", self.interact.origin, 1000, 0);
        function_73147cdf5c28d10c(self.var_288baefd91a399f6, &function_319bf885af6b2f58, self);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f53
// Size: 0x15
function function_18ba78b06ac4e432(requestid, userdata) {
    return true;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f71
// Size: 0x2e
function function_319bf885af6b2f58(requestid, userdata) {
    return !istrue(level.var_451ca4e0326e67ee["drum"].busy);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6fa8
// Size: 0x114
function private function_dd148c8a999e199c() {
    level endon("game_ended");
    self endon("attunement_ended");
    elements = ["fire", "ice", "electric", "toxic"];
    if (!isdefined(level.var_451ca4e0326e67ee["drum"].var_806e83e4385baf71) || level.var_451ca4e0326e67ee["drum"].var_806e83e4385baf71.size == 0) {
        assertmsg("<dev string:x147>");
    }
    self.var_56f75f98b28dec8c = [];
    for (var_8675a545801ae00e = 0; var_8675a545801ae00e < 5; var_8675a545801ae00e++) {
        spawnpoint = random(level.var_451ca4e0326e67ee["drum"].var_806e83e4385baf71);
        elementtype = random(elements);
        var_7f3923f88a8c4d37 = function_c7b617f406aa4d13(spawnpoint, elementtype);
        self.var_56f75f98b28dec8c[self.var_56f75f98b28dec8c.size] = var_7f3923f88a8c4d37;
        wait 5;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x70c4
// Size: 0x1a6
function private function_c7b617f406aa4d13(spawnpoint, element) {
    var_99db42c55ebd0fb3 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_base_armored_heavy", spawnpoint.origin + (100, 0, 100), (0, 0, 0), "team_two_hundred");
    if (element == "electric") {
        var_99db42c55ebd0fb3.element = "electrical";
    } else if (element == "ice") {
        var_99db42c55ebd0fb3.element = "cold";
    } else {
        var_99db42c55ebd0fb3.element = element;
    }
    var_99db42c55ebd0fb3.var_7e3144ab69fefa03 = 0;
    var_99db42c55ebd0fb3.ignore_nuke = 1;
    var_99db42c55ebd0fb3.fullhealth = var_99db42c55ebd0fb3.health + 8500;
    var_99db42c55ebd0fb3.maxhealth = var_99db42c55ebd0fb3.fullhealth;
    var_99db42c55ebd0fb3.health = var_99db42c55ebd0fb3.fullhealth;
    var_99db42c55ebd0fb3 function_3ab9164ef76940fd("obelisk_vfx", element);
    var_99db42c55ebd0fb3 scripts\common\callbacks::add("on_zombie_ai_damaged", &function_b5b83a61f2db07a6);
    var_99db42c55ebd0fb3 scripts\common\callbacks::add("on_zombie_ai_killed", &function_d00da0bcb509676);
    var_99db42c55ebd0fb3.var_c3554a26521188a8 = &function_56a6f3ec9d11d2e7;
    var_99db42c55ebd0fb3.var_b5117f0fdd28774a = &function_56a6f3ec9d11d2e7;
    var_99db42c55ebd0fb3.var_8a5ad30eca36b2f9 = &function_56a6f3ec9d11d2e7;
    var_99db42c55ebd0fb3.var_1b74dbfbf5e984dc = &function_56a6f3ec9d11d2e7;
    var_99db42c55ebd0fb3.var_51618a5cd18d54b = &function_56a6f3ec9d11d2e7;
    var_99db42c55ebd0fb3.var_1aafe987ad681a50 = 1;
    var_99db42c55ebd0fb3.var_1011e5d6f6934ec0 = 1;
    return var_99db42c55ebd0fb3;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7273
// Size: 0x3
function function_56a6f3ec9d11d2e7() {
    return false;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x727f
// Size: 0x80
function private function_d00da0bcb509676(params) {
    if (!isdefined(level.var_451ca4e0326e67ee["drum"].var_b2f7480d638a4c61)) {
        level.var_451ca4e0326e67ee["drum"].var_b2f7480d638a4c61 = 0;
    }
    level.var_451ca4e0326e67ee["drum"].var_b2f7480d638a4c61++;
    level.var_451ca4e0326e67ee["drum"].spawnloc = self.origin;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7307
// Size: 0x173
function private function_b5b83a61f2db07a6(dmgstruct) {
    if (isdefined(self.element)) {
        var_2bd7283211fa61e7 = namespace_301533d2f1378cb9::function_591305dc9c07499b(dmgstruct.sweapon, dmgstruct.eattacker, dmgstruct.smeansofdeath);
        var_718be00895ad09e9 = 0;
        switch (self.element) {
        case #"hash_ceb098150f024a39":
            var_718be00895ad09e9 = dmgstruct.smeansofdeath != "MOD_ELEMENTAL_FIRE";
            break;
        case #"hash_a7c76a8f41a40e13":
            var_718be00895ad09e9 = dmgstruct.smeansofdeath != "MOD_ELEMENTAL_ELEC";
            break;
        case #"hash_6fe0d38b135245cc":
            var_718be00895ad09e9 = dmgstruct.smeansofdeath != "MOD_ELEMENTAL_TOXIC";
            break;
        case #"hash_ea0c2b29bbd6856f":
            var_718be00895ad09e9 = dmgstruct.smeansofdeath != "MOD_ELEMENTAL_COLD";
            break;
        }
        if (isdefined(var_2bd7283211fa61e7)) {
            if (istrue(var_718be00895ad09e9) && var_2bd7283211fa61e7 != self.element) {
                dmgstruct.idamage = 0;
                self.health = self.fullhealth;
                self.maxhealth = self.fullhealth;
                if (level.var_e5eff1795ff9b7d7 == 0) {
                    thread namespace_446fc987a980892f::playevent("RFT_S5_5_RGUQ_Relic_Attunement_Drum_Start", level.var_9d040a2beeb197e5);
                    level.var_e5eff1795ff9b7d7 = 1;
                }
            }
        }
    }
    return dmgstruct.idamage;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7483
// Size: 0x496
function private function_1ec60fe1002e6a82() {
    level endon("game_ended");
    self endon("attunement_ended");
    var_e5b6a9669e4cfc9 = [];
    var_e5b6a9669e4cfc9["fire"] = spawnstruct();
    var_e5b6a9669e4cfc9["ice"] = spawnstruct();
    var_e5b6a9669e4cfc9["electric"] = spawnstruct();
    var_e5b6a9669e4cfc9["toxic"] = spawnstruct();
    triggers = level.var_451ca4e0326e67ee["drum"].triggers;
    spawnpoints = level.var_451ca4e0326e67ee["drum"].var_da69543dcbd23671;
    var_cd41424a986c4c3f = level.var_451ca4e0326e67ee["drum"].var_8488e9b63ccdc3e1;
    foreach (triggervolume in triggers) {
        switch (triggervolume.script_noteworthy) {
        case #"hash_fe0fd5228eda0f07":
            var_e5b6a9669e4cfc9["ice"].triggervolume = triggervolume;
            break;
        case #"hash_4f5cd54aaf7f106":
            var_e5b6a9669e4cfc9["fire"].triggervolume = triggervolume;
            break;
        case #"hash_853faa00a9ff1020":
            var_e5b6a9669e4cfc9["toxic"].triggervolume = triggervolume;
            break;
        case #"hash_afaaf053b2461f8a":
            var_e5b6a9669e4cfc9["electric"].triggervolume = triggervolume;
            break;
        }
    }
    foreach (spawnpoint in spawnpoints) {
        switch (spawnpoint.script_noteworthy) {
        case #"hash_fe0fd5228eda0f07":
            var_e5b6a9669e4cfc9["ice"].spawnpoint = spawnpoint;
            break;
        case #"hash_4f5cd54aaf7f106":
            var_e5b6a9669e4cfc9["fire"].spawnpoint = spawnpoint;
            break;
        case #"hash_853faa00a9ff1020":
            var_e5b6a9669e4cfc9["toxic"].spawnpoint = spawnpoint;
            break;
        case #"hash_afaaf053b2461f8a":
            var_e5b6a9669e4cfc9["electric"].spawnpoint = spawnpoint;
            break;
        }
    }
    foreach (var_57d7a876cf9df9b6 in var_cd41424a986c4c3f) {
        switch (var_57d7a876cf9df9b6.script_noteworthy) {
        case #"hash_fe0fd5228eda0f07":
            var_e5b6a9669e4cfc9["ice"].var_485a0bddfe01d9a0 = var_57d7a876cf9df9b6.origin;
            var_e5b6a9669e4cfc9["ice"].var_209b2ab9769544da = var_57d7a876cf9df9b6.angles;
            break;
        case #"hash_4f5cd54aaf7f106":
            var_e5b6a9669e4cfc9["fire"].var_485a0bddfe01d9a0 = var_57d7a876cf9df9b6.origin;
            var_e5b6a9669e4cfc9["fire"].var_209b2ab9769544da = var_57d7a876cf9df9b6.angles;
            break;
        case #"hash_853faa00a9ff1020":
            var_e5b6a9669e4cfc9["toxic"].var_485a0bddfe01d9a0 = var_57d7a876cf9df9b6.origin;
            var_e5b6a9669e4cfc9["toxic"].var_209b2ab9769544da = var_57d7a876cf9df9b6.angles;
            break;
        case #"hash_afaaf053b2461f8a":
            var_e5b6a9669e4cfc9["electric"].var_485a0bddfe01d9a0 = var_57d7a876cf9df9b6.origin;
            var_e5b6a9669e4cfc9["electric"].var_209b2ab9769544da = var_57d7a876cf9df9b6.angles;
            break;
        }
    }
    self.var_cbf7ae87edf744ba = [];
    foreach (element, value in var_e5b6a9669e4cfc9) {
        self.var_cbf7ae87edf744ba[element] = spawnstruct();
        self.var_cbf7ae87edf744ba[element] thread function_3adc9459af96232d(value.triggervolume, value.spawnpoint, element, value.var_485a0bddfe01d9a0, value.var_209b2ab9769544da);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x7921
// Size: 0x187
function private function_3adc9459af96232d(triggerstruct, spawnstruct, element, var_485a0bddfe01d9a0, var_209b2ab9769544da) {
    level endon("game_ended");
    level.var_451ca4e0326e67ee["drum"] endon("attunement_ended");
    if (isdefined(triggerstruct)) {
        self.triggerstruct = triggerstruct;
    }
    var_869d699197f920a2 = "jup_ob_relic_mirror_" + element + "_fx";
    self.var_cd2aa409f280b3d4 = spawnscriptable(var_869d699197f920a2, triggerstruct.origin + (0, 0, 180), (0, 0, 0));
    self.var_cd2aa409f280b3d4 setscriptablepartstate("vfx", "active");
    self.var_b042e500f70a05c0 = spawnscriptable(var_869d699197f920a2, var_485a0bddfe01d9a0, var_209b2ab9769544da);
    self.var_b042e500f70a05c0 setscriptablepartstate("vfx", "active");
    triggerstruct.scriptable = spawnscriptable("jup_season5_5_ob_attune_ammo_interact", triggerstruct.origin);
    triggerstruct.scriptable setscriptablepartstate("interact", "usable");
    triggerstruct.scriptable.element = element;
    triggerstruct.scriptable.interact = function_32645103f7520635(triggerstruct.scriptable, &function_8977f0546b26bf71);
    triggerstruct.scriptable.interact function_e6c63f16f2258b80(&function_588293477a813b1f);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x7ab0
// Size: 0x30
function private function_588293477a813b1f(interact, player) {
    return {#string:%JUP_OB_S5/GATE_KEY_AMMO_MOD, #type:"HINT_BUTTON"};
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x7ae9
// Size: 0x113
function private function_8977f0546b26bf71(player) {
    if (isdefined(self.element)) {
        player playsoundtoplayer("uin_ob_pickup_ammomod", player);
        switch (self.element) {
        case #"hash_ceb098150f024a39":
            mod = "napalmburst";
            player playsoundtoplayer("uin_ob_ammomod_used_napalmburst", player);
            break;
        case #"hash_47276d6c2f4cfd60":
            mod = "cryofreeze";
            player playsoundtoplayer("uin_ob_ammomod_used_cryofreeze", player);
            break;
        case #"hash_f7a6ad55f66e4e1e":
            mod = "deadwire";
            player playsoundtoplayer("uin_ob_ammomod_used_deadwire", player);
            break;
        case #"hash_6fe0d38b135245cc":
            mod = "brainrot";
            player playsoundtoplayer("uin_ob_ammomod_used_brainrot", player);
            break;
        }
        current_weapon = player getcurrentweapon();
        player namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(current_weapon, mod);
        player earthquakeforplayer(0.5, 1, player.origin, 500);
        self setscriptablepartstate("interact", "cooldown");
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7c04
// Size: 0x145
function private function_6e42737e668504de() {
    level endon("game_ended");
    self waittill("attunement_ended", success, spawnloc);
    function_caa6319dd9c1fbda("drum", &function_b6c537c024035da2, success, spawnloc);
    function_c7311cb3f768f21e("drum_attunement");
    foreach (zombie in self.var_56f75f98b28dec8c) {
        zombie.nocorpse = 1;
        zombie.var_7e4b076a06c6df27 = 1;
        zombie kill();
    }
    self.var_56f75f98b28dec8c = [];
    foreach (ammotrigger in self.var_cbf7ae87edf744ba) {
        ammotrigger.var_cd2aa409f280b3d4 freescriptable();
        ammotrigger.var_b042e500f70a05c0 freescriptable();
        ammotrigger.triggerstruct.scriptable freescriptable();
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7d51
// Size: 0x4f
function private function_32c7cc28517924ab() {
    level endon("game_ended");
    self endon("attunement_ended");
    var_6b1731951a93709 = 5;
    self.var_b2f7480d638a4c61 = 0;
    while (self.var_b2f7480d638a4c61 < var_6b1731951a93709) {
        wait 1;
    }
    self notify("attunement_ended", 1, self.spawnloc);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x7da8
// Size: 0x184
function private function_ec57858f51e80f6e(var_5529bba56857dfba, squad, ignorerange, ignoretime) {
    if (!istrue(level.var_451ca4e0326e67ee[var_5529bba56857dfba].busy)) {
        level.var_451ca4e0326e67ee[var_5529bba56857dfba].busy = 1;
        level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers = [];
        lootref = "jup_rift_gate_key_season5_" + var_5529bba56857dfba;
        lootid = loot::getlootidfromref(lootref);
        foreach (squadmember in squad) {
            hasitem = squadmember namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(lootid, 1);
            squadmember earthquakeforplayer(0.5, 1, squadmember.origin, 500);
            if (istrue(hasitem)) {
                level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers[level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers.size] = squadmember;
                squadmember function_f3bb4f4911a1beb2("game", "removeFirstFromBackpack", lootid, 1);
            }
        }
        if (!istrue(ignorerange)) {
            level.var_451ca4e0326e67ee[var_5529bba56857dfba] thread function_a7121964085d84df();
        }
        if (!istrue(ignoretime)) {
            level.var_451ca4e0326e67ee[var_5529bba56857dfba] thread function_d822bddcbc95733e();
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7f34
// Size: 0x42
function private function_d822bddcbc95733e() {
    level endon("game_ended");
    self endon("attunement_ended");
    self.elapsedtime = 0;
    while (self.elapsedtime < 600) {
        self.elapsedtime++;
        wait 1;
    }
    self notify("attunement_ended");
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7f7e
// Size: 0xb5
function private function_a7121964085d84df() {
    level endon("game_ended");
    self endon("attunement_ended");
    while (true) {
        var_ecf119526e4ac6f5 = 0;
        foreach (player in self.activeplayers) {
            if (distance2dsquared(player.origin, self.interact.origin) < squared(5000)) {
                var_ecf119526e4ac6f5 = 1;
                break;
            }
        }
        if (!istrue(var_ecf119526e4ac6f5)) {
            self notify("attunement_ended");
        }
        wait 1;
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x803b
// Size: 0x1f5
function private function_caa6319dd9c1fbda(var_5529bba56857dfba, lootfunc, success, spawnloc) {
    level endon("game_ended");
    wait 1;
    if (istrue(level.var_451ca4e0326e67ee[var_5529bba56857dfba].busy)) {
        level.var_451ca4e0326e67ee[var_5529bba56857dfba].busy = 0;
        if (istrue(success)) {
            lootref = "jup_rift_gate_key_season5_" + var_5529bba56857dfba + "_attuned";
            lootid = loot::getlootidfromref(lootref);
            if (!isdefined(spawnloc)) {
                spawnloc = level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers[0].origin;
            }
            function_2d956ba6ecbc1906(level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers, -1 * lootid, lootfunc, spawnloc);
            wait 2;
            foreach (var_f329842bc1d61932 in level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers) {
                switch (var_5529bba56857dfba) {
                case #"hash_9b8400bb4bdcd96c":
                    thread namespace_446fc987a980892f::playconversation("RFT_S5_5_RGUQ_Relic_Attunement_Locked_Diary_Complete", [var_f329842bc1d61932]);
                    break;
                case #"hash_306c23099bffb04d":
                    thread namespace_446fc987a980892f::playconversation("RFT_S5_5_RGUQ_Relic_Attunement_Drum_Complete", [var_f329842bc1d61932]);
                    break;
                case #"hash_3f2cb3b7b263b30f":
                    thread namespace_446fc987a980892f::playevent("RFT_S5_5_RGUQ_Relic_Attunement_Giraffe_Complete", [var_f329842bc1d61932]);
                    break;
                }
            }
            var_7bc0c3236a85a96a = getaiarrayinradius(spawnloc, 1000, "team_two_hundred");
            if (isdefined(var_7bc0c3236a85a96a) && var_7bc0c3236a85a96a.size > 0) {
                thread function_5f684837e5288b1e(spawnloc, 1000, var_7bc0c3236a85a96a);
            }
        }
        level.var_451ca4e0326e67ee[var_5529bba56857dfba].activeplayers = [];
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8238
// Size: 0x21b
function private function_ad06a810f0513757(player) {
    level notify("ob_giraffe_attunement_setup");
    level endon("ob_giraffe_attunement_setup");
    level endon("game_ended");
    level endon("end_ambient_zombie_wave_spawn");
    level flag_wait("ob_infil_completed");
    var_2d7d1fbc98689898 = loot::getlootidfromref("jup_rift_gate_key_season5_giraffe");
    hasitem = player namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(var_2d7d1fbc98689898, 1);
    if (!istrue(hasitem) || istrue(level.var_451ca4e0326e67ee["giraffe"].busy)) {
        return;
    }
    playersquad = player getsquadmembers();
    function_ec57858f51e80f6e("giraffe", playersquad);
    foreach (player in playersquad) {
        thread namespace_446fc987a980892f::playevent("RFT_S5_5_RGUQ_Relic_Attunement_Giraffe_Start", [player]);
    }
    circle_struct = getstruct("s5_attunement_giraffe_encounter_spawn", "targetname");
    if (isdefined(circle_struct) && !isdefined(level.var_451ca4e0326e67ee["giraffe"].encounterid)) {
        level.var_451ca4e0326e67ee["giraffe"].encounterid = namespace_614554f86e52695c::spawn_request("ai_encounter:s5_relic_attunement_giraffe", circle_struct.origin, circle_struct.radius, 1, 0, 0);
        namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(level.var_451ca4e0326e67ee["giraffe"].encounterid, &function_2c7217780aa2bede);
        namespace_614554f86e52695c::function_f0cc0f2e6e1d085e(level.var_451ca4e0326e67ee["giraffe"].encounterid, &function_42371937e8b06de0);
        namespace_614554f86e52695c::function_7a2920be35f4386(level.var_451ca4e0326e67ee["giraffe"].encounterid, &function_a8d4e3c42b785b65, [self]);
        function_adcc96a7d541aa36(level.var_451ca4e0326e67ee["giraffe"].encounterid, 0);
    }
    level.var_451ca4e0326e67ee["giraffe"] thread function_3027b73850eb02ec();
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x845b
// Size: 0x55
function function_a8d4e3c42b785b65(requestid, userdata, wavenumber) {
    if (istrue(level.var_451ca4e0326e67ee["giraffe"].var_8490cdf88dc669a4)) {
        level.var_451ca4e0326e67ee["giraffe"].var_8490cdf88dc669a4 = undefined;
        return true;
    }
    return false;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x84b9
// Size: 0x21e
function function_2c7217780aa2bede(requestid, instance, agent, ai_data) {
    circle_struct = getstruct("s5_attunement_giraffe_encounter_spawn", "targetname");
    if (isdefined(circle_struct)) {
        agent function_65cdab0fc78aba8f(circle_struct.origin, circle_struct.radius);
    } else {
        agent function_65cdab0fc78aba8f(agent.origin, getdvarint(@"hash_436fc10ebca82d41", 2048));
    }
    if (issubstr(ai_data.aitype, "jup_spawner_zombie_abom_hvt") || issubstr(ai_data.aitype, "mimic_hvt_emp") || issubstr(ai_data.aitype, "disciple_s5_rr_unlock")) {
        if (!isdefined(level.var_451ca4e0326e67ee["giraffe"].objid)) {
            level.var_451ca4e0326e67ee["giraffe"].objid = namespace_c8baf39126f1ef99::function_fbd6a74053f1cb9a(%"hash_57ce5f1f6cb503ee");
        }
        if (isdefined(level.var_451ca4e0326e67ee["giraffe"].objid) && level.var_451ca4e0326e67ee["giraffe"].objid != -1) {
            iconzoffset = issubstr(ai_data.aitype, "jup_spawner_zombie_abom_hvt") ? 195 : 95;
            level.var_451ca4e0326e67ee["giraffe"] thread namespace_c8baf39126f1ef99::function_a90a4361890d7c1d(agent, level.var_451ca4e0326e67ee["giraffe"].activeplayers, level.var_451ca4e0326e67ee["giraffe"].objid, iconzoffset);
            level.var_451ca4e0326e67ee["giraffe"] thread ob_giraffe_attunement_end_watch();
        }
        if (issubstr(ai_data.aitype, "disciple_s5_rr_unlock")) {
            agent scripts\common\callbacks::add("on_zombie_ai_killed", &function_15f26b4f1814a447);
            return;
        }
        agent scripts\common\callbacks::add("on_zombie_ai_killed", &function_2ea7aced56dd8f14);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x86df
// Size: 0x5d
function private ob_giraffe_attunement_end_watch() {
    level notify("ob_giraffe_attunement_end_watch");
    level endon("ob_giraffe_attunement_end_watch");
    level endon("game_ended");
    self waittill("attunement_ended");
    if (isdefined(level.var_451ca4e0326e67ee["giraffe"].objid)) {
        namespace_c8baf39126f1ef99::function_fa14863bc660a9b5(level.var_451ca4e0326e67ee["giraffe"].objid);
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8744
// Size: 0x64
function private function_2ea7aced56dd8f14(params) {
    if (isdefined(level.var_451ca4e0326e67ee["giraffe"].objid)) {
        namespace_c8baf39126f1ef99::function_fa14863bc660a9b5(level.var_451ca4e0326e67ee["giraffe"].objid);
    }
    level.var_451ca4e0326e67ee["giraffe"].var_8490cdf88dc669a4 = 1;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x87b0
// Size: 0x2c
function private function_15f26b4f1814a447(params) {
    level.var_451ca4e0326e67ee["giraffe"] notify("attunement_ended", 1, self.origin);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x87e4
// Size: 0x1a
function function_42371937e8b06de0(requestid, userdata) {
    function_a39e9894083f4513(requestid);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8806
// Size: 0xb3
function function_3027b73850eb02ec() {
    level endon("game_ended");
    level.var_451ca4e0326e67ee["giraffe"] waittill("attunement_ended", success, spawnloc);
    function_caa6319dd9c1fbda("giraffe", &function_5ccb597286a4e768, success, spawnloc);
    function_adcc96a7d541aa36(level.var_451ca4e0326e67ee["giraffe"].encounterid, 1);
    level.var_451ca4e0326e67ee["giraffe"].busy = 0;
    level.var_451ca4e0326e67ee["giraffe"].encounterid = undefined;
    level.var_451ca4e0326e67ee["giraffe"] notify("attunement_ended");
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x88c1
// Size: 0x143
function private function_2d956ba6ecbc1906(playerlist, lootid, lootfunc, spawnloc) {
    if (isdefined(playerlist) && isdefined(lootid)) {
        playergroup = [];
        foreach (player in playerlist) {
            playergroup[playergroup.size] = [player];
            if (!isdefined(spawnloc)) {
                spawnloc = player.origin;
            }
            if (lootid < 0) {
                var_989b68606ea19ab1 = 1;
                lootid *= -1;
                hasitem = 1;
            } else {
                hasitem = player namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(lootid, 1);
            }
            if (istrue(hasitem)) {
                if (!istrue(var_989b68606ea19ab1)) {
                    player function_f3bb4f4911a1beb2("game", "removeFirstFromBackpack", lootid, 1);
                }
            }
        }
        placement = spawnstruct();
        placement.origin = getgroundposition(spawnloc, 15);
        placement.angles = player.angles;
        if (playerlist.size > 0) {
            namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(playergroup, placement, lootfunc);
        }
    }
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8a0c
// Size: 0x23
function private function_2d1324a75337af55(params) {
    params.lootlist = "ob_jup_item_reward_diary_s5_attuned";
    return function_33fd9641d5bd5093(params);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8a38
// Size: 0x23
function private function_b6c537c024035da2(params) {
    params.lootlist = "ob_jup_item_reward_drum_s5_attuned";
    return function_33fd9641d5bd5093(params);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8a64
// Size: 0x23
function private function_5ccb597286a4e768(params) {
    params.lootlist = "ob_jup_item_reward_giraffe_s5_attuned";
    return function_33fd9641d5bd5093(params);
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8a90
// Size: 0x4d
function private function_33fd9641d5bd5093(params) {
    cache = spawnstruct();
    items = namespace_2abc885019e1956::function_bc2f4857c90f5344(params.lootlist, 1);
    namespace_3883e3399f2870b5::function_fd95ef820bb2b980(items, cache);
    return cache.contents;
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8ae6
// Size: 0x13c
function private function_1aeb1f253eec27f1(usable, player) {
    if (isdefined(usable) && isdefined(usable.var_5529bba56857dfba)) {
        switch (usable.var_5529bba56857dfba) {
        case #"hash_9b8400bb4bdcd96c":
            lootid = loot::getlootidfromref("jup_rift_gate_key_season5_diary");
            break;
        case #"hash_306c23099bffb04d":
            lootid = loot::getlootidfromref("jup_rift_gate_key_season5_drum");
            break;
        case #"hash_3f2cb3b7b263b30f":
            lootid = loot::getlootidfromref("jup_rift_gate_key_season5_giraffe");
            break;
        default:
            lootid = -1;
            break;
        }
    }
    hasitem = player namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(lootid, 1);
    if (istrue(hasitem)) {
        if (istrue(level.var_451ca4e0326e67ee[usable.var_5529bba56857dfba].busy)) {
            hintstring = %JUP_OB_S5/ATTUNEMENT_BUSY;
            hinttype = "HINT_NOBUTTON";
        } else {
            hintstring = %JUP_OB_S5/HAS_KEY_START_ATTUNEMENT;
            hinttype = "HINT_BUTTON";
        }
    } else {
        hintstring = %;
        hinttype = "HINT_NOBUTTON";
    }
    return {#string:hintstring, #type:hinttype};
}

// Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x8c2b
// Size: 0xaf
function private function_5f684837e5288b1e(location, radius, zombies) {
    level endon("game_ended");
    waitframe();
    foreach (zombie in zombies) {
        if (isalive(zombie)) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
        }
    }
}

/#

    // Namespace namespace_c2522520955f08d1 / namespace_98669dbced571030
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8ce2
    // Size: 0xb2
    function function_55258ffc4dcf9b4b() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x188>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x1a0>", "<dev string:x1ae>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x1e6>", "<dev string:x1fe>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x23e>", "<dev string:x24b>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x282>", "<dev string:x299>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x2d8>", "<dev string:x2e8>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x322>", "<dev string:x33c>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x37e>", "<dev string:x39a>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        scripts\common\devgui::function_fe953f000498048f();
    }

#/
