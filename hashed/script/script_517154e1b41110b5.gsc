// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_contracts_outlast_cs;

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_contracts_outlast_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_contracts_outlast_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_contracts_outlast_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_contracts_outlast_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ce
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x315
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31f
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_contracts_outlast_cs");
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x335
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

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x52
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_outlast_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_f14cf7b81a0baf85":
        function_e1e18f51c8408c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff
// Size: 0x646
function function_e1e18f51c8408c8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41963, -4990, 2994), (0, 247.1, 0), "ava_tablet", "s_outlast_f_shipment", "ava_tablet", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42288.3, -4586.04, 2992.5), (0, 220.97, 0), "s_outlast_f_shipment_reward", "s_outlast_f_shipment", "s_outlast_f_shipment_reward", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42183, -4587.58, 2991.5), (0, 91.81, 0), "pnd", "s_outlast_f_shipment", "pnd", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42451.8, -6335, 2983.5), (0, 265, 0), "zombie_spawn_wave_1", "s_outlast_f_shipment", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42185.5, -4586.44, 3047), (0, 1.81, 0), "s_outlast_f_shipment", "s_outlast_f_shipment", "objective_outlast_f_shipment", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43532, -4063, 2985), (0, 142.8, 0), "zombie_spawn_wave_3", "s_outlast_f_shipment", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41192, -3674.5, 2968), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_f_shipment", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42084.5, -3623, 2987.5), (0, 265, 0), "zombie_spawn_wave_2", "s_outlast_f_shipment", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40460.8, -4636.5, 2968), (0, 342.6, 0), "zombie_spawn_wave_2", "s_outlast_f_shipment", "zombie_spawn_wave_2", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (43441, -5098.75, 2982.5), (0, 209, 0), "zombie_spawn_wave_1", "s_outlast_f_shipment", "zombie_spawn_wave_1", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39026, 1786.25, 3030.25), (0, 310.38, 0), "activity_nexus_instance_joiner", "s_outlast_f_shipment", "OUTLAST_F_SHIPMENT", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (40843, -6073.75, 2979.5), (0, 135, 0), "zombie_spawn_wave_3", "s_outlast_f_shipment", "zombie_spawn_wave_3", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    s.is_cs_trigger = 1;
    s.var_857f45e57f5d5a7a = 1;
    s.var_750c4cbbadf7cc32 = (1041.5, 945.75, 296.25);
    s.var_74e936bbadd15418 = (657.75, -18.75, 32);
    s.height = 128;
    s.length = "128";
    s.width = "128";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42454.6, -4906.2, 3016.5), (0, 90.19, 0), "outlast_noent_entrance_trigger", "s_outlast_f_shipment", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42034, -4879.75, 2990.5), (0, 135, 0), "outlast_space", "s_outlast_f_shipment", "outlast_space", undefined, undefined, (0, 0, 0), (0, 0, 0), 1600);
}

// Namespace mp_jup_st_f_ob_contracts_outlast_cs/namespace_7b1dcc1cfe7bf651
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4c
// Size: 0xeb
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydefinition_outlast";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_contracts_outlast_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (42180.9, -4586.94, 3038);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(42046.2, -4736.5, 3010.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["OUTLAST_F_SHIPMENT"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
