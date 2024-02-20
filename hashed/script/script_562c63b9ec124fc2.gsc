// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_activities_summon_cs;

// Namespace mp_jup_st_a_ob_activities_summon_cs/namespace_c7a042a866083b3e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_activities_summon_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_activities_summon_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_activities_summon_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_activities_summon_cs/namespace_c7a042a866083b3e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_activities_summon_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_activities_summon_cs");
}

// Namespace mp_jup_st_a_ob_activities_summon_cs/namespace_c7a042a866083b3e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x457
// Size: 0xb57
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "map_location_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31883.1, 42915.8, 1760.61), (0, 64.4, 0), "map_location_2_b", undefined, "map_location_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "map_location_1_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31883.4, 42915.9, 1790.66), (0.07, 64.3, -3.1), "map_location_1_b", undefined, "map_location_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "map_location_3_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31970.5, 42957.8, 1766.18), (359.71, 64.89, 4.69), "map_location_3_b", undefined, "map_location_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "map_location_4_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31968.3, 42956.9, 1792.69), (359.71, 64.89, -1.11), "map_location_4_b", undefined, "map_location_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_map_pin_4_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31939.1, 42943, 1760.15), (0, 67.1, 0), undefined, undefined, "green_map_pin_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_map_pin_5_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31915.6, 42931.4, 1759.28), (0, 64, 0), undefined, undefined, "green_map_pin_5");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "red_map_pin_1_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31926.3, 42936.7, 1781.52), (0, 64.9, 0), undefined, undefined, "red_map_pin_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "red_map_pin_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31931.1, 42939.1, 1778.94), (0, 66, 0), undefined, undefined, "red_map_pin_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "yellow_map_pin_1_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31927.7, 42937.3, 1789.56), (0, 67, 0), undefined, undefined, "yellow_map_pin_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "red_map_pin_3_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31927.7, 42937.6, 1775.16), (0, 66.2, 0), undefined, undefined, "red_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_map_pin_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31944.6, 42945.9, 1795.25), (0, 63.4, 0), undefined, undefined, "green_map_pin_2");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_map_pin_3_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31943.2, 42944.8, 1777.65), (0, 63.6, 0), undefined, undefined, "green_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_console_1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24586, 41949, 1882), (0, 336.5, 0), "green_console_1", "summon_console_green_controller", "summon_consoles");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "green_map_pin_1_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31913.3, 42930.4, 1799.09), (0, 63.8, 0), undefined, undefined, "green_map_pin_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "yellow_map_pin_4_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31912.7, 42930.2, 1780.14), (0, 67.7, 0), undefined, undefined, "yellow_map_pin_4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "yellow_map_pin_3_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31916.7, 42932, 1770.82), (0, 64.3, 0), undefined, undefined, "yellow_map_pin_3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "refractor";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15271.8, 21699.4, 2259.39), (1.01, 201.32, 2.07), undefined, "refractor_controller_b", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "refractor";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14696.9, 21425.2, 2237.34), (0, 117, 0), undefined, "refractor_controller_b", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "refractor";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14986.5, 20287.3, 2276.12), (6.05, 11.52, -3.32), undefined, "refractor_controller_b", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "refractor_controller_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15094.7, 21102.9, 2281.92), (0, 0, 0), "refractor_controller_b", undefined, "refractor_set", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "refractor";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15733.7, 20838.5, 2310.26), (358.67, 297.32, -1.62), undefined, "refractor_controller_b", "refractor", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "ammo_crate";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15844.6, 21205.9, 2317.16), (359.96, 233.01, -1.5), undefined, "refractor_controller_b", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "ammo_crate";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14509.1, 20475, 2244.34), (355.5, 30.9, 2.3), undefined, "refractor_controller_b", "ammo_crate", undefined, undefined, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "worm_arena";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15415.7, 19547.2, 2366.25), (0, 0, 0), undefined, "worm_arena_d", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "worm_arena";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15080.3, 20956.7, 2248.43), (0, 0, 0), "worm_arena_d", undefined, "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "worm_arena";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16408, 21461.7, 2254.87), (0, 0, 0), undefined, "worm_arena_d", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1000);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "worm_arena";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14957.2, 22673.5, 2207.04), (0, 0, 0), undefined, "worm_arena_d", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "worm_arena";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-13511.6, 20260.5, 2164.41), (0, 0, 0), undefined, "worm_arena_d", "deathworm_arena", undefined, undefined, (0, 0, 0), (0, 0, 0), 1250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_summon_cs";
    s.name = "yellow_map_pin_2_b";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31927.1, 42937, 1765.39), (0, 63.5, 0), undefined, undefined, "yellow_map_pin_2");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_activities_summon_cs/namespace_c7a042a866083b3e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_activities_summon_cs/namespace_c7a042a866083b3e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfbf
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_activities_summon_cs");
}
