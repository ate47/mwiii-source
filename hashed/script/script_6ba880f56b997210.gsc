// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_wallbuys_cs;

// Namespace mp_jup_st_d_ob_wallbuys_cs/namespace_60784ca744394e0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_wallbuys_cs/namespace_60784ca744394e0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_wallbuys_cs");
}

// Namespace mp_jup_st_d_ob_wallbuys_cs/namespace_60784ca744394e0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0x349
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-26490, 8639, 1148), (0, 6, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-33857, 11719, 960), (0, 9.97, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-32459, 3226, 960), (0, 190, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-25627, 1204, 1005), (0, 113.85, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-18809, 5004, 1278), (0, 90, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-27674, 15107, 1171), (0, 349.96, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_wallbuys_cs/namespace_60784ca744394e0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_wallbuys_cs/namespace_60784ca744394e0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x519
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_wallbuys_cs");
}
