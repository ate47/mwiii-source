#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_activities_servershutdown_cs;

// Namespace mp_jup_st_c_ob_activities_servershutdown_cs / namespace_2fd4af9f8020b5a0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_activities_servershutdown_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_activities_servershutdown_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_activities_servershutdown_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_activities_servershutdown_cs / namespace_2fd4af9f8020b5a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_activities_servershutdown_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_activities_servershutdown_cs");
}

// Namespace mp_jup_st_c_ob_activities_servershutdown_cs / namespace_2fd4af9f8020b5a0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x1a8
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (30624, 28312, 1152), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (24512, 18048, 640), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (40640, 22656, 640), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_servershutdown_cs";
    s.height = 4096;
    fe [[ f ]](s, us, cf, (39616, 30656, 1600), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_servershutdown_cs / namespace_2fd4af9f8020b5a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_activities_servershutdown_cs / namespace_2fd4af9f8020b5a0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37b
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_activities_servershutdown_cs");
}
