// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_contracts_outlast_cs;

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x392
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39c
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b2
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_OUTLAST";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_c311645c98b04902":
        function_cf60010c19e18101(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4c3a794c61bd7818":
        function_5241efb1693a2c03(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x495
// Size: 0x880
function function_cf60010c19e18101(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (179, 338.5, 169.5);
    s.var_74e936bbadd15418 = (131.5, 196.5, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34881.6, 11296.8, 988.5), (0, 127.04, 0), "outlast_noent_entrance_trigger", "s_outlast_d_rails", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (113, 87, 85.5);
    s.var_74e936bbadd15418 = (109.5, 196.5, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36820.1, 10117.8, 988.5), (0, 127.04, 0), "outlast_noent_entrance_trigger", "s_outlast_d_rails", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (263, 162.5, 94.5);
    s.var_74e936bbadd15418 = (175.5, 232, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36587.6, 10263.8, 988.5), (0, 127.04, 0), "outlast_noent_entrance_trigger", "s_outlast_d_rails", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36201, 10794, 966), (0, 344, 0), "ava_tablet", "s_outlast_d_rails", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36025.1, 10597.7, 963.5), (0, 76.62, 0), "s_outlast_d_rails_reward", "s_outlast_d_rails", "s_outlast_d_rails_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35940.4, 10660.4, 963.5), (0, 307.46, 0), "pnd", "s_outlast_d_rails", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35946, 9742.5, 956.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_d_rails", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35941.7, 10658, 1022), (0, 217.46, 0), "s_outlast_d_rails", "s_outlast_d_rails", "objective_outlast_d_rails", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33512.5, 11013.2, 952), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_d_rails", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34352, 12292.2, 958), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_d_rails", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36225, 8877, 953), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_d_rails", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-38088.5, 9536.75, 944.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_d_rails", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35233, 5026.5, 962.25), (0, 204.24, 0), "activity_nexus_instance_joiner", "s_outlast_d_rails", "OUTLAST_D_RAILS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (289.5, 1349, 222.5);
    s.var_74e936bbadd15418 = (290.5, 329, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35509.1, 11047.8, 988.5), (0, 127.04, 0), "outlast_noent_entrance_trigger", "s_outlast_d_rails", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35862.5, 10901, 946), (0, 135, 0), "outlast_space", "s_outlast_d_rails", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35190.2, 9489.5, 958), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_d_rails", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c
// Size: 0x6d1
function function_5241efb1693a2c03(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (244.5, 1274, 147.5);
    s.var_74e936bbadd15418 = (139.5, 242, 160);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32979.1, 3937.8, 1212.5), (0, 99.94, 0), "outlast_noent_entrance_trigger", "s_outlast_d_warehouse", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34009, 3836, 970), (0, 183, 0), "ava_tablet", "s_outlast_d_warehouse", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33213.1, 3941.7, 967.5), (0, 229.12, 0), "s_outlast_d_warehouse_reward", "s_outlast_d_warehouse", "s_outlast_d_warehouse_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33317.2, 3925.2, 967.5), (0, 99.96, 0), "pnd", "s_outlast_d_warehouse", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34562, 2847.5, 955.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_d_warehouse", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33314.9, 3926.73, 1026), (0, 9.96, 0), "s_outlast_d_warehouse", "s_outlast_d_warehouse", "objective_outlast_d_warehouse", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32035.2, 3219.25, 962), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_d_warehouse", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32219, 4825.25, 954), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_d_warehouse", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33506, 2272, 956), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_d_warehouse", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33999.2, 5292, 934.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_d_warehouse", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.name = "script_struct_nexus_activity_joiner";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30941.8, -826.5, 965.5), (0, 138.03, 0), "activity_nexus_instance_joiner", "s_outlast_d_warehouse", "OUTLAST_D_WAREHOUSE", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (538.5, 1349, 147.5);
    s.var_74e936bbadd15418 = (441.5, 337, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32979.1, 3937.8, 999.5), (0, 99.94, 0), "outlast_noent_entrance_trigger", "s_outlast_d_warehouse", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33464.2, 3820.75, 1028), (0, 135, 0), "outlast_space", "s_outlast_d_warehouse", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34949.5, 4915.25, 954), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_d_warehouse", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_outlast_cs/namespace_f03f6d33241fa445
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f4
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-35938.3, 10661, 1013);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-35872, 10917, 976.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1600];
    var_fdc9acdc19473f08["OUTLAST_D_RAILS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-33319.3, 3925.63, 1017);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-33481.5, 3816.5, 1014.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1300];
    var_fdc9acdc19473f08["OUTLAST_D_WAREHOUSE"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
