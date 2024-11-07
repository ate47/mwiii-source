#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_14609b809484646e;
#using script_3a8f9ace195c9da9;
#using script_7c40fa80892a721;
#using script_66122a002aff5d57;
#using script_3feec618e51a6291;
#using scripts\cp\cp_gameskill.gsc;
#using script_3bcaa2cbaf54abdd;
#using script_12e2fb553ec1605e;
#using scripts\cp\utility\cp_safehouse_util.gsc;
#using scripts\cp\cp_objectives.gsc;
#using scripts\cp\cp_checkpoint.gsc;

#namespace namespace_9bd6c605a5e74215;

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56b
// Size: 0x1a5
function checkpoints_init() {
    if (isdefined(level.registered_checkpoints)) {
        return;
    }
    namespace_9c383b14c4908e46::function_8ece37593311858a(&function_aac970e61d5cb3c6);
    if (!isdefined(game["checkpoint_attempts"])) {
        game["checkpoint_attempts"] = [];
    }
    if (!isdefined(game["checkpoints_completed"])) {
        game["checkpoints_completed"] = [];
    }
    /#
        cmd = "<dev string:x1c>";
        addentrytodevgui(cmd);
        cmd = "<dev string:x80>";
        addentrytodevgui(cmd);
        thread function_699304dd575765c9(@"hash_ab7abd921b71638d", &function_7d2ee45f1241a17a);
    #/
    level.registered_checkpoints = [];
    level.var_22ee4e8db4fd17f3 = [];
    level.var_aa13322507f4f9e8 = [];
    var_47589cd2789c1a5 = [];
    var_313cc72de0c10cde = [];
    var_47589cd2789c1a5 = [];
    if (isdefined(level.checkpoint_player_spawns_func)) {
        var_47589cd2789c1a5 = [[ level.checkpoint_player_spawns_func ]]();
    }
    var_313cc72de0c10cde = [];
    if (isdefined(level.checkpoint_carepkg_spawns_func)) {
        var_313cc72de0c10cde = [[ level.checkpoint_carepkg_spawns_func ]]();
    }
    if (var_47589cd2789c1a5.size < 1 && var_313cc72de0c10cde.size < 1) {
        return;
    }
    items = array_combine(var_47589cd2789c1a5, var_313cc72de0c10cde);
    foreach (item in items) {
        if (!isdefined(level.registered_checkpoints[item.checkpoint])) {
            level.registered_checkpoints[item.checkpoint] = [];
        }
        level.registered_checkpoints[item.checkpoint][index] = item;
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x175
function function_aac970e61d5cb3c6() {
    var_d1e73a2097674c26 = namespace_1170726b2799ea65::function_50f02a42c72031cb(level.mapname);
    if (isdefined(var_d1e73a2097674c26) && var_d1e73a2097674c26 != "") {
        function_24490b05670afa23(var_d1e73a2097674c26);
    }
    var_57acddc40b2f741 = namespace_1170726b2799ea65::function_124086d0afefcee3();
    angles = var_57acddc40b2f741[1];
    origin = var_57acddc40b2f741[0];
    if (isdefined(origin) && origin != "") {
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        if (isstring(angles)) {
            toks = strtok(angles, "(");
            toks = strtok(toks[0], ")");
            toks = strtok(toks[0], ",");
            angles = (float(toks[0]), float(toks[1]), float(toks[2]));
        }
        if (isstring(origin)) {
            toks = strtok(origin, "(");
            toks = strtok(toks[0], ")");
            toks = strtok(toks[0], ",");
            origin = (float(toks[0]), float(toks[1]), float(toks[2]));
        }
        struct = spawnstruct();
        struct.angles = angles;
        struct.origin = origin;
        self.pers["checkpoint_spawnpoint"] = struct;
    }
    thread function_ef6a255ad0d55f48();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x895
// Size: 0x9a
function function_ef6a255ad0d55f48() {
    self endon("disconnect");
    level endon("game_ended");
    flag_wait("player_spawned_with_loadout");
    while (!istrue(self.armorinitialized)) {
        waitframe();
    }
    var_ec99da435b12b106 = namespace_1170726b2799ea65::function_a00ff86fba36d23e();
    if (isdefined(var_ec99da435b12b106) && var_ec99da435b12b106 > 0) {
        namespace_f8d3520d3483c1::function_ac7803d45979135c(var_ec99da435b12b106, 1);
    }
    var_c2dc97ae1544c42d = namespace_1170726b2799ea65::function_25ae243b0c56d3fc();
    if (isdefined(var_c2dc97ae1544c42d) && var_c2dc97ae1544c42d > 0) {
        namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(var_c2dc97ae1544c42d);
    }
    var_b194f832b48e63ce = namespace_1170726b2799ea65::function_beebc333010c5122();
    if (istrue(var_b194f832b48e63ce)) {
        namespace_6250b14b3f614101::addselfrevivetoken(1, 1);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x937
// Size: 0x15
function function_418cc3c8f49d765a(val) {
    level.var_8d39359d283b5d75 = val;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x954
// Size: 0x37
function checkpoint_register(checkpoint, func) {
    if (!isdefined(level.registered_checkpoint_funcs)) {
        level.registered_checkpoint_funcs = [];
    }
    level.registered_checkpoint_funcs[checkpoint] = func;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x993
// Size: 0xd2
function function_17660e9c061a06db() {
    var_abb77a43d0eea9f2 = undefined;
    start = function_704ff93a09415c5d();
    if (isdefined(level.var_2a02072872ccd8a1)) {
        keys = getarraykeys(level.var_2a02072872ccd8a1);
        for (i = 0; i < keys.size; i++) {
            if (isdefined(level.var_2a02072872ccd8a1[keys[i]].starts)) {
                j = 0;
                for (j = 0; j < level.var_2a02072872ccd8a1[keys[i]].starts.size; j++) {
                    if (start == level.var_2a02072872ccd8a1[keys[i]].starts[j]) {
                        var_abb77a43d0eea9f2 = keys[i];
                        break;
                    }
                }
            }
        }
    }
    return var_abb77a43d0eea9f2;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa6e
// Size: 0x147
function function_d37e0c86fbcf710b(objectives, checkpoints, var_7bd2543cb85e81d7) {
    if (function_51a0f44b99dc2fd3()) {
        if (!isdefined(level.var_9f966ce33c2acf74)) {
            level.var_9f966ce33c2acf74 = [];
        }
        array = level.var_9f966ce33c2acf74;
        if (!isarray(objectives)) {
            objectives = [objectives];
        }
        foreach (objective in objectives) {
            if (!isdefined(array[objective])) {
                array[objective] = [];
            }
            if (!isarray(checkpoints)) {
                checkpoints = [checkpoints];
            }
            foreach (checkpoint in checkpoints) {
                if (!isdefined(array[objective][checkpoint])) {
                    array[objective][checkpoint] = spawnstruct();
                }
                array[objective][checkpoint].isvalid = 0;
                array[objective][checkpoint].var_7bd2543cb85e81d7 = var_7bd2543cb85e81d7;
            }
        }
        level.var_9f966ce33c2acf74 = array;
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x5d
function function_81066d5ad04fa613(checkpoint, objective) {
    if (isdefined(level.var_9f966ce33c2acf74) && isdefined(level.var_9f966ce33c2acf74[objective]) && isdefined(level.var_9f966ce33c2acf74[objective][checkpoint])) {
        return istrue(level.var_9f966ce33c2acf74[objective][checkpoint].isvalid);
    }
    return true;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc23
// Size: 0x73
function function_b6090c4fefd0c9a5(checkpoint, objective) {
    if (isdefined(level.var_9f966ce33c2acf74[objective][checkpoint].var_7bd2543cb85e81d7)) {
        struct = spawnstruct();
        struct.checkpoint = checkpoint;
        struct.objective = objective;
        struct [[ level.var_9f966ce33c2acf74[objective][checkpoint].var_7bd2543cb85e81d7 ]]();
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9e
// Size: 0x43
function function_25958aa1ac22a73() {
    checkpoint = function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "" && isdefined(level.registered_checkpoint_funcs[checkpoint])) {
        level thread [[ level.registered_checkpoint_funcs[checkpoint] ]]();
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce9
// Size: 0x111
function function_d4cdc242233c15b3() {
    start = function_704ff93a09415c5d();
    var_abb77a43d0eea9f2 = function_17660e9c061a06db();
    checkpoint = function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "" && isdefined(level.registered_checkpoint_funcs[checkpoint])) {
        if (isdefined(var_abb77a43d0eea9f2) && isdefined(level.var_2a02072872ccd8a1) && isdefined(var_abb77a43d0eea9f2) && isdefined(level.var_2a02072872ccd8a1[var_abb77a43d0eea9f2])) {
            var_b62e28e3fbdfac20 = level.var_2a02072872ccd8a1[var_abb77a43d0eea9f2];
            if (isdefined(var_b62e28e3fbdfac20.checkpoints) && isdefined(var_b62e28e3fbdfac20.checkpoints[checkpoint]) && isdefined(var_b62e28e3fbdfac20.checkpoints[checkpoint].var_23c5a6352ce4150e)) {
                level.default_player_spawns = var_b62e28e3fbdfac20.checkpoints[checkpoint].var_23c5a6352ce4150e;
            }
        }
        level thread [[ level.registered_checkpoint_funcs[checkpoint] ]]();
        return;
    }
    if (isdefined(var_abb77a43d0eea9f2)) {
        function_ebc288fcc6cabbe4(var_abb77a43d0eea9f2);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe02
// Size: 0x78
function function_ebc288fcc6cabbe4(mission_name) {
    var_b7ccdef52750bfdb = level.var_2a02072872ccd8a1[mission_name];
    if (isdefined(var_b7ccdef52750bfdb.var_97d01eef320789e)) {
        level.default_player_spawns = var_b7ccdef52750bfdb.var_97d01eef320789e;
    }
    var_b7ccdef52750bfdb.start = function_704ff93a09415c5d();
    var_b7ccdef52750bfdb.checkpoint = function_9eed75023a958c18();
    var_b7ccdef52750bfdb thread [[ var_b7ccdef52750bfdb.var_e0c23e69910a3ea0 ]]();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe82
// Size: 0x9d
function private function_704ff93a09415c5d() {
    start = getdvar(@"start");
    if (!isdefined(start) || isdefined(start) && start == "") {
        if (istrue(level.var_8d39359d283b5d75)) {
            if (flag("start_is_set")) {
                start = level.start_point;
            } else if (isdefined(level.default_start_override)) {
                start = level.default_start_override;
            } else if (namespace_a09f244480e07471::level_has_start_points()) {
                start = level.start_functions[0]["name"];
            } else {
                start = "default";
            }
        }
    }
    return start;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf28
// Size: 0x8b
function function_9df80ff2f32ed96d(mission_name, var_d400f734a98fd7d7, var_e0c23e69910a3ea0, var_7064a1a61989f0f5) {
    if (!isdefined(level.var_2a02072872ccd8a1)) {
        level.var_2a02072872ccd8a1 = [];
    }
    struct = spawnstruct();
    struct.starts = var_d400f734a98fd7d7;
    struct.checkpoints = [];
    struct.var_e0c23e69910a3ea0 = var_e0c23e69910a3ea0;
    struct.var_97d01eef320789e = var_7064a1a61989f0f5;
    level.var_2a02072872ccd8a1[mission_name] = struct;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfbb
// Size: 0xb2
function function_a83214ec9cbf5bc8(mission_name, checkpoint, var_90705ad3da93aa0a, var_49dc719a8aea08c8) {
    if (!isdefined(level.var_2a02072872ccd8a1) || !isdefined(level.var_2a02072872ccd8a1[mission_name])) {
        assert("attempted to register a checkpoint " + checkpoint + " for unregistered mission: " + mission_name);
        return;
    }
    var_b62e28e3fbdfac20 = level.var_2a02072872ccd8a1[mission_name];
    var_66397695e709cad6 = spawnstruct();
    var_66397695e709cad6.var_a0ab64db3b95a0a5 = var_90705ad3da93aa0a;
    var_66397695e709cad6.var_23c5a6352ce4150e = var_49dc719a8aea08c8;
    var_b62e28e3fbdfac20.checkpoints[checkpoint] = var_66397695e709cad6;
    checkpoint_register(checkpoint, var_90705ad3da93aa0a);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1075
// Size: 0xa
function function_c506f6b5c63e776c() {
    return isdefined(game["restart_checkpoint"]);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1088
// Size: 0x24
function function_f64efae7665a7baa(delay, checkpoint) {
    level endon("game_ended");
    wait delay;
    checkpoint_set(checkpoint);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10b4
// Size: 0x1f3
function checkpoint_set(checkpoint, var_8c5b2ee4dfdfc600, var_2072812d969955cb) {
    if (!istrue(var_2072812d969955cb)) {
        function_ee15fb8d39d4f4dd(checkpoint);
    }
    game["restart_checkpoint"] = checkpoint;
    if (checkpoint == "") {
        game["restart_checkpoint"] = undefined;
    }
    thread scripts\cp\cp_gameskill::function_71ec52011ff77954();
    var_4a0d987ac61bba3b = getdvar(hashcat(@"hash_287b3b75f2c14fe9", level.mapname));
    if (isdefined(var_4a0d987ac61bba3b) && var_4a0d987ac61bba3b != "") {
        setdvar(hashcat(@"hash_287b3b75f2c14fe9", level.mapname), "");
    }
    if (checkpoint != "") {
        /#
            announcement("<dev string:xdc>" + checkpoint);
        #/
        setdvar(@"hash_f004b2ccc04fdc8d", 1);
        function_24490b05670afa23(checkpoint);
        if (!istrue(var_2072812d969955cb)) {
            setomnvar("ui_cp_checkpoint", 1);
        }
        if (isdefined(game["checkpoint_attempts"]) && !isdefined(game["checkpoint_attempts"][checkpoint])) {
            game["checkpoint_attempts"][checkpoint] = 1;
        }
    }
    foreach (player in level.players) {
        player.pers["counting_stats"]["kills"] = player namespace_6c67e93a4c487d83::function_c0480dc3a45ef6("kills");
        player.pers["counting_stats"]["downs"] = player namespace_6c67e93a4c487d83::function_c0480dc3a45ef6("downs");
        player.pers["counting_stats"]["revives"] = player namespace_6c67e93a4c487d83::function_c0480dc3a45ef6("revives");
        if (checkpoint != "" && !istrue(var_8c5b2ee4dfdfc600)) {
            player thread namespace_751288259782653c::function_7da7bd24b280d295();
        }
    }
    scripts\cp\cp_gameskill::function_ffef4cfd9fec2e5b();
    thread function_57bb5cb576f3486e();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12af
// Size: 0x7b
function function_705d572f010fb61c() {
    if (isdefined(game["checkpoints_completed"]) && game["checkpoints_completed"].size > 0) {
        var_eb92e89246b291b6 = getarraykeys(game["checkpoints_completed"]);
        foreach (checkpoint in var_eb92e89246b291b6) {
            function_e7991cd1beb1563f(checkpoint);
        }
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1332
// Size: 0x39
function function_87ce7c6cba6c393() {
    if (isdefined(game["checkpoints_completed"]) && game["checkpoints_completed"].size > 0) {
        var_eb92e89246b291b6 = getarraykeys(game["checkpoints_completed"]);
        return var_eb92e89246b291b6;
    }
    return [];
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1373
// Size: 0xac
function function_24490b05670afa23(checkpoint) {
    difficulty = scripts\cp\cp_gameskill::get_gameskill();
    foreach (player in level.players) {
        player namespace_1170726b2799ea65::function_5de16de5f3a1776f(level.script, checkpoint, int(difficulty), player isnightvisionon(), getgroundposition(player getvieworigin(), 8), player getplayerangles(1));
    }
    function_e7991cd1beb1563f(checkpoint);
    game["checkpoints_completed"][checkpoint] = 1;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1427
// Size: 0x19
function function_e7991cd1beb1563f(checkpoint) {
    flag_set(checkpoint + "_completed");
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1448
// Size: 0x15
function function_cd10e09e02e4eb07(checkpoint) {
    return istrue(game["checkpoints_completed"][checkpoint]);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1466
// Size: 0x2b
function function_5ace495feba111d3() {
    level.player namespace_1170726b2799ea65::function_5de16de5f3a1776f();
    setdvar(@"hash_f004b2ccc04fdc8d", 0);
    game["checkpoints_completed"] = [];
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1499
// Size: 0x16
function function_57bb5cb576f3486e() {
    level endon("game_ended");
    waitframe();
    setomnvar("ui_cp_checkpoint", 0);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b7
// Size: 0x89
function function_9eed75023a958c18() {
    if (getdvarint(@"hash_f1981b3f0cb1f449")) {
        return "";
    }
    if (isdefined(game["restart_checkpoint"])) {
        return game["restart_checkpoint"];
    }
    checkpoint = level.player namespace_1170726b2799ea65::function_50f02a42c72031cb(level.mapname);
    if (isdefined(checkpoint) && checkpoint != "" && !istrue(game["ddl_checkpoint_used"])) {
        game["ddl_checkpoint_used"] = 1;
        game["restart_checkpoint"] = checkpoint;
        return checkpoint;
    }
    return "";
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1548
// Size: 0x41
function function_16083b03fbaa26b2(checkpoint, default_func, var_69e0de2fc4bae179) {
    if (isdefined(checkpoint) && function_51a0f44b99dc2fd3()) {
        if (function_cd10e09e02e4eb07(checkpoint)) {
            thread [[ var_69e0de2fc4bae179 ]]();
        }
        return;
    }
    thread [[ default_func ]]();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1591
// Size: 0x1d
function function_51a0f44b99dc2fd3() {
    if (getdvarint(@"hash_ba52fc94cd52acad", 1)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15b6
// Size: 0xe8
function checkpoint_get_item(checkpoint, item_type) {
    var_e7c8f9864cc0e30 = level.registered_checkpoints[checkpoint];
    if (!isdefined(var_e7c8f9864cc0e30)) {
        return undefined;
    }
    foreach (item in var_e7c8f9864cc0e30) {
        if (item.type != item_type) {
            continue;
        }
        if (item.checkpoint != checkpoint) {
            continue;
        }
        if (isdefined(item.inuse)) {
            continue;
        }
        switch (item_type) {
        case #"hash_765f4f5fb06286a0":
            item.inuse = 1;
            return item;
        case #"hash_2edfeb5cf47ba7b5":
        case #"hash_40ad539921f037a4":
            return item;
        }
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a6
// Size: 0x32
function function_ee15fb8d39d4f4dd(checkpoint) {
    scripts\engine\utility::function_f3bb4f4911a1beb2("game", "checkpoint_set", checkpoint);
    if (function_b4c58bbbae8c7412(checkpoint)) {
        return istrue(function_58beb11b01fb7b92(checkpoint));
    }
    return true;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e1
// Size: 0x17
function function_b4c58bbbae8c7412(checkpoint) {
    return isdefined(level.var_22ee4e8db4fd17f3[checkpoint]);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1701
// Size: 0x19
function function_58beb11b01fb7b92(checkpoint) {
    [[ level.var_22ee4e8db4fd17f3[checkpoint] ]]();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1722
// Size: 0x20
function function_63e1728c535014c9(checkpoint, func) {
    level.var_22ee4e8db4fd17f3[checkpoint] = func;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x174a
// Size: 0x41
function checkpoint_release_spawnpoint(player) {
    player waittill_any_2("spawned_player", "disconnect");
    while (any_player_nearby(self.origin, 64)) {
        wait 1;
    }
    self.inuse = undefined;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1793
// Size: 0x1ea
function checkpoint_create_carepackage(checkpoint) {
    level endon("game_ended");
    if (!isdefined(level.registered_checkpoint_funcs[checkpoint])) {
        assertmsg("Using a checkpoint for wrong level: " + checkpoint);
        return;
    }
    spawnpoint = checkpoint_get_item(checkpoint, "carepackage");
    care_pkg = spawn("script_model", spawnpoint.origin);
    care_pkg.angles = spawnpoint.angles;
    care_pkg setmodel("military_carepackage_01_friendly");
    brushmodel = getent("care_package_col", "targetname");
    collisionmodel = spawn("script_model", spawnpoint.origin);
    collisionmodel.angles = spawnpoint.angles;
    collisionmodel clonebrushmodeltoscriptmodel(brushmodel);
    collisionmodel linkto(care_pkg);
    var_e88f6961175998ce = spawn("script_model", spawnpoint.origin + (0, 0, 35));
    var_e88f6961175998ce setmodel("tag_origin");
    var_e88f6961175998ce sethintobject(undefined, "HINT_BUTTON", undefined, %CP_STRIKE/EDIT_LOADOUT, 25, "duration_short", "hide", 256, 75, 128, 75);
    var_e88f6961175998ce.headicon = createheadicon(care_pkg);
    setheadiconimage(var_e88f6961175998ce.headicon, "hud_icon_survival_weapon");
    setheadiconsnaptoedges(var_e88f6961175998ce.headicon, 0);
    setheadiconmaxdistance(var_e88f6961175998ce.headicon, 1024);
    setheadiconnaturaldistance(var_e88f6961175998ce.headicon, 256);
    setheadiconzoffset(var_e88f6961175998ce.headicon, -5);
    care_pkg.collision = collisionmodel;
    care_pkg.interaction = var_e88f6961175998ce;
    var_e88f6961175998ce thread checkpoint_carepackage_think(care_pkg);
    return care_pkg;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1986
// Size: 0x4b
function checkpoint_carepackage_think(carepackage) {
    self endon("death");
    carepackage endon("death");
    while (true) {
        self waittill("trigger", player);
        if (!player is_valid_player()) {
            continue;
        }
        player thread checkpoint_edit_loadout(self);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d9
// Size: 0x79
function checkpoint_edit_loadout(interaction) {
    self endon("disconnect");
    self endon("last_stand");
    level endon("game_ended");
    interaction disableplayeruse(self);
    level thread scripts\cp\utility\cp_safehouse_util::function_54dac17e1c475546(self, interaction);
    self setclientomnvar("cp_open_cac", -1);
    self setclientomnvar("ui_options_menu", 2);
    waittill_any_2("loadout_given", "loadout_menu_closed");
    wait 1;
    self setclientomnvar("cp_open_cac", -2);
    interaction enableplayeruse(self);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5a
// Size: 0x365
function checkpoint_create_carepackage_munitions(checkpoint, var_a4c65dfcaf9e25e0, var_4a727ea336a56cb, use_milcrate) {
    level endon("game_ended");
    exit = 0;
    if (istrue(level.disable_map_munitions)) {
        switch (checkpoint) {
        case #"hash_375daee74272699":
        case #"hash_bdc72b8b1960fa5":
        case #"hash_53abaf23787c2d08":
        case #"hash_53abb023787c2e9b":
        case #"hash_53abb123787c302e":
        case #"hash_7010d957c8cd3663":
        case #"hash_c48403df9bace772":
        case #"hash_e62185dc1075bb84":
            exit = 1;
            break;
        }
        if (exit) {
            return;
        }
    }
    spawnpoint = checkpoint_get_item(checkpoint, "carepackage_munitions");
    if (!isdefined(spawnpoint) || !isdefined(spawnpoint.origin)) {
        return;
    }
    care_pkg = spawn("script_model", spawnpoint.origin);
    care_pkg.angles = spawnpoint.angles;
    var_c2722c653e3e4e3 = (0, 0, 35);
    var_f1b21d47f7e81f45 = "show";
    var_1fadb16c673c2c10 = undefined;
    var_fd0b63c63d9fcc8c = undefined;
    if (!istrue(use_milcrate)) {
        care_pkg setmodel("military_carepackage_01_uk");
        brushmodel = getent("care_package_col", "targetname");
        collisionmodel = spawn("script_model", spawnpoint.origin);
        collisionmodel.angles = spawnpoint.angles;
        collisionmodel clonebrushmodeltoscriptmodel(brushmodel);
        collisionmodel linkto(care_pkg);
        care_pkg.collision = collisionmodel;
        if (isdefined(checkpoint) && checkpoint == "strongbox") {
            level.checkpoint = "strongbox";
            var_c2722c653e3e4e3 += (-10, 25, 0);
            var_1fadb16c673c2c10 = (10, -25, 35);
        }
    } else {
        care_pkg setmodel("military_hq_crate_01_proxy_cp_spawnable");
        care_pkg setscriptablepartstate("main", "on");
        care_pkg.use_milcrate = 1;
        var_c2722c653e3e4e3 += rotatevector((18.5, 16.6, 2), care_pkg.angles);
        var_f1b21d47f7e81f45 = "hide";
        var_1fadb16c673c2c10 = (0, 0, 35) + rotatevector((18.5, -14.6, 2), care_pkg.angles);
    }
    level thread checkpoint_carepackage_munitions_role_init(var_1fadb16c673c2c10, spawnpoint, care_pkg, var_a4c65dfcaf9e25e0, var_4a727ea336a56cb, use_milcrate, var_f1b21d47f7e81f45);
    var_e88f6961175998ce = spawn("script_model", spawnpoint.origin + var_c2722c653e3e4e3);
    var_e88f6961175998ce setmodel("tag_origin");
    var_e88f6961175998ce sethintobject(undefined, "HINT_BUTTON", undefined, %CP_STRIKE/EDIT_MUNITIONS, 1, "duration_short", var_f1b21d47f7e81f45, 256, 75, 128, 75);
    care_pkg.interaction = var_e88f6961175998ce;
    var_e88f6961175998ce.care_pkg = care_pkg;
    var_e88f6961175998ce.munitions_override_waittill = var_a4c65dfcaf9e25e0;
    var_e88f6961175998ce.munitions_override_time = var_4a727ea336a56cb;
    var_e88f6961175998ce.use_milcrate = use_milcrate;
    var_e88f6961175998ce thread checkpoint_carepackage_munitions_think(care_pkg);
    return care_pkg;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc8
// Size: 0xf3
function checkpoint_carepackage_munitions_role_init(var_1fadb16c673c2c10, spawnpoint, care_pkg, var_a4c65dfcaf9e25e0, var_4a727ea336a56cb, use_milcrate, var_f1b21d47f7e81f45) {
    level endon("game_ended");
    if (isdefined(var_1fadb16c673c2c10)) {
        var_4bef6b7f5a69864f = spawn("script_model", spawnpoint.origin + var_1fadb16c673c2c10);
        var_4bef6b7f5a69864f setmodel("tag_origin");
        if (!isdefined(var_f1b21d47f7e81f45)) {
            var_f1b21d47f7e81f45 = "hide";
        }
        var_4bef6b7f5a69864f sethintobject(undefined, "HINT_BUTTON", undefined, %CP_STRIKE/EDIT_ROLE, 1, "duration_short", var_f1b21d47f7e81f45, 256, 75, 128, 75);
        care_pkg.role_interaction = var_4bef6b7f5a69864f;
        var_4bef6b7f5a69864f.care_pkg = care_pkg;
        var_4bef6b7f5a69864f.munitions_override_waittill = var_a4c65dfcaf9e25e0;
        var_4bef6b7f5a69864f.munitions_override_time = var_4a727ea336a56cb;
        var_4bef6b7f5a69864f.use_milcrate = use_milcrate;
        var_4bef6b7f5a69864f thread checkpoint_carepackage_munitions_role_think(care_pkg);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec3
// Size: 0x6d
function checkpoint_carepackage_munitions_think(carepackage) {
    self endon("death");
    carepackage endon("death");
    thread checkpoint_edit_munitions_icon_init();
    thread checkpoint_edit_munitions_limit_init();
    while (true) {
        self waittill("trigger", player);
        if (!player is_valid_player()) {
            continue;
        }
        if (istrue(player.disable_purchase_munitions)) {
            continue;
        }
        player thread checkpoint_edit_munitions(self);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f38
// Size: 0x6d
function checkpoint_carepackage_munitions_role_think(carepackage, type) {
    self endon("death");
    carepackage endon("death");
    thread checkpoint_edit_role_limiter();
    while (true) {
        self waittill("trigger", player);
        if (!player is_valid_player()) {
            continue;
        }
        if (istrue(player.disable_purchase_munitions)) {
            continue;
        }
        player thread checkpoint_edit_role(self);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fad
// Size: 0x18
function checkpoint_edit_role_limiter() {
    level endon("game_ended");
    level waittill("close_munitions_store");
    self makeunusable();
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fcd
// Size: 0x36
function checkpoint_edit_munitions_limit_init() {
    level endon("game_ended");
    level endon("close_munitions_store");
    while (true) {
        level waittill("player_spawned", player);
        level thread checkpoint_edit_munitions_limiter(player, self);
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x200b
// Size: 0x305
function checkpoint_edit_munitions_icon_init() {
    level endon("game_ended");
    flag_wait("objectives_registered");
    flag_wait("strike_init_done");
    var_4c87400544dc7457 = 38;
    if (istrue(self.use_milcrate)) {
        var_4c87400544dc7457 = 22;
    }
    self.objicon = scripts\cp\cp_objectives::requestworldid("munitions_purchase", 25);
    objective_setplayintro(self.objicon, 0);
    objective_setbackground(self.objicon, 1);
    objective_state(self.objicon, "invisible");
    objective_icon(self.objicon, "hud_icon_survival_killstreak_small");
    org = self.origin;
    if (isdefined(level.checkpoint) && level.checkpoint == "strongbox") {
        var_4c87400544dc7457 = 75;
        org = self.care_pkg.origin;
    }
    objective_position(self.objicon, org + (0, 0, var_4c87400544dc7457));
    objective_setshowdistance(self.objicon, 0);
    objective_sethot(self.objicon, 0);
    objective_setpinned(self.objicon, 0);
    objective_hidefromplayersinmask(self.objicon);
    objective_removeallfrommask(self.objicon);
    flag_wait("player_spawned_with_loadout");
    wait 2.5;
    progress = 1;
    var_d19e041c9e06acbe = 60;
    waittime = 0.1;
    if (isdefined(self.munitions_override_time)) {
        var_d19e041c9e06acbe = self.munitions_override_time;
    }
    var_9a856ea56a94e11e = waittime / var_d19e041c9e06acbe;
    if (isdefined(self.munitions_override_waittill)) {
        level waittill(self.munitions_override_waittill);
    }
    objective_showprogressforteam(self.objicon, "allies");
    while (progress > 0) {
        objective_setprogress(self.objicon, progress);
        wait waittime;
        progress -= var_9a856ea56a94e11e;
        if (progress < 0) {
            progress = 0;
        }
    }
    level notify("close_munitions_store");
    self makeunusable();
    foreach (player in level.players) {
        if (player getclientomnvar("cp_open_cac") == 3) {
            player setclientomnvar("cp_open_cac", -2);
        }
    }
    if (istrue(self.use_milcrate)) {
        self.care_pkg setscriptablepartstate("main", "off");
    } else {
        self.care_pkg setscriptablepartstate("anims", "capture", 0);
        self.care_pkg setscriptablepartstate("capture", "start", 0);
        self.care_pkg.collision delete();
    }
    scripts\cp\cp_objectives::freeworldid("munitions_purchase");
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2318
// Size: 0xfb
function checkpoint_edit_munitions_limiter(player, var_16a8b2d5ca83a123) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    level endon("close_munitions_store");
    if (istrue(player.tracking_munitions_purchase)) {
        return;
    }
    player.tracking_munitions_purchase = 1;
    wait 3;
    while (true) {
        var_1652ce42e6fcf832 = distance2dsquared(player.origin, var_16a8b2d5ca83a123.origin);
        if (isdefined(var_1652ce42e6fcf832) && var_1652ce42e6fcf832 > 262144) {
            if (!istrue(player.hiding_munitions_purchase)) {
                objective_addclienttomask(var_16a8b2d5ca83a123.objicon, player);
                player.hiding_munitions_purchase = 1;
            }
        } else if (isdefined(var_1652ce42e6fcf832) && var_1652ce42e6fcf832 <= 262144) {
            if (isdefined(player.hiding_munitions_purchase)) {
                objective_removeclientfrommask(var_16a8b2d5ca83a123.objicon, player);
                player.hiding_munitions_purchase = undefined;
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x241b
// Size: 0x48
function checkpoint_edit_munitions(interaction) {
    self endon("disconnect");
    self endon("last_stand");
    level endon("game_ended");
    level endon("close_munitions_store");
    interaction disableplayeruse(self);
    self setclientomnvar("cp_open_cac", 3);
    wait 1;
    interaction enableplayeruse(self);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x246b
// Size: 0x53
function checkpoint_edit_role(interaction) {
    self endon("disconnect");
    self endon("last_stand");
    level endon("game_ended");
    level endon("close_munitions_store");
    interaction disableplayeruse(self);
    self.role_edit = 1;
    self setclientomnvar("cp_open_cac", 5);
    wait 1;
    interaction enableplayeruse(self);
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24c6
// Size: 0x64
function checkpoint_add_spawnpoint(checkpoint, origin, angles) {
    s = spawnstruct();
    s.origin = origin;
    s.angles = angles;
    s.type = "player_spawn";
    s.checkpoint = checkpoint;
    return s;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2533
// Size: 0x64
function function_51b0d14867f16470(mission, checkpoint, targetname) {
    if (!isdefined(level.var_2a02072872ccd8a1)) {
        return;
    }
    if (!isdefined(level.var_2a02072872ccd8a1[mission])) {
        return;
    }
    if (!isdefined(level.var_2a02072872ccd8a1[mission][checkpoint])) {
        return;
    }
    level.var_2a02072872ccd8a1[mission][checkpoint].var_23c5a6352ce4150e = targetname;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x259f
// Size: 0x2b
function function_e2aa894ae0cf3455(checkpoint, targetname) {
    level.var_aa13322507f4f9e8[checkpoint] = getstructarray(targetname, "targetname");
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d2
// Size: 0x11
function function_16f5e35ccefe859e() {
    return self.pers["checkpoint_spawnpoint"];
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ec
// Size: 0x94
function function_5b0a03741aa420d7() {
    foreach (player in level.players) {
        struct = spawnstruct();
        struct.angles = player getplayerangles(1);
        struct.origin = player getorigin();
        player.pers["checkpoint_spawnpoint"] = struct;
    }
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2688
// Size: 0x11
function function_903f68999f98fa78() {
    self.pers["checkpoint_spawnpoint"] = undefined;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26a1
// Size: 0xe3
function function_666625d0030969ff(checkpoint) {
    if (getdvarint(@"hash_ef675b8b6b09b0f", 1)) {
        spawnpoint = function_16f5e35ccefe859e();
        if (isdefined(spawnpoint)) {
            spawnpoint.inuse = 1;
            return spawnpoint;
        }
        if (isdefined(level.var_aa13322507f4f9e8[checkpoint])) {
            spawnpoints = level.var_aa13322507f4f9e8[checkpoint];
            if (isfunction(level.var_aa13322507f4f9e8[checkpoint])) {
                spawnpoints = [[ level.var_aa13322507f4f9e8[checkpoint] ]]();
            }
            foreach (spawnpoint in spawnpoints) {
                if (!istrue(spawnpoint.inuse)) {
                    spawnpoint.inuse = 1;
                    return spawnpoint;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x278d
// Size: 0x64
function checkpoint_add_carepackage(checkpoint, origin, angles) {
    s = spawnstruct();
    s.origin = origin;
    s.angles = angles;
    s.type = "carepackage";
    s.checkpoint = checkpoint;
    return s;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x27fa
// Size: 0x64
function checkpoint_add_carepackage_munitions(checkpoint, origin, angles) {
    s = spawnstruct();
    s.origin = origin;
    s.angles = angles;
    s.type = "carepackage_munitions";
    s.checkpoint = checkpoint;
    return s;
}

// Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2867
// Size: 0x33
function function_4bfef22c47a65be5(checkpoint) {
    cmd = "devgui_cmd \"CP Debug:2 / Checkpoints / " + checkpoint + "\" \"set scr_checkpoint_debug checkpoint_:" + checkpoint + "\" \n";
    addentrytodevgui(cmd);
}

/#

    // Namespace namespace_9bd6c605a5e74215 / scripts\cp\cp_checkpoint
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x28a2
    // Size: 0x170
    function function_7d2ee45f1241a17a(var_f91e0918144a746e) {
        flag_wait("<dev string:xe8>");
        items = strtok(var_f91e0918144a746e, "<dev string:xff>");
        params = strtok(var_f91e0918144a746e, "<dev string:x101>");
        playertoks = strtok(var_f91e0918144a746e, "<dev string:x103>");
        player = undefined;
        if (playertoks.size > 1) {
            playerint = int(playertoks[1]);
            player = level.players[playerint];
        }
        switch (items[0]) {
        case #"hash_1da4229a165378a0":
            function_5ace495feba111d3();
            foreach (player in level.players) {
                player scripts\cp\cp_checkpoint::function_903f68999f98fa78();
            }
            break;
        case #"hash_c62ca67d7a04c8df":
            if (params.size > 1) {
                var_10211caa50ddba2d = params[1];
            } else {
                if (!isdefined(level.var_3e7e946ee7aef4e8)) {
                    level.var_3e7e946ee7aef4e8 = 0;
                }
                var_10211caa50ddba2d = "<dev string:x116>" + level.var_3e7e946ee7aef4e8;
                level.var_3e7e946ee7aef4e8++;
            }
            checkpoint_set(var_10211caa50ddba2d);
            break;
        default:
            break;
        }
    }

#/