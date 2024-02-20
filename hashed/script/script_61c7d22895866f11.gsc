// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_weapon_stash_cs;

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_weapon_stash_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_weapon_stash_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_weapon_stash_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_weapon_stash_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa
// Size: 0xa67
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4142, 38136, 1320), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4480, 37921, 1320), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4541, 37347, 1320), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4435, 37573, 1320), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3395, 37245, 1326), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2774, 37922, 1320), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3121, 37808, 1544), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "thermal_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4387, 37961, 1544), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10626, 32626, 1200), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10267, 32948, 1199.99), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10196, 33223, 1200), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10467, 33395, 1200), (0, 270, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10897, 32773, 1209), (0, 0, 0), undefined, undefined, "ai_encounter_spawnpoint");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_b13455d8cb3bcd74 = "zombie";
    s.groupid = "warehouse_spawnpoints";
    s.var_e5decd57d2e1579 = "3000";
    s.script_stealthgroup = "-1";
    s.var_9846517a0453cefb = "none";
    s.var_161186c731745abb = "-1";
    s.var_90a30a42ca3830f1 = "none";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10376, 33476, 1200), (0, 180, 0), undefined, undefined, "ai_encounter_spawnpoint");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd72
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_weapon_stash_cs");
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd88
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_WEAPON_STASH";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf9
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_54d122654fd09c98":
        function_a3b690964f6750b1(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_cee75d6728a96c07":
        function_391435c42faa1044(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x3d5
function function_a3b690964f6750b1(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5032, 37082.5, 1334.92), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2437, 37546, 1544), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1997.5, 37201.5, 1318), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4044, 39066, 1347.42), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3365.2, 37380.8, 1320), (0, 94.15, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3357.96, 37775.3, 1320), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2604.5, 36652.5, 1320), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-600.55, 35925.8, 1357.55), (270, 0, 27.34), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_B_THERMAL_PLANT", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4206.5, 37198.5, 1544), (0, 0, 0), undefined, "WEAPON_STASH_B_THERMAL_PLANT", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1247
// Size: 0x371
function function_391435c42faa1044(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9919.3, 33788.4, 1199.96), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11186.2, 32398.6, 1081.47), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10924, 31425.4, 1197.39), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9442.7, 34025.6, 1199.96), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9998.1, 31863.4, 1212.26), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    s.var_e1c68d186b8918b5 = "MERC_STRONGHOLD_TEST";
    s.var_5b6c0bbb3c3e9362 = "ZOMBIE_STRONGHOLD_F_RURAL_SHOP_MD";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10700.3, 33077.1, 1200), (0, 211.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_safe", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10462.3, 33154.1, 1200), (0, 121.63, 0), undefined, "WEAPON_STASH_B_WAREHOUSE_SM", "weaponstash_rift", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7340.75, 31764.8, 1256.5), (270, 91.91, -71.81), "activity_nexus_instance_joiner", undefined, "WEAPON_STASH_B_WAREHOUSE_SM", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_weapon_stash_cs/namespace_f6a6b867f6543d57
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15bf
// Size: 0x1bb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-3365.2, 37380.8, 1320);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-3364, 37414, 1320)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_B_THERMAL_PLANT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_weapon_stash";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_weapon_stash_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (10572, 33074, 1216);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(10699.5, 33076.5, 1200)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:200];
    var_fdc9acdc19473f08["WEAPON_STASH_B_WAREHOUSE_SM"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

