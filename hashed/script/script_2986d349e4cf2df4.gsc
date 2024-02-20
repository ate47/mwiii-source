// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_c_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_c_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_c_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_c_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_c_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_c_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb04
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4b
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_c_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b
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

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_7830542f07793d89":
        function_c43311846aff6778(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b64f1d1e77b48e32":
        function_253e79ec672f5995(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_e476f6f42236760a":
        function_94a32de83ec40f5f(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_f9366d87afa0370a":
        function_f835abb516c2a93d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_7370664650967470":
        function_1abdfbe08bb43b3d(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_59a9a17f757b0ab4":
        function_9ab035399e469e39(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb2
// Size: 0xa4d
function function_c43311846aff6778(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20790.8, 31238, 1485.5), (2.8, 4.78, -4.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21252, 30611.5, 1489.62), (0, 5, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20523.5, 30116, 2176.92), (0, 0, 0), "cspf_7_auto7849903697216012517", "cspf_7_auto14849411164486980990", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21793.4, 30502.8, 1519.67), (0, 26.7, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20759, 30805, 1489.1), (0.01, 90, 0), "MERC_CAMP_RAILWAY_OFFSHOOT", undefined, "merc_camp_railway_offshoot", "link_merc_camp_railway_offshoot", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20330, 30497, 2124), (0, 0, 0), "cspf_7_auto14849411164486980990", "cspf_7_auto8943157705619582670", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20438, 30440.5, 1536.38), (2.03, 4.98, -0.49), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20302.5, 31419.5, 2135.98), (0, 0, 0), "cspf_7_auto8943157705619582670", "cspf_7_auto15701646501675415239", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20721.2, 30338.8, 1492.52), (355.84, 283.44, -0.35), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20704, 32896, 1380.34), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20494, 30246, 1536.73), (8.02, 5.4, 0.75), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21213.5, 31107, 1490.56), (359.82, 5, -0.05), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20421.8, 31376.5, 1496.75), (5.65, 5.14, -1.17), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20681.5, 30133.2, 1510.89), (4.07, 4.66, -4.71), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20647.5, 31494, 2121.18), (0, 0, 0), "cspf_7_auto15701646501675415239", "cspf_7_auto614986582377852586", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21324.4, 30343.8, 2160.25), (0, 160, 0), "s_merc_camp_drone", "cspf_7_auto3986086080790765841", undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21285.5, 30972, 2139.62), (0, 0, 0), "cspf_7_auto614986582377852586", "cspf_7_auto3941279699234280936", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21316, 30403.5, 2139.72), (0, 0, 0), "cspf_7_auto3941279699234280936", "cspf_7_auto3986086080790765841", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22560, 32096, 1550), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (19296, 31520, 1433.57), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20857.7, 30124.6, 2168.19), (0, 0, 0), "cspf_7_auto3986086080790765841", "cspf_7_auto7849903697216012517", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (20773.5, 30888, 1489.05), (359.97, 285, -0.02), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_railway_offshoot", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1706
// Size: 0x876
function function_253e79ec672f5995(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-190, -251, 48), (0, 0, 0), "MERC_CAMP_C_CHURCH_HILL", undefined, "merc_camp_c_church_hill", "link_merc_camp_c_church_hill", undefined, (35108, 19420, 3073.52), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-89.4, -677.01, 649.99), (360, 91.84, 0.02), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (454.56, -325.5, 650), (360, 146, -0), "cspf_8_auto8038584816154551323", "cspf_8_auto9475429086340380124", undefined, undefined, undefined, (35108, 19420, 3073.52), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-180.97, 515.64, 649.99), (0, 146, 0), "cspf_8_auto9475429086340380124", "cspf_8_auto6226715010739024097", undefined, undefined, undefined, (35108, 19420, 3073.52), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-508, -1673, -13.9), (0, 201.9, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (800, 1952, -324.43), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-9, -220, 159.48), (0, 9.6, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-173, -242, 45), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 350);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-879.15, -352.97, 649.97), (359.96, 326, 0.01), "cspf_8_auto6226715010739024097", "cspf_8_auto11831651169648559285", undefined, undefined, undefined, (35108, 19420, 3073.52), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2336, 352, 270.56), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-158.52, -885.22, 650), (0, 326, 0), "cspf_8_auto11831651169648559285", "cspf_8_auto8038584816154551323", undefined, undefined, undefined, (35108, 19420, 3073.52), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1222, 388, 103.16), (351.06, 359.33, 4.32), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1169.34, 617.43, 54.56), (337.22, 339.99, 6.11), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1248, -1728, -195.11), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1024, -2304, 183.63), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1048.5, 1318.5, -134.8), (334.48, 262.86, -19.18), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1261.26, -1195.59, -16.1), (342.97, 342.37, 9.52), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (306.5, -1548, 172.76), (357.01, 339.84, 2.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_church_hill", (35108, 19420, 3073.52), (0, 0, 0), 100);
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f83
// Size: 0xa38
function function_94a32de83ec40f5f(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30912.7, 34621.1, 1189.55), (0, 0, 0), "MERC_CAMP_C_PORT_GAS", undefined, "merc_camp_c_port_gas", "link_merc_camp_c_port_gas", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30522.5, 33883.8, 1188.93), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30231.5, 34158, 1720), (0, 125, 0), "s_merc_camp_drone", "cspf_9_auto7199712530220427375", undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31602.9, 33175.1, 1190.55), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30799.1, 34108.8, 1189.55), (0, 213.66, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29664, 32864, 1350), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32468.9, 34666.7, 1190.04), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29632, 37536, 1016.7), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33536, 35168, 1031), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31165.3, 33651, 1189.55), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31920.7, 34958.6, 1190.54), (0, 360, -2.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30636, 35566.5, 1191.08), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30269.2, 34484.6, 1178.71), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawnpoint";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33728, 32416, 1136.74), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32177.9, 33667.2, 1192), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30640.9, 34978.9, 1839.54), (0, 0, 0), "cspf_9_auto7199712530220427375", "cspf_9_auto8076568766837108501", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31780.6, 35344.1, 1778), (0, 0, 0), "cspf_9_auto8076568766837108501", "cspf_9_auto3148036455059699961", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32254.2, 34735.5, 1836.27), (0, 0, 0), "cspf_9_auto3148036455059699961", "cspf_9_auto10948358822894293172", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32342, 33894, 1839.55), (0, 0, 0), "cspf_9_auto10948358822894293172", "cspf_9_auto6887367274480648037", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31496.5, 33331.5, 1915.46), (0, 0, 0), "cspf_9_auto6887367274480648037", "cspf_9_auto13795873287559263589", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (30557, 34137, 1839.55), (0, 0, 0), "cspf_9_auto13795873287559263589", "cspf_9_auto7199712530220427375", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31471.8, 34263.4, 1189.77), (359.32, 149.18, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_c_port_gas", (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c2
// Size: 0x9b4
function function_f835abb516c2a93d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21903.5, 22236, 1370), (0, 0, 0), "MERC_CAMP_C_WEST_GATE", undefined, "merc_camp_c_west_gate", "link_merc_camp_c_west_gate", undefined, (0, 0, 0), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21182, 22135.5, 1349.99), (359.96, 358.67, -0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21127.5, 22307.5, 2114.67), (0, 0, 0), "s_merc_camp_drone", "cspf_10_auto7199712530220427375", undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0), undefined, 8, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22641.5, 21830, 1350.08), (0, 359.98, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22922.5, 22181, 1349.23), (0.41, 359.98, 0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22903, 22442, 1349.21), (0.44, 0, 0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21234, 22266.5, 1350.03), (359.92, 358.67, 0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22749.5, 22710, 1356.88), (1.36, 359.96, -1.48), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22295.4, 22332.8, 1351.83), (356.42, 1.43, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21811, 22627.5, 1364), (0, 182.3, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21186, 22745, 1368.96), (7.05, 359.22, 13.08), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21500, 23075, 1367.84), (7.61, 359.23, 0.18), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24384, 23824, 1351), (0, 180, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (18616, 21736, 1426.52), (0, 180, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22045.4, 22312.2, 1370), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_c_west_gate", (0, 0, 0), (0, 0, 0), 360);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21085.9, 23045.9, 2006.59), (0, 0, 0), "cspf_10_auto7199712530220427375", "cspf_10_auto8076568766837108501", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22789.1, 23025.1, 2000.36), (0, 0, 0), "cspf_10_auto8076568766837108501", "cspf_10_auto3148036455059699961", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22920.2, 22481.5, 1999.08), (0, 0, 0), "cspf_10_auto3148036455059699961", "cspf_10_auto10948358822894293172", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (22532, 21971.5, 2024.08), (0, 0, 0), "cspf_10_auto10948358822894293172", "cspf_10_auto6887367274480648037", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21927.5, 21851, 2000.08), (0, 0, 0), "cspf_10_auto6887367274480648037", "cspf_10_auto13795873287559263589", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (21195, 22149.5, 1999.99), (0, 0, 0), "cspf_10_auto13795873287559263589", "cspf_10_auto7199712530220427375", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337d
// Size: 0xd94
function function_1abdfbe08bb43b3d(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28203.4, 25877, 1372.91), (356.11, 191.11, 1.57), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29912, 23952, 1439.59), (0, 180, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28603, 26489.6, 1387.01), (5.62, 239.61, -4.91), "MERC_CAMP_C_BARRACKS", undefined, "merc_camp_c_barracks", "link_merc_camp_c_barracks", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31536, 26464, 1513.36), (0, 180, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29524.2, 25636.4, 1378.7), (358.61, 308.15, -1.09), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29341, 25241.3, 1388.36), (357.19, 308.15, 0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28876.4, 24813.1, 1360.5), (4.09, 308.45, 2.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28716.2, 24986.9, 1362.23), (6.65, 308.8, 3.94), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27181.2, 25879.4, 1355), (0, 308.8, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28767, 27889.1, 1346.36), (355.95, 221.87, 0.44), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27645.8, 25321.4, 2020.23), (0, 0, 0), "cspf_11_auto3795987576771596192", "cspf_11_auto14535906638320712230", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28153.7, 25557.9, 2010.79), (0, 0, 0), "cspf_11_auto14535906638320712230", "cspf_11_auto14534204566809566199", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28548.8, 25622.7, 2011.7), (0, 0, 0), "cspf_11_auto14534204566809566199", "cspf_11_auto17724442231198751540", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27887.7, 26454.4, 2180.29), (17.29, 252.96, -1.57), "s_merc_camp_drone", "cspf_11_auto10329937657890428476", undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28926.8, 25329.8, 2025.23), (0, 0, 0), "cspf_11_auto17724442231198751540", "cspf_11_auto12943623383822736265", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28991.8, 25726.4, 1375.51), (358.48, 318.64, 0.26), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29024.2, 27702.4, 1351.39), (354.05, 222.71, -2.38), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29415.7, 25758, 2031.36), (0, 0, 0), "cspf_11_auto12943623383822736265", "cspf_11_auto6776997678286417373", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29469.1, 26087, 2033.58), (0, 0, 0), "cspf_11_auto6776997678286417373", "cspf_11_auto3602306810363256327", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29358.2, 26526.7, 2033.86), (0, 0, 0), "cspf_11_auto3602306810363256327", "cspf_11_auto17415243151838512442", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29450.2, 26879.3, 2022.39), (0, 0, 0), "cspf_11_auto17415243151838512442", "cspf_11_auto648663282994090665", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (29002.6, 27311, 2020.44), (0, 0, 0), "cspf_11_auto648663282994090665", "cspf_11_auto3145524347951197763", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28495.6, 27702, 2022.18), (0, 0, 0), "cspf_11_auto3145524347951197763", "cspf_11_auto16777062250534947312", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28085.9, 27583.1, 2010.29), (0, 0, 0), "cspf_11_auto16777062250534947312", "cspf_11_auto2697938465766903396", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28155.3, 27018.9, 2154.31), (0, 0, 0), "cspf_11_auto2697938465766903396", "cspf_11_auto11958723419868068768", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27655.7, 26961.7, 2022.98), (0, 0, 0), "cspf_11_auto11958723419868068768", "cspf_11_auto17910319865800610034", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27323.4, 26239.2, 2011.64), (0, 0, 0), "cspf_11_auto17910319865800610034", "cspf_11_auto10329937657890428476", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27276.8, 26020, 2007.86), (0, 0, 0), "cspf_11_auto10329937657890428476", "cspf_11_auto3795987576771596192", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 10);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28421.7, 26353.3, 1382.86), (3.51, 191.1, 0.69), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_c_barracks", (0, 0, 0), (0, 0, 0), 384);
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4118
// Size: 0xd1c
function function_9ab035399e469e39(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34696, 24552, 1500.87), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34219.3, 27597.5, 1543.27), (0, 159.15, 0), "MERC_CAMP_C_RAIL_FUELING", undefined, "merc_camp_c_rail_fueling", "link_merc_camp_c_rail_fueling", undefined, (0, 0, 0), (0, 0, 0), 384);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33898, 27908.6, 2360), (0, 0, 0), "cspf_12_auto12208501126449619615", "cspf_12_auto16932466752003335868", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34248, 28355.2, 2192), (0, 0, 0), "cspf_12_auto16932466752003335868", "cspf_12_auto894649863014410693", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35134.5, 28051.2, 2192), (0, 0, 0), "cspf_12_auto894649863014410693", "cspf_12_auto11670256849133081012", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35023.9, 27429.7, 2400), (0, 0, 0), "cspf_12_auto11670256849133081012", "cspf_12_auto12998395469669623625", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33777.7, 27615.7, 2384), (0, 0, 0), "cspf_12_auto12998395469669623625", "cspf_12_auto6176443008115108490", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32248, 26960, 1544), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33441.8, 27115.5, 2264), (0, 0, 0), "cspf_12_auto6176443008115108490", "cspf_12_auto10930243916894337513", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33583.5, 26652.1, 2192), (0, 0, 0), "cspf_12_auto10930243916894337513", "cspf_12_auto8565455039119624735", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34161.8, 26293.3, 2192), (0, 0, 0), "cspf_12_auto8565455039119624735", "cspf_12_auto6032191174600357377", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34582, 26406.2, 2192), (0, 0, 0), "cspf_12_auto6032191174600357377", "cspf_12_auto12796616590849471712", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34809, 26724, 2336), (0, 0, 0), "cspf_12_auto12796616590849471712", "cspf_12_auto11055181259572772139", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8, 0);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34820.3, 26991.2, 2400), (0, 0, 0), "cspf_12_auto11055181259572772139", "cspf_12_auto10434387445236609713", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 8);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35013.4, 27054, 2352), (1.14, 114.18, -1.78), "s_merc_camp_drone", "cspf_12_auto10434387445236609713", undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), undefined, 10, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34040.2, 27156.3, 1544), (0, 75.18, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34872.8, 26611.9, 1544.75), (0, 219.43, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34916.2, 26985.5, 1544.5), (0, 70.27, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32936, 25512, 1506.58), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34933.3, 27678.7, 1544), (0, 106.27, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33279.4, 27970.4, 1575), (0, 12.9, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34236.3, 27759.2, 1738), (358.6, 314.3, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33554.9, 28130.9, 1575), (0, 12.9, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33959.9, 27961.9, 1575), (0, 12.9, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (33816.9, 27835.9, 1575), (0, 12.9, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 300);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (35944, 25800, 1559.38), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34809.7, 27177.7, 2320), (0, 0, 0), "cspf_12_auto10434387445236609713", "cspf_12_auto12208501126449619615", undefined, undefined, undefined, (0, 0, 0), (0, 0, 0), undefined, 5);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34149.2, 27678, 1556.27), (13.88, 338.64, 2.09), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_c_rail_fueling", (0, 0, 0), (0, 0, 0), 200);
}

