// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b2
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x726
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e6
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_MERC_CAMP";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_merccamp";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86d
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_cd1c3e741cfb82b4":
        function_18a0d07644a26a09(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f2cb6fe80e19edf9":
        function_7b9f0330a27d540e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_473980bd34fc6c66":
        function_297ee43ef43626f9(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_41c0c33f75bff273":
        function_c0c3a2c3bcf781ea(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1fa04b15c26fdd3d":
        function_ab558b1bb4eaf9a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_a00ccb717c71a394":
        function_95d3de41777c07d7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x943
// Size: 0x5c0
function function_18a0d07644a26a09(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3728, -17258.5, 1720), (0, 0, 0), "MERC_CAMP_H_REPAIR_SHOP_01", undefined, "merc_camp_h_repair_shop_01", "link_merc_camp_h_repair_shop_01", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3493.25, -17385.5, 2452), (0, 2, 0), "s_merc_camp_drone", "cspf_7_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4208, -16282, 2367), (0, 285, 0), "cspf_7_auto8038584816154551323", "cspf_7_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5182, -18134.1, 2367), (0, 179.4, 0), "cspf_7_auto9475429086340380124", "cspf_7_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3758, -17257.5, 1717), (0, 256, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4330, -16463.5, 1707.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3910, -17268, 1717), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3143, -18005.5, 2367), (0, 78.2, 0), "cspf_7_auto6226715010739024097", "cspf_7_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2876.01, -16767.8, 2367), (0, 326, 0), "cspf_7_auto666769489343115847", "cspf_7_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3418, -16531.5, 1708), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5258, -16975.5, 1705.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3389, -17538.5, 1706.25), (357, 283.11, -0.35), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_repair_shop_01", (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0a
// Size: 0x5bf
function function_7b9f0330a27d540e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9142, -20447.5, 1710.5), (0, 0, 0), "MERC_CAMP_H_NORTH_GAS", undefined, "merc_camp_h_north_gas", "link_merc_camp_h_north_gas", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9014.99, -20782.1, 2357.5), (0, 2, 0), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10022, -19837, 2357.5), (0, 285, 0), "cspf_8_auto8038584816154551323", "cspf_8_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10704, -21301.1, 2357.5), (0, 179.4, 0), "cspf_8_auto9475429086340380124", "cspf_8_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9336, -20148.5, 1707.5), (0, 166, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9704, -21222.5, 1709), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8449, -19787.5, 1709.75), (356.62, 119, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8771, -20730, 1707.5), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8173, -21640.5, 2357.5), (0, 78.2, 0), "cspf_8_auto6226715010739024097", "cspf_8_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8454.01, -19706.8, 2357.5), (0, 326, 0), "cspf_8_auto666769489343115847", "cspf_8_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (8180, -21534.5, 1713.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10216, -21158.5, 1710), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_north_gas", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0x5bf
function function_297ee43ef43626f9(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10472, -27043, 1749), (0, 0, 0), "MERC_CAMP_H_TUNNEL_WORKYARD", undefined, "merc_camp_h_tunnel_workyard", "link_merc_camp_h_tunnel_workyard", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10229, -26681.6, 2396), (0, 2, 0), "s_merc_camp_drone", "cspf_9_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11268, -26336.5, 2396), (0, 285, 0), "cspf_9_auto8038584816154551323", "cspf_9_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11146, -27352.6, 2396), (0, 179.4, 0), "cspf_9_auto9475429086340380124", "cspf_9_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11062.1, -26862.4, 1730.7), (0, 246, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9522, -26646, 1746), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10970, -26678.5, 1729.38), (0.53, 27.91, 1.17), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10072.5, -26952, 1746), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9735, -28112, 2396), (0, 78.2, 0), "cspf_9_auto6226715010739024097", "cspf_9_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9716.01, -26258.3, 2396), (0, 326, 0), "cspf_9_auto666769489343115847", "cspf_9_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (10346, -27794, 1746), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (11106, -27294, 1762), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_tunnel_workyard", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0x5bf
function function_c0c3a2c3bcf781ea(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15486.4, -31158.8, 2479.33), (0, 0, 0), "MERC_CAMP_H_LAKE_UNDERPASS", undefined, "merc_camp_h_lake_underpass", "link_merc_camp_h_lake_underpass", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15959, -30712.1, 2940), (0, 220.57, 0), "s_merc_camp_drone", "cspf_10_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15460.8, -31357.2, 2835.63), (0, 143.57, 0), "cspf_10_auto8038584816154551323", "cspf_10_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14880.6, -31108.1, 2787.77), (0, 37.97, 0), "cspf_10_auto9475429086340380124", "cspf_10_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (14972.5, -31534.7, 2491.91), (353.17, 255.29, 4.22), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15866.4, -29925.7, 2371.22), (0, 0, -11.86), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15420.5, -31526.5, 2512.05), (357.93, 220.9, 9.69), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15439.1, -31134.1, 2476.04), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15406.9, -29725.9, 2717.08), (0, 296.77, 0), "cspf_10_auto6226715010739024097", "cspf_10_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (16000, -29847.3, 2684.37), (0, 184.57, 0), "cspf_10_auto666769489343115847", "cspf_10_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15654.4, -29844.3, 2365.99), (0, 0, -1.55), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (15068, -32342.1, 2547.65), (355.29, 0, -1.59), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_lake_underpass", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205c
// Size: 0x5bf
function function_ab558b1bb4eaf9a8(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-768.5, -31777, 1806), (0, 0, 0), "MERC_CAMP_H_HOUSING_CONSTRUCTION", undefined, "merc_camp_h_housing_construction", "link_merc_camp_h_housing_construction", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1312.51, -31754.6, 2481), (0, 2, 0), "s_merc_camp_drone", "cspf_11_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-197.5, -31437.5, 2481), (0, 285, 0), "cspf_11_auto8038584816154551323", "cspf_11_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-195.5, -32457.6, 2481), (0, 179.4, 0), "cspf_11_auto9475429086340380124", "cspf_11_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-518.48, -32622.1, 1818.09), (0, 169.1, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (342.5, -31637, 1763), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-729.5, -32437, 1991.75), (357.5, 295.6, -0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-827.5, -31625, 1993), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1282.5, -32269, 2481), (0, 78.2, 0), "cspf_11_auto6226715010739024097", "cspf_11_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1561.49, -31295.3, 2481), (0, 326, 0), "cspf_11_auto666769489343115847", "cspf_11_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-885.5, -30853, 1783), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (278.5, -32287, 1780), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_housing_construction", (0, 0, 0), (0, 0, 0), 100);
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2622
// Size: 0x4d5
function function_95d3de41777c07d7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1994, -37721, 2203), (0, 0, 0), "MERC_CAMP_H_PARK_FACILITIES", undefined, "merc_camp_h_park_facilities", "link_merc_camp_h_park_facilities", undefined, (0, 0, 0), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2237.01, -37283.6, 2871), (0, 2, 0), "s_merc_camp_drone", "cspf_12_auto8038584816154551323", undefined, undefined, "link_merc_camp_h_park_facilities", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1270, -36806.5, 2871), (0, 285, 0), "cspf_12_auto8038584816154551323", "cspf_12_auto9475429086340380124", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-556, -37742.6, 2871), (0, 179.4, 0), "cspf_12_auto9475429086340380124", "cspf_12_auto6226715010739024097", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2577, -37283.5, 2142.33), (0, 177.25, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_h_park_facilities", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2332, -38272, 2214), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_h_park_facilities", (0, 0, 0), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1987, -37741.5, 2198.51), (0, 104, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_h_park_facilities", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1909, -38015.5, 2227), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_h_park_facilities", (0, 0, 0), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2595, -38946, 2871), (0, 78.2, 0), "cspf_12_auto6226715010739024097", "cspf_12_auto666769489343115847", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-3129.99, -36792.3, 2871), (0, 326, 0), "cspf_12_auto666769489343115847", "cspf_12_auto8038584816154551323", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
}

