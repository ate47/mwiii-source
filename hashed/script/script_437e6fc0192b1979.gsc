// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_exfil_cs;

// Namespace mp_jup_st_d_ob_exfil_cs/namespace_b2f2a1aea0c10d31
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_exfil_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_exfil_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_exfil_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_exfil_cs/namespace_b2f2a1aea0c10d31
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_exfil_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_exfil_cs");
}

// Namespace mp_jup_st_d_ob_exfil_cs/namespace_b2f2a1aea0c10d31
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x457
// Size: 0x78a
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.name = "exfil_content_destination_marina";
    s.variantname = "content_destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-41899, 6452, 3098), (0, 0, 0), "ob_st_d_marina_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.content_key = "exfil_interact";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36830, -875, 1014.4), (0, 292.1, 0), "exfil_content_struct_marina_south", "exfil_content_instance_marina_south");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.content_key = "exfil_interact";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24423, 14303, 1503.18), (0, 352.3, 0), "exfil_content_struct_marina_east", "exfil_content_instance_marina_east");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24434.5, 13133.1, 2894), (0, 0, 0), "exfil_content_instance_marina_east", "exfil_tile_d_marina_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21076, 14641, 5744), (0, 315, 0), "cspf_0_auto11728021693339388834", "cspf_0_auto9964347695087208757");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.variantname = "content_location";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-41908.5, 5458, 2952), (0, 0, 0), "exfil_tile_d_marina_location", "ob_st_d_marina_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36878.5, -1919.9, 1098.82), (0, 0, 0), "exfil_content_instance_marina_south", "exfil_tile_d_marina_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17837.6, 15507.4, 7813), (0, 193, 0), undefined, "cspf_0_auto11728021693339388834", "exfil_content_struct_marina_south");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26423, 12988, 4230), (0, 315, 0), "cspf_0_auto9964347695087208757", "cspf_0_auto14260596509628026069");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28751, 10030, 3120), (0, 315, 0), "cspf_0_auto14260596509628026069", "cspf_0_auto5901488058297043729");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30071, 6279, 2414), (0, 315, 0), "cspf_0_auto5901488058297043729", "cspf_0_auto2908705018962920135");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32691, 1705, 2434), (0, 221, 0), "cspf_0_auto2908705018962920135", "cspf_0_auto13969502116259930260");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-35460, 1006, 2203), (0, 203, 0), "cspf_0_auto13969502116259930260");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19954.6, -2919, 6358), (0, 45, 0), "cspf_0_auto276512533624171978", "cspf_0_auto17293711443497165488");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18838.7, -6795.12, 8921), (0, 108, 0), undefined, "cspf_0_auto276512533624171978", "exfil_content_struct_marina_east");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22694, 154, 3817), (0, 45, 0), "cspf_0_auto17293711443497165488", "cspf_0_auto4124106738959076361");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25524, 2221, 3665), (0, 45, 0), "cspf_0_auto4124106738959076361", "cspf_0_auto6029457858348859754");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25861, 7453, 3614), (0, 45, 0), "cspf_0_auto6029457858348859754", "cspf_0_auto16680977816452184798");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22702, 14161, 3563), (0, 141, 0), "cspf_0_auto16680977816452184798");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24495.9, 14294.7, 1743), (0, 238.81, 0), undefined, undefined, "exfil_content_struct_marina_east_dest");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_exfil_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16565, -10214, 0), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_exfil_cs/namespace_b2f2a1aea0c10d31
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe8
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_exfil_cs/namespace_b2f2a1aea0c10d31
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf2
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_exfil_cs");
}
