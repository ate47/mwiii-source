// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_activities_merc_stronghold_cs;

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_activities_merc_stronghold_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_activities_merc_stronghold_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_activities_merc_stronghold_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x657
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_activities_merc_stronghold_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c6
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x717
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_activities_merc_stronghold_cs");
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d
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

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79e
// Size: 0xb6
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_66b0dc0e744e028":
        function_6e541aab8d090a15(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_389728a288e42d9e":
        function_5070fba3d459b57f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_86c96f7554bfd527":
        function_50be2f4e50e673da(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f3152ea0682f1ac1":
        function_b8da58bef8cc444(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_8bfc15808e50ca6e":
        function_f9857e65858ed485(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b
// Size: 0x18e
function function_6e541aab8d090a15(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spwanpoint_reinforcements";
    s.script_parameters = "merc_stronghold_c_subbase_warehouse_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31872, 39592, 1047), (0, 0, 0), undefined, "MERC_STRONGHOLD_SUBBASE_WAREHOUSE_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32320, 40392, 1086.25), (0, 0, 0), "MERC_STRONGHOLD_C_SUBBASE_WAREHOUSE_02_main", "MERC_STRONGHOLD_SUBBASE_WAREHOUSE_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_subbase_warehouse_02_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32132, 39840, 1184), (0, 60, 0), undefined, "MERC_STRONGHOLD_SUBBASE_WAREHOUSE_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f0
// Size: 0x18e
function function_5070fba3d459b57f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_c_countdown_office_2s_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37191, 29214, 1768), (0, 135, 0), undefined, "MERC_STRONGHOLD_COUNTDOWN_OFFICE_2S_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36336, 29344, 1792), (0, 0, 0), "MERC_STRONGHOLD_C_COUNTDOWN_OFFICE_2S_01_main", "MERC_STRONGHOLD_COUNTDOWN_OFFICE_2S_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_countdown_office_2s_01_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35860, 29384, 1938), (0, 60, 0), undefined, "MERC_STRONGHOLD_COUNTDOWN_OFFICE_2S_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb85
// Size: 0x18e
function function_50be2f4e50e673da(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_c_milbase_office_2s_02_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32620, 30976, 1349.52), (0, 135, 0), undefined, "MERC_STRONGHOLD_MILBASE_OFFICE_2S_02", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32096, 30176, 1488), (0, 0, 0), "MERC_STRONGHOLD_C_MILBASE_OFFICE_2S_02_main", "MERC_STRONGHOLD_MILBASE_OFFICE_2S_02", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_milbase_office_2s_02_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32216, 29952, 1480), (0, 60, 0), undefined, "MERC_STRONGHOLD_MILBASE_OFFICE_2S_02", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1a
// Size: 0x18e
function function_b8da58bef8cc444(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24184, 33928, 1552), (0, 0, 0), "MERC_STRONGHOLD_C_MILBASE_WAREHOUSE_01_main", "MERC_STRONGHOLD_MILBASE_WAREHOUSE_01", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_milbase_warehouse_01_safe_room";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23824, 33760, 1736), (0, 59.6, 0), undefined, "MERC_STRONGHOLD_MILBASE_WAREHOUSE_01", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_c_milbase_warehouse_01_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23920, 33216, 1552), (0, 90, 0), undefined, "MERC_STRONGHOLD_MILBASE_WAREHOUSE_01", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaf
// Size: 0x18e
function function_f9857e65858ed485(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27752, 23928, 1432), (0, 0, 0), "MERC_STRONGHOLD_C_POLICE_STATION_01_B_main", "MERC_STRONGHOLD_POLICE_STATION_01_B", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.script_parameters = "auto_floor_2_saferoom";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27864, 24064, 1596), (0, 270.09, 0), undefined, "MERC_STRONGHOLD_POLICE_STATION_01_B", "s_safe_spawn", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    s.name = "ai_encounter_spawnpoint_reinforcements";
    s.script_parameters = "merc_stronghold_c_police_station_01_b_reinforcements";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28352, 23360, 1424), (0, 180, 0), undefined, "MERC_STRONGHOLD_POLICE_STATION_01_B", "s_safe_reinforce", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_stronghold_cs/namespace_8bdc94c286ca8f7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1044
// Size: 0xeb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (32272, 40312, 1488);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(32320, 40392, 1032)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1536];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(32320, 40392, 1000)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1280];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(32128, 40360, 1064)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(32320, 40424, 952)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2048];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(32224, 40336, 984)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.locationorigin = [0:(32320, 40392, 968)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2048];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_C_SUBBASE_WAREHOUSE_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (36368, 29368, 2224);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(36320, 29352, 1792)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1536];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(36320, 29352, 1824)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2048];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(36320, 29352, 1856)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(36304, 29360, 1792)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1280];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(36288, 29360, 1784)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:960];
    var_5f614235e4cbbd5b.locationorigin = [0:(36312, 29400, 1792)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_C_COUNTDOWN_OFFICE_2S_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (32216, 30416, 1848);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(32088, 30176, 1496)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1536];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(32104, 30200, 1496)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2048];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(32104, 30200, 1528)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(32088, 30176, 1496)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1280];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(32184, 30368, 1496)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:640];
    var_5f614235e4cbbd5b.locationorigin = [0:(32088, 30176, 1496)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_C_MILBASE_OFFICE_2S_02"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (24280, 33760, 2072);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(24192, 33920, 1560)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(24144, 33936, 1560)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2048];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(24240, 33848, 1592)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(24192, 33920, 1560)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1536];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(24224, 33832, 1552)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:720];
    var_5f614235e4cbbd5b.locationorigin = [0:(24192, 33920, 1560)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_C_MILBASE_WAREHOUSE_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merc_stronghold";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_stronghold_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (27840, 23832, 1888);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(27808, 23944, 1448)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].locationorigin = [0:(27736, 23976, 1440)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_approach"].var_a19931107c2774a8 = [0:2048];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].locationorigin = [0:(27800, 23888, 1472)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["handler_comms_nokey"].var_a19931107c2774a8 = [0:1024];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(27792, 23944, 1448)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1600];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(27808, 23832, 1472)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:960];
    var_5f614235e4cbbd5b.locationorigin = [0:(27760, 23936, 1432)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["MERC_STRONGHOLD_C_POLICE_STATION_01_B"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
