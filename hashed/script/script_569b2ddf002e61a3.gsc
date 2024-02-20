// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_ambient_biomes_cs;

// Namespace mp_jup_st_d_ob_ambient_biomes_cs/namespace_22ec60f51e713465
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_ambient_biomes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_ambient_biomes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_ambient_biomes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_ambient_biomes_cs/namespace_22ec60f51e713465
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_ambient_biomes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_ambient_biomes_cs");
}

// Namespace mp_jup_st_d_ob_ambient_biomes_cs/namespace_22ec60f51e713465
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4
// Size: 0x64d
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32562, 11107.4, 1084.4), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-36291, 9134.7, 960.37), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-33077.3, 7494.54, 1168.35), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32892.5, 3031.88, 1249.35), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 3000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24958.4, -145.85, 1087.4), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22635, -1126.19, 1390.97), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-21336.4, -1562.28, 1578.96), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-20599.4, 2107.47, 1399.66), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-22321.1, 3089.82, 1377.64), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-19224.7, 4310.18, 1425.62), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-17460.4, 2712.8, 1271.59), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27145.1, 1712.34, 1030.66), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-24631, 2843.47, 1188.44), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-18519.1, 37.64, 1271.94), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27459.6, 14206, 1241.92), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1500);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-32229, 14498, 1145), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 1000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27502.9, 11334.1, 1232.87), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-27304.1, 8209.46, 1196.51), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26752.2, 5816.37, 1178.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    s = s();
    s.name = "dense";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-26340.8, 3544.21, 1379.1), (0, 0, 0), "ai_biome_struct", undefined, "dense", undefined, undefined, undefined, undefined, 2000);
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_ambient_biomes_cs/namespace_22ec60f51e713465
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x808
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}
