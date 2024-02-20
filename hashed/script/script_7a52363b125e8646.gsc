// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_ambient_mimics_cs;

// Namespace mp_jup_st_d_ob_ambient_mimics_cs/namespace_cf3caf9c332c5c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_ambient_mimics_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_ambient_mimics_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_ambient_mimics_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_ambient_mimics_cs/namespace_cf3caf9c332c5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_ambient_mimics_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_ambient_mimics_cs");
}

// Namespace mp_jup_st_d_ob_ambient_mimics_cs/namespace_cf3caf9c332c5c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347
// Size: 0xd5f
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18526.5, -19082, 1654.97), (0, 36.05, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18611.5, 4370.5, 1270.74), (0, 178.75, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21301, 2500.5, 1307.64), (0, 319.84, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27754, 12761.5, 1153.5), (0, 187.79, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26743.5, -20546, 1709), (0, 348.43, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31701.5, 13518.5, 955.43), (0, 359.17, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23439, 263, 1007.17), (0, 194.78, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27441, -13904.5, 1534.2), (0, 52.01, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21983.5, -25273.5, 1699), (0, 135.29, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31158, 3409, 968), (0, 189.87, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33059.5, 15185.5, 1086.75), (0, 189.61, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19109, 5203, 1261.98), (0, 90.9, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24814.5, -1301, 1018), (0, 250.19, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31194.5, -25972.5, 1568), (0, 161.17, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32874, 2120.5, 959.98), (0, 99.26, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27567.5, -6469.5, 1740), (0, 10.99, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16138.5, -22189.5, 1759.97), (0, 253.21, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30411.5, -13152.5, 1533.5), (0, 86.87, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24730.5, -25607.5, 2028), (0, 167.05, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32752.5, 3146.5, 1105), (0, 189.13, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32392.5, 11288.5, 960), (0, 189.45, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25098.5, 4332.5, 1456), (0, 194.1, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23276, -12776, 1504.99), (0, 359.57, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12591.5, -8163, 1713), (0, 358.13, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34697, 8445, 959.97), (0, 98.57, 0), undefined, undefined, "ambient_mimic_spawn");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_ambient_mimics_cs/namespace_cf3caf9c332c5c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ad
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_ambient_mimics_cs/namespace_cf3caf9c332c5c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b7
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_ambient_mimics_cs");
}
