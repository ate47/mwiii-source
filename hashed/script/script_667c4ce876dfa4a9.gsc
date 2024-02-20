// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x474
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a8
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_STRONGHOLD";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62f
// Size: 0x9d
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_ccc1209e1c9d8e76":
        function_c5967eb0ab661a81(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_5e7e8405f9c48391":
        function_42ef57df9e29b166(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4a2a2b7602614224":
        function_91e6ecd1a9477d47(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c627baa21d508ad9":
        function_6316ebd56a7444ac(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d3
// Size: 0x18e
function function_c5967eb0ab661a81(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_a_apartment_abandoned_md_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23135.8, 39551.1, 2086.37), (0, 0, 0), undefined, "MERC_STRONGHOLD_APARTMENT_ABANDONED_MD_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23552.3, 39123.5, 2099.88), (0, 0, 0), "MERC_STRONGHOLD_A_APARTMENT_ABANDONED_MD_02_main", "MERC_STRONGHOLD_APARTMENT_ABANDONED_MD_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23666.1, 39166.1, 2236), (0, 136, 0), undefined, "MERC_STRONGHOLD_APARTMENT_ABANDONED_MD_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x868
// Size: 0x18e
function function_42ef57df9e29b166(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_a_store_abandoned_lg_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23372.2, 18540.6, 1514.94), (0, 0, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_LG_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22881.5, 17646.5, 1520), (0, 0, 0), "MERC_STRONGHOLD_A_STORE_ABANDONED_LG_02_main", "MERC_STRONGHOLD_STORE_ABANDONED_LG_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22988.6, 17830.2, 1656), (0, 270, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_LG_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fd
// Size: 0x18e
function function_91e6ecd1a9477d47(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_a_store_abandoned_md_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31639.2, 24198.1, 1272), (0, 0, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32008.4, 23572.1, 1292), (0, 0, 0), "MERC_STRONGHOLD_A_STORE_ABANDONED_MD_01_main", "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31861.8, 23727.9, 1418), (0, 186, 0), undefined, "MERC_STRONGHOLD_STORE_ABANDONED_MD_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb92
// Size: 0x18e
function function_6316ebd56a7444ac(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.name = "spawn_heli_reinforcements";
    s.script_parameters = "merc_stronghold_a_apartment_24_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28665.2, 43607.9, 1680), (0, 0, 0), undefined, "MERC_STRONGHOLD_APARTMENT_24", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28659.3, 42291.8, 1558), (0, 0, 0), "MERC_STRONGHOLD_A_APARTMENT_24_main", "MERC_STRONGHOLD_APARTMENT_24", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28716.9, 41994.1, 1694), (0, 64, 0), undefined, "MERC_STRONGHOLD_APARTMENT_24", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_activities_merc_stronghold_cs/namespace_f7b48e29d7b7dd93
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd27
// Size: 0xbc9
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-23552.3, 39123.5, 2636);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:800];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.locationorigin = [0:(-23552.3, 39123.5, 2099.88)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1700];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_A_APARTMENT_ABANDONED_MD_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-22881.5, 17646.5, 2056);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1200];
    var_5f614235e4cbbd5b.locationorigin = [0:(-22881.5, 17646.5, 1520)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1700];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_A_STORE_ABANDONED_LG_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-32009.1, 23571.8, 1682);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:400];
    var_5f614235e4cbbd5b.locationorigin = [0:(-32009.1, 23571.8, 1292)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_A_STORE_ABANDONED_MD_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-28659.3, 42291.8, 2230);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:610];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(-28659.3, 42291.8, 1558)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_A_APARTMENT_24"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

