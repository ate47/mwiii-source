// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_activities_aethernest_cs;

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_activities_aethernest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_activities_aethernest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_activities_aethernest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_activities_aethernest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x538
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (295.11, 26371.7, 994.81), (2.66, 116.46, -3.11), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (336, 26311.5, 999.5), (355.88, 329.02, -1.27), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1191.15, 18235.4, 1138.81), (2.46, 112.96, -3.27), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1154, 18172.8, 1143.28), (355.96, 325.52, -1.04), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2465.1, 32821.7, 1301.81), (2.66, 116.46, -3.11), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2506, 32761.5, 1306.5), (355.88, 329.02, -1.27), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f2
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x908
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERNEST";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_aethernest";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x979
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_aethernest_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_67abf027bd160333":
        function_2a49d96612b126cc(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_df6c150ef8f09942":
        function_638429712a9300df(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_2e61317587d80329":
        function_d23ee8ad1f2e44c2(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x78b
function function_2a49d96612b126cc(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1176.69, 18203.9, 1175.5), (0, 9.81, 0), "ceiling_spawner", "AETHERNEST_POWERPLANT_GAS", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1014.25, 18233.8, 1028), (0, 0, 0), "AETHERNEST_POWERPLANT_GAS", "AETHERNEST_GAS_STATION_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (216, 320, 92);
    s.var_74e936bbadd15418 = (256, 668, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1015.25, 18232.2, 1033.5), (0, 255.01, 0), "aethernest_interior_trigger", "AETHERNEST_POWERPLANT_GAS", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-795.25, 18124.8, 1064.25), (335, 341.8, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-724.5, 18098.8, 1107), (298.15, 292.91, 87.04), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1353.25, 18402, 1029), (27.46, 257.61, 0), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1035.25, 18419.6, 1108.25), (29.92, 261.23, 92.15), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-852.25, 17930.2, 1070), (0, 165.81, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1370.5, 18342, 1181.25), (358.5, 269.81, 180), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1276, 18568.5, 1075.25), (55.76, 170.35, -89.34), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1326.75, 18580.8, 1165.5), (354.99, 158.64, -107.31), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-778.75, 17918.5, 1168), (38.75, 247.84, 144.22), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-974, 18179.5, 1107.75), (0, 349.81, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1461.75, 18152.2, 1097.5), (72.57, 171.48, 92.56), "s_cyst_spawn", "AETHERNEST_POWERPLANT_GAS", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1174.75, 18113.5, 1031.5), (0, 314.07, 0), "s_loot_cache_spawn", "AETHERNEST_POWERPLANT_GAS", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1196
// Size: 0xc0f
function function_638429712a9300df(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2301.75, 32680.3, 1289.5), (0, 180, 84.38), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2579.75, 32689.6, 1333.5), (0.01, 90.33, 111.84), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2479.26, 32795.8, 1339), (0, 275.87, -0), "ceiling_spawner", "AETHERNEST_INDUSTRYPARK_DELI", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2654.6, 32986, 1329.75), (0.01, 0.33, 111.84), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2761.25, 32625.5, 1330.25), (30.78, 279.23, 107.62), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2765, 32871.9, 1231.78), (76.09, 180, 0), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2662.65, 32482.8, 1259.44), (0.01, 178.83, 90.55), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2589, 32496.1, 1327.25), (3.49, 139.54, 115.91), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2392.25, 32979.8, 1215.5), (352.17, 357.39, 48.12), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2761.04, 32930, 1299.23), (0.1, 270.31, 96.93), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2696.5, 32689.6, 1343.75), (359.69, 90.1, -173.25), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2273.5, 32488.8, 1332), (0.16, 178.03, 125.39), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2037.5, 32682.1, 1331.52), (30.18, 37.92, 116.45), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1981, 32830.5, 1331.25), (0, 90, 120.47), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1979.75, 32938.2, 1329.61), (0, 90, 113.72), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2117.5, 32810.8, 1344.5), (0, 90, -180), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2103.25, 32984.1, 1213.56), (0, 0, 46.05), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2561.75, 32979.3, 1330.25), (1.88, 321.71, 112.03), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2403, 32690.8, 1337.5), (0, 180, 143.2), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2173.05, 32917.3, 1343.75), (0, 245, -180), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cycsts";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2582, 32725.3, 1286.92), (357.67, 267.67, 98.23), "s_cyst_spawn", "AETHERNEST_INDUSTRYPARK_DELI", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "lootcache_spawns";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2206.25, 32829.8, 1211), (0, 0, 0), "s_loot_cache_spawn", "AETHERNEST_INDUSTRYPARK_DELI", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (476, 158, 32.75);
    s.var_74e936bbadd15418 = (304, 347, 103.25);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2287.75, 32832.5, 1313.75), (0, 0, 0), "aethernest_interior_trigger", "AETHERNEST_INDUSTRYPARK_DELI", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2276, 32699, 1204), (0, 180, 0), "AETHERNEST_INDUSTRYPARK_DELI", "AETHERNEST_STORE_ABANDONED_SM_08", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dac
// Size: 0x78b
function function_d23ee8ad1f2e44c2(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (120, 362, 86);
    s.var_74e936bbadd15418 = (134, 338, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (262, 26275, 906), (0, 339.5, 0), "aethernest_interior_trigger", "AETHERNEST_POWERPLANT_TRAILER", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (302.43, 26333.8, 1034), (360, 10, 0), "ceiling_spawner", "AETHERNEST_POWERPLANT_TRAILER", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (299, 26319, 888), (0, 0, 0), "AETHERNEST_POWERPLANT_TRAILER", "AETHERNEST_OFFICE_IND_03", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (67.03, 25983.1, 913.4), (354.46, 158.37, 58.39), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (69, 25977.5, 983.5), (45.8, 162, 84.81), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (382.5, 26272.6, 906), (0, 67.98, 0), "s_loot_cache_spawn", "AETHERNEST_POWERPLANT_TRAILER", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (451, 26604, 968.25), (0, 340, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (511.54, 26568.3, 1024.09), (20.84, 305.85, 112.07), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (263.11, 25928.3, 1023), (321.37, 157.94, 154.85), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (251, 26331.5, 1033.5), (0, 270, -180), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (213.69, 26526.2, 919.21), (45.99, 71.99, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (178, 26414.3, 975.5), (320.01, 69.49, 91.06), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (346.95, 26313.7, 1034), (0, 65, -180), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (320.7, 26055.8, 1029.25), (2.04, 245.88, 130.08), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (200.5, 26238.2, 989), (0, 344, 90), "s_cyst_spawn", "AETHERNEST_POWERPLANT_TRAILER", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_aethernest_cs/namespace_2259d18cfebbd842
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253e
// Size: 0x28f
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1206, 18264.1, 1326.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-1179.25, 18274.8, 1032)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:750];
    var_fdc9acdc19473f08["AETHERNEST_POWERPLANT_GAS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (2389, 32772, 1420.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(2361, 32778, 1203)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:650];
    var_fdc9acdc19473f08["AETHERNEST_INDUSTRYPARK_DELI"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (281.75, 26269.2, 1102.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(283, 26283, 888)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:650];
    var_fdc9acdc19473f08["AETHERNEST_POWERPLANT_TRAILER"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

