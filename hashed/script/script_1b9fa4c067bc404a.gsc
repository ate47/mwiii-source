// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_ambient_mimics_cs;

// Namespace mp_jup_st_e_ob_ambient_mimics_cs/namespace_f31648baa92750b8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_ambient_mimics_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_ambient_mimics_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_ambient_mimics_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_ambient_mimics_cs/namespace_f31648baa92750b8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_ambient_mimics_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_ambient_mimics_cs");
}

// Namespace mp_jup_st_e_ob_ambient_mimics_cs/namespace_f31648baa92750b8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347
// Size: 0x13a7
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18850, -2209.5, 2004), (0, 174.94, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15646.5, 7104, 1271.97), (0, 43.1, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17820, -7069.5, 1909.92), (0, 314.52, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21481.5, -4140.5, 2036), (0, 191.22, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-12075, 6542, 1064), (0, 341.08, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (265.5, 3080, 1816), (0, 237.33, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7386, -3983, 2392), (0, 17.55, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (17993.5, -7512.5, 1919.94), (0, 186.26, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11607, 1550, 1752), (0, 17.55, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_turret";
    s.name = "mimic_spawns_turret";
    s.proplist = "mimicproplist:jup_mimic_prop_list_turrettraps";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-819.5, -8948.5, 1633.48), (0, 43.01, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5106, -3358, 2072.5), (0, 135.32, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3000.5, 5358, 2014.75), (0, 359.95, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15383.5, 5203.5, 2230.27), (0, 238.97, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_safe";
    s.name = "mimic_spawns_safe";
    s.proplist = "mimicproplist:jup_mimic_prop_list_safes";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21056, -3599.5, 2277.74), (0, 190.08, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14659.5, 907, 1744), (0, 303.97, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8537, -1594, 2208), (0, 315.22, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2104.5, -365.5, 1816.15), (0, 269.3, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18031, 4833.5, 1273.01), (0, 359.97, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_perk";
    s.name = "mimic_spawns_perk";
    s.proplist = "mimicproplist:jup_mimic_prop_list_perkmachines";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6206.5, 10612, 1055), (0, 302.32, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20504, -2473, 2335.48), (0, 259.13, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14558, -721.5, 1520), (0, 303.94, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15107.5, 1864.5, 1766.17), (0, 123.27, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1865, 4555, 2034), (0, 180.79, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2160, -8314.5, 2023.25), (0, 338.51, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_cache";
    s.name = "mimic_spawns_cache";
    s.proplist = "mimicproplist:jup_mimic_prop_list_caches";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15226.5, -13054.5, 1875.5), (0, 303.39, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18656, -3246.5, 1864), (0, 67.31, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13386.5, -1004.5, 1720), (0, 303.75, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9661.5, 168, 2012), (0, 180.55, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6276, -1588.5, 2008), (0, 44.56, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3118, 8241, 1444), (0, 44.89, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_buystation";
    s.name = "mimic_spawns_buystation";
    s.proplist = "mimicproplist:jup_mimic_prop_list_buystations";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-11010, 12795.5, 1268.35), (0, 269.68, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5250, 11515, 1056), (0, 122.55, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3066, 10537, 1444), (0, 314.41, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1418, -1108, 1816), (0, 135.84, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6583, 439.5, 2012), (0, 348.28, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13167.5, 1007.5, 1626), (0, 123.21, 0), undefined, undefined, "ambient_mimic_spawn");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_ambient_mimics_cs";
    s.groupid = "mimic_spawns_ammodepot";
    s.name = "mimic_spawns_ammodepot";
    s.proplist = "mimicproplist:jup_mimic_prop_list_ammodepots";
    s.variantname = "mimic_spawn_point";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14253.5, -4782, 1426.76), (0, 321.87, 0), undefined, undefined, "ambient_mimic_spawn");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_ambient_mimics_cs/namespace_f31648baa92750b8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f5
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_ambient_mimics_cs/namespace_f31648baa92750b8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16ff
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_ambient_mimics_cs");
}
