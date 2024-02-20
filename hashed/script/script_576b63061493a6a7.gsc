// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_exfil_oldtown_cs;

// Namespace mp_jup_st_e_ob_exfil_oldtown_cs/namespace_d3d7c78398640f47
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_exfil_oldtown_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_exfil_oldtown_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_exfil_oldtown_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_exfil_oldtown_cs/namespace_d3d7c78398640f47
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_exfil_oldtown_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_exfil_oldtown_cs");
}

// Namespace mp_jup_st_e_ob_exfil_oldtown_cs/namespace_d3d7c78398640f47
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224
// Size: 0x13c
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_exfil_oldtown_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_exfil_oldtown_cs";
    s.variantname = "content_location";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7914, 12072, 3158), (0, 0, 0), "exfil_tile_e_oldtown_location", "ob_st_e_oldtown_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_exfil_oldtown_cs";
    s.name = "exfil_content_destination_oldtown";
    s.variantname = "content_destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8040, 12164, 4852), (0, 0, 0), "ob_st_e_oldtown_exfil_destination");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_exfil_oldtown_cs/namespace_d3d7c78398640f47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x367
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_exfil_oldtown_cs/namespace_d3d7c78398640f47
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x371
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_exfil_oldtown_cs");
}
