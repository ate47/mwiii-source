// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_wallbuys_cs;

// Namespace mp_jup_st_b_ob_wallbuys_cs/namespace_5e17518aa5e7d37e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_wallbuys_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_wallbuys_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_wallbuys_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_wallbuys_cs/namespace_5e17518aa5e7d37e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_wallbuys_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_wallbuys_cs");
}

// Namespace mp_jup_st_b_ob_wallbuys_cs/namespace_5e17518aa5e7d37e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0x8c9
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (9010, 29632, 1203), (0, 75.4, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-2822, 25889, 881), (0, 74.44, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (492, 32399, 1242), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (3633, 31190, 985), (0, 71.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (6945, 38262, 1403), (0, 270, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (13558, 32273, 1008), (0, 164.5, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-365, 37274, 1317), (0, 94, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-6605, 35033, 1294), (0, 184.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-8666, 29840, 1180), (0, 254.3, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-7370, 25460, 1002), (0, 254.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-8142, 19321, 1383), (0, 270, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-1395, 21081, 1004), (0, 255.1, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (2108, 22244, 999), (0, 343.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-301, 18147, 1000), (0, 74.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (8238, 24750, 1004), (0, 74.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (14001, 17945, 916), (0, 74.8, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_wallbuys_cs";
    s.content_key = "wallbuy_spawn";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 55), (0, 0, 0), undefined, undefined, "random_ob", undefined, undefined, (-3555, 28994, 1000), (0, 80.3, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_wallbuys_cs/namespace_5e17518aa5e7d37e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8f
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_wallbuys_cs/namespace_5e17518aa5e7d37e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_wallbuys_cs");
}

