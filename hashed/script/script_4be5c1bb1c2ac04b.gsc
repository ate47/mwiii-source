// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_contracts_zombie_control_cs;

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_contracts_zombie_control_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_contracts_zombie_control_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_contracts_zombie_control_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_contracts_zombie_control_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x566
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x570
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_contracts_zombie_control_cs");
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ZOMBIE_CONTROL";
    var_d13c18af4084bdfd.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_a9b68dd3fa9bcfe5":
        function_ed9113c03966f330(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d1e484287db9ab20":
        function_5c15a1ff3ea8db03(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x669
// Size: 0x8a7
function function_ed9113c03966f330(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3121.75, 21762, 949), (0, 225, 0), "control_point_11", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3055, 20772.5, 963.5), (0, 225, 0), "control_point_1", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4983, 20613.5, 930.5), (0, 225, 0), "control_point_2", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3606, 21666.5, 901.5), (0, 225, 0), "control_point_3", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3677, 19530.5, 953.5), (0, 225, 0), "control_point_4", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4972.75, 19226.8, 956.5), (0, 225, 0), "control_point_5", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4361.75, 19586.5, 953.75), (0, 225, 0), "control_point_6", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4646, 21605.5, 901.5), (0, 225, 0), "control_point_7", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4480, 20342.5, 929.5), (0, 225, 0), "control_point_8", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2864, 19722.5, 997.5), (0, 225, 0), "control_point_9", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4648.17, 21044.9, 958.75), (0, 147.71, 0), "s_zombie_control_b_nuclear", "s_zombie_control_b_nuclear", "objective_zombie_control_b_nuclear", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5562.5, 19976, 1002.25), (0, 225, 0), "control_point_10", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4517.19, 21067.8, 902.75), (270, 0, 167.4), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_b_nuclear", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4683.31, 20984.9, 864.75), (0, 244.8, 0), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_b_nuclear", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4535.65, 21111.4, 906.5), (0, 76.27, 0), "s_zombie_control_test_reward", "s_zombie_control_b_nuclear", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4656.81, 21041.1, 897.75), (0, 147.04, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_b_nuclear", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8646.25, 21827.2, 1048), (0, 345.34, 0), "activity_nexus_instance_joiner", "s_zombie_control_b_nuclear", "ZOMBIE_CONTROL_B_NUCLEAR", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3973, 21934.5, 896.5), (0, 225, 0), "control_point_12", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4267.5, 20243, 1660), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_b_nuclear", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3739, 20406.5, 928.5), (0, 225, 0), "control_point_13", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5295, 21283.5, 950.5), (0, 225, 0), "control_point_14", "s_zombie_control_b_nuclear", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf17
// Size: 0x91e
function function_5c15a1ff3ea8db03(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9219.75, 36837, 1329.25), (0, 225, 0), "control_point_11", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8472.5, 36980.5, 1341.75), (0, 225, 0), "control_point_1", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7463.75, 36889.8, 1345.75), (0, 225, 0), "control_point_2", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7904, 36993.5, 1363.5), (0, 225, 0), "control_point_3", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8000, 35449.5, 1249.5), (0, 225, 0), "control_point_4", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6046, 36281.5, 1345.5), (0, 225, 0), "control_point_5", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7404, 35305.5, 1244.5), (0, 225, 0), "control_point_6", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6213.5, 37669.5, 1361.75), (0, 225, 0), "control_point_7", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7469, 36195, 1329.5), (0, 225, 0), "control_point_8", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8648.25, 35838, 1281.5), (0, 225, 0), "control_point_9", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8619.29, 36225.3, 1442.5), (0, 0.57, 0), "s_zombie_control_b_construction", "s_zombie_control_b_construction", "objective_zombie_control_b_construction", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    s.name = "script_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8614.34, 36226, 1417.5), (0, 0.57, 0), "zombie_control_start_interact", "s_zombie_control_b_construction", "zombie_control_start_interact", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6291, 35587.5, 1297.5), (0, 225, 0), "control_point_10", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8491.31, 36196.1, 1388), (270, 0, 54.9), "c_jup_zmb_zombie_base_charred_male_corpse_pose_13", "s_zombie_control_b_construction", "zombie_control_start_interact_soldier_b_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8634.8, 36314.5, 1343.5), (356.5, 96.75, -7.01), "c_jup_zmb_zombie_base_charred_male_corpse_pose_08", "s_zombie_control_b_construction", "zombie_control_start_interact_soldier_a_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8466.1, 36224.4, 1394.5), (0, 76.27, 0), "s_zombie_control_test_reward", "s_zombie_control_b_construction", "objective_reward_struct", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8628.59, 36223.7, 1381.5), (0, 359.9, 0), "zombie_control_start_interact_inhibitor_model", "s_zombie_control_b_construction", "zombie_control_start_interact_inhibitor_model", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-346.25, 34363.8, 1236), (0, 353.66, 0), "activity_nexus_instance_joiner", "s_zombie_control_b_construction", "ZOMBIE_CONTROL_B_CONSTRUCTION", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7486.5, 37318.8, 1352.25), (0, 225, 0), "control_point_12", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-7471.5, 36401, 2070), (0, 0, 0), "zombie_control_quest_circle", "s_zombie_control_b_construction", "zombie_control_quest_circle", undefined, undefined, (0, 0, 0), (0, 0, 0), 2000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9476.25, 35928.8, 1277.25), (0, 225, 0), "control_point_13", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6640.75, 37054.2, 1343.5), (0, 225, 0), "control_point_14", "s_zombie_control_b_construction", "control_spawn_point", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_contracts_zombie_control_cs/namespace_8a00e9497f6d1155
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183c
// Size: 0x1bd
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (4660.12, 21030.7, 1042.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(4091.75, 20388.2, 1253.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_B_NUCLEAR"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_ob_activitydef_zombiecontrol";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_contracts_zombie_control_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-8637.02, 36230.7, 1526.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-7634.5, 36338, 1663.5)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["ZOMBIE_CONTROL_B_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

