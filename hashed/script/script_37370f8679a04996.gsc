// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_activities_aethernest_cs;

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_activities_aethernest_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_activities_aethernest_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_activities_aethernest_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_activities_aethernest_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x538
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25904.8, -38753.1, 3216.67), (3.9, 57.97, -2.29), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25844.8, -38790.7, 3218.47), (4.13, 215.46, -2.7), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24486.7, -25999.2, 3203.17), (3.9, 327.97, -2.29), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24445.6, -25940.8, 3204.97), (4.43, 132.67, -2.16), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.name = "ai_encounter_spawnpoint";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22630.4, -17847.5, 3019.83), (4, 322.72, -1.85), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.animation = "ai_jup_crawler_abom_two_drop_01_idle";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "custom";
    s.var_2b2ae43751de4aa7 = "nest_crawler_spawnpoint";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22592.8, -17789.6, 3024.47), (4.14, 125.68, -2.68), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ba
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_activities_aethernest_cs");
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d0
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

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_aethernest_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_846f35e9504a1450":
        function_f9bfe1fa840a2b25(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_bc9ad1e840323e20":
        function_9e252a4de25f2fc9(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_c480006956a97a34":
        function_51abf58cdba3ebd1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cc
// Size: 0x792
function function_f9bfe1fa840a2b25(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22605, -17820, 3059), (0, 251.44, 0), "ceiling_spawner", "AETHERNEST_I_GAS_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22548.8, -18007.6, 2905), (0, 241.45, 0), "AETHERNEST_I_GAS_NORTH", "AETHERNEST_GAS_STATION_03", "750", undefined, undefined, (0, 0, 0), (0, 0, 0), 750);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22500.4, -17798.4, 2915), (0, 204.61, 0), "s_loot_cache_spawn", "AETHERNEST_I_GAS_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (222, 340, 92);
    s.var_74e936bbadd15418 = (256, 668, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22548.1, -17978.2, 2927.5), (0, 134.14, 0), "aethernest_interior_trigger", "AETHERNEST_I_GAS_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22338.3, -18134.4, 2943.66), (335, 223.44, 90), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22281.7, -18178.5, 2987.5), (298.93, 186.02, 76.95), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "5", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22855.6, -17777.1, 2914.55), (0, 139.25, 0), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22716, -18066.8, 2995.59), (29.92, 136.42, 92.15), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22219.1, -17967.1, 2994), (0, 47.45, 90), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22807.3, -17737.6, 3062.5), (358.5, 151.45, -180), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22955.4, -17937.5, 2958.71), (55.76, 52, -89.34), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22998.3, -17894.3, 3049.06), (353.19, 45.84, -116.14), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22155, -18047.3, 3049), (38.75, 129.48, 144.22), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22489.8, -17982.4, 2981), (0, 231.45, 90), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22693.8, -17572.1, 2983.87), (72.56, 53.13, 92.56), "s_cyst_spawn", "AETHERNEST_I_GAS_NORTH", "2", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1165
// Size: 0x6a4
function function_9e252a4de25f2fc9(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25874.5, -38775.6, 3256), (0, 236.75, 0), "ceiling_spawner", "AETHERNEST_I_MILCAMP_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25824.7, -38973.1, 3102), (0, 238.96, 0), "AETHERNEST_I_MILCAMP_SOUTH", "AETHERNEST_MILITARY_CAMP_WAREHOUSE_01", "450", undefined, undefined, (0, 0, 0), (0, 0, 0), 450);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (222, 333, 114);
    s.var_74e936bbadd15418 = (256, 274, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25825.3, -38943.7, 3124.5), (0, 131.66, 0), "aethernest_interior_trigger", "AETHERNEST_I_MILCAMP_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25833.4, -38968.5, 3248), (0, 44.96, 119.9), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25552.3, -39135.5, 3134), (360, 135.56, 45), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25583.3, -39181.5, 3240), (0, 172.88, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26110.9, -38826.3, 3217.75), (360, 314.89, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25674.9, -38751.2, 3170), (0, 44.96, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25691.2, -39150.5, 3127.5), (0, 219.09, 0), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25928.5, -39194, 3245), (354.46, 254.45, 109.07), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25940.8, -39107.2, 3128), (0, 150.2, 0), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26132.2, -39009.5, 3211), (0, 228.96, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_SOUTH", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25699.4, -38902.4, 3128), (0, 44.91, 0), "s_loot_cache_spawn", "AETHERNEST_I_MILCAMP_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1810
// Size: 0x6a4
function function_51abf58cdba3ebd1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "ceiling_spawners";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24462.2, -25969.3, 3244), (0, 159.86, 0), "ceiling_spawner", "AETHERNEST_I_MILCAMP_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24260.9, -25989.6, 3091), (0, 169.54, 0), "AETHERNEST_I_MILCAMP_CENTRAL", "AETHERNEST_MILITARY_CAMP_WAREHOUSE_01", "450", undefined, undefined, (0, 0, 0), (0, 0, 0), 450);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (222, 333, 114);
    s.var_74e936bbadd15418 = (256, 274, 32);
    s.groupid = "triggers";
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24288.7, -25979.8, 3113.5), (0, 62.24, 0), "aethernest_interior_trigger", "AETHERNEST_I_MILCAMP_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24268.3, -25997.8, 3231), (0, 323.56, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24014.8, -25778.7, 3120.25), (0, 66.14, 45), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23990.9, -25832.9, 3232.25), (0, 111.14, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24485.9, -26219.8, 3203), (0, 245.48, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24419.7, -25781.7, 3161), (0, 335.55, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24043.7, -25920.2, 3114.25), (0, 149.67, 0), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24079.6, -26166.2, 3231.25), (360, 191.25, 105.2), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24165.5, -26148.8, 3115.25), (0, 80.79, 0), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "6", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.groupid = "cyst_spawnpoints";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24314.9, -26294.8, 3199), (0, 152.48, 90), "s_cyst_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", "4", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_activities_aethernest_cs";
    s.name = "loot_cache_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24149.4, -25751.4, 3116), (0, 152.11, 0), "s_loot_cache_spawn", "AETHERNEST_I_MILCAMP_CENTRAL", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_i_ob_activities_aethernest_cs/namespace_847be010ee7a4242
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebb
// Size: 0x28f
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (22686.5, -17873, 3188.25);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(22513, -18006.6, 2917)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:850];
    var_fdc9acdc19473f08["AETHERNEST_I_GAS_NORTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (25814.1, -38967.2, 3302.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(25821, -38971.6, 3114)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:450];
    var_fdc9acdc19473f08["AETHERNEST_I_MILCAMP_SOUTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_aethernest";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_i_ob_activities_aethernest_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (24257.3, -25980.9, 3305.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(24261, -25985.6, 3103)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:450];
    var_fdc9acdc19473f08["AETHERNEST_I_MILCAMP_CENTRAL"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
