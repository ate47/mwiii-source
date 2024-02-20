// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_interactions_turret_trap_cs;

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_interactions_turret_trap_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_interactions_turret_trap_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_interactions_turret_trap_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_interactions_turret_trap_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x452
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_interactions_turret_trap_cs");
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_TURRET_TRAP";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3
// Size: 0xe8
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_486fe0a766be194f":
        function_92d441dd8b4c820a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_881342ea73ddfa69":
        function_2f5ffeb7f8b69ec6(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_3ef11d2d30168b04":
        function_a3e8140b9d1227e3(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_98f2adfbfc4c66c7":
        function_15fead11ebb67920(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4094ab1a15d620fe":
        function_a94ddcf71dd25ccf(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c244752af50df861":
        function_afb43bee169e245c(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_85a0b8bc71fb3b8e":
        function_144344db8fe567ed(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d2
// Size: 0x163
function function_92d441dd8b4c820a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41046, 11705.8, 3364.5), (0, 268, 0), "turret_trap_spawn", "s_turret_trap_f_town", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41047.1, 11706.9, 3449), (0, 178, 0), "s_turret_trap_f_town", undefined, "activity_turret_trap_f_town", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41043.9, 11678, 3414.5), (0, 178, 0), "turret_trap_panel", "s_turret_trap_f_town", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73c
// Size: 0x163
function function_2f5ffeb7f8b69ec6(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25995, 6395.8, 1564.5), (0, 332.8, 0), "turret_trap_spawn", "s_turret_trap_f_shack", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25994.5, 6397.27, 1649), (0, 242.8, 0), "s_turret_trap_f_shack", undefined, "activity_turret_trap_f_shack", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26019.3, 6382.06, 1614.5), (0, 242.8, 0), "turret_trap_panel", "s_turret_trap_f_shack", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a6
// Size: 0x163
function function_a3e8140b9d1227e3(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30658.4, -5246.76, 2736.5), (0, 246.7, 0), "turret_trap_spawn", "s_turret_trap_f_cliffside", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30659.8, -5246.16, 2821), (0, 156.7, 0), "s_turret_trap_f_cliffside", undefined, "activity_turret_trap_f_cliffside", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30646.3, -5271.94, 2786.5), (0, 156.7, 0), "turret_trap_panel", "s_turret_trap_f_cliffside", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa10
// Size: 0x163
function function_15fead11ebb67920(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31180.2, -1416.68, 2239.5), (0, 119.6, 0), "turret_trap_spawn", "s_turret_trap_f_crossroad", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31179.8, -1418.16, 2324), (0, 29.6, 0), "s_turret_trap_f_crossroad", undefined, "activity_turret_trap_f_crossroad", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31167.4, -1391.84, 2289.5), (0, 29.6, 0), "turret_trap_panel", "s_turret_trap_f_crossroad", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0x163
function function_a94ddcf71dd25ccf(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33605.2, -12337.1, 3127.75), (0, 283.8, 0), "turret_trap_spawn", "s_turret_trap_f_cafe", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33605.9, -12335.8, 3212.25), (0, 193.8, 0), "s_turret_trap_f_cafe", undefined, "activity_turret_trap_f_cafe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33610.8, -12364.5, 3177.75), (0, 193.8, 0), "turret_trap_panel", "s_turret_trap_f_cafe", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce4
// Size: 0x163
function function_afb43bee169e245c(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43700.1, -4199.84, 3294.5), (0, 265.1, 0), "turret_trap_spawn", "s_turret_trap_f_shipment", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43701.3, -4198.83, 3379), (0, 175.1, 0), "s_turret_trap_f_shipment", undefined, "activity_turret_trap_f_shipment", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43696.6, -4227.55, 3344.5), (0, 175.1, 0), "turret_trap_panel", "s_turret_trap_f_shipment", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4e
// Size: 0x163
function function_144344db8fe567ed(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31266.7, 4892.85, 2376.5), (0, 301.5, 0), "turret_trap_spawn", "s_turret_trap_f_tin", "turret_trap_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31267.1, 4894.38, 2461), (0, 211.5, 0), "s_turret_trap_f_tin", undefined, "activity_turret_trap_f_tin", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31280.3, 4868.47, 2426.5), (0, 211.5, 0), "turret_trap_panel", "s_turret_trap_f_tin", "turret_trap_panel", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_f_ob_interactions_turret_trap_cs/namespace_406c2f76088a332b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb8
// Size: 0x5d0
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (41048.1, 11705, 3467);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(41049.9, 11701.5, 3497)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_TOWN"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (25996.6, 6397.36, 1667);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(26000.6, 6397.5, 1697)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_SHACK"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (30660, -5248.25, 2839);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(30660.4, -5252.23, 2869)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_CLIFFSIDE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (31178, -1417.06, 2342);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(31174.6, -1414.97, 2372)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_CROSSROAD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (33607.4, -12337.3, 3230.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(33610.1, -12340.3, 3260.25)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_CAFE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (43702.1, -4200.74, 3397);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(43703.8, -4204.4, 3427)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_SHIPMENT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_turret_trap";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_interactions_turret_trap_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (31268.8, 4893.31, 2479);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(31272.4, 4891.38, 2509)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:100];
    var_fdc9acdc19473f08["TURRET_TRAP_F_TIN"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
