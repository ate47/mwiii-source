// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_essence_cs;

// Namespace mp_jup_st_i_ob_essence_cs/namespace_9c12c3ac22d75c87
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_essence_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_essence_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_essence_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_essence_cs/namespace_9c12c3ac22d75c87
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_essence_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_essence_cs");
}

// Namespace mp_jup_st_i_ob_essence_cs/namespace_9c12c3ac22d75c87
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2
// Size: 0x3b9
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41841, -26080, 3674), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30316, -22085, 3418), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29267, -30924, 4118), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28714, -35611, 3332), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34762, -29076, 3107), (0.02, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38067, -18864, 3293), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19223, -30624, 3880), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_essence_cs";
    s.content_key = "essence_large_spawn";
    s.name = "essence_container_large";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22232, -21742, 2998), (0, 0, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_essence_cs/namespace_9c12c3ac22d75c87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x592
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_essence_cs/namespace_9c12c3ac22d75c87
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59c
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_essence_cs");
}

