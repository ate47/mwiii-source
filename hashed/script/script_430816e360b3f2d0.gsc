// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs;

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_contracts_vehicle_drive_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_contracts_vehicle_drive_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_contracts_vehicle_drive_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_contracts_vehicle_drive_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0x605
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20746.8, 25020.7, 4985.76), (0, 35, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30433.9, 20242, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30278.9, 30208.2, 5167.14), (0, 125, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36687.7, 32969.7, 6492.55), (0, 170, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33256.1, 38072.7, 5503.6), (0, 230, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28960.8, 36094.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22678.6, 33347.1, 4532.85), (0, 320, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36868.9, 25469, 5731.74), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36540.3, 17361.6, 3303.59), (352, 12.31, 5.18), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21696, 25535, 1375.1), (0, 359.93, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31696, 38089, 1034), (0, 1.38, 0), "dmz_vehicledrive_end", undefined, "VEHICLE_DRIVE_TRAIN", undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28461.9, 25638, 5824.73), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26070.8, 39628.3, 5707.82), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fe
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_VEHICLE_DRIVE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x985
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_c96efca84c9aaa1e":
        function_329e0348c0550009(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x1d1
function function_329e0348c0550009(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31805.2, 34760.8, 1192), (0, 135, 0), "vehicledrive_horde", "VEHICLE_DRIVE_C_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32208, 34444, 1196), (0, 90, 0), "vehicledrive_guard", "VEHICLE_DRIVE_C_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31968, 34558, 1252), (0, 151, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_C_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30671.2, 38570.8, 1036.5), (270, 270, 0), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_C_GARAGE_GASSTATION_SOUTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_contracts_vehicle_drive_cs/namespace_78f598d5a0fb01e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb6
// Size: 0xeb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (31964, 34556, 1212);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(32101.8, 34539, 1193)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_C_GARAGE_GASSTATION_SOUTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

