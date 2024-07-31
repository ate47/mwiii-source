#using scripts\common\callbacks.gsc;
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;
#using script_2e445b403a12d74d;
#using script_62d456d3f9853f1f;
#using script_860bfdfe82326e3;
#using script_2583ee5680cf4736;
#using script_46c7c73b1a7e4773;
#using script_58be75c518bf0d40;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_485622d93fa7e4cf;
#using script_5640d32580c6bc7d;
#using script_7f9409b703dad400;
#using script_600b944a95c3a7bf;
#using script_16ea1b94f0f381b3;
#using script_22f1701e151b9d12;
#using script_482376d10f69832c;
#using script_57bdd8aff28a4717;
#using script_100adcc1cc11d2fa;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_41387eecc35b88bf;
#using scripts\mp\objidpoolmanager.gsc;
#using script_55c245eeebbdf85c;
#using script_507bdfb9bc863968;
#using script_293ab57698d6b32c;
#using script_68bae9be40ea196b;
#using script_5605739161b1abe1;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_43971bbeefd98f05;
#using script_19c169a442d5975a;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;
#using script_3390b73ac3318fe;
#using scripts\mp\mp_agent.gsc;

#namespace namespace_c2522720955f0d37;

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x1347
// Size: 0x1d
function private autoexec __init__system__() {
    system::register(#"hash_db399e7f0e2400b", undefined, &__init__, &function_baf56f45f52c0901);
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136c
// Size: 0x1b5
function __init__() {
    if (!getdvarint(@"hash_56590849e2d10fb0", 0)) {
        return;
    }
    level._effect["rift_gate_activated_easy"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_gate_low_power.vfx");
    level._effect["rift_gate_activated_hard"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_gate_high_power.vfx");
    level._effect["rift_pedestal_active_crayon"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_toxic.vfx");
    level._effect["rift_pedestal_active_giraffe"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_elec.vfx");
    level._effect["rift_pedestal_active_journal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_fire.vfx");
    level._effect["rift_pedestal_active_laptop"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_pedestal_active_cryo.vfx");
    level._effect["rift_gate_item_fx_giraffe"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_elec.vfx");
    level._effect["rift_gate_item_fx_crayon"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_toxic.vfx");
    level._effect["rift_gate_item_fx_journal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_fire.vfx");
    level._effect["rift_gate_item_fx_laptop"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_rift_unlock_item_cryo.vfx");
    level.var_bddbfe8bee6d6dc5 = [];
    level.var_f9fafd3d5230df68 = [];
    level.var_8b939fbe0ef2d56b = &on_item_drop;
    callback::add("player_spawned", &function_5defc56cf37dad61);
    callback::add("player_disconnect", &function_2186874d62832c93);
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("player_item_drop", &on_item_drop);
    callback::add("player_assimilated", &function_436b7bae8de567e7);
    callback::add("spawn_s3_rift_pedestal_containers", &function_922a434697a632e3);
    level.var_7aecd883b359d02f = 0;
    level.var_c5dc8846687704f6 = 0;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1529
// Size: 0xca
function function_baf56f45f52c0901() {
    thread function_87fc4dd30dbe9e7e();
    if (!getdvarint(@"hash_56590849e2d10fb0", 0)) {
        return;
    }
    namespace_580fdd1a01eb7ad::main();
    level flag_wait("ai_spawn_director_initialized");
    level.var_208c272494e2fd5 = getstruct("s3_rift_gate", "script_noteworthy");
    if (isdefined(level.var_208c272494e2fd5)) {
        function_5155042c35a3fdd2(level.var_208c272494e2fd5);
        level thread function_9a8fd43ba8259335(level.var_208c272494e2fd5);
        level thread function_ad319ef1312a4f2e(level.var_208c272494e2fd5);
        function_a0856378b9181a73(level.var_208c272494e2fd5, "ob_jup_items_keys_rift_gate_season3");
        function_1df61ac1719b72b8(level.var_208c272494e2fd5, &function_6ea3f32b954ba32b);
    }
    thread function_4faa21d126f9a5a3();
    level flag_set("rift_gates_spawned");
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fb
// Size: 0x174
function function_87fc4dd30dbe9e7e() {
    level endon("game_ended");
    waittill_any_2("match_start_real_countdown", "match_start_timer_skip");
    if (level.mapname == "mp_jup_bigmap") {
        validplayers = [];
        foreach (player in level.players) {
            if (isdefined(player) && function_8253592e0f6fb67(player) == 0 && namespace_34b6dd083314d3eb::function_6502de8f1658ce59(player)) {
                validplayers[validplayers.size] = player;
            }
        }
        if (validplayers.size > 0) {
            var_2e2a4163dba53609 = requestobjectiveid();
            var_9df8672cb04d3bb9 = level.var_2400a3ac0894afbb.origin + (0, 0, 200);
            objective_add_objective(var_2e2a4163dba53609, "current", var_9df8672cb04d3bb9, "jup_ui_map_icon_exfil_to_story");
            objective_playermask_hidefromall(var_2e2a4163dba53609);
            function_46822b25a91c60bc(validplayers);
            wait 65;
            thread namespace_446fc987a980892f::playconversation("quest_s35_rift_open", validplayers);
            foreach (validplayer in validplayers) {
                validplayer thread function_1cc31f82c0a48ab(var_2e2a4163dba53609);
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1777
// Size: 0x4e
function function_1cc31f82c0a48ab(var_2e2a4163dba53609) {
    level endon("game_ended");
    self endon("death");
    self waittill("dx_ob_st35_stry_soap_sty35stmriftopenln3" + "_endon");
    wait 20;
    if (!isdefined(self)) {
        return;
    }
    thread namespace_34b6dd083314d3eb::function_8b67e03b991ac60f(var_2e2a4163dba53609);
    thread namespace_446fc987a980892f::playconversation("quest_s35_rift_open_resp", [self], undefined, 0);
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17cd
// Size: 0x16e
function function_46822b25a91c60bc(var_249fdd086dd5b361) {
    level endon("game_ended");
    var_7cddb1a25ec9f269 = function_f159c10d5cf8f0b4("SM_VO_trigger_approach", "targetname");
    var_6982c4a34de46ab0 = function_f159c10d5cf8f0b4("SM_VO_trigger_arrive", "targetname");
    assert(isdefined(var_7cddb1a25ec9f269) && isarray(var_7cddb1a25ec9f269));
    assert(isdefined(var_6982c4a34de46ab0) && isarray(var_6982c4a34de46ab0));
    assert(var_7cddb1a25ec9f269.size == 1);
    assert(var_6982c4a34de46ab0.size == 1);
    if (isarray(var_7cddb1a25ec9f269) && var_7cddb1a25ec9f269.size > 0) {
        foreach (var_f0624a0049d4b480 in var_7cddb1a25ec9f269) {
            if (isdefined(var_f0624a0049d4b480)) {
                thread function_e0586ac65c340a5("quest_s35_approach", var_f0624a0049d4b480, var_249fdd086dd5b361);
                break;
            }
        }
    }
    if (isarray(var_6982c4a34de46ab0) && var_6982c4a34de46ab0.size > 0) {
        foreach (var_1211025df5ae1ae3 in var_6982c4a34de46ab0) {
            if (isdefined(var_1211025df5ae1ae3)) {
                thread function_e0586ac65c340a5("quest_s35_arrive", var_1211025df5ae1ae3, var_249fdd086dd5b361);
                break;
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1943
// Size: 0x146
function function_e0586ac65c340a5(void, var_39046f743b7de43d, var_249fdd086dd5b361) {
    level endon("game_ended");
    assert(isdefined(var_39046f743b7de43d) && isdefined(void) && isdefined(var_249fdd086dd5b361));
    var_b1ab6fc982a31d2e = var_249fdd086dd5b361;
    while (var_b1ab6fc982a31d2e.size > 0) {
        var_42376ed54d25120a = var_39046f743b7de43d waittill("trigger");
        if (isdefined(var_42376ed54d25120a)) {
            if (isplayer(var_42376ed54d25120a) && array_contains(var_b1ab6fc982a31d2e, var_42376ed54d25120a)) {
                thread namespace_446fc987a980892f::playconversation(void, [var_42376ed54d25120a]);
                var_b1ab6fc982a31d2e = array_remove(var_b1ab6fc982a31d2e, var_42376ed54d25120a);
            } else if (var_42376ed54d25120a scripts\cp_mp\vehicles\vehicle::isvehicle()) {
                occupants = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getalloccupants(var_42376ed54d25120a);
                var_a7415b218454162f = [];
                foreach (occupant in occupants) {
                    if (isplayer(occupant) && array_contains(var_b1ab6fc982a31d2e, occupant)) {
                        var_a7415b218454162f[var_a7415b218454162f.size] = occupant;
                        var_b1ab6fc982a31d2e = array_remove(var_b1ab6fc982a31d2e, occupant);
                    }
                }
                if (var_a7415b218454162f.size > 0) {
                    thread namespace_446fc987a980892f::playconversation(void, var_a7415b218454162f);
                }
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a91
// Size: 0x2b
function function_4faa21d126f9a5a3() {
    level endon("game_ended");
    level utility::flag_wait("ob_infil_completed");
    namespace_3d880430cde22149::init();
    namespace_e35b3aa0fd6626d4::init();
    namespace_f60f8b35aea76152::init();
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac4
// Size: 0x53
function on_item_pickup(params) {
    if (isdefined(params.item) && isdefined(params) && isdefined(params.item.var_d1c37d94e5043730)) {
        params.item.var_d1c37d94e5043730 delete();
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1f
// Size: 0x2d3
function function_436b7bae8de567e7(params) {
    player = params.player;
    oldsquadid = params.oldsquadindex;
    newsquadid = params.newsquadindex;
    if (!isdefined(player)) {
        return;
    }
    if (isdefined(level.squaddata[player.team][newsquadid]) && isdefined(level.squaddata[player.team][newsquadid].players)) {
        foreach (squaddie in level.squaddata[player.team][newsquadid].players) {
            if (isdefined(squaddie.var_f9fafd3d5230df68) && squaddie != player) {
                if (isdefined(player.var_f9fafd3d5230df68)) {
                    if (isdefined(oldsquadid)) {
                        oldteaminfo = level.squaddata[player.team][oldsquadid];
                    }
                    if (isdefined(oldteaminfo)) {
                        a_oldteam = oldteaminfo.players;
                    }
                    if (isdefined(a_oldteam) && a_oldteam.size > 0) {
                        foreach (interact in player.var_f9fafd3d5230df68) {
                            if (isdefined(interact)) {
                                interact disablescriptableplayeruse(player);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to disable undefined pedestal interacts");
                        }
                    } else {
                        foreach (interact in player.var_f9fafd3d5230df68) {
                            if (isdefined(interact)) {
                                interact freescriptable();
                                level.var_f9fafd3d5230df68 = array_remove(level.var_f9fafd3d5230df68, interact);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to clean up undefined pedestal interacts");
                        }
                    }
                }
                player.var_f9fafd3d5230df68 = squaddie.var_f9fafd3d5230df68;
                foreach (interact in player.var_f9fafd3d5230df68) {
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dfa
// Size: 0x13e
function on_item_drop(params) {
    if (isdefined(params) && isdefined(params.payload) && isarray(params.payload) && isdefined(params.payload[1]) && params.payload[1] == self getentitynumber() && issubstr(params.item.type, "ob_jup_scriptable_key_rift_gate_season3")) {
        a_squad = namespace_ca7b90256548aa40::getsquadmembers();
        if (a_squad.size > 1 && !isdefined(params.item.var_d1c37d94e5043730)) {
            level thread function_dc5d83d97e8f9e9c(params.item, params.itembundlename, a_squad, self);
        }
        foreach (player in level.players) {
            if (!array_contains(a_squad, player)) {
                params.item disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f40
// Size: 0x1d2
function function_dc5d83d97e8f9e9c(item, itembundlename, a_squad, player) {
    level endon("game_ended");
    while (isdefined(item)) {
        str_state = item getscriptablepartstate(item.type);
        if (str_state == "dropped") {
            waitframe();
            continue;
        }
        break;
    }
    item.var_d1c37d94e5043730 = spawn("script_model", item.origin);
    if (!isdefined(item.var_d1c37d94e5043730)) {
        return;
    }
    str_model = getscriptbundle("itemspawnentry:" + itembundlename).worldmodel;
    item.var_d1c37d94e5043730 setmodel(str_model);
    item.var_d1c37d94e5043730.angles = item.angles;
    item.var_d1c37d94e5043730 hide();
    if (issubstr(itembundlename, "attuned") && scripts\cp_mp\utility\game_utility::getmapname() == "mp_jup_bigmap") {
        str_fx = function_da3e68f8f9f52e9b(itembundlename);
    }
    foreach (unknown_player in level.players) {
        if (array_contains(a_squad, unknown_player)) {
            if (unknown_player != player) {
                item.var_d1c37d94e5043730 showtoplayer(unknown_player);
                if (isdefined(str_fx)) {
                    playfxontagforclients(level._effect["rift_gate_item_fx_" + str_fx], item.var_d1c37d94e5043730, "tag_origin", player);
                }
            }
            continue;
        }
        item disablescriptableplayeruse(unknown_player);
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x211a
// Size: 0x5b
function function_da3e68f8f9f52e9b(itembundlename) {
    if (issubstr(itembundlename, "crayon")) {
        return "crayon";
    }
    if (issubstr(itembundlename, "giraffe")) {
        return "giraffe";
    }
    if (issubstr(itembundlename, "journal")) {
        return "journal";
    }
    if (issubstr(itembundlename, "laptop")) {
        return "laptop";
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x217d
// Size: 0x27
function function_2186874d62832c93(params) {
    if (isdefined(self.var_f04a7621530c4687)) {
        self.var_f04a7621530c4687 delete();
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21ac
// Size: 0x1c3
function function_5defc56cf37dad61(params) {
    self endon("death_or_disconnect");
    self.var_ef36152f8d3d0f78 = undefined;
    function_7ea1c314162a37f6(self);
    level flag_wait("rift_gates_spawned");
    foreach (s_gate in level.var_bddbfe8bee6d6dc5) {
        if (s_gate.targetname != "s3_rift_gate") {
            continue;
        }
        if (isdefined(s_gate.var_39cfa415b2be8156)) {
            foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
                s_pedestal.mdl_pedestal showtoplayer(self);
            }
        }
        if (istrue(function_d5046430bfbc057c(self))) {
            if (!isdefined(self.var_f04a7621530c4687)) {
                self.var_f04a7621530c4687 = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate", 1, 1);
                if (isdefined(self.var_f04a7621530c4687)) {
                    self.var_f04a7621530c4687 showonlytoplayer(self);
                    self.var_f04a7621530c4687 setscriptablepartstate("reveal", "reveal_out");
                }
            }
            continue;
        }
        foreach (interact in level.var_f9fafd3d5230df68) {
            if (isdefined(interact)) {
                interact disablescriptableplayeruse(self);
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2377
// Size: 0x46f
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
            if (s_pedestal.targetname == "toxic") {
                var_18819ef03e6b0884 = "jup_zm_rift_pedestal";
            } else {
                var_18819ef03e6b0884 = s_pedestal.targetname + "::" + "jup_zm_rift_pedestal";
            }
            var_93ef5ee002227bec = s_pedestal.targetname + "_on::" + "jup_zm_rift_pedestal";
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x27ee
// Size: 0x13e
function private function_922a434697a632e3(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (isdefined(params.player.var_f9fafd3d5230df68)) {
        return;
    }
    a_squad = params.player namespace_ca7b90256548aa40::getsquadmembers();
    foreach (squaddie in a_squad) {
        if (isdefined(squaddie.var_f9fafd3d5230df68)) {
            var_78e49555d76726c1 = squaddie.var_f9fafd3d5230df68;
            break;
        }
    }
    if (isdefined(var_78e49555d76726c1)) {
        params.player.var_f9fafd3d5230df68 = var_78e49555d76726c1;
        foreach (interact in var_78e49555d76726c1) {
            interact enablescriptableplayeruse(params.player);
        }
        return;
    }
    level thread function_1383a22b72211d91(a_squad);
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2934
// Size: 0x26b
function private function_1383a22b72211d91(a_squad) {
    s_gate = level.var_208c272494e2fd5;
    if (!isdefined(s_gate.var_39cfa415b2be8156)) {
        return;
    }
    foreach (player in a_squad) {
        player.var_f9fafd3d5230df68 = [];
        if (getdvarint(@"hash_f812d1b84ae3e56f", 0)) {
            thread function_fdb378f67f901e05(s_gate, player);
        }
    }
    level.var_6f534773a462cc07 = default_to(level.var_6f534773a462cc07, 0);
    level.var_63b5ad00d6be7ebd = default_to(level.var_63b5ad00d6be7ebd, 0);
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        var_a3a5c8e4541d079f = anglestoforward(s_pedestal.angles) * -8;
        v_offset = anglestoup(s_pedestal.angles) * (16 + level.var_63b5ad00d6be7ebd) + anglestoforward(s_pedestal.angles) * level.var_6f534773a462cc07;
        v_spawn = s_pedestal.origin + v_offset + var_a3a5c8e4541d079f;
        var_8986997b27e850da = spawnscriptable("ob_jup_rift_gate_s3_pedestal_container", v_spawn);
        var_8986997b27e850da.s_pedestal = s_pedestal;
        var_8986997b27e850da.s_gate = s_gate;
        var_8986997b27e850da.noweaponslot = 1;
        var_8986997b27e850da.var_532eac3c428e5b9b = 1;
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("rift_gate_pedestal_container", &function_cf1b1f86951a9209);
        var_8986997b27e850da.var_55bb3585d29af1be = &function_359904b2a0fb09ed;
        var_8986997b27e850da callback::add("on_cache_closed", &function_4c1f32239229c511);
        var_8986997b27e850da.var_6978a4b328fd33b3 = &function_652b184a9e197fea;
        var_8986997b27e850da.containertype = 19;
        function_21ff655d80e2e4aa(var_8986997b27e850da, a_squad);
        level.var_f9fafd3d5230df68 = function_6d6af8144a5131f1(level.var_f9fafd3d5230df68, var_8986997b27e850da);
    }
    level.var_6f534773a462cc07++;
    level.var_63b5ad00d6be7ebd++;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba7
// Size: 0xfc
function function_21ff655d80e2e4aa(var_8986997b27e850da, var_9281831b50d55a3d) {
    if (isdefined(var_8986997b27e850da) && isdefined(var_9281831b50d55a3d) && isarray(var_9281831b50d55a3d)) {
        var_8986997b27e850da setscriptablepartstate("rift_gate_pedestal_container", "closed_usable");
        foreach (var_cd1b2eae3618a04d in level.players) {
            var_8986997b27e850da disablescriptableplayeruse(var_cd1b2eae3618a04d);
        }
        foreach (squadmember in var_9281831b50d55a3d) {
            squadmember.var_f9fafd3d5230df68 = function_6d6af8144a5131f1(squadmember.var_f9fafd3d5230df68, var_8986997b27e850da);
            var_8986997b27e850da enablescriptableplayeruse(squadmember);
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2cab
// Size: 0x13
function function_359904b2a0fb09ed(instance, player) {
    
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc6
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5e
// Size: 0x182
function function_ad319ef1312a4f2e(s_gate, player) {
    level endon("game_ended");
    old_players = [];
    var_70d983a2559807d6 = 0;
    while (true) {
        a_players = getplayersinradius(s_gate.origin, 2400, 2400);
        foreach (player in a_players) {
            if (!istrue(function_d5046430bfbc057c(player))) {
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee8
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
            case #"hash_20efca6763d55597": 
                namespace_fc89f9b99b72df11::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season3_crayon_attuned", 1);
                break;
            case #"hash_3f2cb3b7b263b30f": 
                namespace_fc89f9b99b72df11::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season3_giraffe_attuned", 1);
                break;
            case #"hash_1d6841634e835758": 
                namespace_fc89f9b99b72df11::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season3_journal_attuned", 1);
                break;
            case #"hash_176116b9eaefe88d": 
                namespace_fc89f9b99b72df11::function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season3_laptop_attuned", 1);
                break;
            default: 
                break;
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3054
// Size: 0x37b
function function_9a8fd43ba8259335(s_gate) {
    level endon("game_ended");
    var_3a9e259605bd2fd9 = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate_yellow", 0, 0);
    var_3a9e259605bd2fd9 hide();
    var_3a9e259605bd2fd9 notsolid();
    var_1446c6e912a6d70a = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate_red", 0, 0);
    var_1446c6e912a6d70a hide();
    var_1446c6e912a6d70a notsolid();
    old_players = [];
    while (true) {
        level.var_aa33d269f36cd637 = getplayersinradius(s_gate.origin, 3600, 3600);
        if (getdvarint(@"hash_66f3d105c4ee3428", 0)) {
            /#
                thread scripts\cp_mp\utility\debug_utility::drawcylinder(s_gate.origin, 3600, 1050, 0.5, (0, 1, 0));
            #/
        }
        foreach (player in level.var_aa33d269f36cd637) {
            if (!array_contains(old_players, player)) {
                var_3a9e259605bd2fd9 function_af96f7c8819ae854(player, 3600);
                var_1446c6e912a6d70a function_af96f7c8819ae854(player, 3600);
                if (istrue(function_d5046430bfbc057c(player))) {
                    player thread function_f6e92750f5fa5c30(s_gate);
                    continue;
                }
                if (isdefined(player.var_f9fafd3d5230df68)) {
                    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
                    foreach (scriptable in player.var_f9fafd3d5230df68) {
                        function_21ff655d80e2e4aa(scriptable, a_squad);
                    }
                    continue;
                }
                if (function_8253592e0f6fb67(player)) {
                    params = spawnstruct();
                    params.player = player;
                    level callback::callback("spawn_s3_rift_pedestal_containers", params);
                }
            }
        }
        foreach (old_player in old_players) {
            var_ae894028b993ed0b = undefined;
            if (isdefined(old_player) && !array_contains(level.var_aa33d269f36cd637, old_player)) {
                old_player thread function_bcd7ba129ebfbfb0(s_gate);
                player function_bab9acc2cf205a62();
                if (isdefined(player.var_f9fafd3d5230df68)) {
                    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
                    foreach (squaddie in a_squad) {
                        if (utility::array_contains(level.var_aa33d269f36cd637, squaddie)) {
                            var_ae894028b993ed0b = 1;
                            break;
                        }
                    }
                    if (!istrue(var_ae894028b993ed0b)) {
                        foreach (scriptable in player.var_f9fafd3d5230df68) {
                            if (isdefined(scriptable)) {
                                scriptable setscriptablepartstate("rift_gate_pedestal_container", "closed_unusable");
                            }
                        }
                    }
                }
            }
        }
        old_players = level.var_aa33d269f36cd637;
        wait 0.5;
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33d7
// Size: 0xe1
function function_f6e92750f5fa5c30(s_gate) {
    self endon("death_or_disconnect");
    while (istrue(self.var_ef36152f8d3d0f78)) {
        wait 0.2;
    }
    self.var_ef36152f8d3d0f78 = 1;
    s_gate.mdl_vortex hidefromplayer(self);
    if (isdefined(self.var_f04a7621530c4687)) {
        self playsoundtoplayer("evt_rr_gate_reshape", self, self.var_f04a7621530c4687);
    }
    wait 0.5;
    if (isdefined(self.var_f04a7621530c4687)) {
        self.var_f04a7621530c4687 setscriptablepartstate("reveal", "reveal_in");
        if (istrue(self.var_7c4a2519f7b89e16)) {
            function_46df852b6f79b0ee([self], 1, 1, 0);
        } else if (istrue(self.var_9b65365d9058829d)) {
            function_46df852b6f79b0ee([self], 0, 1, 0);
        }
    }
    wait 2;
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34c0
// Size: 0x100
function function_bcd7ba129ebfbfb0(s_gate) {
    self endon("death_or_disconnect");
    while (istrue(self.var_ef36152f8d3d0f78)) {
        wait 0.25;
    }
    self.var_ef36152f8d3d0f78 = 1;
    s_gate.mdl_vortex showtoplayer(self);
    if (istrue(function_d5046430bfbc057c(self))) {
        if (isdefined(self.var_f04a7621530c4687)) {
            self playsoundtoplayer("evt_rr_gate_dissolve", self, self.var_f04a7621530c4687);
        }
    }
    wait 0.5;
    if (isdefined(self.var_f04a7621530c4687)) {
        self.var_f04a7621530c4687 setscriptablepartstate("reveal", "reveal_out");
        if (istrue(self.var_7c4a2519f7b89e16)) {
            function_46df852b6f79b0ee([self], 1, 0, 0);
            self.var_7c4a2519f7b89e16 = 1;
        } else if (istrue(self.var_9b65365d9058829d)) {
            function_46df852b6f79b0ee([self], 0, 0, 0);
            self.var_9b65365d9058829d = 1;
        }
    }
    wait 2;
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35c8
// Size: 0x1ce
function function_e51836f1240c2b7a(s_gate) {
    if (s_gate.targetname != "s3_rift_gate") {
        println("<dev string:x4f>");
        return;
    }
    self endon("death_or_disconnect");
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
    if (!isdefined(self.var_f04a7621530c4687)) {
        self.var_f04a7621530c4687 = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate", 1, 1);
        self.var_f04a7621530c4687 hide();
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "active");
    }
    wait 6.5;
    if (isdefined(self.var_f04a7621530c4687)) {
        self.var_f04a7621530c4687 showonlytoplayer(self);
        self.var_f04a7621530c4687 setscriptablepartstate("reveal", "appear_instantly");
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "off");
    }
    self setclientomnvar("ob_rift_gate_formation", 0);
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x379e
// Size: 0x117
function function_1df61ac1719b72b8(s_gate, var_6a6601f4d2fb4a0a) {
    foreach (s_prompt in s_gate.var_a489feecfa0a74) {
        s_prompt.interact = spawnscriptable("ob_jup_rift_gate_interact", s_prompt.origin, s_prompt.angles);
        s_prompt.interact setscriptablepartstate("interact", "usable");
        namespace_5775ad2badedbcaa::function_32645103f7520635(s_prompt.interact, var_6a6601f4d2fb4a0a);
        s_prompt.interact.s_gate = s_gate;
        s_prompt.interact.script_label = s_prompt.script_label;
        s_prompt.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_59702b2cde6be814);
        s_gate.var_d1e2ce25ea15c51d = [];
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38bd
// Size: 0x20c
function function_59702b2cde6be814(interact, player) {
    if (function_2d894bba915fa71d(interact, player)) {
        if (interact.s_gate.var_d1e2ce25ea15c51d.size) {
            a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
            foreach (info in interact.s_gate.var_d1e2ce25ea15c51d) {
                if (array_contains(a_squad, info.player)) {
                    player.var_9c6168187b815669 = undefined;
                    return {#string:%JUP_OB_S3/RIFT_TOKEN_VOTE_IN_PROGRESS, #type:"HINT_NOBUTTON"};
                }
            }
        }
        if (function_6932962f514cd776(player)) {
            player.var_9c6168187b815669 = undefined;
            return {#string:%JUP_OB_S3/RIFT_TOKEN_CONTRACT_IN_PROGRESS, #type:"HINT_NOBUTTON"};
        }
        if (interact.script_label == "low") {
            lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_low");
            var_3ff928df2d5138ea = %JUP_OB_S3/RIFT_TOKEN_MISSING_PROMPT_LOW;
            var_e5242855a04339bf = %JUP_OB_S3/RIFT_TOKEN_ACTIVATE_PROMPT_LOW;
        } else {
            lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_high");
            var_3ff928df2d5138ea = %JUP_OB_S3/RIFT_TOKEN_MISSING_PROMPT_HIGH;
            var_e5242855a04339bf = %JUP_OB_S3/RIFT_TOKEN_ACTIVATE_PROMPT_HIGH;
        }
        backpackindex = player namespace_feea61bc660e9e0f::function_4776284a348ebb6a(lootid);
        if (backpackindex == -1) {
            player.var_9c6168187b815669 = undefined;
            return {#string:var_3ff928df2d5138ea, #type:"HINT_NOBUTTON"};
        } else {
            player.var_9c6168187b815669 = lootid;
            return {#string:var_e5242855a04339bf, #type:"HINT_BUTTON"};
        }
    }
    player.var_9c6168187b815669 = undefined;
    return {#string:%, #type:"HINT_NOBUTTON"};
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad2
// Size: 0x47
function function_2d894bba915fa71d(interact, player) {
    if (issubstr(interact.s_gate.targetname, "s3") && function_d5046430bfbc057c(player) == 1) {
        return true;
    }
    return false;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b22
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd2
// Size: 0x5fe
function function_a7a66cb92f56ae54(s_gate, a_squad, player) {
    level endon("game_ended");
    e_sound = namespace_4164bc931714b00b::spawn_script_model(s_gate, "tag_origin", 0, 0);
    var_d1ae2d7a03ea3888 = randomint(2);
    switch (var_d1ae2d7a03ea3888) {
    case 0: 
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Last_Object_Placed_Alt01_Line_01", level.players, 5);
        break;
    case 1: 
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Last_Object_Placed_Alt02_Line_01", level.players, 5);
        break;
    }
    if (isdefined(player) && isdefined(player.var_f9fafd3d5230df68)) {
        var_78e49555d76726c1 = player.var_f9fafd3d5230df68;
        foreach (interact in var_78e49555d76726c1) {
            interact setscriptablepartstate("rift_gate_pedestal_container", "closed_unusable");
            if (isdefined(interact.var_745e910fb84e7971)) {
                interact.var_745e910fb84e7971 setscriptablepartstate(interact.var_745e910fb84e7971.type, "complete");
            }
        }
    } else {
        println("<dev string:xb7>");
    }
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        if (isdefined(s_pedestal.mdl_pedestal_on)) {
            foreach (squaddie in a_squad) {
                playfxontagforclients(level._effect["rift_pedestal_active_" + s_pedestal.targetname], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
            }
        }
    }
    thread namespace_446fc987a980892f::playevent("quest_s3_rift_gate_unlock_gate_formation", a_squad, 0.75);
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
            squaddie.var_f9fafd3d5230df68 = undefined;
            squaddie thread function_e51836f1240c2b7a(s_gate);
        }
    }
    wait 8;
    var_1b2aadfc59a37075 = randomint(2);
    switch (var_1b2aadfc59a37075) {
    case 0: 
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Last_Object_Placed_Alt01_Line_02", level.players);
        break;
    case 1: 
        thread namespace_446fc987a980892f::playevent("RFT_S3_5_RGUQ_Last_Object_Placed_Alt02_Line_02", level.players);
        break;
    }
    foreach (squaddie in a_squad) {
        if (isdefined(squaddie) && isalive(squaddie)) {
            squaddie thread scripts\mp\hud_message::showsplash("ob_rift_portal_opened", undefined, undefined, undefined, 1, "splash_list_jup_ob");
        }
    }
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        if (isdefined(s_pedestal.mdl_pedestal_on)) {
            foreach (squaddie in a_squad) {
                if (isdefined(squaddie)) {
                    stopfxontagforclients(level._effect["rift_pedestal_active_" + s_pedestal.targetname], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
                }
            }
        }
    }
    foreach (interact in var_78e49555d76726c1) {
        if (isdefined(interact)) {
            interact.var_8a88f9de72798219.item notify("cleanup");
            interact.var_8a88f9de72798219.item freescriptable();
            interact.var_8a88f9de72798219 = undefined;
            interact freescriptable();
            level.var_f9fafd3d5230df68 = array_remove(level.var_f9fafd3d5230df68, interact);
        }
    }
    s_gate.var_6188ee921621bc1 = undefined;
    if (issubstr(s_gate.targetname, "s3")) {
        function_25759c51891d4f43(s_gate, a_squad);
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x41d8
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
    scriptable = level.var_208c272494e2fd5.var_38b605adf8e926c8;
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
            if (isdefined(player.var_f04a7621530c4687)) {
                player playsoundtoplayer("evt_rr_gate_player_activate", player, player.var_f04a7621530c4687);
                if (var_af0f0d4f82488cd9) {
                    player.var_f04a7621530c4687 setmodel(str_model);
                    if (array_contains(level.var_aa33d269f36cd637, player)) {
                        player.var_f04a7621530c4687 setscriptablepartstate("reveal", "appear_instantly");
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
        if (isdefined(player.var_f04a7621530c4687)) {
            player playsoundtoplayer("evt_rr_gate_portal_end", player, player.var_f04a7621530c4687);
            if (var_af0f0d4f82488cd9) {
                player.var_f04a7621530c4687 setmodel("jup_zm_rift_gate");
                if (array_contains(level.var_aa33d269f36cd637, player)) {
                    player.var_f04a7621530c4687 setscriptablepartstate("reveal", "appear_instantly");
                }
            }
        }
        if (isdefined(var_65b90d4bc595041b)) {
            var_65b90d4bc595041b setmodel("jup_zm_rift_gate");
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x449b
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
        playlistid = 1011;
    } else {
        playlistid = 1012;
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x470b
// Size: 0x75
function function_7ea1c314162a37f6(player) {
    if (istrue(function_d5046430bfbc057c(player)) || player namespace_9571f642f38c8169::function_3bb8b73991355a1(18) || getdvarint(@"hash_5164bb897076b072", 0) == 1) {
        player.var_f277fbd58fcf41c8 = 1;
        return;
    }
    if (function_8253592e0f6fb67() && getdvarint(@"hash_5164bb897076b072", 0) == 0) {
        player.var_f277fbd58fcf41c8 = 0;
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4788
// Size: 0x6b0
function private function_4c1f32239229c511(params) {
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
        if (isdefined(self.var_745e910fb84e7971.var_d1c37d94e5043730)) {
            self.var_745e910fb84e7971.var_d1c37d94e5043730 delete();
        }
        self.var_745e910fb84e7971 freescriptable();
        self.var_745e910fb84e7971 = undefined;
        self.var_8a88f9de72798219 = undefined;
        foreach (squaddie in a_squad) {
            self.s_pedestal.mdl_pedestal showtoplayer(squaddie);
            self.s_pedestal.mdl_pedestal_on hidefromplayer(squaddie);
        }
    }
    if (istrue(var_a182c34120b242d6) && isdefined(var_5f598218fed720bd)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_5f598218fed720bd);
        item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, v_spawn, self.s_pedestal.angles, 1, 1, payload);
        item.var_695427780354d0e5 = 1;
        item.s_pedestal = self.s_pedestal;
        item.var_19ef9dd0bcb44b4d = self;
        self.var_745e910fb84e7971 = item;
        var_f8431b01820e31a8 = function_69ce7040cf0dea2d(var_5f598218fed720bd, self.s_pedestal.targetname);
        self.var_8a88f9de72798219 = {#interact:self, #var_f8431b01820e31a8:var_f8431b01820e31a8, #item:item, #player:player};
        foreach (unknown_player in level.players) {
            item disablescriptableplayeruse(unknown_player);
            if (array_contains(a_squad, unknown_player)) {
                if (!isdefined(item.var_d1c37d94e5043730)) {
                    item.var_d1c37d94e5043730 = 1;
                    thread function_dc5d83d97e8f9e9c(item, var_5f598218fed720bd, a_squad, player);
                }
                if (istrue(var_f8431b01820e31a8)) {
                    var_7806751ca0fb753a = self.s_pedestal.targetname;
                    self setscriptablepartstate("audio", "active_" + var_7806751ca0fb753a);
                    self.s_pedestal.mdl_pedestal_on showtoplayer(unknown_player);
                    self.s_pedestal.mdl_pedestal hidefromplayer(unknown_player);
                }
            }
        }
        if (istrue(var_f8431b01820e31a8) && function_edbd89f85d943b54(self.s_gate, a_squad, player)) {
            thread overlord::playconversation("s3_rq_last_item_placed", level.players);
            level thread function_a7a66cb92f56ae54(self.s_gate, a_squad, player);
            foreach (squaddie in a_squad) {
                if (isdefined(squaddie) && isalive(squaddie)) {
                    squaddie zombie_challenges::function_f10f600ac4ee4c09("s3_rift_gate_unlock", 3);
                    squaddie.var_f277fbd58fcf41c8 = 1;
                    function_7ea1c314162a37f6(squaddie);
                }
            }
        }
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4e40
// Size: 0xe5
function private function_ac975683fd3cc398(var_16d6ef1b75c521ca) {
    var_23bce0e7989ad9e4 = "toxic";
    switch (var_16d6ef1b75c521ca) {
    case #"hash_20efca6763d55597": 
        var_23bce0e7989ad9e4 = "toxic";
        break;
    case #"hash_51e9ccb810cf040d": 
        var_23bce0e7989ad9e4 = "toxic_attuned";
        break;
    case #"hash_3f2cb3b7b263b30f": 
        var_23bce0e7989ad9e4 = "electric";
        break;
    case #"hash_717640b7f9748f45": 
        var_23bce0e7989ad9e4 = "electric_attuned";
        break;
    case #"hash_1d6841634e835758": 
        var_23bce0e7989ad9e4 = "fire";
        break;
    case #"hash_63b5ad2e38cc5f46": 
        var_23bce0e7989ad9e4 = "fire_attuned";
        break;
    case #"hash_176116b9eaefe88d": 
        var_23bce0e7989ad9e4 = "ice";
        break;
    case #"hash_6e540c6f5473f62b": 
        var_23bce0e7989ad9e4 = "ice_attuned";
        break;
    default: 
        break;
    }
    return var_23bce0e7989ad9e4;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4f2e
// Size: 0xe5
function private function_54b2c5a00ed87d60(var_23bce0e7989ad9e4) {
    var_16d6ef1b75c521ca = "toxic";
    switch (var_23bce0e7989ad9e4) {
    case #"hash_6fe0d38b135245cc": 
        var_16d6ef1b75c521ca = "crayon";
        break;
    case #"hash_de7862fa664ee542": 
        var_16d6ef1b75c521ca = "crayon_attuned";
        break;
    case #"hash_f7a6ad55f66e4e1e": 
        var_16d6ef1b75c521ca = "giraffe";
        break;
    case #"hash_2804c354f9907e1c": 
        var_16d6ef1b75c521ca = "giraffe_attuned";
        break;
    case #"hash_ceb098150f024a39": 
        var_16d6ef1b75c521ca = "journal";
        break;
    case #"hash_f32d4d097478aeef": 
        var_16d6ef1b75c521ca = "journal_attuned";
        break;
    case #"hash_47276d6c2f4cfd60": 
        var_16d6ef1b75c521ca = "laptop";
        break;
    case #"hash_1d163d9eaa1b080e": 
        var_16d6ef1b75c521ca = "laptop_attuned";
        break;
    default: 
        break;
    }
    return var_16d6ef1b75c521ca;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x501c
// Size: 0xaa
function private function_69ce7040cf0dea2d(var_f1043532a12f9008, var_3725432276e15c1a) {
    var_e05f6cd7912a7fdd = ["crayon_attuned", "giraffe_attuned", "journal_attuned", "laptop_attuned"];
    foreach (str_element in var_e05f6cd7912a7fdd) {
        if (issubstr(var_f1043532a12f9008, str_element)) {
            var_d5704eda87278c93 = str_element;
            if (issubstr(var_d5704eda87278c93, var_3725432276e15c1a)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x50cf
// Size: 0xaf
function private function_edbd89f85d943b54(s_gate, a_squad, player) {
    n_correct = 0;
    a_info = [];
    foreach (interact in player.var_f9fafd3d5230df68) {
        if (isdefined(interact.var_8a88f9de72798219) && istrue(interact.var_8a88f9de72798219.var_f8431b01820e31a8)) {
            n_correct++;
        }
    }
    return n_correct > 3;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5187
// Size: 0x27
function private function_d5046430bfbc057c(player) {
    if (isdefined(player.var_f277fbd58fcf41c8)) {
        return player.var_f277fbd58fcf41c8;
    }
    return 0;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x51b7
// Size: 0x37
function private function_8253592e0f6fb67(player) {
    if (isdefined(player) && player namespace_9571f642f38c8169::function_3bb8b73991355a1(17) || getdvarint(@"hash_f361aa685712210c", 0) == 1) {
        return true;
    }
    return false;
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x51f7
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x52e7
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5360
// Size: 0x31
function private function_6ea3f32b954ba32b(player) {
    tokenid = player.var_9c6168187b815669;
    if (isdefined(tokenid)) {
        thread function_3ce69a9ed7775817(tokenid, player);
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5399
// Size: 0x3ed
function private function_3ce69a9ed7775817(tokenid, player) {
    player endon("death_or_disconnect");
    player forceplaygestureviewmodel("jup_ges_open_portal");
    player playsound("fly_player_activate_portal");
    var_88234437d3758ed8 = namespace_2abc885019e1956::function_fc925a153c7fd55c(tokenid);
    var_f0467a62f52ac9d6 = issubstr(var_88234437d3758ed8, "low");
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    foreach (squaddie in a_squad) {
        if (!isdefined(squaddie.var_f04a7621530c4687)) {
            var_e075f39c1003cdcb = namespace_4164bc931714b00b::spawn_script_model(self.s_gate, "jup_zm_rift_gate", 1, 1);
            break;
        }
    }
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb hide();
        foreach (squaddie in a_squad) {
            var_e075f39c1003cdcb function_af96f7c8819ae854(squaddie, 2000);
        }
    }
    wait 0.5;
    /#
        if (getdvarint(@"hash_ab8c82aa304547b", 0)) {
            function_25759c51891d4f43(self.s_gate, a_squad);
            return;
        }
    #/
    var_1a92db52accd1108 = {#player:player};
    self.s_gate.var_d1e2ce25ea15c51d = array_add(self.s_gate.var_d1e2ce25ea15c51d, var_1a92db52accd1108);
    if (isdefined(player.var_f04a7621530c4687)) {
        player.var_f04a7621530c4687 playsoundtoplayer("ui_zm_core_door_purchase_success", player);
    }
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    if (isdefined(var_e075f39c1003cdcb)) {
        foreach (squaddie in a_squad) {
            if (!isdefined(squaddie.var_f04a7621530c4687)) {
                self.s_gate.mdl_vortex hidefromplayer(squaddie);
                var_e075f39c1003cdcb showtoplayer(squaddie);
            }
        }
        var_e075f39c1003cdcb setscriptablepartstate("reveal", "reveal_in");
    }
    function_46df852b6f79b0ee(a_squad, var_f0467a62f52ac9d6, 1, 1, var_e075f39c1003cdcb);
    b_success = namespace_6c57c664b4288f88::function_93c8f90c3bd798c6(player, 30);
    self.s_gate.var_d1e2ce25ea15c51d = array_remove(self.s_gate.var_d1e2ce25ea15c51d, var_1a92db52accd1108);
    if (b_success == 1) {
        b_valid = player namespace_feea61bc660e9e0f::function_181a584e4a68d5d6(tokenid);
        player.var_9c6168187b815669 = undefined;
        if (b_valid) {
            level thread function_b83ca58b862b27e9(a_squad, var_f0467a62f52ac9d6);
        } else if (isdefined(player.var_f04a7621530c4687)) {
            player.var_f04a7621530c4687 playsoundtoplayer("ui_zm_core_purchase_deny", player);
        }
        return;
    }
    if (isdefined(player.var_f04a7621530c4687)) {
        player.var_f04a7621530c4687 playsoundtoplayer("ui_zm_core_purchase_deny", player);
    }
    function_46df852b6f79b0ee(a_squad, var_f0467a62f52ac9d6, 0, 1, var_e075f39c1003cdcb);
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb setscriptablepartstate("reveal", "reveal_out");
        foreach (squaddie in a_squad) {
            if (isdefined(squaddie) && !isdefined(squaddie.var_f04a7621530c4687)) {
                self.s_gate.mdl_vortex showtoplayer(squaddie);
            }
        }
    }
    wait 5;
    if (isdefined(var_e075f39c1003cdcb)) {
        var_e075f39c1003cdcb delete();
    }
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x578e
// Size: 0x145
function private function_25759c51891d4f43(s_gate, a_squad) {
    wait 2.5;
    function_46df852b6f79b0ee(a_squad, 1);
    v_spawn = getclosestpointonnavmesh(s_gate.s_encounter.origin);
    wait 6;
    var_1646f06a1cdcfce7 = scripts\mp\mp_agent::spawnnewagentaitype("jup_spawner_zombie_disciple_s3_rr_unlock", s_gate.origin, s_gate.angles, "team_two_hundred");
    var_1646f06a1cdcfce7 thread function_35e8a48dc2442eb2(a_squad, s_gate.s_reward.origin);
    var_1646f06a1cdcfce7 waittill("death");
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_megabom_spawn", a_squad, 1);
    wait 1;
    utility::flag_clear("s3_gate_battle_active");
    function_46df852b6f79b0ee(a_squad, 1, 0);
    wait 1;
    reward_groups = [];
    foreach (player in a_squad) {
        reward_groups[reward_groups.size] = [player];
    }
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, s_gate.s_reward, &function_90db22df3aa5cf66);
}

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x58db
// Size: 0xd6
function private function_35e8a48dc2442eb2(a_players, v_charge) {
    self endon("death");
    scripts\common\values::set("rift_gate_battle", "ignoreall", 1);
    wait 1.5;
    self setgoalpos(v_charge, 32);
    wait 1.5;
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

// Namespace namespace_c2522720955f0d37 / namespace_9866a3bced571d62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x59b9
// Size: 0x47
function private function_90db22df3aa5cf66(params) {
    low_token = spawnstruct();
    low_token.lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_low");
    low_token.quantity = 1;
    return [low_token];
}
