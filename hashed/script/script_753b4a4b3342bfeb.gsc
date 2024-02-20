// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_zip_door_cs;

// Namespace mp_jup_st_d_ob_zip_door_cs/namespace_b4e88912baf6dbd9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_zip_door_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_zip_door_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_zip_door_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_zip_door_cs/namespace_b4e88912baf6dbd9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_zip_door_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_zip_door_cs");
}

// Namespace mp_jup_st_d_ob_zip_door_cs/namespace_b4e88912baf6dbd9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa
// Size: 0xa17
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28185.2, 10399.1, 1605.12), (0, 90.97, 0), "zip_door_destination", "cspf_0_auto4780828477474504615", "563");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_1_auto10583907438871018898", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_1_auto3737599740395406375", "cspf_1_auto11170290169130929106", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_1_auto11059709549162147396", "cspf_1_auto625250580259730343", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_1_auto625250580259730343", "cspf_1_auto4486163629117164502", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_1_auto4486163629117164502", "cspf_1_auto14858222856449094156", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_1_auto14858222856449094156", "cspf_1_auto13980094656917523402", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_1_auto13980094656917523402", undefined, undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_1_auto10583907438871018898", "cspf_1_auto3737599740395406375", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_1_auto11170290169130929106", "cspf_1_auto11059709549162147396", undefined, undefined, undefined, (-34918.1, 9478.11, 1010.32), (0, 10.13, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28204.1, 10501.9, 1640.62), (0, 270.69, 0), "cspf_0_auto4780828477474504615", "cspf_0_auto6632474592269012091", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28184.2, 10502.2, 1640.62), (0, 270.69, 0), "cspf_0_auto6632474592269012091", "cspf_0_auto8547027372271769495", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-28164.6, 10502.5, 1640.62), (0, 270.69, 0), "cspf_0_auto8547027372271769495", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-31159.5, -3910, 1045.45), (0, 359.15, 0), "zip_door_destination", "cspf_0_auto3047481378894805734", "152");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30955.6, -3902.86, 1022.95), (0, 178.88, 0), "cspf_0_auto3047481378894805734", "cspf_0_auto13223394195794839479", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30955.9, -3922.76, 1022.95), (0, 178.88, 0), "cspf_0_auto13223394195794839479", "cspf_0_auto7799696227085157435", "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.name = "Zip Destination Digit";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-30956.3, -3942.36, 1022.95), (0, 178.88, 0), "cspf_0_auto7799696227085157435", undefined, "000");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    s.objectid = "zip_door";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3, 0, 0), (90, 0, 0), "zip_door_entry", "cspf_2_auto10583907438871018898", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 46), (-90, 0, 0), "cspf_2_auto3737599740395406375", "cspf_2_auto11170290169130929106", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, -13, 106), (-90, 0, 0), "cspf_2_auto11059709549162147396", "cspf_2_auto625250580259730343", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 17, 106), (-90, 0, 0), "cspf_2_auto625250580259730343", "cspf_2_auto4486163629117164502", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 78), (-90, 0, 0), "cspf_2_auto4486163629117164502", "cspf_2_auto14858222856449094156", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 46), (-90, 0, 0), "cspf_2_auto14858222856449094156", "cspf_2_auto13980094656917523402", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-0.5, 35, 14), (-90, 0, 0), "cspf_2_auto13980094656917523402", undefined, undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 14.5), (-90, 0, 0), "cspf_2_auto10583907438871018898", "cspf_2_auto3737599740395406375", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_zip_door_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1.5, -36, 78), (-90, 0, 0), "cspf_2_auto11170290169130929106", "cspf_2_auto11059709549162147396", undefined, undefined, undefined, (-29257.9, -10527.8, 2120.5), (0, 239.49, 0));
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_zip_door_cs/namespace_b4e88912baf6dbd9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec8
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_zip_door_cs/namespace_b4e88912baf6dbd9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_zip_door_cs");
}

