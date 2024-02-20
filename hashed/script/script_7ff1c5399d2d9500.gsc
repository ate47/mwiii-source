// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_43971bbeefd98f05;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\scriptable.gsc;
#using script_4c770a9a4ad7659c;
#using script_2ff6eb4f5b8663fb;
#using script_6df6604a74a7a9c7;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_16ea1b94f0f381b3;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\trace.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\vehicle.gsc;
#using script_9880b9dc28bc25e;
#using script_2d400da2610fe542;
#using script_22f1701e151b9d12;
#using script_58be75c518bf0d40;
#using script_7cfaa6fd841fb4dd;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\mp_agent.gsc;
#using script_7534b1d3ac3ea47a;
#using script_443d99fe707f1d9f;
#using script_7b2517368c79e5bc;
#using script_4f7c27d4fef4bc09;
#using scripts\engine\math.gsc;
#using scripts\common\vehicle_paths.gsc;

#namespace namespace_945da193e84ea7bb;

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2f
// Size: 0xce
function init() {
    wait(5);
    level.var_5c034827af8b8b9b = spawnstruct();
    level._effect["vfx_zb_sos_body_exp_f"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_escort_laser_ch.vfx");
    level._effect["vfx_zai_blood_annihilate_exp"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_blood_annihilate_exp.vfx");
    level._effect["vfx_megabomb_raz_dest_weak_point_exp_blood_ch_1"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_megabomb_raz_dest_weak_point_exp_blood_ch_1.vfx");
    level.var_5c034827af8b8b9b function_d248cfa981edc561();
    level.var_5c034827af8b8b9b thread function_a35cf12bd47f74d0();
    level.var_5c034827af8b8b9b thread function_f5041efcb5c830e0();
    level.var_5c034827af8b8b9b thread function_50eaf1d6526a26c3();
    level.var_5c034827af8b8b9b thread function_ed2e505118e05ca4();
    level.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe = [];
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb04
// Size: 0x376
function function_d248cfa981edc561() {
    self.var_f45e9dd33c0e0a2a = getstruct("vault_panic_room_center", "targetname");
    if (!isdefined(self.var_f45e9dd33c0e0a2a)) {
        /#
            println("evt_ob_vault_chess_piece_falls");
        #/
        return;
    }
    self.var_5277d508414310ec = 0;
    self.var_50e383364d5e0d02 = getentitylessscriptablearray("ob_ivory_terminal", "targetname")[0];
    self.var_78d32439fe570df0 = getentitylessscriptablearray("ob_ivory_game", "script_noteworthy");
    self.var_caa14caa182b4e1 = getentitylessscriptablearray("ob_ivory_light", "script_noteworthy");
    self.var_9914d3b88d3af227 = getentitylessscriptablearray("ob_ivory_blocker", "targetname");
    foreach (scriptable in self.var_78d32439fe570df0) {
        scriptable setscriptablepartstate("model", "visible");
    }
    foreach (blocker in self.var_9914d3b88d3af227) {
        blocker setscriptablepartstate("state", "visible");
    }
    foreach (light in self.var_caa14caa182b4e1) {
        light setscriptablepartstate("model", "visible");
    }
    if (isdefined(self.var_50e383364d5e0d02)) {
        self.var_50e383364d5e0d02 setscriptablepartstate("model", "visible");
    }
    var_fdac662e687fe18d = self.var_f45e9dd33c0e0a2a function_954eb52ab4cdeb46("s_vault_door", "targetname");
    var_aee2168ef9296c2b = self.var_f45e9dd33c0e0a2a function_954eb52ab4cdeb46("s_vault_cache", "targetname");
    self.vault_doors = [];
    var_aee2168ef9296c2b = array_randomize(var_aee2168ef9296c2b);
    foreach (s_door in var_fdac662e687fe18d) {
        self.vault_doors = namespace_f6368c72597c6d90::function_ad1b6accbaab404e(s_door, self.vault_doors, "vault", 1);
    }
    for (i = 0; i < var_aee2168ef9296c2b.size; i++) {
        var_7275f76481b5353f = var_aee2168ef9296c2b[i];
        if (i == 0) {
            thread function_e1544d723150bc92(var_7275f76481b5353f, 3);
        } else if (i == 1) {
            thread function_e1544d723150bc92(var_7275f76481b5353f, 1);
        } else {
            thread function_e1544d723150bc92(var_7275f76481b5353f, 2);
        }
    }
    foreach (door in self.vault_doors) {
        if (istrue(door.var_3d9512b73bdc1514)) {
            door scriptabledoorfreeze(1);
        } else {
            namespace_f6368c72597c6d90::function_fbbfe6f05eda5eb1(door);
        }
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe81
// Size: 0x7e
function function_b6f48b1b3dcc129b(instance, player) {
    instance setscriptablepartstate("body", "hidden");
    var_ee29db2c510a0a0a = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_SharedFunc("zombie_mimic_hvt");
    var_8034a1f2faf000f1 = namespace_53fc9ddbb516e6e1::spawnNewAIType_SharedFunc(var_ee29db2c510a0a0a[0], instance.origin, instance.angles, "team_two_hundred");
    var_8034a1f2faf000f1 waittill("death");
    function_d8e0882d86531309("k");
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf06
// Size: 0x56
function function_d8e0882d86531309(var_fd20834b59a233a2) {
    var_d9010fc83650b43e = getentitylessscriptablearray("ob_ivory_" + var_fd20834b59a233a2, "targetname")[0];
    if (isdefined(var_d9010fc83650b43e)) {
        var_d9010fc83650b43e setscriptablepartstate("orientation", "toppled");
        playsoundatpos(var_d9010fc83650b43e.origin, "evt_ob_vault_chess_piece_falls");
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf63
// Size: 0x167
function function_a35cf12bd47f74d0() {
    loc = getstruct("vault_bishop_encounter", "targetname");
    if (!isdefined(loc)) {
        /#
            println("damage_heavy");
        #/
        return;
    }
    var_3cfd601891a152ff = getstructarray(loc.target, "targetname");
    function_606642b946a01237("bishop_encounter", loc.origin, 1000, 1);
    while (function_7c093aaec980131b(loc.origin) < 0.85) {
        wait(1);
    }
    foreach (smoke in var_3cfd601891a152ff) {
        var_f5e8adcec5f0a46d = magicgrenademanual("smoke_grenade_mp", smoke.origin, (0, 0, -10), 0);
        thread play_sound_in_space("smoke_grenade_expl_trans", var_f5e8adcec5f0a46d.origin);
    }
    requestid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:enc_vault_bishop", loc.origin, loc.radius, 1, 1, 0);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(requestid, &function_145c21969dc1144d, self);
    function_adcc96a7d541aa36(requestid, 0);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d1
// Size: 0x108
function function_145c21969dc1144d(requestid, instance, agent, data) {
    if (agent.agent_type == "actor_jup_ob_enemy_specialist_bishop") {
        agent.var_7e4b076a06c6df27 = 1;
        agent.var_7aebd48da5b12133 = randomfloatrange(250, 299);
        agent.var_f714dcba7a0b7168 = randomfloatrange(200, 250);
        agent namespace_c77c96f1aa8fcce1::function_5213d881f2e26966(agent.origin, 1000);
        attacker = agent waittill("death");
        var_c9b69aecc5c631ed = attacker namespace_ca7b90256548aa40::getSquadMembers();
        self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe = array_combine_unique(self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe, var_c9b69aecc5c631ed);
        agent function_3ecabd59662c63e4("b");
        agent thread function_9749f093b0e831ec("ob_jup_item_weapon_pi_decho" + "_blue");
        function_c7311cb3f768f21e("bishop_encounter", 40);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11e0
// Size: 0x28
function private function_e4314d1dd59383d5() {
    self endon("death");
    while (1) {
        wait(6);
        attacker = self waittill("damage");
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120f
// Size: 0x26d
function function_f5041efcb5c830e0() {
    loc = getstruct("vault_rook_encounter", "targetname");
    if (!isdefined(loc)) {
        /#
            println("usable");
        #/
        return;
    }
    self.var_fddd4165e203ecbf = getstruct(loc.target, "targetname");
    self.var_f19cd60f8bc4cc97 = getstruct("rook_trigger_location", "targetname");
    requestid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:enc_vault_rook", loc.origin, loc.radius, 1, 1, 0);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(requestid, &function_213b8f238df26b55, self);
    function_adcc96a7d541aa36(requestid, 0);
    data = function_9a39e23c3c52c2af(requestid);
    if (!isdefined(data) || !isdefined(data.ai)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    while (data.ai.size <= 0) {
        data = function_9a39e23c3c52c2af(requestid);
        waitframe();
    }
    var_e2c8cdc592751534 = data.ai[0];
    var_f32357b4f622db32 = getstructarray("vault_rook_sentry", "targetname");
    foreach (struct in var_f32357b4f622db32) {
        namespace_64135de19550f047::function_586d4d82f07e0d09(struct);
    }
    var_5ef3badcbe1b5057 = getstructarray("vault_rook_mine", "targetname");
    foreach (struct in var_5ef3badcbe1b5057) {
        namespace_64135de19550f047::function_908ec13fb4d6cede(struct.origin, struct.targetname, var_e2c8cdc592751534, 100);
    }
    loc2 = getstruct("vault_rook_zombies_encounter", "targetname");
    var_a4d0ab6d312a821f = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_flood_fill_encounter:enc_vault_rook_flood_zombies", loc2.origin, loc2.radius, 1, 1, 0);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_a4d0ab6d312a821f, &function_b125915248d5d6f8, self);
    namespace_614554f86e52695c::function_73147cdf5c28d10c(var_a4d0ab6d312a821f, &function_71515921947dd954, var_e2c8cdc592751534);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x35
function function_71515921947dd954(requestid, data) {
    if (isalive(data) || isplayer(data.target)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c0
// Size: 0x41
function function_b125915248d5d6f8(requestid, instance, agent, data) {
    waitframe();
    agent.dontattackme = 0;
    agent.attackeraccuracy = 1000;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1508
// Size: 0x10f
function function_213b8f238df26b55(requestid, instance, agent, data) {
    agent function_9f94dc92da1665ff(instance);
    agent.var_7e4b076a06c6df27 = 1;
    agent.ignoreme = 1;
    agent.accuracy = 1;
    agent.forcesuppressai = 1;
    agent.var_51642e27c7e7d224 = 0;
    agent function_65cdab0fc78aba8f(agent.origin, 5000);
    agent setgoalpos(agent.origin, 126);
    attacker = agent waittill("death");
    var_c9b69aecc5c631ed = attacker namespace_ca7b90256548aa40::getSquadMembers();
    self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe = array_combine_unique(self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe, var_c9b69aecc5c631ed);
    agent function_3ecabd59662c63e4("r");
    agent thread function_9749f093b0e831ec("ob_jup_item_weapon_sn_boscar" + "_blue");
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x161e
// Size: 0x2e
function private function_9f94dc92da1665ff(manager) {
    self endon("death");
    childthread function_65fc225c8178ed55(manager);
    childthread function_88a0090ded17ffd5(manager);
    childthread function_d4ea6e47247325c7(manager);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1653
// Size: 0xb5
function private function_88a0090ded17ffd5(manager) {
    self endon("ROOK_GOAL_UPDATE_NOTIFY");
    while (1) {
        attacker = amount = self waittill("damage");
        if (self.helmethealth <= 0 || self.armorhealth <= 20) {
            self setgoalpos(manager.var_fddd4165e203ecbf.origin, 20);
            /#
                if (getdvarint(@"hash_4595c5559a093ea6", 0)) {
                    iprintlnbold("<unknown string>");
                    thread function_a913a37e48f4f7ae(manager.var_fddd4165e203ecbf.origin, 20);
                }
            #/
            return;
        }
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x170f
// Size: 0x5d
function private function_65fc225c8178ed55(manager) {
    while (1) {
        attacker = amount = self waittill("damage");
        if (!issentient(attacker)) {
            continue;
        }
        self agentsetfavoriteenemy(attacker);
        self setagentattacker(attacker);
        self getenemyinfo(attacker);
        self forcethreatupdate();
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1773
// Size: 0xd8
function private function_d4ea6e47247325c7(manager) {
    var_bdfbd0e95b4ce3f6 = function_f9ce4ee3950dd8cf(manager.var_f19cd60f8bc4cc97.origin, manager.var_f19cd60f8bc4cc97.angles, 600, 250, 50);
    while (1) {
        data = var_bdfbd0e95b4ce3f6 waittill("trigger");
        if (isplayer(data)) {
            self setgoalpos(manager.var_fddd4165e203ecbf.origin, 150);
            self notify("ROOK_GOAL_UPDATE_NOTIFY");
            /#
                if (getdvarint(@"hash_4595c5559a093ea6", 0)) {
                    iprintlnbold("<unknown string>");
                    thread function_a913a37e48f4f7ae(manager.var_fddd4165e203ecbf.origin, 150);
                }
            #/
            return;
        }
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1852
// Size: 0x7e
function private function_f9ce4ee3950dd8cf(location, angles, length, width, height) {
    size = (length, width, height);
    trigger_box = spawn("trigger_box", location, 0, size, size + (1, 1, 1));
    trigger_box.angles = angles;
    /#
        thread function_4ee7b39c84cb18ab(trigger_box, size);
    #/
    return trigger_box;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x18d8
// Size: 0x62
function private function_4ee7b39c84cb18ab(trigger_box, size) {
    /#
        while (isdefined(trigger_box)) {
            if (getdvarint(@"hash_4595c5559a093ea6", 0)) {
                orientedbox(trigger_box.origin, size * 2, trigger_box.angles, (0, 0, 1), 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1941
// Size: 0x91
function function_a913a37e48f4f7ae(v_goal, n_goal_radius) {
    /#
        self endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            thread draw_ent_axis((1, 0, 0), 10, 30);
            sphere(v_goal, n_goal_radius, (1, 0, 0), undefined, 1);
            thread draw_line_for_time(self.origin, v_goal, 1, 0, 0, 0.1);
            wait(0.1);
        }
    #/
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d9
// Size: 0xcb
function function_50eaf1d6526a26c3() {
    var_1a65e2c434cfab4e = getstruct("s_vault_pawn_center", "targetname");
    if (!isdefined(var_1a65e2c434cfab4e)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    var_997da3edd0c2b7b3 = var_1a65e2c434cfab4e function_98edf48d14333f3f("s_vault_pawn_phone", "targetname");
    var_6ea45e0941843624 = var_1a65e2c434cfab4e function_954eb52ab4cdeb46("s_vault_cache", "targetname");
    foreach (var_7275f76481b5353f in var_6ea45e0941843624) {
        thread function_e1544d723150bc92(var_7275f76481b5353f, 0);
    }
    var_997da3edd0c2b7b3 function_3ecabd59662c63e4("p", &function_a8e25edd9bd5d91);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aab
// Size: 0xdf
function private function_a8e25edd9bd5d91(var_5e789651655404a4, player) {
    var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getSquadMembers();
    level.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe = array_combine_unique(level.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe, var_c9b69aecc5c631ed);
    s_vault_pawn_encounter = getstruct("s_vault_pawn_encounter", "targetname");
    if (isdefined(s_vault_pawn_encounter)) {
        earthquake(0.25, 1.25, var_5e789651655404a4.origin, s_vault_pawn_encounter.radius);
        var_a4d0ab6d312a821f = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:enc_vault_pawn_zombies", s_vault_pawn_encounter.origin, s_vault_pawn_encounter.radius, 1, 0);
        namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_a4d0ab6d312a821f, &function_5a686d590d9806d3, level.var_5c034827af8b8b9b);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b91
// Size: 0x39
function function_5a686d590d9806d3(requestid, instance, agent, data) {
    agent function_65cdab0fc78aba8f(agent.origin, 800);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd1
// Size: 0x14a
function function_ed2e505118e05ca4() {
    var_80c68f3960aac6c4 = getstruct("vault_knight_h_to_e", "targetname");
    if (!isdefined(var_80c68f3960aac6c4)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    spawndata = spawnstruct();
    spawndata.angles = (0, 90, 0);
    spawndata.team = "team_hundred_ninety";
    spawndata.var_f16652e1462a3739 = 1;
    spawndata.var_22aa4aa0cf0aa6bb = 1;
    spawndata.origin = var_80c68f3960aac6c4.origin;
    vehicleRef = "veh9_techo_rebel_armor";
    var_280ab764114c5fb6 = spawnstruct();
    var_280ab764114c5fb6.var_6093c29675253b36 = "enc_vault_knight";
    vehicle = vehicle_spawn(vehicleRef, spawndata);
    vehicle.var_8ee1ce7eccbe27e2 = 0;
    vehicle.var_aa4804cc1bc59e93 = 1;
    vehicle setscriptablepartstate("single", "vehicle_unusable");
    vehicle namespace_4ff41449ab14a3a0::handle_attached_guys();
    function_1dbb97673ec1e0c7(var_280ab764114c5fb6, spawndata.origin, vehicle);
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, "neutral");
    vehicle thread function_5a285e11881bf4c4();
    vehicle function_a2955e32519b544f();
    return vehicle;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d23
// Size: 0x29
function function_a2955e32519b544f() {
    self endon("death");
    self endon("entitydeleted");
    childthread function_b5fc6db21a3000c8();
    childthread function_9f49e74f355beae1();
    thread function_86c0d294557b3f18();
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d53
// Size: 0x83
function private function_1dbb97673ec1e0c7(var_280ab764114c5fb6, origin, vehicle) {
    vehicle.requestid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:" + var_280ab764114c5fb6.var_6093c29675253b36, origin, 128, 1, 1, 0);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(vehicle.requestid, &function_bed20391ba8dcfce, vehicle);
    function_adcc96a7d541aa36(vehicle.requestid, 0);
    function_b0a68315f80cb547(vehicle.requestid, vehicle);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ddd
// Size: 0xe2
function private function_bed20391ba8dcfce(requestid, instance, agent, data) {
    if (agent.agent_type == "actor_jup_ob_enemy_specialist_knight") {
        instance.var_9359753a6347dd67 = agent;
        agent.var_7e4b076a06c6df27 = 1;
        agent.var_534e788bc498be9f.displayname = "JUP_OB_OBJECTIVES/THE_KNIGHT";
        attacker = agent waittill("death");
        var_c9b69aecc5c631ed = attacker namespace_ca7b90256548aa40::getSquadMembers();
        self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe = array_combine_unique(self.var_5c034827af8b8b9b.var_6c29f2fdb0054bbe, var_c9b69aecc5c631ed);
        agent function_3ecabd59662c63e4("h");
        agent thread function_9749f093b0e831ec("ob_jup_item_weapon_lm_foxtrot" + "_blue");
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec6
// Size: 0x65
function function_b5fc6db21a3000c8() {
    while (!isdefined(self.driver) || !isdefined(self.var_9359753a6347dd67)) {
        waitframe();
    }
    msg = waittill_any_ents_return(self.driver, "death", self, "damage_heavy", self.var_9359753a6347dd67, "death");
    self notify("leavepath_unload");
    function_9ca6ea0ca85c0fbf();
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f32
// Size: 0x131
function private function_9f49e74f355beae1() {
    if (!isdefined(self)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    while (self.riders.size != 5) {
        waitframe();
    }
    self vehicle_turnengineon();
    self.var_83407d7413600f7f = 0;
    self.var_365e0ef7b20d47d8 = 0;
    while (isdefined(self) && !self.var_8ee1ce7eccbe27e2) {
        if (function_7c093aaec980131b(self.origin) > 0.5) {
            players = namespace_7e17181d03156026::getplayersinradius(self.origin, 1500);
            if (players.size > 0) {
                function_a2f48e85dd453198(players);
            }
            function_42eb11c189051210(40);
            if (isdefined(self.team) && self.team != "team_hundred_ninety") {
                namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "team_hundred_ninety");
            }
            self.var_cea4023330a76a08 = 1;
            if (self.veh_speed >= 35) {
                function_e3eed47d3d829f6a();
            }
        } else {
            function_42eb11c189051210(26);
            if (isdefined(self.team) && self.team != "neutral") {
                namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
            }
        }
        wait(1);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x206a
// Size: 0x76
function private function_e3eed47d3d829f6a(var_49e1c02ad714708e) {
    if (!isdefined(var_49e1c02ad714708e)) {
        var_49e1c02ad714708e = 6;
    }
    if (isdefined(self) && !self.var_83407d7413600f7f) {
        mine = namespace_64135de19550f047::function_908ec13fb4d6cede(self.origin, undefined, self.driver);
        mine setscriptablepartstate("arm", "active");
        mine thread function_bd3bafa9e60cb7c5(1, self);
        childthread function_c87978976b1e2686("mines", var_49e1c02ad714708e);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20e7
// Size: 0x5b
function private function_42eb11c189051210(var_9c6951b5ecc4c3af, var_3464e6452137cd18) {
    if (!isdefined(var_3464e6452137cd18)) {
        var_3464e6452137cd18 = 30;
    }
    if (!self.var_365e0ef7b20d47d8) {
        self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(var_9c6951b5ecc4c3af));
        self vehicle_setspeedimmediate(0, 1, 1);
        childthread function_c87978976b1e2686("speed", var_3464e6452137cd18);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2149
// Size: 0x76
function private function_c87978976b1e2686(var_a6f0d89171545034, cooldowntime) {
    if (!isdefined(var_a6f0d89171545034) || !isdefined(cooldowntime)) {
        return;
    }
    switch (var_a6f0d89171545034) {
    case #"hash_628ffe6f4a417560":
        self.var_365e0ef7b20d47d8 = 1;
        wait(cooldowntime);
        self.var_365e0ef7b20d47d8 = 0;
        break;
    case #"hash_515260130b210bff":
        self.var_83407d7413600f7f = 1;
        wait(cooldowntime);
        self.var_83407d7413600f7f = 0;
        break;
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c6
// Size: 0x73
function function_a2f48e85dd453198(players) {
    if (isdefined(self.var_9359753a6347dd67)) {
        closestplayer = sortbydistance(players, self.var_9359753a6347dd67.origin)[0];
        self.var_9359753a6347dd67 getenemyinfo(closestplayer);
        self.var_9359753a6347dd67.favoriteenemy = closestplayer;
        self.var_9359753a6347dd67 forcethreatupdate();
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2240
// Size: 0x29
function private function_bd3bafa9e60cb7c5(time, vehicle) {
    self endon("mine_destroyed");
    wait(time);
    if (isdefined(self)) {
        self detonate();
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2270
// Size: 0x5c
function private function_90a3bfcfefc8a07a(player) {
    var_485b74cb677a51a9 = player.origin - self.origin;
    forward = anglestoforward(self.angles);
    angle = namespace_d3f3cb0a543667c1::anglebetweenvectors(var_485b74cb677a51a9, forward);
    return angle < 45;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22d4
// Size: 0x108
function private function_9ca6ea0ca85c0fbf() {
    self function_65aa053c077c003a(1);
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(0));
    self vehicle_setspeedimmediate(0, 1, 1);
    self vehicle_cleardrivingstate();
    self.var_8ee1ce7eccbe27e2 = 1;
    self.var_aa4804cc1bc59e93 = undefined;
    waitframe();
    namespace_b479ac682b93cd92::_vehicle_unload("default");
    self waittill("unloaded");
    self.var_1c8191fe69482997 = 1;
    if (self function_1e8542a707a8002("p2p")) {
        self function_6a325f91941ed47c("p2p");
    }
    if (self function_1e8542a707a8002("path")) {
        self function_6a325f91941ed47c("path");
    }
    if (self function_1e8542a707a8002("animator")) {
        self function_6a325f91941ed47c("animator");
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self, "neutral");
    self setscriptablepartstate("single", "vehicle_use");
    self function_9cab25983e27246();
    self function_65aa053c077c003a(0);
    function_38d372701ae1e2d9(self.requestid);
    thread function_598bba9d433d8d5a(self.requestid);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23e3
// Size: 0x81
function private function_38d372701ae1e2d9(requestid) {
    data = function_9a39e23c3c52c2af(requestid);
    foreach (ai in data.ai) {
        ai function_65cdab0fc78aba8f(ai.origin, 1000);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x246b
// Size: 0x12
function private function_86c0d294557b3f18() {
    self waittill("vehicleStuckNavSpline");
    function_9ca6ea0ca85c0fbf();
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2484
// Size: 0x154
function function_598bba9d433d8d5a(requestid) {
    level endon("game_ended");
    data = function_9a39e23c3c52c2af(requestid);
    data.isnotarget = 0;
    while (data.ai.size != 0 && isdefined(self)) {
        if (function_7c093aaec980131b(self.origin, 0) < 0.8) {
            if (!data.isnotarget) {
                foreach (ai in data.ai) {
                    ai.ignoreme = 1;
                }
                data.isnotarget = 1;
            }
        } else if (data.isnotarget) {
            foreach (ai in data.ai) {
                ai.ignoreme = 0;
            }
            data.isnotarget = 0;
        }
        wait(1);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25df
// Size: 0x252
function private function_5a285e11881bf4c4() {
    self endon("death");
    var_6b962f57738d2659 = 26;
    function_b61f675503083701();
    goalpoint = getstruct("vault_knight_h_to_e", "targetname");
    self vehicle_teleport(goalpoint.origin + (0, 0, 100), goalpoint.angles);
    var_bfe90410fad38aaa = mph_to_ips(var_6b962f57738d2659);
    self function_77320e794d35465a("p2p", "manualSpeed", var_bfe90410fad38aaa);
    thread namespace_3bb9da687f15383d::checkVehicleNavSplineStuck();
    while (isdefined(goalpoint)) {
        self function_77320e794d35465a("p2p", "goalPoint", goalpoint.origin);
        self waittill("near_goal");
        var_6b7545fea47f0739 = goalpoint;
        goalpoint = getstruct(goalpoint.target, "targetname");
        /#
            if (isdefined(level.var_984bc6feaab3cad4)) {
                duration = 5000;
                var_17129dc345d151cf = ips_to_mph(self function_3dda404001a83ee(function_906e53c2fb9d3f9c("<unknown string>", "<unknown string>")));
                goalThreshold = self function_3dda404001a83ee(function_906e53c2fb9d3f9c("<unknown string>", "<unknown string>"));
                sphere(goalpoint.origin, goalThreshold, (1, 1, 0), 0, duration);
                var_8a36adb66b4b027f = getstruct(goalpoint.target, "<unknown string>");
                var_efaa9ab3c88c72d8 = anglestoforward(self.angles);
                var_42b62ae4e3aca4af = goalpoint.origin - self.origin;
                var_3896fef17cab20be = vectordot(var_42b62ae4e3aca4af, var_efaa9ab3c88c72d8);
                color = ter_op(var_3896fef17cab20be > 0, (1, 1, 1), (1, 0, 0));
                line(self.origin, goalpoint.origin, color, 1, 0, duration);
                line(self.origin, self.origin + var_efaa9ab3c88c72d8 * goalThreshold, (1, 1, 0), 1, 0, duration);
            }
        #/
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2838
// Size: 0x1b3
function private function_b61f675503083701(var_b0246e4215beae7f, var_784030f0b32d0f1d) {
    var_b0246e4215beae7f = ter_op(isdefined(var_b0246e4215beae7f), var_b0246e4215beae7f, 0);
    var_784030f0b32d0f1d = ter_op(isdefined(var_784030f0b32d0f1d), var_784030f0b32d0f1d, 0);
    if (!self function_1e8542a707a8002("p2p")) {
        self function_d2e41c7603ba7697("p2p");
    }
    if (var_b0246e4215beae7f) {
        if (!self function_1e8542a707a8002("path")) {
            self function_d2e41c7603ba7697("path");
        }
    }
    if (var_784030f0b32d0f1d) {
        if (!self function_1e8542a707a8002("animator")) {
            self function_d2e41c7603ba7697("animator");
        }
    }
    self function_77320e794d35465a("p2p", "checkStuck", 0);
    self function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    self function_77320e794d35465a("p2p", "automaticNormal", 1);
    self function_77320e794d35465a("p2p", "brakeOnGoalGasbrake", 1);
    self function_77320e794d35465a("p2p", "goalPoint", self.origin);
    self function_77320e794d35465a("p2p", "goalThreshold", 200);
    self function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedThreshold", 1);
    self function_77320e794d35465a("p2p", "automaticFastTopspeedFraction", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 1);
    self function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 4);
    self function_77320e794d35465a("p2p", "throttleSpeedClose", 2);
    self function_77320e794d35465a("p2p", "gasToStopMovement", 0.9);
    self function_77320e794d35465a("p2p", "steeringMultiplier", 2);
    self function_77320e794d35465a("path", "radiusToStep", 300);
    self.stopping = 0;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x29f2
// Size: 0x8c
function private function_a646f25304f0c578(var_7db6235a7408e42f, var_bfe90410fad38aaa) {
    durations = [];
    /#
        assert(var_7db6235a7408e42f.size <= 48);
    #/
    if (var_7db6235a7408e42f.size >= 2) {
        for (index = 0; index < var_7db6235a7408e42f.size - 1; index++) {
            currentpoint = var_7db6235a7408e42f[index];
            nextpoint = var_7db6235a7408e42f[index + 1];
            durations[durations.size] = function_215e10bf17f98702(currentpoint, nextpoint, var_bfe90410fad38aaa);
        }
        durations[durations.size] = durations[durations.size - 1];
    }
    return durations;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a86
// Size: 0x4e
function private function_215e10bf17f98702(startpos, endpos, speed) {
    segmentlength = distance(startpos, endpos);
    var_58824a41b5315792 = segmentlength / speed;
    if (var_58824a41b5315792 < 0.05) {
        var_58824a41b5315792 = 0.05;
    }
    return var_58824a41b5315792;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2adc
// Size: 0x54
function function_6ce516b4bbba4cae() {
    loc = getstruct("vault_king_encounter", "targetname");
    requestid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:enc_vault_king", loc.origin, 90, 1, 1, 0);
    namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(requestid, &function_8e73dcfacecaa96b, self);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b37
// Size: 0x10f
function private function_8e73dcfacecaa96b(requestid, instance, agent, data) {
    agent.nocorpse = 1;
    agent waittill("death");
    var_bdcfdd023b589b9b = spawn_tag_origin(agent.origin + (0, 0, 25), agent.angles);
    thread play_sound_in_space("gib_fullbody", agent.origin);
    playfxontag(getfx("vfx_zb_sos_body_exp_f"), var_bdcfdd023b589b9b, "tag_origin");
    playfxontag(getfx("vfx_zai_blood_annihilate_exp"), var_bdcfdd023b589b9b, "tag_origin");
    wait(0.3);
    playfx(getfx("vfx_megabomb_raz_dest_weak_point_exp_blood_ch_1"), getgroundposition(agent.origin, 1));
    var_8034a1f2faf000f1 = namespace_34f6a6adabfc542d::spawnnewagentaitype("jup_spawner_zombie_mimic", agent.origin, agent.angles, "team_two_hundred");
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4d
// Size: 0x10b
function function_3ecabd59662c63e4(var_b4eb12f662dd36a6, on_use_function) {
    if (var_b4eb12f662dd36a6 == "p") {
        var_5e789651655404a4 = spawnscriptable("ob_vault_transmission_device", self.origin, self.angles);
    } else {
        playsoundatpos(self.origin, "evt_ob_vault_chess_enemy_killed_stinger");
        var_5e789651655404a4 = spawnscriptable("ob_vault_transmission_device", self.origin + (20, 20, 25), (270, 180, 180));
        level.var_5c034827af8b8b9b thread function_8884edbcdf7fafcf(var_5e789651655404a4, 120);
    }
    var_5e789651655404a4 setscriptablepartstate("model", "dropped");
    var_5e789651655404a4 setscriptablepartstate("interact", "usable");
    namespace_29b5250e9959ea::function_3cec1b2981075936("jup_hacking_device_ob", var_5e789651655404a4, &function_e6b0b57c7fd33045, undefined, &function_1dab1047cc916891, 2);
    var_5e789651655404a4.var_c606b11086a2b24b = var_b4eb12f662dd36a6;
    var_5e789651655404a4.var_5c034827af8b8b9b = level.var_5c034827af8b8b9b;
    var_5e789651655404a4.var_a27e02d40b7eeda6 = 0;
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d5f
// Size: 0x3d
function private function_1dab1047cc916891(player) {
    player endon("interaction_complete");
    self setscriptablepartstate("model", "hidden");
    player waittill("cancel");
    self setscriptablepartstate("model", "dropped");
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2da3
// Size: 0x75
function private function_e6b0b57c7fd33045(player) {
    if (self.var_c606b11086a2b24b == "p") {
        function_a8e25edd9bd5d91(self, player);
    }
    self.var_a27e02d40b7eeda6 = 1;
    self.var_5c034827af8b8b9b function_94b78afd5298be48(self.var_c606b11086a2b24b);
    self setscriptablepartstate("model", "hidden");
    self setscriptablepartstate("interact", "unusable");
    self notify("device_used");
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1f
// Size: 0x1d5
function function_94b78afd5298be48(var_c606b11086a2b24b) {
    if (!isdefined(self.var_f45e9dd33c0e0a2a)) {
        /#
            println("evt_ob_vault_chess_piece_falls");
        #/
        return;
    }
    function_d8e0882d86531309(var_c606b11086a2b24b);
    self.var_5277d508414310ec++;
    lights = getentitylessscriptablearray("ob_ivory_light_" + self.var_5277d508414310ec, "targetname");
    foreach (light in lights) {
        light setscriptablepartstate("model", "on");
    }
    if (self.var_5277d508414310ec == 4) {
        foreach (player in level.players) {
            self.var_50e383364d5e0d02 disablescriptableplayeruse(player);
        }
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (isplayer(player)) {
                self.var_50e383364d5e0d02 enablescriptableplayeruse(player);
            }
        }
        if (isdefined(self.var_50e383364d5e0d02)) {
            self.var_50e383364d5e0d02 setscriptablepartstate("model", "enabled");
            self.var_50e383364d5e0d02 scriptable_addusedcallbackbypart("model", &function_29e2ee863284984c);
            self.var_50e383364d5e0d02.var_5c034827af8b8b9b = self;
        }
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ffb
// Size: 0x5f
function function_8884edbcdf7fafcf(var_27d6902091f45267, var_92d6f86c9665c12e) {
    var_27d6902091f45267 endon("device_used");
    wait(var_92d6f86c9665c12e);
    if (!var_27d6902091f45267.var_a27e02d40b7eeda6) {
        var_27d6902091f45267 setscriptablepartstate("model", "hidden");
        var_27d6902091f45267 setscriptablepartstate("interact", "unusable");
        function_94b78afd5298be48(var_27d6902091f45267.var_c606b11086a2b24b);
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3061
// Size: 0x133
function private function_29e2ee863284984c(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    var_5738b32c08d8eef9 = namespace_29b5250e9959ea::function_aec261e207cbd04a("jup_hacking_device_ob", player, 3);
    if (istrue(var_5738b32c08d8eef9)) {
        instance setscriptablepartstate("model", "visible");
        foreach (door in instance.var_5c034827af8b8b9b.vault_doors) {
            playsoundatpos(door.origin, "evt_ob_vault_door_unlock");
            namespace_f6368c72597c6d90::function_b092780f9ec4496e(door);
            time = lookupsoundlength("evt_ob_vault_door_unlock") / 1000;
            wait(time);
        }
    }
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x319b
// Size: 0x136
function private function_9749f093b0e831ec(var_fbe755f0978c0369) {
    var_fbe755f0978c0369 = function_53c4c53197386572(var_fbe755f0978c0369, "ob_jup_item_weapon_pi_decho_blue");
    var_1a827f12b6347e9d = 4;
    var_2d62b5de8c483c2f = "ob_jup_items_enemy_droplist_solider";
    if (isdefined(level.var_e7e662c51dc0814a) && level.var_e7e662c51dc0814a != "") {
        var_2d62b5de8c483c2f = level.var_e7e662c51dc0814a;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (itembundle.type == "weapon" && isdefined(itembundle.baseweapon)) {
        if (!isdefined(itembundle.spawncount)) {
            var_29bdca006c2f9d55 = function_7209c8cd4b2e3afd(weaponmaxammo(itembundle.baseweapon));
        } else {
            var_29bdca006c2f9d55 = function_7209c8cd4b2e3afd(itembundle.spawncount);
        }
    }
    spawn_pos = self.origin;
    var_d03b21428bf6d166 = spawnstruct();
    function_f632348cbb773537(level.var_230e213404e33c44, var_d03b21428bf6d166);
    namespace_b4f2af6fa775d9b::function_c069cffb4cbd1707(itembundle, spawn_pos, self.angles);
    namespace_2abc885019e1956::function_cd45408bd44fab07(var_2d62b5de8c483c2f, var_1a827f12b6347e9d, spawn_pos);
}

// Namespace namespace_945da193e84ea7bb/namespace_d7e80b14e1130dc4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32d8
// Size: 0x171
function private function_e1544d723150bc92(var_7275f76481b5353f, cache_type) {
    switch (cache_type) {
    case 0:
        cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_7707c98d8fb91322", var_7275f76481b5353f.origin, var_7275f76481b5353f.angles);
        break;
    case 1:
        cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_db9dd25fb9a30359", var_7275f76481b5353f.origin, var_7275f76481b5353f.angles);
        break;
    case 2:
        cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_c93e3c6a0f418c4d", var_7275f76481b5353f.origin, var_7275f76481b5353f.angles);
        break;
    case 3:
        cache = spawnscriptable("ob_loot_cache_large_zm", var_7275f76481b5353f.origin, var_7275f76481b5353f.angles);
        cache.var_55bb3585d29af1be = &function_b6f48b1b3dcc129b;
        break;
    default:
        cache = namespace_9b83895815d12835::function_71d64108850e7b91(#"hash_7707c98d8fb91322", var_7275f76481b5353f.origin, var_7275f76481b5353f.angles);
        break;
    }
    while (!isdefined(cache)) {
        waitframe();
    }
    var_7275f76481b5353f.cache = cache;
    var_7275f76481b5353f.cache setscriptablepartstate("body", "closed_usable");
}