// Namespace mp_jup_st_h_ob_activities_merc_camp_cs/namespace_989dce7f12aa3ffe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2afe
// Size: 0xcb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (3842.25, -17243, 1710);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(3967.25, -17564.2, 1704.97)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(4196, -17380.5, 1712)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(4108, -17368.5, 1712)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1250];
    var_5f614235e4cbbd5b.locationorigin = [0:(4176, -17332.5, 1717)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_H_REPAIR_SHOP_01"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (8804.25, -20517.8, 1730.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(9014.75, -20792.2, 1707.95)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(9142, -20447.5, 1723)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(9142, -20447.5, 1723)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1400];
    var_5f614235e4cbbd5b.locationorigin = [0:(9156.5, -20599.5, 1723)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_CAMP_H_NORTH_GAS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (10031.5, -26994.2, 1730.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(10140.6, -27639.2, 1794.62)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(10369, -27043, 1741)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(10472, -27043, 1741)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(10472, -27043, 1741)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_CAMP_H_TUNNEL_WORKYARD"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (15512.5, -31196.2, 2481.34);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(15490.5, -30929.4, 2459.89)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(15306.1, -31009.4, 2463.2)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(15462.5, -31078.2, 2471.91)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.locationorigin = [0:(15466.7, -31104.3, 2474.17)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2200];
    var_fdc9acdc19473f08["MERC_CAMP_H_LAKE_UNDERPASS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-628.25, -31581, 1985.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-483.25, -31919, 1850)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-768.5, -31686, 1854)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-768.5, -31777, 1850)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1500];
    var_5f614235e4cbbd5b.locationorigin = [0:(-768.5, -31777, 1850)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_CAMP_H_HOUSING_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1937.25, -38445.5, 2221.75);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-1994, -37423.2, 2216)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-2206, -37370, 2154.8)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-1994, -37423.2, 2216)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1700];
    var_5f614235e4cbbd5b.locationorigin = [0:(-1994, -37645, 2216)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:3000];
    var_fdc9acdc19473f08["MERC_CAMP_H_PARK_FACILITIES"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
