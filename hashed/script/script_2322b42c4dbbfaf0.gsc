// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_activities_servershutdown_cs;

// Namespace mp_jup_st_b_ob_activities_servershutdown_cs/namespace_e03919da9578d3dc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_activities_servershutdown_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_activities_servershutdown_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_activities_servershutdown_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_activities_servershutdown_cs/namespace_e03919da9578d3dc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_activities_servershutdown_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_activities_servershutdown_cs");
}

// Namespace mp_jup_st_b_ob_activities_servershutdown_cs/namespace_e03919da9578d3dc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1
// Size: 0x201
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_servershutdown_cs";
    s.height = 4096;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1152, 34432, 960), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_servershutdown_cs";
    s.height = 4096;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (12304, 33920, 960), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_servershutdown_cs";
    s.height = 4096;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11200, 22464, 768), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_servershutdown_cs";
    s.height = 4096;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-4224, 17408, 960), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_servershutdown_cs";
    s.height = 4096;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-6720, 28224, 960), (0, 0, 0), "aether_storm_spawnpoint", undefined, undefined, undefined, undefined, undefined, undefined, 2048);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_servershutdown_cs/namespace_e03919da9578d3dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_activities_servershutdown_cs/namespace_e03919da9578d3dc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_activities_servershutdown_cs");
}