// Namespace mp_jup_st_c_ob_activities_merc_camp_cs/namespace_79ba1524e1edcc86
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3b
// Size: 0xcb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (20654, 30850, 1489.41);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(20936, 31008, 1488)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(20992, 30944, 1488)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(20912, 30656, 1488)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(20912, 30656, 1488)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:800];
    var_fdc9acdc19473f08["MERC_CAMP_RAILWAY_OFFSHOOT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-136, -200, 16);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (35108, 19420, 3073.52);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-226, -243, 40)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-40, -281, 40)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-226, -243, 15.48)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.locationorigin = [0:(-226, -243, 40)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(35108, 19420, 3073.52)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1350];
    var_fdc9acdc19473f08["MERC_CAMP_C_CHURCH_HILL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (30986, 34558, 1188);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(31277.3, 34473.7, 1189.55)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(31247.3, 34503.7, 1189.55)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(30987.3, 34679.7, 1189.55)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(30991.3, 34677.7, 1189.55)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1300];
    var_fdc9acdc19473f08["MERC_CAMP_C_PORT_GAS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (22080, 22338, 1370);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(21892, 22311.5, 1370)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(21893.5, 22311, 1370)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(21893.5, 22311, 1370)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(21893, 22312, 1370)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1100];
    var_fdc9acdc19473f08["MERC_CAMP_C_WEST_GATE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (28432, 26452, 1382.21);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(28604.2, 26489.9, 1392)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(28685.2, 26385.9, 1392)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(28603.2, 26489.9, 1392)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(28604, 26489.5, 1392)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1500];
    var_fdc9acdc19473f08["MERC_CAMP_C_BARRACKS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_c_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (34268, 27668, 1543);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(34415.6, 27500.8, 1543.27)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(34412.4, 27497.2, 1543.27)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(34411.8, 27498.5, 1543.27)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.locationorigin = [0:(34412, 27502.4, 1543.27)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1400];
    var_fdc9acdc19473f08["MERC_CAMP_C_RAIL_FUELING"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

