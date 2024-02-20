// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_i_ob_zip_door_cs;

// Namespace mp_jup_st_i_ob_zip_door_cs/namespace_3516e99458a59ddd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c8
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_i_ob_zip_door_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_i_ob_zip_door_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_i_ob_zip_door_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_i_ob_zip_door_cs/namespace_3516e99458a59ddd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_i_ob_zip_door_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_i_ob_zip_door_cs");
}

// Namespace mp_jup_st_i_ob_zip_door_cs/namespace_3516e99458a59ddd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0xa17
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30765, -30256.3, 3099), (0, 203.9, 0), "zip_door_destination", "cspf_0_auto4780828477474504615", "234");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30640.5, -30323.4, 3082), (0, 23.9, 0), "cspf_0_auto4780828477474504615", "cspf_0_auto6632474592269012091", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30630.7, -30301.4, 3082), (0, 23.9, 0), "cspf_0_auto6632474592269012091", "cspf_0_auto8547027372271769495", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30621, -30279.5, 3082), (0, 23.9, 0), "cspf_0_auto8547027372271769495", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44198, -30364.7, 3141.51), (0, 56.6, 0), "zip_door_destination", "cspf_0_auto9819767579108367625", "372");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_1_auto10583907438871018898", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_1_auto3737599740395406375", "cspf_1_auto11170290169130929106", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_1_auto11059709549162147396", "cspf_1_auto625250580259730343", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_1_auto625250580259730343", "cspf_1_auto4486163629117164502", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_1_auto4486163629117164502", "cspf_1_auto14858222856449094156", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_1_auto14858222856449094156", "cspf_1_auto13980094656917523402", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_1_auto13980094656917523402", undefined, undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_1_auto10583907438871018898", "cspf_1_auto3737599740395406375", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_1_auto11170290169130929106", "cspf_1_auto11059709549162147396", undefined, undefined, undefined, (34124, -34739, 3296), (0, 202.7, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44283.5, -30192.2, 3154.51), (0, 238.7, 0), "cspf_0_auto9819767579108367625", "cspf_0_auto13170057833861355640", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44301.5, -30203, 3154.51), (0, 238.7, 0), "cspf_0_auto13170057833861355640", "cspf_0_auto11642802417402089927", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44319.4, -30213.9, 3154.51), (0, 238.7, 0), "cspf_0_auto11642802417402089927", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_2_auto10583907438871018898", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_2_auto3737599740395406375", "cspf_2_auto11170290169130929106", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_2_auto11059709549162147396", "cspf_2_auto625250580259730343", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_2_auto625250580259730343", "cspf_2_auto4486163629117164502", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_2_auto4486163629117164502", "cspf_2_auto14858222856449094156", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_2_auto14858222856449094156", "cspf_2_auto13980094656917523402", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_2_auto13980094656917523402", undefined, undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_2_auto10583907438871018898", "cspf_2_auto3737599740395406375", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_i_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_2_auto11170290169130929106", "cspf_2_auto11059709549162147396", undefined, undefined, undefined, (25323.4, -40424.4, 3247.44), (0, 219.71, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_i_ob_zip_door_cs/namespace_3516e99458a59ddd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec9
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_i_ob_zip_door_cs/namespace_3516e99458a59ddd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed3
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_i_ob_zip_door_cs");
}

