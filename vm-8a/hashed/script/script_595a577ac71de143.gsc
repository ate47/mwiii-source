#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\callbacks.gsc;
#using script_5438ebe20b6ec614;
#using script_638d701d263ee1ed;
#using script_19c169a442d5975a;

#namespace ob_visionset;

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25e
// Size: 0x1a
function function_b17698b01ef99a95() {
    callback::add("player_region_difficulty_change", &function_f83939ddb2573de8);
    init_internal();
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x69
function function_da135ec070e2e6e8(str_vision, var_7433545f29b128f7, var_25ec1993359bcfdf) {
    root = function_53f47ae03d865dab();
    if (isdefined(str_vision)) {
        root.override_vision = str_vision;
    }
    if (isdefined(var_7433545f29b128f7)) {
        root.var_e190a9f1018c081a = var_7433545f29b128f7;
    }
    if (isdefined(var_25ec1993359bcfdf)) {
        root.var_25ec1993359bcfdf = var_25ec1993359bcfdf;
    }
    init_internal();
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f1
// Size: 0x37
function private init_internal() {
    init_vfx();
    root = function_53f47ae03d865dab();
    level callback::add("player_spawned", &on_player_spawn);
    /#
        level function_5cf9263cdde7f142();
    #/
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x330
// Size: 0x73
function private on_player_spawn(params) {
    check_start();
    root = function_53f47ae03d865dab();
    thread namespace_6c72573a48881070::function_cb1caaf18300a508();
    if (isdefined(root.var_e190a9f1018c081a)) {
        function_dd25c590d4badd78(root.var_e190a9f1018c081a);
    }
    if (isdefined(root.override_vision)) {
        waitframe();
        namespace_6c72573a48881070::function_27a921508cb04613(root.override_vision, 0.25);
    }
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ab
// Size: 0x75
function private function_f83939ddb2573de8(params) {
    player = params.player;
    newdifficulty = params.new_difficulty;
    olddifficulty = params.old_difficulty;
    player function_dd25c590d4badd78(function_a981dfc82d83237(newdifficulty));
    player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(newdifficulty));
    player thread function_bd72e98353976267(newdifficulty);
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x428
// Size: 0x7f
function private function_bd72e98353976267(zone_difficulty) {
    vision = function_a99354442cd0039f(zone_difficulty);
    last_vision = self.var_d68047cbd7bc9d3b;
    if (isdefined(last_vision) && last_vision == vision) {
        return false;
    }
    if (istrue(namespace_6c72573a48881070::function_8e888e08a6ab22d3(vision))) {
        return false;
    }
    if (isdefined(last_vision) && last_vision != vision) {
        namespace_6c72573a48881070::function_9a92ae402e209ecc(last_vision, 0.25);
        waitframe();
    }
    namespace_6c72573a48881070::function_27a921508cb04613(vision, 0.25);
    self.var_d68047cbd7bc9d3b = vision;
    return true;
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x71
function private function_a99354442cd0039f(zone_difficulty) {
    vision_name = "mp_jup_bigmap_green";
    if (isdefined(zone_difficulty)) {
        switch (zone_difficulty) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec": 
            vision_name = "mp_jup_bigmap_red";
            break;
        case #"hash_af83e47edfa8900a": 
            vision_name = "mp_jup_bigmap_yellow";
            break;
        default: 
            break;
        }
    }
    return vision_name;
}

/#

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x52a
    // Size: 0xae
    function private function_5cf9263cdde7f142() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x3f>" + "<dev string:x2f>", &debug_visionset);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x50>", "<dev string:x3f>" + "<dev string:x50>", &debug_visionset);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x62>", "<dev string:x3f>" + "<dev string:x62>", &debug_visionset);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x78>", "<dev string:x81>", &function_97ec04fd36f9b911);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x9a>", "<dev string:xa7>", &function_46a1a0c6592edc27);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:xc4>", "<dev string:xdc>", &function_34ec067faab1f472);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x5e0
    // Size: 0x84
    function private debug_visionset(params) {
        if (!isdefined(params[0]) || is_equal(params[0], "<dev string:xf6>")) {
            return;
        }
        level.player function_dd25c590d4badd78(function_a981dfc82d83237(params[0]));
        level.player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(params[0]));
        level.player thread function_bd72e98353976267(params[0]);
        iprintlnbold("<dev string:xf7>" + function_a99354442cd0039f(params[0]));
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x66c
    // Size: 0x81
    function private function_34ec067faab1f472(params) {
        foreach (player in level.players) {
            if (isalive(player) && isplayer(player)) {
                player namespace_6c72573a48881070::function_cb1caaf18300a508();
            }
        }
        iprintlnbold("<dev string:x110>");
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x6f5
    // Size: 0x67
    function private function_97ec04fd36f9b911(params) {
        level.player function_dd25c590d4badd78("<dev string:x125>");
        level.player function_e6965cda6f8ff5d("<dev string:x138>");
        level.player function_e6965cda6f8ff5d("<dev string:x138>");
        level.player namespace_6c72573a48881070::function_27a921508cb04613("<dev string:x14e>", 0.25);
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x764
    // Size: 0x90
    function private function_46a1a0c6592edc27(params) {
        foreach (player in level.players) {
            if (isalive(player)) {
                player function_dd25c590d4badd78("<dev string:x15e>");
                player function_e6965cda6f8ff5d("<dev string:x138>");
                player namespace_6c72573a48881070::function_27a921508cb04613("<dev string:x175>", 0.5);
            }
        }
    }

#/

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0xa7
function function_29b46d591982c45a() {
    init_vfx();
    moodlist = function_5244353dfc2d15ff();
    level thread namespace_ced1636a962433d2::init(moodlist);
    level callback::add("player_connect", &on_connect);
    level callback::add("player_region_difficulty_change", &function_3388294e62fdd0bc);
    /#
        level function_1ad29958b0c16235();
    #/
    utility::flag_wait("aether_storm_initialized");
    level.aether_storm.radiation callback::add("player_entered_radiation", &function_cecaf5099ed3aa41);
    level.aether_storm.radiation callback::add("player_exited_radiation", &function_78983343268efcab);
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ab
// Size: 0xa7
function function_e466816b861caf8b() {
    init_vfx();
    moodlist = function_5244353dfc2d15ff();
    level thread namespace_ced1636a962433d2::init(moodlist);
    level callback::add("player_connect", &on_connect);
    level callback::add("player_spawned", &function_a3ffb5ca860e0fcb);
    /#
        level function_1ad29958b0c16235();
    #/
    utility::flag_wait("aether_storm_initialized");
    level.aether_storm.radiation callback::add("player_entered_radiation", &function_cecaf5099ed3aa41);
    level.aether_storm.radiation callback::add("player_exited_radiation", &function_a3ffb5ca860e0fcb);
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x12
function private on_connect(params) {
    check_start();
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x974
// Size: 0x3f
function private check_start() {
    root = function_53f47ae03d865dab();
    if (!isdefined(root.inited)) {
        root.inited = 1;
        if (istrue(root.var_25ec1993359bcfdf)) {
        }
    }
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bb
// Size: 0x7
function private function_5244353dfc2d15ff() {
    return "jup_ob_moodlist_default";
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cb
// Size: 0x137
function private function_3388294e62fdd0bc(params) {
    player = params.player;
    newdifficulty = params.new_difficulty;
    olddifficulty = params.old_difficulty;
    if (!isdefined(newdifficulty)) {
        return;
    }
    if (isdefined(player.var_56b758046d7fc64f) && player.var_56b758046d7fc64f == newdifficulty) {
        return;
    }
    player endon("death");
    level endon("game_ended");
    /#
        mood = function_a659642818f62c93(newdifficulty);
        if (isdefined(mood)) {
            iprintlnbold(mood.state.visionsetsuffix + "<dev string:x189>" + newdifficulty);
        }
    #/
    if (!isdefined(player.currentmood) && !istrue(player.var_5872a7af669d9983)) {
        player.var_5872a7af669d9983 = 1;
    }
    player function_dd25c590d4badd78(function_a981dfc82d83237(newdifficulty));
    player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(newdifficulty));
    player function_37ff5d03f010f57e(function_a659642818f62c93(newdifficulty));
    if (istrue(player.var_5872a7af669d9983)) {
        waitframe();
        player.var_5872a7af669d9983 = 0;
    }
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x40
function private function_cecaf5099ed3aa41(params) {
    player = params.player;
    if (isdefined(player)) {
        player function_dd25c590d4badd78("jup_ob_aether_storm_fx");
        player function_e6965cda6f8ff5d("mp_jup_ob_red_zone_fx");
    }
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb52
// Size: 0x8d
function private function_78983343268efcab(params) {
    player = params.player;
    if (isdefined(player) && isdefined(player.origin)) {
        difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(player.origin);
        player function_dd25c590d4badd78(function_a981dfc82d83237(difficulty));
        player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(difficulty));
        if (istrue(player.var_5872a7af669d9983)) {
            waitframe();
            player.var_5872a7af669d9983 = 0;
        }
    }
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe7
// Size: 0x32
function private function_a3ffb5ca860e0fcb(params) {
    function_dd25c590d4badd78("jup_ob_rift_run_fx");
    function_e6965cda6f8ff5d("mp_jup_ob_red_zone_fx");
    function_37ff5d03f010f57e(namespace_ced1636a962433d2::get_mood(3));
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc21
// Size: 0x6d
function private function_a659642818f62c93(region_difficulty) {
    mood_index = 0;
    if (isdefined(region_difficulty)) {
        switch (region_difficulty) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec": 
            mood_index = 2;
            break;
        case #"hash_af83e47edfa8900a": 
            mood_index = 1;
            break;
        default: 
            break;
        }
    }
    return namespace_ced1636a962433d2::get_mood(mood_index);
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc97
// Size: 0x26
function private function_53f47ae03d865dab() {
    if (!isdefined(level.ob_visionset)) {
        level.ob_visionset = spawnstruct();
    }
    return level.ob_visionset;
}

/#

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xcc6
    // Size: 0x172
    function private function_1ad29958b0c16235() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x19f>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x1b8>", "<dev string:x1cc>", &function_37d964772b906469);
        scripts\common\devgui::function_fe953f000498048f();
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x1df>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x200>" + "<dev string:x2f>" + "<dev string:x20c>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x50>", "<dev string:x200>" + "<dev string:x50>" + "<dev string:x20c>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x215>", "<dev string:x200>" + "<dev string:x215>" + "<dev string:x20c>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x78>", "<dev string:x225>" + "<dev string:x20c>", &function_8d0e7f7fe911132a);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x9a>", "<dev string:x239>" + "<dev string:x20c>", &function_943833c459d1100);
        scripts\common\devgui::function_fe953f000498048f();
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x251>");
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x200>" + "<dev string:x2f>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x50>", "<dev string:x200>" + "<dev string:x50>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x215>", "<dev string:x200>" + "<dev string:x215>", &debug_mood);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x78>", "<dev string:x225>", &function_8d0e7f7fe911132a);
        scripts\common\devgui::function_b23a59dfb4ca49a1("<dev string:x9a>", "<dev string:x239>", &function_943833c459d1100);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xe40
    // Size: 0xdf
    function private debug_mood(params) {
        if (!isdefined(params[0]) || is_equal(params[0], "<dev string:xf6>")) {
            return;
        }
        level.player function_dd25c590d4badd78(function_a981dfc82d83237(params[0]));
        level.player function_e6965cda6f8ff5d(function_d8ad2691db50eb0(params[0]));
        if (isdefined(params[1]) && params[1] == "<dev string:x27c>") {
            level.var_5872a7af669d9983 = 1;
            level.debugtransition = 1;
            level.player function_37ff5d03f010f57e(function_a659642818f62c93(params[0]));
            level.var_5872a7af669d9983 = 0;
            level.debugtransition = 0;
        } else {
            level.player function_37ff5d03f010f57e(function_a659642818f62c93(params[0]));
        }
        iprintln("<dev string:x284>" + params[0]);
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xf27
    // Size: 0xaa
    function private function_8d0e7f7fe911132a(params) {
        if (isdefined(params[0]) && params[0] == "<dev string:x27c>") {
            level.var_5872a7af669d9983 = 1;
            level.debugtransition = 1;
        }
        foreach (player in level.players) {
            if (isalive(player)) {
                player function_a3ffb5ca860e0fcb();
            }
        }
        level.var_5872a7af669d9983 = 0;
        level.debugtransition = 0;
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xfd9
    // Size: 0xab
    function private function_943833c459d1100(params) {
        if (isdefined(params[0]) && params[0] == "<dev string:x27c>") {
            level.var_5872a7af669d9983 = 1;
            level.debugtransition = 1;
        }
        foreach (player in level.players) {
            function_cecaf5099ed3aa41({#player:player});
        }
        level.var_5872a7af669d9983 = 0;
        level.debugtransition = 0;
    }

    // Namespace ob_visionset / namespace_3ce6fec06f172d0f
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x108c
    // Size: 0x44
    function private function_37d964772b906469(params) {
        level.player function_dd25c590d4badd78("<dev string:x29e>");
        level.player function_e6965cda6f8ff5d(undefined);
        level.player function_eb0326e0c8803f41(0);
    }

#/

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d8
// Size: 0x2
function private init_vfx() {
    
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0x18
function private function_dd25c590d4badd78(var_7433545f29b128f7) {
    utility::function_3677f2be30fdd581("jup_ob_fx", var_7433545f29b128f7);
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1102
// Size: 0x71
function private function_a981dfc82d83237(zone_difficulty) {
    fx_name = "jup_ob_fx_off";
    if (isdefined(zone_difficulty)) {
        switch (zone_difficulty) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec": 
            fx_name = "jup_ob_red_zone_fx";
            break;
        case #"hash_af83e47edfa8900a": 
            fx_name = "jup_ob_yellow_zone_fx";
            break;
        default: 
            break;
        }
    }
    return fx_name;
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x117c
// Size: 0x71
function private function_e6965cda6f8ff5d(var_8acbdb03885a9d78) {
    if (isdefined(self.var_1a56b3933b0e630c) && isdefined(var_8acbdb03885a9d78) && self.var_1a56b3933b0e630c == var_8acbdb03885a9d78) {
        return;
    }
    if (isdefined(self.var_1a56b3933b0e630c)) {
        function_fb39412d7c61e5c7(self.var_1a56b3933b0e630c, 1, self);
        self.var_1a56b3933b0e630c = undefined;
    }
    if (!isdefined(var_8acbdb03885a9d78)) {
        return;
    }
    function_aa6da985e05e2780(var_8acbdb03885a9d78, 1, self);
    self.var_1a56b3933b0e630c = var_8acbdb03885a9d78;
}

// Namespace ob_visionset / namespace_3ce6fec06f172d0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f5
// Size: 0x6d
function private function_d8ad2691db50eb0(zone_difficulty) {
    world_event = undefined;
    if (isdefined(zone_difficulty)) {
        switch (zone_difficulty) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec": 
            world_event = "mp_jup_ob_red_zone_fx";
            break;
        case #"hash_af83e47edfa8900a": 
            world_event = "mp_jup_ob_yellow_zone_fx";
            break;
        default: 
            break;
        }
    }
    return world_event;
}
