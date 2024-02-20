// mwiii decomp prototype
#using script_7edf952f8921aa6b;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_485622d93fa7e4cf;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_749ff6f56673a813;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_41387eecc35b88bf;
#using script_6a8ec730b2bfa844;
#using script_6f65366f542f6627;
#using script_55221d469e7b320e;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_1f97a44d1761c919;
#using script_58be75c518bf0d40;

#namespace namespace_e809fb16a76c99a;

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0x152
function function_751a7af62e6ae0c7() {
    callback::add("quest_exfil_spawned", &function_efb50a1f9ede7de7);
    callback::add("quest_exfil_complete", &function_202616c69c9f30c0);
    callback::add("player_spawned", &on_player_spawned);
    level.var_4dc2d161649b3568 = &function_11bcd4711058b7d3;
    level.var_41e730a6eb28dcca = "JUP_OB_OBJECTIVES/QUEST_0_EXFIL_ACT1";
    level.var_2b4ea776b3e4b973 = "JUP_OB_OBJECTIVES/QUEST_0_EXFIL_ACT2";
    level.var_baa6228c15af450c = "JUP_OB_OBJECTIVES/QUEST_0_EXFIL_ACT3";
    level flag_wait("exfil_initialized");
    level.var_9ec4962076db301b = [];
    level.var_9ec4962076db301b["exfil_destinations"] = [];
    var_89a48fee7588a0ac = getstructarray("content_destination", "variantname");
    foreach (destination in var_89a48fee7588a0ac) {
        if (is_equal(destination.script_noteworthy, "quest_destination")) {
            level.var_9ec4962076db301b["exfil_destinations"] = array_add(level.var_9ec4962076db301b["exfil_destinations"], destination);
        }
    }
    function_7b7ef7b297577097();
    level thread function_3588066237370357();
    level flag_set("quest_exfil_initialized");
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf
// Size: 0x109
function on_player_spawned(params) {
    level flag_wait("quest_exfil_initialized");
    if (getdvarint(@"hash_bb56255b931f8adb", 0)) {
        namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act1");
        namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act2");
        namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act3");
    }
    if (namespace_9571f642f38c8169::function_3bb8b73991355a1(2) || getdvarint(@"hash_7672e037953e3ff2", 0)) {
        if (!getdvarint(@"hash_8a2c3d4f98cab77e", 0)) {
            namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act1");
        }
    }
    if (namespace_9571f642f38c8169::function_3bb8b73991355a1(4) || getdvarint(@"hash_cbbe6eb889d15db1", 0)) {
        if (!getdvarint(@"hash_2dd1fe433bb4044f", 0)) {
            namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act2");
        }
    }
    if (namespace_9571f642f38c8169::function_3bb8b73991355a1(6) || getdvarint(@"hash_9f96ef962ff292e4", 0)) {
        if (!getdvarint(@"hash_964dfa8da1d550f4", 0)) {
            namespace_bbc151ced3ff8d46::function_689512f156cb5a4a(self, "s0_act3");
        }
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df
// Size: 0x13b
function function_7b7ef7b297577097() {
    level.var_9ec4962076db301b["general_info"] = spawnstruct();
    level.var_9ec4962076db301b["general_info"].var_80e27bd49e794ecd = [];
    level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be = [];
    level.var_9ec4962076db301b["s0_act1"] = spawnstruct();
    level.var_9ec4962076db301b["s0_act1"].name = "s0_act1";
    level.var_9ec4962076db301b["s0_act1"].var_80e27bd49e794ecd = [];
    level.var_9ec4962076db301b["s0_act2"] = spawnstruct();
    level.var_9ec4962076db301b["s0_act2"].name = "s0_act2";
    level.var_9ec4962076db301b["s0_act2"].var_80e27bd49e794ecd = [];
    level.var_9ec4962076db301b["s0_act3"] = spawnstruct();
    level.var_9ec4962076db301b["s0_act3"].name = "s0_act3";
    level.var_9ec4962076db301b["s0_act3"].var_80e27bd49e794ecd = [];
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721
// Size: 0xa4
function function_689512f156cb5a4a(player, mission_name) {
    if (!isdefined(level.var_9ec4962076db301b[mission_name]) || !isdefined(player)) {
        return;
    }
    level.var_9ec4962076db301b[mission_name].var_80e27bd49e794ecd[level.var_9ec4962076db301b[mission_name].var_80e27bd49e794ecd.size] = player;
    level.var_9ec4962076db301b["general_info"].var_80e27bd49e794ecd[level.var_9ec4962076db301b["general_info"].var_80e27bd49e794ecd.size] = player;
    player.var_9043213f45d750a4 = mission_name;
    function_6a3d3280a1913f27(player);
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cc
// Size: 0x7f
function function_587db41e9361a424(player, mission_name) {
    if (!isplayer(player)) {
        return;
    }
    if (isdefined(mission_name)) {
        if (isdefined(level.var_9ec4962076db301b[mission_name]) && array_contains(level.var_9ec4962076db301b[mission_name].var_80e27bd49e794ecd, player)) {
            return 1;
        }
    } else if (array_contains(level.var_9ec4962076db301b["general_info"].var_80e27bd49e794ecd, player)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x853
// Size: 0x18
function function_f4506108332ff64b(player) {
    var_fc92e63a56e600d2 = [];
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872
// Size: 0x271
function function_3588066237370357() {
    level flag_wait("quest_exfil_initialized");
    var_b9fd6576745cea1 = array_randomize(level.var_9ec4962076db301b["exfil_destinations"]);
    var_601a910f45d75832 = var_b9fd6576745cea1;
    var_b9fd6576745cea1 = [];
    foreach (var_55d707c3d5cdeddc in var_601a910f45d75832) {
        if (isdefined(level.var_24b61da48c7bdf06) && isvector(level.var_24b61da48c7bdf06.var_5712319afa086cc8) && isdefined(level.var_24b61da48c7bdf06.var_4355367c3316786c)) {
            distancesquared = distance2dsquared(level.var_24b61da48c7bdf06.var_5712319afa086cc8, var_55d707c3d5cdeddc.origin);
            var_d3229d567868fb23 = squared(max(level.var_24b61da48c7bdf06.var_4355367c3316786c, 0));
            if (distancesquared <= var_d3229d567868fb23) {
                continue;
            }
            var_b9fd6576745cea1[var_b9fd6576745cea1.size] = var_55d707c3d5cdeddc;
        }
    }
    var_d08f3ac86be7ae9e = [];
    for (i = 0; i < 3; i++) {
        if (isdefined(var_b9fd6576745cea1[i])) {
            level thread namespace_9f6a961447bab709::function_cb80f3df972cd7d4(var_b9fd6576745cea1[i]);
        }
    }
    foreach (var_751df20fceaee5 in level.var_2562ea48235e90b5) {
        if (namespace_9f6a961447bab709::function_4027f5445bb7c8fb(var_751df20fceaee5) && !isdefined(var_751df20fceaee5.var_d182b8d3f3aaa93b)) {
            var_d08f3ac86be7ae9e[var_d08f3ac86be7ae9e.size] = var_751df20fceaee5;
        }
    }
    for (i = 0; i < var_d08f3ac86be7ae9e.size; i++) {
        mission_name = function_1cbe81bf66185af4(i);
        if (is_equal(mission_name, "s0_act2")) {
            var_d08f3ac86be7ae9e[i].var_35d53d54bebe2864 = 1;
            var_d08f3ac86be7ae9e[i].var_1defa642cf137bd = 1;
            var_d08f3ac86be7ae9e[i].var_4e8463d4b66778dc = 1;
        }
        var_d08f3ac86be7ae9e[i].var_1f97475ff2d69ebf = function_515820c869914cdd(mission_name);
        var_d08f3ac86be7ae9e[i].var_e115a5d733190f7d = mission_name;
        var_d08f3ac86be7ae9e[i] namespace_9f6a961447bab709::function_2e0dc001c9a5c661();
        level thread function_53350420745f6c60(var_d08f3ac86be7ae9e[i]);
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaea
// Size: 0x53
function function_cd828662014a857e() {
    switch (self.model) {
    case #"hash_d212853f8d744c9e":
        return "s0_act1";
        break;
    case #"hash_313fbf630ac98b33":
        return "s0_act2";
        break;
    case #"hash_313fbe630ac989a0":
        return "s0_act3";
        break;
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb44
// Size: 0x77
function function_1cbe81bf66185af4(n_act) {
    switch (n_act) {
    case 0:
        var_e115a5d733190f7d = "s0_act1";
        break;
    case 1:
        var_e115a5d733190f7d = "s0_act2";
        break;
    case 2:
        var_e115a5d733190f7d = "s0_act3";
        break;
    default:
        var_e115a5d733190f7d = "s0_act1";
        break;
    }
    return var_e115a5d733190f7d;
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc3
// Size: 0x54
function function_515820c869914cdd(mission_name) {
    switch (mission_name) {
    case #"hash_34b3c3f2be08e508":
        return "cp_mp_quest_exfil_site_xmodel";
        break;
    case #"hash_34b3c6f2be08e9c1":
        return "cp_mp_quest_exfil_site_xmodel_2";
        break;
    case #"hash_34b3c5f2be08e82e":
        return "cp_mp_quest_exfil_site_xmodel_3";
        break;
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1e
// Size: 0xb7
function function_6a3d3280a1913f27(player) {
    level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be = array_removedead(level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be);
    foreach (var_767a93cd0ac57ef6 in level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be) {
        if (isdefined(var_767a93cd0ac57ef6)) {
            var_767a93cd0ac57ef6 enablescriptableplayeruse(player);
            var_767a93cd0ac57ef6 showtoplayer(player);
        }
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x1da
function function_efb50a1f9ede7de7(params) {
    if (!isdefined(params.var_d182b8d3f3aaa93b)) {
        return;
    }
    var_d182b8d3f3aaa93b = params.var_d182b8d3f3aaa93b;
    var_d182b8d3f3aaa93b setscriptablepartstate("cp_mp_exfil_icon", "default_icon");
    var_f31b9a09f5136f2f = var_d182b8d3f3aaa93b function_cd828662014a857e();
    foreach (player in level.players) {
        var_d182b8d3f3aaa93b disablescriptableplayeruse(player);
        var_d182b8d3f3aaa93b hidefromplayer(player);
    }
    foreach (player in level.var_9ec4962076db301b[var_f31b9a09f5136f2f].var_80e27bd49e794ecd) {
        if (isdefined(player)) {
            var_d182b8d3f3aaa93b enablescriptableplayeruse(player);
            var_d182b8d3f3aaa93b showtoplayer(player);
            var_5c6e050b71cc8eb3 = var_d182b8d3f3aaa93b getlinkedscriptableinstance();
        }
        wait(1);
        if (isdefined(player)) {
            if (var_f31b9a09f5136f2f == "cp_mp_quest_exfil_site_xmodel") {
                missionid = 17551;
            } else if (var_f31b9a09f5136f2f == "cp_mp_quest_exfil_site_xmodel_2") {
                missionid = 17568;
            } else {
                missionid = 17091;
            }
            if (!function_62b41959b3c5a9ca(player, missionid)) {
                player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(18, var_5c6e050b71cc8eb3.origin, var_5c6e050b71cc8eb3.index);
            }
        }
    }
    level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be = array_add(level.var_9ec4962076db301b["general_info"].var_f6e64573c4a3a4be, var_d182b8d3f3aaa93b);
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebd
// Size: 0xb2
function function_202616c69c9f30c0(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (isdefined(params.var_751df20fceaee5.var_a29dfbc008072d57) && array_contains(level.var_9ec4962076db301b[params.var_751df20fceaee5.var_a29dfbc008072d57].var_80e27bd49e794ecd, params.player)) {
        var_ca26c1c8e7c7f75a = "exfil_to_" + params.var_751df20fceaee5.var_a29dfbc008072d57;
        logstring("quest exfil to act callback");
        level callback::callback(var_ca26c1c8e7c7f75a, params);
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf76
// Size: 0x22a
function function_11bcd4711058b7d3(var_751df20fceaee5, player) {
    if (!isdefined(player)) {
        return;
    }
    level.var_9ec4962076db301b["s0_act1"].var_80e27bd49e794ecd = array_removeundefined(level.var_9ec4962076db301b["s0_act1"].var_80e27bd49e794ecd, 1);
    level.var_9ec4962076db301b["s0_act2"].var_80e27bd49e794ecd = array_removeundefined(level.var_9ec4962076db301b["s0_act2"].var_80e27bd49e794ecd, 1);
    level.var_9ec4962076db301b["s0_act3"].var_80e27bd49e794ecd = array_removeundefined(level.var_9ec4962076db301b["s0_act3"].var_80e27bd49e794ecd, 1);
    if (array_contains(level.var_9ec4962076db301b["s0_act1"].var_80e27bd49e794ecd, player) && var_751df20fceaee5.var_1f97475ff2d69ebf == "cp_mp_quest_exfil_site_xmodel") {
        level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a1t7_ava_start", level.var_9ec4962076db301b["s0_act1"].var_80e27bd49e794ecd, 0, 1);
        var_751df20fceaee5.var_a29dfbc008072d57 = "s0_act1";
    } else if (array_contains(level.var_9ec4962076db301b["s0_act2"].var_80e27bd49e794ecd, player) && var_751df20fceaee5.var_1f97475ff2d69ebf == "cp_mp_quest_exfil_site_xmodel_2") {
        level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0_a2t6_exfil_to_act", level.var_9ec4962076db301b["s0_act2"].var_80e27bd49e794ecd, 0, 1);
        var_751df20fceaee5.var_a29dfbc008072d57 = "s0_act2";
    } else if (array_contains(level.var_9ec4962076db301b["s0_act3"].var_80e27bd49e794ecd, player) && var_751df20fceaee5.var_1f97475ff2d69ebf == "cp_mp_quest_exfil_site_xmodel_3") {
        level thread namespace_446fc987a980892f::function_c1c677ed7a1b1128("quest_s0a3t5_zakhaev_start", level.var_9ec4962076db301b["s0_act3"].var_80e27bd49e794ecd, 0, 1);
        var_751df20fceaee5.var_a29dfbc008072d57 = "s0_act3";
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a7
// Size: 0x1b6
function map_transition(var_684092929dab076f, var_576f57af0204c38c, var_e115a5d733190f7d) {
    if (!isdefined(var_684092929dab076f)) {
        return;
    }
    if (!isdefined(var_e115a5d733190f7d)) {
        return;
    }
    var_61dbf957f494509e = [];
    var_2de99dcf81d44b88 = function_3e4e6e35ce1eb985(var_e115a5d733190f7d);
    logstring("quest exfil start squad check");
    var_684092929dab076f = array_removeundefined(var_684092929dab076f);
    while (1) {
        player = var_684092929dab076f[0];
        if (!isdefined(player)) {
            return;
        }
        var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getSquadMembers(undefined, 1);
        var_de42222cf42400aa = [];
        foreach (var_9191cfe9f04a69a8 in var_c9b69aecc5c631ed) {
            if (var_576f57af0204c38c function_c80b9a252474413b(var_9191cfe9f04a69a8)) {
                var_de42222cf42400aa[var_de42222cf42400aa.size] = var_9191cfe9f04a69a8;
            }
        }
        var_61dbf957f494509e[var_61dbf957f494509e.size] = var_de42222cf42400aa;
        foreach (var_9191cfe9f04a69a8 in var_de42222cf42400aa) {
            if (isdefined(var_9191cfe9f04a69a8)) {
                var_684092929dab076f = array_remove(var_684092929dab076f, var_9191cfe9f04a69a8);
            }
        }
        if (!var_684092929dab076f.size) {
            break;
        }
        waitframe();
    }
    foreach (squad in var_61dbf957f494509e) {
        logstring("quest exfil squad to map to map start");
        level thread namespace_41bcc2f40ffd0e7f::function_e229d89e0c38206d(squad, var_2de99dcf81d44b88);
    }
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1364
// Size: 0x5b
function function_3e4e6e35ce1eb985(var_e115a5d733190f7d) {
    switch (var_e115a5d733190f7d) {
    case #"hash_34b3c3f2be08e508":
        n_id = 1001;
        break;
    case #"hash_34b3c6f2be08e9c1":
        n_id = 1002;
        break;
    case #"hash_34b3c5f2be08e82e":
        n_id = 1003;
        break;
    }
    return n_id;
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c7
// Size: 0x49
function function_c80b9a252474413b(player) {
    if (!isdefined(self) || !isalive(self) || !isdefined(self.origin) || !isdefined(player) || !isdefined(player.origin)) {
        return 0;
    }
    return function_f69d383479425bfa(player);
}

// Namespace namespace_e809fb16a76c99a/namespace_bbc151ced3ff8d46
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1418
// Size: 0x3f
function function_f69d383479425bfa(player) {
    if (isarray(self.var_8784c427b1af24a6) && array_contains_key(self.var_8784c427b1af24a6, player.guid)) {
        return 1;
    }
    return 0;
}
