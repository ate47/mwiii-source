// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_ambient_biomes_cs;

// Namespace mp_jup_st_a_ob_ambient_biomes_cs/namespace_92f8a210c3f60bd9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_ambient_biomes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_ambient_biomes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_ambient_biomes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_ambient_biomes_cs/namespace_92f8a210c3f60bd9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_ambient_biomes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_ambient_biomes_cs");
}

// Namespace mp_jup_st_a_ob_ambient_biomes_cs/namespace_92f8a210c3f60bd9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x69a
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24285, 39339, 2265.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18532.8, 39600.6, 2487.41), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-15471.1, 37145.7, 2476.59), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1700);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33140.8, 40505.8, 1942.82), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32991.3, 44594.6, 1738.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-25158.4, 42838, 2057.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27298.5, 38666.9, 1871.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21178, 37438.3, 2231.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19388.9, 37545.1, 2168.25), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-14096.4, 34307.1, 2659.72), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16170.6, 34275.1, 2660.24), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1200);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33232.3, 32059.3, 1727.24), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 5000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32645.3, 24083.7, 1545.24), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 4200);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28778.3, 27720.3, 1608.58), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28127, 30658.9, 1848.41), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-16524, 27979, 3064.77), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22207.7, 21055.8, 1715.81), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-23350.5, 18533.9, 1648.81), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22002.2, 24650.8, 1703.42), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-29686.5, 41929.7, 2073.91), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 4000);
    s = s();
    s.var_8bbc1803a27915e6 = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-34972, 42711, 1814), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2500);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_ambient_biomes_cs/namespace_92f8a210c3f60bd9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x855
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

