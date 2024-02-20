// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_contracts_escort_cs;

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_contracts_escort_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_contracts_escort_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_contracts_escort_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_contracts_escort_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_contracts_escort_cs");
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69a
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e1
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6eb
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_contracts_escort_cs");
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x701
// Size: 0x58
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ESCORT_ZOMBIES";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x761
// Size: 0x6b
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_escort_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_82c92e59ac052f5f":
        function_74a4aa5837c174b2(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_991ac33090f405dd":
        function_107e94ede7e629a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3
// Size: 0x96f
function function_74a4aa5837c174b2(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32968, 1754, 972), (0, 0, 0), "escort_d_warehouse_fishing_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31490, 3044.5, 1012.5), (0, 281.72, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_D_WAREHOUSE_FISHING", "ESCORT_ZOMBIES_D_WAREHOUSE_FISHING", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32108, 232, 960), (0, 0, 0), "ESCORT_ZOMBIES_D_WAREHOUSE_FISHING", undefined, "escort_d_warehouse_fishing", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33410, 7696, 972), (0, 292, 0), "ESCORT_ZOMBIES_D_WAREHOUSE_FISHING_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32082, 2562, 972), (0, 0, 0), "escort_d_warehouse_fishing_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33448, 2978, 972), (0, 0, 0), "escort_d_warehouse_fishing_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34550, 4144, 972), (0, 0, 0), "escort_d_warehouse_fishing_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35314, 4836, 920), (0, 0, 0), "escort_d_warehouse_fishing_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34398, 5228, 958.98), (0, 0, 0), "escort_d_warehouse_fishing_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33206, 5732, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32818, 6936, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33744, 7704, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32432, 7526, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32998, 1780, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33866, 3570, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33036, 3210, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35386, 5394, 920), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33752, 4744, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33890, 5714, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32290, 6944, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33772, 8364, 968), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32514, 8044, 976), (0, 0, 0), "escort_d_warehouse_fishing_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34692, 6144, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34478, 3052, 972), (0, 0, 0), "escort_d_warehouse_fishing_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32184, 7340, 959.98), (0, 0, 0), "escort_d_warehouse_fishing_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1149
// Size: 0xa89
function function_107e94ede7e629a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27442, 9428, 1166), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27594, 12664, 1160), (0, 0, 0), "ESCORT_ZOMBIES_D_POOL_APARTMENTS", undefined, "escort_d_pool_apartments", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27968, 15117, 1208.61), (0, 83.21, 0), "activity_nexus_instance_joiner", "ESCORT_ZOMBIES_D_POOL_APARTMENTS", "ESCORT_ZOMBIES_D_POOL_APARTMENTS", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26622, 4106, 1032), (0, 212, 0), "ESCORT_ZOMBIES_D_POOL_APARTMENTS_REWARD", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25774, 9770, 1166), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26744, 8816, 1166), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28366, 8346, 1041.38), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26206, 6984, 1032.93), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28488, 7176, 1029.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26314, 4596, 1029.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26056, 3598, 1029.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26054, 3596, 1029.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27500, 3412, 1029.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27946, 5076, 1057.98), (0, 0, 0), "escort_d_pool_apartments_neutralize_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26936, 6332, 1031.16), (0, 0, 0), "escort_d_pool_apartments_horde_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26384, 9068, 1150), (0, 0, 0), "escort_d_pool_apartments_horde_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26390, 3306, 1150), (0, 0, 0), "escort_d_pool_apartments_horde_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27638, 10962, 1150.99), (0, 0, 0), "escort_d_pool_apartments_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26422, 11424, 1182), (0, 0, 0), "escort_d_pool_apartments_ambush_01", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26004, 9890, 1150.8), (0, 0, 0), "escort_d_pool_apartments_ambush_02", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26588, 8400, 1112.29), (0, 0, 0), "escort_d_pool_apartments_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27782, 8714, 1143.99), (0, 0, 0), "escort_d_pool_apartments_ambush_03", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26848, 7410, 1022.22), (0, 0, 0), "escort_d_pool_apartments_ambush_04", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28434, 7302, 1029.98), (0, 0, 0), "escort_d_pool_apartments_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27654, 6568, 1048), (0, 0, 0), "escort_d_pool_apartments_ambush_05", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27784, 4676, 1029.48), (0, 0, 0), "escort_d_pool_apartments_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26578, 4814, 1032.17), (0, 0, 0), "escort_d_pool_apartments_ambush_06", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26978, 3550, 1030.95), (0, 0, 0), "escort_d_pool_apartments_ambush_07", undefined, undefined, undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_d_ob_contracts_escort_cs/namespace_5a797a965e52ffdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd9
// Size: 0x319
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-32218, 176, 960);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-33042, 7526, 960), 1:(-34726, 5396, 970), 2:(-33622, 2546, 960), 3:(-32200, 486, 960.11)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:1000, 2:1000, 3:750];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_D_WAREHOUSE_FISHING"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_escort";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_d_ob_contracts_escort_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-27652, 12800, 1160);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.locationorigin = [0:(-27656, 12466, 1160), 1:(-26438, 9838, 1150), 2:(-27632, 7324, 1028), 3:(-26852, 3784, 1032)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0), 1:(0, 0, 0), 2:(0, 0, 0), 3:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000, 1:1000, 2:1000, 3:1000];
    var_fdc9acdc19473f08["ESCORT_ZOMBIES_D_POOL_APARTMENTS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
