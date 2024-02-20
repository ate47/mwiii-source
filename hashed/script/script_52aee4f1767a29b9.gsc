// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_machines_cs;

// Namespace mp_jup_st_f_ob_machines_cs/namespace_b4423be1b735edcf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_machines_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_machines_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_machines_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_machines_cs/namespace_b4423be1b735edcf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_machines_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_machines_cs");
}

// Namespace mp_jup_st_f_ob_machines_cs/namespace_b4423be1b735edcf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x44f
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31866.2, -8947.4, 3169.06), (0, 287.98, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32258.7, 11353.1, 2061.74), (0, 228.68, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41854.6, 6001.54, 2967.06), (0, 242.78, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34351, 9567, 2224), (0, 215.38, 0), undefined, undefined, "in_gas_station");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41331, 12379, 3077), (0, 120.48, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27861, 698, 2082), (0, 235.08, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (45621.5, -2850, 3091), (0, 354.98, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_region_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32688, -12287, 2937), (0, 13.68, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "pap_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33227.3, 2821.95, 2401), (0, 206.18, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29536, 5878, 2228), (0, 94, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_machines_cs";
    s.content_key = "perk_machine_choice_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42206, -4076, 3128), (0, 270, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_machines_cs/namespace_b4423be1b735edcf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_machines_cs/namespace_b4423be1b735edcf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_machines_cs");
}

