// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs;

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x219
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_contracts_vehicle_drive_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_contracts_vehicle_drive_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_contracts_vehicle_drive_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_contracts_vehicle_drive_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x641
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35096, 23776, 4992), (0, 35, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25816, 20672, 5824), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25080, 32704, 5152), (0, 125, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20152, 34496, 6496), (0, 170, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22136, 41120, 5504), (0, 230, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29784, 38240, 5696), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33400, 33440, 4544), (0, 320, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19992, 27008, 5728), (0, 350, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28376, 27168, 5824), (0, 80, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.classname_mp = "script_vehicle_iw8_lbravo_carrier";
    s.script_unload = "default";
    s.spawngroup = "heli_test_guys";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28728, 43168, 5696), (0, 275, 0), undefined, undefined, "heli_reinforceNode", undefined, undefined, undefined, undefined, undefined, 45);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-40864, 36968, 960), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32223, 19843, 907.23), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16636, 20996, 2287.39), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15402, 36002, 2476.18), (0, 0, 0), "dmz_vehicledrive_end", undefined, undefined, undefined, undefined, undefined, undefined, 200);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x944
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_contracts_vehicle_drive_cs");
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x964
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

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d5
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_31f9b68b7b4494a4":
        function_2481f5507af33d27(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_96436180e4aa8062":
        function_45dbf9e1d023136d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa47
// Size: 0x1d1
function function_2481f5507af33d27(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22532, 24216, 1764), (0, 339, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22216.5, 24196.5, 1703.53), (0, 315, 0), "vehicledrive_horde", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22728, 24460, 1704), (0, 315, 0), "vehicledrive_guard", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_SOUTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21122, 20982, 1794.75), (270, 45, 0), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_A_GARAGE_GASSTATION_SOUTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1f
// Size: 0x1d1
function function_45dbf9e1d023136d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27652, 39428, 1626), (0, 245, 0), "dmz_vehicledrive_start", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), 15000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27855, 39202.2, 1566.05), (0, 225, 0), "vehicledrive_horde", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27675, 39678, 1567.5), (0, 270, 0), "vehicledrive_guard", "VEHICLE_DRIVE_A_GARAGE_GASSTATION_NORTH", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24622, 37270, 1830.5), (270, 0, 0), "activity_nexus_instance_joiner", undefined, "VEHICLE_DRIVE_A_GARAGE_GASSTATION_NORTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_a_ob_contracts_vehicle_drive_cs/namespace_c53cc58959bd5ec4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf7
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-22532, 24216, 1720);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-22591.5, 24354, 1705.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_A_GARAGE_GASSTATION_SOUTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_vehicle_drive";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_a_ob_contracts_vehicle_drive_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-27652, 39428, 1584);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-27684.5, 39559.5, 1567.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:350];
    var_fdc9acdc19473f08["VEHICLE_DRIVE_A_GARAGE_GASSTATION_NORTH"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

