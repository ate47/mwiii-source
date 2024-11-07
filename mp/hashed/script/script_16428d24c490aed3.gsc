#using scripts\common\callbacks.gsc;
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;
#using script_2e445b403a12d74d;
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
#using script_3559130ee2bb3a29;
#using script_100adcc1cc11d2fa;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_41387eecc35b88bf;
#using script_5605739161b1abe1;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_76cc264b397db9cb;
#using script_43971bbeefd98f05;
#using script_19c169a442d5975a;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\hud_message.gsc;
#using scripts\common\values.gsc;
#using script_6f65366f542f6627;

#namespace ob_rift_gate;

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf83
// Size: 0x1d
function private autoexec __init__system__() {
    system::register(#"ob_rift_gate", undefined, &__init__, &function_baf56f45f52c0901);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa8
// Size: 0x1c2
function __init__() {
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0)) {
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
    level.var_f9faff3d5230e3ce = [];
    level.var_8b939fbe0ef2d56b = &on_item_drop;
    callback::add("player_spawned", &function_5defc56cf37dad61);
    callback::add("player_disconnect", &function_2186874d62832c93);
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("player_item_drop", &on_item_drop);
    callback::add("player_assimilated", &function_436b7bae8de567e7);
    if (function_3e9b5fc322cb6c83()) {
        callback::add("squad_created", &function_6d402ea224e021c2);
        namespace_af93597583d94051::function_b45f9d15a24dd4d0();
    }
    callback::add("spawn_s1_rift_pedestal_containers", &function_922a434697a632e3);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1172
// Size: 0xa1
function function_6d402ea224e021c2(sparams) {
    if (isdefined(sparams.team) && isdefined(sparams) && isdefined(level.squaddata) && isdefined(sparams.index)) {
        level.squaddata[sparams.team][sparams.index].properties["UnlockQuestPedestalsS1"] = [];
        level.squaddata[sparams.team][sparams.index].properties["UnlockQuestPedestalsCompleteS1"] = 0;
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x121b
// Size: 0x5a
function private function_222b578c46e71445(player) {
    var_ac0eafb387bd7c4 = undefined;
    if (isdefined(player)) {
        if (function_3e9b5fc322cb6c83()) {
            var_ac0eafb387bd7c4 = namespace_af93597583d94051::function_b200e7001502a482(player.team, player.sessionsquadid, "s1");
        } else {
            var_ac0eafb387bd7c4 = player.var_f9faff3d5230e3ce;
        }
    }
    return var_ac0eafb387bd7c4;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x127e
// Size: 0x121
function private function_b200e7001502a482(team, sessionsquadid, var_6b0ee97314aed333) {
    var_ac0eafb387bd7c4 = undefined;
    if (isdefined(team) && isdefined(sessionsquadid)) {
        if (function_3e9b5fc322cb6c83()) {
            var_ac0eafb387bd7c4 = namespace_af93597583d94051::function_b200e7001502a482(team, sessionsquadid, "s1", var_6b0ee97314aed333);
        } else {
            squaddata = level.squaddata[team][sessionsquadid];
            if (isdefined(squaddata.players) && isdefined(squaddata) && isdefined(squaddata.players.size) && squaddata.players.size > 0) {
                foreach (squaddie in squaddata.players) {
                    if (isdefined(squaddie) && isdefined(squaddie.var_f9faff3d5230e3ce)) {
                        if (isdefined(var_6b0ee97314aed333) && squaddie == var_6b0ee97314aed333) {
                            continue;
                        }
                        var_ac0eafb387bd7c4 = squaddie.var_f9faff3d5230e3ce;
                        break;
                    }
                }
            }
        }
    }
    return var_ac0eafb387bd7c4;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13a8
// Size: 0x12
function private function_3e9b5fc322cb6c83() {
    return getdvarint(@"hash_d2e476f8b0cfc0ac", 1);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c3
// Size: 0xca
function function_baf56f45f52c0901() {
    if (!getdvarint(@"hash_abc1d9ea495ec189", 0)) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::getmapname() != "mp_jup_bigmap") {
        return;
    }
    namespace_580fdd1a01eb7ad::main();
    level flag_wait("ai_spawn_director_initialized");
    level.var_1fb16fc647c8b98b = getstruct("ob_rift_gate", "script_noteworthy");
    if (isdefined(level.var_1fb16fc647c8b98b)) {
        function_5155042c35a3fdd2(level.var_1fb16fc647c8b98b);
        level thread function_9a8fd43ba8259335(level.var_1fb16fc647c8b98b);
        level thread function_ad319ef1312a4f2e(level.var_1fb16fc647c8b98b);
        function_a0856378b9181a73(level.var_1fb16fc647c8b98b, "ob_jup_items_keys_rift_gate_season1");
        function_1df61ac1719b72b8(level.var_1fb16fc647c8b98b, &function_977fba46aefad325);
    }
    level flag_set("rift_gates_spawned");
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1495
// Size: 0x3f
function on_item_pickup(params) {
    if (isdefined(params.item.var_d1c37d94e5043730)) {
        params.item.var_d1c37d94e5043730 delete();
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14dc
// Size: 0x31f
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
        namespace_af93597583d94051::function_5121e154aabb5b05(player, oldteam, newteam, oldsquadid, newsquadid, "s1");
        return;
    }
    if (isdefined(level.squaddata[player.team][newsquadid]) && isdefined(level.squaddata[player.team][newsquadid].players)) {
        foreach (squaddie in level.squaddata[player.team][newsquadid].players) {
            if (isdefined(squaddie.var_f9faff3d5230e3ce) && squaddie != player) {
                if (isdefined(player.var_f9faff3d5230e3ce)) {
                    if (isdefined(oldsquadid)) {
                        oldteaminfo = level.squaddata[player.team][oldsquadid];
                    }
                    if (isdefined(oldteaminfo)) {
                        a_oldteam = oldteaminfo.players;
                    }
                    if (isdefined(a_oldteam) && a_oldteam.size > 0) {
                        foreach (interact in player.var_f9faff3d5230e3ce) {
                            if (isdefined(interact)) {
                                interact disablescriptableplayeruse(player);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to disable undefined pedestal interacts");
                        }
                    } else {
                        foreach (interact in player.var_f9faff3d5230e3ce) {
                            if (isdefined(interact)) {
                                interact freescriptable();
                                level.var_f9faff3d5230e3ce = array_remove(level.var_f9faff3d5230e3ce, interact);
                                continue;
                            }
                            logstring("OB RIFT GATE - tried to clean up undefined pedestal interacts");
                        }
                    }
                }
                player.var_f9faff3d5230e3ce = squaddie.var_f9faff3d5230e3ce;
                foreach (interact in player.var_f9faff3d5230e3ce) {
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1803
// Size: 0x112
function on_item_drop(params) {
    if (isdefined(params.payload) && params.payload[1] == self getentitynumber() && issubstr(params.item.type, "ob_jup_scriptable_key_rift_gate_season1")) {
        a_squad = namespace_ca7b90256548aa40::getsquadmembers();
        if (a_squad.size > 1 && !isdefined(params.item.var_d1c37d94e5043730)) {
            level thread namespace_af93597583d94051::function_dc5d83d97e8f9e9c(params.item, params.itembundlename, a_squad, self);
        }
        foreach (player in level.players) {
            if (!array_contains(a_squad, player)) {
                params.item disablescriptableplayeruse(player);
            }
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191d
// Size: 0x1d
function function_2186874d62832c93(params) {
    if (isdefined(self)) {
        namespace_af93597583d94051::function_96b2f0429cd884b5(self, "s1");
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1942
// Size: 0x1dd
function function_5defc56cf37dad61(params) {
    self endon("death_or_disconnect");
    self.var_ef36152f8d3d0f78 = undefined;
    function_9075c9a5985b8ac0(self);
    level flag_wait("rift_gates_spawned");
    foreach (s_gate in level.var_bddbfe8bee6d6dc5) {
        if (s_gate.targetname != "s1_rift_gate") {
            continue;
        }
        if (isdefined(s_gate.var_39cfa415b2be8156)) {
            foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
                s_pedestal.mdl_pedestal showtoplayer(self);
            }
        }
        if (istrue(function_8442cf03b10a3296(self))) {
            if (!isdefined(self.var_a20bb623ab5f6211) && !namespace_af93597583d94051::function_50ab9eb71c85b240()) {
                namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s1");
                self.var_a20bb623ab5f6211 = namespace_4164bc931714b00b::spawn_script_model(s_gate, "jup_zm_rift_gate", 1, 1);
                if (isdefined(self.var_a20bb623ab5f6211)) {
                    self.var_a20bb623ab5f6211 showonlytoplayer(self);
                    self.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "reveal_out");
                }
            }
            continue;
        }
        foreach (interact in level.var_f9faff3d5230e3ce) {
            if (isdefined(interact)) {
                interact disablescriptableplayeruse(self);
            }
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b27
// Size: 0x46f
function function_5155042c35a3fdd2(s_gate) {
    v_offset = (0, 0, 0);
    /#
        if (level.mapname == "<dev string:x1c>" || level.mapname == "<dev string:x37>") {
            v_offset = (-8222, 12250, -1400);
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f9e
// Size: 0x114
function private function_922a434697a632e3(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (!istrue(function_3e9b5fc322cb6c83())) {
        if (isdefined(params.player.var_f9faff3d5230e3ce)) {
            return;
        }
    }
    var_78e49555d76726c1 = function_b200e7001502a482(params.player);
    if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
        if (function_3e9b5fc322cb6c83()) {
            namespace_af93597583d94051::function_42a3e6a8375b53dc(params.player, 1, "s1");
        } else {
            params.player.var_f9faff3d5230e3ce = var_78e49555d76726c1;
            foreach (interact in var_78e49555d76726c1) {
                interact enablescriptableplayeruse(params.player);
            }
        }
        return;
    }
    level thread function_1383a22b72211d91(params.player);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x20ba
// Size: 0x3b1
function private function_1383a22b72211d91(player) {
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    s_gate = level.var_1fb16fc647c8b98b;
    if (!isdefined(s_gate.var_39cfa415b2be8156)) {
        return;
    }
    foreach (squadmember in a_squad) {
        squadmember.var_f9faff3d5230e3ce = [];
        if (getdvarint(@"hash_7eaab0cafd4a5e85", 0)) {
            thread function_fdb378f67f901e05(s_gate, squadmember);
        }
    }
    level.var_baa6971238a67105 = default_to(level.var_baa6971238a67105, 0);
    level.var_c75d3185077f2f0f = default_to(level.var_c75d3185077f2f0f, 0);
    var_56f5775724510587 = [];
    foreach (s_pedestal in s_gate.var_39cfa415b2be8156) {
        var_a3a5c8e4541d079f = anglestoforward(s_pedestal.angles) * -8;
        v_offset = anglestoup(s_pedestal.angles) * (16 + level.var_c75d3185077f2f0f) + anglestoforward(s_pedestal.angles) * level.var_baa6971238a67105;
        v_spawn = s_pedestal.origin + v_offset + var_a3a5c8e4541d079f;
        var_8986997b27e850da = spawnscriptable("ob_jup_rift_gate_pedestal_container", v_spawn);
        var_8986997b27e850da.s_pedestal = s_pedestal;
        var_8986997b27e850da.s_gate = s_gate;
        var_8986997b27e850da.noweaponslot = 1;
        var_8986997b27e850da.var_532eac3c428e5b9b = 1;
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("rift_gate_pedestal_container", &function_cf1b1f86951a9209);
        var_8986997b27e850da.var_55bb3585d29af1be = &function_359904b2a0fb09ed;
        var_8986997b27e850da callback::add("on_cache_closed", &function_4986d8866a8ff66f);
        var_8986997b27e850da.var_6978a4b328fd33b3 = &function_652b184a9e197fea;
        var_8986997b27e850da.containertype = 19;
        foreach (var_cd1b2eae3618a04d in level.players) {
            var_8986997b27e850da disablescriptableplayeruse(var_cd1b2eae3618a04d);
        }
        var_8986997b27e850da setscriptablepartstate("rift_gate_pedestal_container", "closed_usable");
        foreach (squadmember in a_squad) {
            if (!istrue(function_3e9b5fc322cb6c83())) {
                squadmember.var_f9faff3d5230e3ce = function_6d6af8144a5131f1(squadmember.var_f9faff3d5230e3ce, var_8986997b27e850da);
            }
            var_8986997b27e850da enablescriptableplayeruse(squadmember);
            namespace_af93597583d94051::function_ae472ac4d2ad5228(squadmember, var_8986997b27e850da, "s1");
        }
        var_56f5775724510587[var_56f5775724510587.size] = var_8986997b27e850da;
        level.var_f9faff3d5230e3ce = function_6d6af8144a5131f1(level.var_f9faff3d5230e3ce, var_8986997b27e850da);
    }
    if (function_3e9b5fc322cb6c83()) {
        if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
            namespace_9bb409deb69fb31d::function_a20a10ce593f692b(player.team, player.sessionsquadid, "UnlockQuestPedestalsS1", var_56f5775724510587);
        }
    }
    level.var_baa6971238a67105++;
    level.var_c75d3185077f2f0f++;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2473
// Size: 0x13
function function_359904b2a0fb09ed(instance, player) {
    
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x248e
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2526
// Size: 0x17e
function function_ad319ef1312a4f2e(s_gate) {
    level endon("game_ended");
    old_players = [];
    var_70d983a2559807d6 = 0;
    while (true) {
        a_players = getplayersinradius(s_gate.origin, 800, 800);
        foreach (player in a_players) {
            if (!istrue(function_8442cf03b10a3296(player))) {
                if (var_70d983a2559807d6 + 1 < gettime()) {
                    player earthquakeforplayer(0.15, 1, s_gate.origin, 800);
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26ac
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
            case #"hash_f7a6ad55f66e4e1e":
                function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season1_electric_attuned", 1);
                break;
            case #"hash_ceb098150f024a39":
                function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season1_fire_attuned", 1);
                break;
            case #"hash_47276d6c2f4cfd60":
                function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season1_ice_attuned", 1);
                break;
            case #"hash_6fe0d38b135245cc":
                function_9426e2a8c6789b97(player, spawnpos, "ob_jup_item_key_rift_gate_season1_toxic_attuned", 1);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2818
// Size: 0xe7
function function_9426e2a8c6789b97(player, var_f877158dac9d9e99, itembundlename, isdebug) {
    itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
    payload = [#"teamselect", player getentitynumber()];
    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
    item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, var_f877158dac9d9e99, undefined, 0, 1, payload);
    if (isdefined(item) && !istrue(isdebug)) {
        params = spawnstruct();
        params.item = item;
        params.itembundlename = itembundlename;
        params.payload = payload;
        if (isdefined(level.var_8b939fbe0ef2d56b)) {
            player [[ level.var_8b939fbe0ef2d56b ]](params);
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2907
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
        level.var_4edc95894f8a7541 = getplayersinradius(s_gate.origin, 1200, 1200);
        /#
            if (getdvarint(@"hash_8fff0e33192f133e", 0)) {
                thread scripts\cp_mp\utility\debug_utility::drawcylinder(s_gate.origin, 1200, 1050, 0.5, (0, 1, 0));
            }
        #/
        foreach (player in level.var_4edc95894f8a7541) {
            if (!array_contains(old_players, player)) {
                if (getdvarint(@"hash_dd416fb0b3f6d71f", 1)) {
                    var_3a9e259605bd2fd9 function_af96f7c8819ae854(player, 1200);
                    var_1446c6e912a6d70a function_af96f7c8819ae854(player, 1200);
                }
                if (istrue(function_8442cf03b10a3296(player))) {
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
                    if (function_3e9b5fc322cb6c83() && !namespace_af93597583d94051::function_d71a760b0589b81d(player.team, player.sessionsquadid, "s1")) {
                        namespace_af93597583d94051::function_42a3e6a8375b53dc(player, "s1");
                    }
                    continue;
                }
                if (namespace_af93597583d94051::function_f0ae0bcc1d1be67c(player, "s1") && !namespace_af93597583d94051::function_d71a760b0589b81d(player.team, player.sessionsquadid, "s1")) {
                    params = spawnstruct();
                    params.player = player;
                    level callback::callback("spawn_s1_rift_pedestal_containers", params);
                }
            }
        }
        foreach (old_player in old_players) {
            var_ae894028b993ed0b = undefined;
            if (isdefined(old_player) && !array_contains(level.var_4edc95894f8a7541, old_player)) {
                old_player thread function_bcd7ba129ebfbfb0(s_gate);
                old_player function_bab9acc2cf205a62();
                var_78e49555d76726c1 = function_222b578c46e71445(old_player);
                if (isdefined(var_78e49555d76726c1) && var_78e49555d76726c1.size > 0) {
                    a_squad = player namespace_ca7b90256548aa40::getsquadmembers();
                    foreach (squaddie in a_squad) {
                        if (utility::array_contains(level.var_4edc95894f8a7541, squaddie)) {
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
        old_players = level.var_4edc95894f8a7541;
        wait 0.5;
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2e
// Size: 0x14d
function function_f6e92750f5fa5c30(s_gate) {
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self notify("proximity_visuals_s1");
        self endon("proximity_visuals_s1");
        while (namespace_af93597583d94051::function_1184fa6d41336bdc(self, "s1")) {
            wait 0.2;
        }
        if (!isdefined(self.var_a20bb623ab5f6211)) {
            namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s1");
        }
        self.var_cecf6e02785a794e = 1;
    } else {
        while (istrue(self.var_ef36152f8d3d0f78)) {
            wait 0.2;
        }
        self.var_ef36152f8d3d0f78 = 1;
    }
    s_gate.mdl_vortex hidefromplayer(self);
    if (isdefined(self.var_a20bb623ab5f6211)) {
        self playsoundtoplayer("evt_rr_gate_reshape", self, self.var_a20bb623ab5f6211);
    }
    wait 0.5;
    if (isdefined(self.var_a20bb623ab5f6211)) {
        self.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "reveal_in");
        if (istrue(self.var_7c4a2519f7b89e16)) {
            function_46df852b6f79b0ee([self], 1, 1, 0);
        } else if (istrue(self.var_9b65365d9058829d)) {
            function_46df852b6f79b0ee([self], 0, 1, 0);
        }
    }
    wait 2;
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_cecf6e02785a794e = undefined;
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e83
// Size: 0x16b
function function_bcd7ba129ebfbfb0(s_gate) {
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self notify("distant_visuals_s1");
        self endon("distant_visuals_s1");
        while (namespace_af93597583d94051::function_670ac099eac79d1b(self, "s1")) {
            wait 0.25;
        }
        self.var_af2642b8f27638f8 = 1;
    } else {
        while (istrue(self.var_ef36152f8d3d0f78)) {
            wait 0.25;
        }
        self.var_ef36152f8d3d0f78 = 1;
    }
    s_gate.mdl_vortex showtoplayer(self);
    if (istrue(function_8442cf03b10a3296(self))) {
        if (isdefined(self.var_a20bb623ab5f6211)) {
            self playsoundtoplayer("evt_rr_gate_dissolve", self, self.var_a20bb623ab5f6211);
        }
    }
    wait 0.5;
    if (isdefined(self.var_a20bb623ab5f6211)) {
        self.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "reveal_out");
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
        if (isdefined(self.var_a20bb623ab5f6211)) {
            namespace_af93597583d94051::function_96b2f0429cd884b5(self, "s1");
        }
        self.var_af2642b8f27638f8 = undefined;
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ff6
// Size: 0x1fc
function function_e51836f1240c2b7a(s_gate) {
    if (getdvarint(@"hash_f61e57169d1515d4", 0)) {
        if (s_gate.targetname != "s1_rift_gate") {
            println("<dev string:x4f>");
            return;
        }
    }
    self endon("death_or_disconnect");
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_a13ef67ff2b6a0c7 = 1;
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
    if (!isdefined(self.var_a20bb623ab5f6211)) {
        namespace_af93597583d94051::function_5cdb4ce28191f853(self, s_gate, "s1");
        self.var_a20bb623ab5f6211 hide();
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "active");
    }
    wait 6.5;
    if (isdefined(self.var_a20bb623ab5f6211)) {
        self.var_a20bb623ab5f6211 showonlytoplayer(self);
        self.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "appear_instantly");
    }
    if (isdefined(s_gate.var_38b605adf8e926c8)) {
        s_gate.var_38b605adf8e926c8 setscriptablepartstate("formation_vfx", "off");
    }
    self setclientomnvar("ob_rift_gate_formation", 0);
    if (namespace_af93597583d94051::function_50ab9eb71c85b240()) {
        self.var_a13ef67ff2b6a0c7 = undefined;
    }
    self.var_ef36152f8d3d0f78 = undefined;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31fa
// Size: 0x14d
function function_1df61ac1719b72b8(s_gate, var_6a6601f4d2fb4a0a) {
    foreach (s_prompt in s_gate.var_a489feecfa0a74) {
        s_prompt.interact = spawnscriptable("ob_jup_rift_gate_interact", s_prompt.origin, s_prompt.angles);
        s_prompt.interact setscriptablepartstate("interact", "usable");
        namespace_5775ad2badedbcaa::function_32645103f7520635(s_prompt.interact, var_6a6601f4d2fb4a0a);
        s_prompt.interact.s_gate = s_gate;
        s_prompt.interact.script_label = s_prompt.script_label;
        s_prompt.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_19897beec827855e);
        s_gate.var_d1e2ce25ea15c51d = [];
        s_prompt.interact.var_8d4002c21d2cac70 = &function_46df852b6f79b0ee;
        s_prompt.interact.var_b83ca58b862b27e9 = &function_b83ca58b862b27e9;
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x334f
// Size: 0x6b
function function_19897beec827855e(interact, player) {
    if (namespace_af93597583d94051::function_7b936b2474aa34c2(interact, player, "s1")) {
        var_bc65b6ae439a23ea = namespace_af93597583d94051::function_2911a407cdc7858(interact, player, "s1");
        if (isdefined(var_bc65b6ae439a23ea)) {
            return var_bc65b6ae439a23ea;
        }
    }
    player.var_9c6168187b815669 = undefined;
    return {#string:%, #type:"HINT_NOBUTTON"};
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33c3
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3473
// Size: 0x66d
function function_a7a66cb92f56ae54(s_gate, a_squad, player) {
    level endon("game_ended");
    e_sound = namespace_4164bc931714b00b::spawn_script_model(s_gate, "tag_origin", 0, 0);
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
        level.squaddata[teamid][squadid].properties["UnlockQuestPedestalsCompleteS1"] = 1;
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
            foreach (squaddie in a_squad) {
                playfxontagforclients(level._effect["rift_pedestal_active_" + s_pedestal.targetname], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
            }
        }
    }
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_gate_formation", a_squad, 0.75);
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
            squaddie.var_f9faff3d5230e3ce = undefined;
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
            foreach (squaddie in a_squad) {
                if (isdefined(squaddie)) {
                    stopfxontagforclients(level._effect["rift_pedestal_active_" + s_pedestal.targetname], s_pedestal.mdl_pedestal_on, "tag_origin", squaddie);
                }
            }
        }
    }
    foreach (interact in var_78e49555d76726c1) {
        if (isdefined(interact)) {
            namespace_af93597583d94051::function_2ba47d2b2d7cadf3(interact);
            level.var_f9faff3d5230e3ce = array_remove(level.var_f9faff3d5230e3ce, interact);
        }
    }
    s_gate.var_6188ee921621bc1 = undefined;
    if (issubstr(s_gate.targetname, "s1")) {
        utility::flag_waitopen("s1_gate_battle_active");
        function_2256e0d4bc38c360(s_gate, a_squad);
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3ae8
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
    scriptable = level.var_1fb16fc647c8b98b.var_38b605adf8e926c8;
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
            if (isdefined(player.var_a20bb623ab5f6211)) {
                player playsoundtoplayer("evt_rr_gate_player_activate", player, player.var_a20bb623ab5f6211);
                if (var_af0f0d4f82488cd9) {
                    player.var_a20bb623ab5f6211 setmodel(str_model);
                    if (array_contains(level.var_4edc95894f8a7541, player)) {
                        player.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "appear_instantly");
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
        if (isdefined(player.var_a20bb623ab5f6211)) {
            player playsoundtoplayer("evt_rr_gate_portal_end", player, player.var_a20bb623ab5f6211);
            if (var_af0f0d4f82488cd9) {
                player.var_a20bb623ab5f6211 setmodel("jup_zm_rift_gate");
                if (array_contains(level.var_4edc95894f8a7541, player)) {
                    player.var_a20bb623ab5f6211 setscriptablepartstate("reveal", "appear_instantly");
                }
            }
        }
        if (isdefined(var_65b90d4bc595041b)) {
            var_65b90d4bc595041b setmodel("jup_zm_rift_gate");
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3dab
// Size: 0x261
function function_b83ca58b862b27e9(a_squad, var_f0467a62f52ac9d6) {
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
        playlistid = 1005;
    } else {
        playlistid = 1006;
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4014
// Size: 0x7a
function function_9075c9a5985b8ac0(player) {
    if (istrue(function_8442cf03b10a3296(player)) || player namespace_9571f642f38c8169::function_3bb8b73991355a1(1) || getdvarint(@"hash_1242ad79d6cc8585", 0) == 1) {
        player.var_f618a05d316a2fd6 = 1;
        player setclientomnvar("s1_rift_gate_drops_enabled", 0);
        return;
    }
    if (getdvarint(@"hash_abc1d9ea495ec189", 0) == 1) {
        player setclientomnvar("s1_rift_gate_drops_enabled", 1);
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4096
// Size: 0x4d8
function private function_4986d8866a8ff66f(params) {
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
        namespace_af93597583d94051::function_fb77e77aa1cd3508(var_5f598218fed720bd, player, "s1");
        if (istrue(self.var_f8431b01820e31a8) && function_edbd89f85d943b54(self.s_gate, a_squad, player)) {
            level thread function_a7a66cb92f56ae54(self.s_gate, a_squad, player);
            foreach (squaddie in a_squad) {
                if (isdefined(squaddie) && isalive(squaddie)) {
                    squaddie zombie_challenges::function_f10f600ac4ee4c09("s1_rift_gate_unlock", 2);
                    squaddie.var_f618a05d316a2fd6 = 1;
                    function_9075c9a5985b8ac0(squaddie);
                }
            }
        }
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4576
// Size: 0xb
function private function_9aca5526e0157e01(str_item_name) {
    
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4589
// Size: 0x9f
function private function_69ce7040cf0dea2d(str_item_name, var_cfd12438a6b9f610) {
    var_705b48909b86734c = ["toxic_attuned", "electric_attuned", "fire_attuned", "ice_attuned"];
    foreach (str_element in var_705b48909b86734c) {
        if (issubstr(str_item_name, str_element) && issubstr(str_element, var_cfd12438a6b9f610)) {
            return true;
        }
    }
    return false;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4631
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x46e4
// Size: 0x27
function private function_8442cf03b10a3296(player) {
    if (isdefined(player.var_f618a05d316a2fd6)) {
        return player.var_f618a05d316a2fd6;
    }
    return 0;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4714
// Size: 0x30
function private function_4f2ca4a6d9d60f81(player) {
    if (player namespace_9571f642f38c8169::function_3bb8b73991355a1(0) || getdvarint(@"hash_3b2a312a55f42bcd", 0) == 1) {
        return true;
    }
    return false;
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x474d
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x483d
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x48b6
// Size: 0x36
function private function_977fba46aefad325(player) {
    tokenid = player.var_9c6168187b815669;
    if (isdefined(tokenid)) {
        thread namespace_af93597583d94051::function_f1db902e3af4f3c(tokenid, player, "s1");
    }
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x48f4
// Size: 0x1f2
function private function_2256e0d4bc38c360(s_gate, a_squad) {
    utility::flag_set("s1_gate_battle_active");
    wait 2.5;
    function_46df852b6f79b0ee(a_squad, 1);
    v_spawn = getclosestpointonnavmesh(s_gate.s_encounter.origin);
    wait 6;
    var_31109020393ed11b = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_sharedfunc("zombie_abom_mega_hvt")[0];
    var_683f14b23771a4ff = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_31109020393ed11b, v_spawn, s_gate.s_encounter.angles, "team_two_hundred");
    var_683f14b23771a4ff thread function_35e8a48dc2442eb2(a_squad, s_gate.s_reward.origin);
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_megabom_spawn", a_squad, 1);
    wait 2.5;
    encounterid = namespace_614554f86e52695c::spawn_request("ai_flood_fill_encounter:enc_ob_rift_gate_flood", s_gate.s_encounter.origin, 350, 1, 1, 0);
    level thread function_7da3c5c759a69cf3();
    var_683f14b23771a4ff thread function_4c7d81204b9467a8(s_gate);
    var_683f14b23771a4ff waittill("death");
    namespace_614554f86e52695c::function_9950e6e485bf5261(encounterid);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_1", 0);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_2", 0);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_3", 0);
    wait 1;
    utility::flag_clear("s1_gate_battle_active");
    function_46df852b6f79b0ee(a_squad, 1, 0);
    wait 1;
    reward_groups = [];
    foreach (player in a_squad) {
        reward_groups[reward_groups.size] = [player];
    }
    thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_megabom_kill", a_squad, 2.5);
    namespace_e8853d3344e33cf6::function_863be9e39e19fe2f(reward_groups, s_gate.s_reward, &function_90db22df3aa5cf66);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4aee
// Size: 0x44
function private function_4c7d81204b9467a8(s_gate) {
    self endon("death");
    while (distancesquared(self.origin, s_gate.origin) < squared(2000)) {
        wait 1;
    }
    self kill();
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4b3a
// Size: 0x6a
function private function_7da3c5c759a69cf3() {
    level endon("s1_gate_battle_active");
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_1", 1);
    wait 10;
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_1", 0);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_2", 1);
    wait 20;
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_2", 0);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_3", 1);
    wait 30;
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_3", 0);
    function_9b8829ab4092a7d7("ob_rift_gate_reinforcements_2", 1);
}

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4bac
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

// Namespace ob_rift_gate / namespace_618dd2e6238edda3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c8a
// Size: 0x47
function private function_90db22df3aa5cf66(params) {
    low_token = spawnstruct();
    low_token.lootid = namespace_2abc885019e1956::function_2c836ad05e5f634c("jup_rift_gate_key_token_low");
    low_token.quantity = 1;
    return [low_token];
}

