// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_machines_cs;

// Namespace mp_jup_st_b_ob_machines_cs/namespace_a91075b4ed17580f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_machines_cs/namespace_a91075b4ed17580f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_machines_cs");
}

// Namespace mp_jup_st_b_ob_machines_cs/namespace_a91075b4ed17580f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x839
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4583, 37234, 1546), (0, 274.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9052.17, 33394.9, 1618.5), (0, 74.72, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4237.56, 27313.9, 1142.58), (0, 230.3, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2067.2, 24318.6, 859), (0, 164.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4238, 38437, 1548), (0, 88.42, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6141, 31227, 1375), (0, 255.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3284, 30015, 1009), (0, 164.88, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6020, 22222, 1001), (0, 164.88, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1383, 24586, 1123), (0, 343.59, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.name = "pap_spawn";
    s.script_modelname = "t10_zm_pap_fxanim";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4801, 24077, 972), (0, 180.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11770, 22744, 1012), (0, 258.1, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6600, 25036, 1154), (0, 74.83, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (13765, 31385, 1008), (0, 344.79, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3726, 34544, 1200), (0, 90.09, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8657, 35378, 1281), (0, 354.42, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.name = "perk_machine_region_spawn";
    s.script_modelname = "t10_zm_machine_speed_cola";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-8985, 30918, 1215), (0, 250.12, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_machines_cs/namespace_a91075b4ed17580f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_machines_cs/namespace_a91075b4ed17580f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa41
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_machines_cs");
}
