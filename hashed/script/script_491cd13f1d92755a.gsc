// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_intel_cs_season1;

// Namespace mp_jup_st_e_ob_intel_cs_season1/namespace_b46e2ad0ff7f74e0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_intel_cs_season1")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_intel_cs_season1");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_intel_cs_season1");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_intel_cs_season1/namespace_b46e2ad0ff7f74e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_intel_cs_season1");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_intel_cs_season1");
}

// Namespace mp_jup_st_e_ob_intel_cs_season1/namespace_b46e2ad0ff7f74e0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x13b
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs_season1";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    s.season = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15374, 9109, 1727), (0, 63.8, 0), "deadbolt_audio_intel", undefined, "intel_s1_deadbolt_audio_ghostmachine");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_intel_cs_season1";
    s.groupid = "deadbolt";
    s.name = "deadbolt_audio_intel";
    s.season = "1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15047, 3763, 1975), (0, 239.5, 0), "deadbolt_audio_intel", undefined, "intel_s1_deadbolt_audio_rav1stimpressions");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_intel_cs_season1/namespace_b46e2ad0ff7f74e0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_intel_cs_season1/namespace_b46e2ad0ff7f74e0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x358
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_intel_cs_season1");
}
