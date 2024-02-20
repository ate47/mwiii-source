// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_exfil_military_cs;

// Namespace mp_jup_st_c_ob_exfil_military_cs/namespace_6c38880515e0b9fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_exfil_military_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_exfil_military_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_exfil_military_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_exfil_military_cs/namespace_6c38880515e0b9fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_exfil_military_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_exfil_military_cs");
}

// Namespace mp_jup_st_c_ob_exfil_military_cs/namespace_6c38880515e0b9fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0xb28
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.target2 = "exfil_destination_1_exit_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28026.7, 17867.3, 1377.65), (0, 261.37, 0), "exfil_destination_1", "exfil_destination_1_enter_start");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (23467.4, 25353.2, 1359.56), (350.04, 251.29, 0.88), "exfil_destination_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.name = "exfil_content_destination_military";
    s.variantname = "content_destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27795, 22222, 1985), (0, 0, 0), "ob_st_c_military_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_key = "exfil_interact";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28252, 18599, 1410), (3, 354.57, -1.07), "exfil_content_struct_military_east", "exfil_content_instance_military_east");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31968, 20312.1, 1473.55), (0, 199.98, 0), "exfil_destination_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30198.3, 22308.8, 1388.59), (355, 241.37, -0), "exfil_destination_1");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_key = "exfil_interact";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25666, 38022, 965), (359.71, 29.97, -1.68), "exfil_content_struct_military_west", "exfil_content_instance_military_west");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (36128, 37964, 1808), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32276.1, 22018.3, 3346), (0, 3.9, 0), "exfil_1_auto2", "exfil_1_auto3");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_accel = float(75);
    s.script_speed = int(250);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33656.8, 21460.5, 3270), (0, 273.9, 0), "exfil_1_auto3", "exfil_1_auto4");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39127.8, 11097.4, 3582), (0, 273.9, 0), "exfil_1_auto4", "exfil_1_auto5");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39290.2, 6856.9, 3302), (0, 273.9, 0), "exfil_1_auto5", "exfil_1_auto6");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (47077.6, 4606.1, 1140.86), (0, 333.9, 0), "exfil_1_auto6");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33221.7, 40447.3, 4114), (0, 273.9, 0), "exfil_destination_1_enter_start", "exfil_1_auto7");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44007.7, 43738.9, 4114), (0, 273.9, 0), "exfil_1_auto7", "exfil_1_auto8");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (45804.9, 35712.5, 4114), (0, 243.9, 0), "exfil_1_auto8", "exfil_1_auto9");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41008.6, 25431.2, 4474), (0, 209.32, 0), "exfil_1_auto9", "cspf_0_auto11092694076957379720");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (25923.5, 38326.1, 1520), (0, 314.57, 0), "exfil_content_instance_military_west", "exfil_tile_c_military_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.variantname = "content_location";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (26587, 22537, 1839), (0, 0, 0), "exfil_tile_c_military_location", "ob_st_c_military_exfil_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28230.5, 18182.1, 1872), (0, 314.57, 0), "exfil_content_instance_military_east", "exfil_tile_c_military_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30930.6, 19495.2, 2688), (0, 147.32, 0), "cspf_0_auto11092694076957379720");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19540, 13878, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (39528, 44866, 3678), (0, 250, 0), undefined, undefined, "exfil_content_struct_military_east");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_key = "exfil_interact";
    s.script_parameters = "disabled";
    s.variantname = "content_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38701, 35222, 2213), (0, 42.23, 0), "exfil_content_struct_hidden_st_c", "exfil_content_instance_hidden_st_c");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.name = "ob_st_c_hidden_exfil_destination";
    s.variantname = "content_destination";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37176, 34226, 2774), (0, 0, 0), "exfil_tile_c_hiddeen_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.content_script_name = "exfil";
    s.variantname = "content_instance";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38693, 34416, 2578), (0, 0, 0), "exfil_content_instance_hidden_st_c", "exfil_tile_c_hidden_location");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.name = "ob_st_c_hidden_exfil_location";
    s.variantname = "content_location";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (37162, 33563, 2636), (0, 0, 0), "exfil_tile_c_hidden_location", "exfil_tile_c_hiddeen_destination");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(100);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (44486, 7006, 6885), (0, 172.23, 0), undefined, "cspf_0_auto10951929346202955095", "exfil_content_struct_hidden_st_c");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30851, 10680, 6026), (0, 144.26, 0), "cspf_0_auto10951929346202955095", "cspf_0_auto5548243177672795488");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27088, 18851, 4881), (0, 91.36, 0), "cspf_0_auto5548243177672795488", "cspf_0_auto5576780170962902564");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29393, 26073, 4045), (0, 44.9, 0), "cspf_0_auto5576780170962902564", "cspf_0_auto9632386344492273108");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35702, 29236, 3547), (0, 43.26, 0), "cspf_0_auto9632386344492273108", "cspf_0_auto7016108639043159546");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_exfil_military_cs";
    s.script_speed = int(60);
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (38232.7, 34285.2, 2889), (0, 42.26, 0), "cspf_0_auto7016108639043159546");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_exfil_military_cs/namespace_6c38880515e0b9fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1065
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_exfil_military_cs/namespace_6c38880515e0b9fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x106f
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_exfil_military_cs");
}

