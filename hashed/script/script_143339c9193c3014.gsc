// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_intel_cs_season1;

// Namespace mp_jup_st_c_ob_intel_cs_season1 / namespace_ca2191c2f05ae3e2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_intel_cs_season1")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_intel_cs_season1");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_intel_cs_season1");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_intel_cs_season1 / namespace_ca2191c2f05ae3e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_intel_cs_season1");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_intel_cs_season1");
}

// Namespace mp_jup_st_c_ob_intel_cs_season1 / namespace_ca2191c2f05ae3e2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3
// Size: 0xc2
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_intel_cs_season1";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    s.season = "1";
    fe [[ f ]](s, us, cf, (42690, 32675, 1876), (0, 314.6, 0), "terminus_audio_intel", undefined, "intel_s1_terminus_audio_newobjectives");
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_intel_cs_season1 / namespace_ca2191c2f05ae3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_intel_cs_season1 / namespace_ca2191c2f05ae3e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_intel_cs_season1");
}

