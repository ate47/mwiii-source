// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_b_ob_activities_merc_camp_cs;

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_b_ob_activities_merc_camp_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_b_ob_activities_merc_camp_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_b_ob_activities_merc_camp_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa83
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_b_ob_activities_merc_camp_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_b_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb39
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb43
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_b_ob_activities_merc_camp_cs");
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59
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

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbca
// Size: 0xcf
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_e904c97285ae2c1":
        function_dc67807d67e3c05e(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_d22666e0605a1736":
        function_9a7d49f0492acf49(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_bed39db98b4f9209":
        function_1017237dc53ad38(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_82ba356705b5c461":
        function_62ea6900bbc75b6a(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_ff475b99c39522c6":
        function_8e881a503ddb91a7(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_4c9c081e00475a4a":
        function_42464dce035ea59b(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca0
// Size: 0x9b3
function function_dc67807d67e3c05e(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (197.99, -38.16, -10.15), (356.36, 71.12, 0.77), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-793.5, -397, 14.5), (0, 272.47, -0), "MERC_CAMP_INDUSTRIAL_GASSOUTH", undefined, "merc_camp_industrial_gassouth", "link_merc_camp_industrial_gassouth", undefined, (-478, 18676, 1014), (0, 0, 0), 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (538, 226.5, -14.15), (359.94, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1524.99, -526.4, 600), (0, 0, 0), "s_merc_camp_drone", "cspf_7_auto16123286219487778423", undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (128.94, -937, 600), (0, 0, 0), "cspf_7_auto16123286219487778423", "cspf_7_auto1216810931826158050", undefined, undefined, undefined, (-478, 18676, 1014), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1505, -191.5, -12.64), (0, 101.94, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (700.5, 300, -14.02), (359.96, 0, 0.01), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1250.27, 563.32, -15.09), (0.88, 346.5, -0.46), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-779.5, -390, 14.5), (0, 171.76, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2240, -800, 384.62), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1952, -896, -0.47), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1093.27, 501.32, -15.16), (0.41, 346.52, -1.57), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1787.98, 828.24, -12.67), (0.22, 83.73, 0.45), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1926.79, 921.46, -12.28), (0.23, 83.73, 0.12), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-64, 1984, -8.15), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1401.56, -544, 600), (0, 0, 0), "cspf_7_auto13034333851474446494", "cspf_7_auto16123286219487778423", undefined, undefined, undefined, (-478, 18676, 1014), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (608, -2080, 400.75), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (358.06, -292.12, 600), (0, 0, 0), "cspf_7_auto1216810931826158050", "cspf_7_auto4826441615498027037", undefined, undefined, undefined, (-478, 18676, 1014), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1108, 178.69, 600), (0, 0, 0), "cspf_7_auto4826441615498027037", "cspf_7_auto13034333851474446494", undefined, undefined, undefined, (-478, 18676, 1014), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.groupid = "mines";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2079.02, 889.91, -10.94), (359.98, 132.33, 0.12), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gassouth", (-478, 18676, 1014), (0, 0, 0), 100);
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165a
// Size: 0x906
function function_9a7d49f0492acf49(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1588.21, 1344.49, 5.99), (0, 0, 0), "MERC_CAMP_INDUSTRIAL_BRIDGE", undefined, "merc_camp_industrial_bridge", "link_merc_camp_industrial_bridge", undefined, (14398, 24438, 1538), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1409, -1083, 8), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-681.7, 968.42, 600), (0, 0, 0), "s_merc_camp_drone", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-791.07, 1020.42, 600), (0, 0, 0), "cspf_8_auto8038584816154551323", "cspf_8_auto9475429086340380124", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-290.81, 0.76, -1.71), (0, 324.01, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2191.36, 1738.51, 10.68), (5.63, 359.74, 3.13), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2708.44, 1424.5, 13.67), (5.41, 304.2, -1.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1588.98, 1341.96, 12.8), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-743.88, 761.14, -1.06), (356.36, 323.81, 1.42), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-5899, 3572, -229), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-934.97, 604.68, 0.87), (0, 315.1, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-754.11, 595.44, -0.42), (0, 333.3, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1938.03, 1878.36, 600), (0, 0, 0), "cspf_8_auto9475429086340380124", "cspf_8_auto12987866824501751068", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2570.46, 2177.11, 600), (0, 0, 0), "cspf_8_auto12987866824501751068", "cspf_8_auto11486071124093972290", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2913.04, 1950.17, 600), (0, 0, 0), "cspf_8_auto11486071124093972290", "cspf_8_auto16306448933336995108", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2916.8, 1543.41, 600), (0, 0, 0), "cspf_8_auto16306448933336995108", "cspf_8_auto779906190278987051", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2172.67, 940.15, 600), (0, 0, 0), "cspf_8_auto779906190278987051", "cspf_8_auto9278999382624902337", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1037.07, 311.2, 600), (0, 0, 0), "cspf_8_auto9278999382624902337", "cspf_8_auto3016972610675486458", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-728.66, 670.95, 600), (0, 0, 0), "cspf_8_auto3016972610675486458", "cspf_8_auto8038584816154551323", undefined, undefined, "link_merc_camp_industrial_bridge", (14398, 24438, 1538), (0, 0, 0), undefined, 7);
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f67
// Size: 0xb51
function function_1017237dc53ad38(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "central";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2508.26, -4370.14, -242), (0, 0, -180), "MERC_CAMP_INDUSTRIAL_GASCENTER", undefined, "merc_camp_industrial_gascenter", "link_merc_camp_industrial_gascenter", undefined, (2784, 31550, 1240), (0, 0, 0), 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3768.5, -4791, -240.5), (359.25, 0.2, 0.7), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4768, -5376, -234), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1463.51, -4417.4, 94.5), (0.43, 206, -0.6), "s_merc_camp_drone", "cspf_9_auto5013739825593310476", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1313.94, -4461.5, 94.5), (0, 0, 0), "cspf_9_auto5013739825593310476", "cspf_9_auto4215843337698092585", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1811.25, -3921.25, -242), (2.19, 265.41, -0.86), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1452.38, -4343.08, -240.51), (359.94, 0.21, 0.13), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2773, -4226, -240), (357.44, 313.81, 2.62), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2509.47, -4372.84, -242), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1503.72, -4001.18, -240.5), (2.8, 268.62, 0.26), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-288, -2880, -236), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1676.84, -3562.61, -240.5), (0.4, 133.73, 0.4), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1382.44, -4920.58, -240.5), (0.54, 288.6, -0.55), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3776, -7168, -251.6), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3644.83, -5404.92, -240.5), (0.22, 315.2, 0.65), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1429.3, -4988.47, 94.5), (0, 0, 0), "cspf_9_auto4215843337698092585", "cspf_9_auto7990599050101051210", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2174.48, -5401.71, 94.5), (0, 0, 0), "cspf_9_auto7990599050101051210", "cspf_9_auto5570641896300158844", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3016.91, -5354.8, 94.5), (0, 0, 0), "cspf_9_auto5570641896300158844", "cspf_9_auto1027769937413732979", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3290.23, -5169.39, 94.5), (0, 0, 0), "cspf_9_auto1027769937413732979", "cspf_9_auto9780561313479104138", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3344.25, -4281.43, 94.5), (0, 0, 0), "cspf_9_auto9780561313479104138", "cspf_9_auto5072479201706512821", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3086.85, -3821.26, 94.5), (0, 0, 0), "cspf_9_auto5072479201706512821", "cspf_9_auto2062942744236520417", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2350.86, -3561.76, 94.5), (0, 0, 0), "cspf_9_auto2062942744236520417", "cspf_9_auto10117636571388935692", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1812.21, -3680.09, 94.5), (0, 0, 0), "cspf_9_auto10117636571388935692", "cspf_9_auto7866135536276369568", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1381.62, -4114.2, 94.5), (0, 268, 0), "cspf_9_auto7866135536276369568", "cspf_9_auto5013739825593310476", undefined, undefined, "link_merc_camp_industrial_gascenter", (2784, 31550, 1240), (0, 0, 0), undefined, 6);
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abf
// Size: 0xa55
function function_62ea6900bbc75b6a(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6086, 408, 48), (0, 0, 0), "MERC_CAMP_B_HIGHWAY_UNDERPASS", undefined, "merc_camp_b_highway_underpass", "link_merc_camp_b_highway_underpass", undefined, (-9942, 32962, 1272), (0, 0, 0), 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_5";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5463.44, 1088.75, 464), (0, 0, 0), "cspf_10_auto12966276661901813457", "cspf_10_auto16523968955834201179", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5528.01, -183.4, 413.76), (0, 326, 0), "s_merc_camp_drone", "cspf_10_auto11573377142374743001", undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), undefined, 5, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_1";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6701.94, -136.25, 464), (0, 0, 0), "cspf_10_auto11573377142374743001", "cspf_10_auto10121765232779370094", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_4";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6641.44, 1148.75, 464), (0, 0, 0), "cspf_10_auto5691491237810603439", "cspf_10_auto12966276661901813457", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5668.41, 1274.16, -129.59), (0, 0, -27.19), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5265, 594.83, 50.38), (355.19, 21.43, 0.35), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (3360, 832, -43.26), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (7840, 416, 183.88), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5673.4, 904.03, 31.09), (357.88, 1.65, -31.31), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6728.59, 246.44, 75.86), (359.62, 0.33, 1.71), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6446.89, -301.04, -37.92), (358.9, 0.4, -5.58), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (4976.39, 114.48, 57.23), (359.5, 0.1, 0.17), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5363.57, -188.81, 42.6), (357.38, 359.48, -3.25), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_2";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6971.47, 212.83, 449.87), (0, 0, 0), "cspf_10_auto10121765232779370094", "cspf_10_auto94812653565888116", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_6";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5216.82, 624.39, 491.01), (0, 0, 0), "cspf_10_auto16523968955834201179", "cspf_10_auto4946141417631550295", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_7";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5226.29, 245.44, 490.51), (0, 0, 0), "cspf_10_auto4946141417631550295", "cspf_10_auto5655066848969886964", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_8";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5479.44, -148.5, 464), (0, 0, 0), "cspf_10_auto5655066848969886964", "cspf_10_auto11573377142374743001", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5267.23, -129.55, 48.95), (359.01, 239.12, 1.32), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli_3";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6985.73, 876.61, 448.46), (0, 0, 0), "cspf_10_auto94812653565888116", "cspf_10_auto5691491237810603439", undefined, undefined, undefined, (-9942, 32962, 1272), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (5984, 2368, 13.31), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_highway_underpass", (-9942, 32962, 1272), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x351b
// Size: 0x874
function function_8e881a503ddb91a7(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "center";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (819.05, 467.08, 1), (0, 0, 0), "MERC_CAMP_B_REACTOR_PORT", undefined, "merc_camp_b_reactor_port", "link_merc_camp_b_reactor_port", undefined, (7182, 20072, 1000), (0, 0, 0), 200);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1476.15, 234.14, 11.35), (359.93, 148.23, 0.03), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "script_struct_heli";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1216.01, -275.4, 564), (0, 326, 0), "s_merc_camp_drone", "cspf_11_auto11573377142374743001", undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1470.44, -351.5, 554), (0, 326, 0), "cspf_11_auto11573377142374743001", "cspf_11_auto5691491237810603439", undefined, undefined, undefined, (7182, 20072, 1000), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1852.44, 724.5, 566), (0, 326, 0), "cspf_11_auto5691491237810603439", "cspf_11_auto8173500450952701261", undefined, undefined, undefined, (7182, 20072, 1000), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2136, -1400, 49.74), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "vehicle";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (874, 34, 0), (0, 341.5, 0), "s_merc_camp_vehicle", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1864, 776, -41.86), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1728, 2848, 4.49), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1452.82, 1347.49, 0.75), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1057.13, 1192.03, 0.5), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (219.87, 143.82, 0.75), (0, 0, 0), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (121, 491, 0.72), (359.97, 360, 0.05), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1505.76, -62.58, 3.22), (1.15, 74.93, 1.83), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "mine";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1359, -366.5, 3.39), (2.77, 84.74, 0.23), "s_merc_camp_mine", undefined, undefined, undefined, "link_merc_camp_b_reactor_port", (7182, 20072, 1000), (0, 0, 0), 100);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (512, 1210, 566), (0, 326, 0), "cspf_11_auto8173500450952701261", "cspf_11_auto10624595389526674977", undefined, undefined, undefined, (7182, 20072, 1000), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-102, -16, 566), (0, 326, 0), "cspf_11_auto10624595389526674977", "cspf_11_auto206759760847127597", undefined, undefined, undefined, (7182, 20072, 1000), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (1424, -454, 566), (0, 326, 0), "cspf_11_auto206759760847127597", "cspf_11_auto11573377142374743001", undefined, undefined, undefined, (7182, 20072, 1000), (0, 0, 0), undefined, 7);
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d96
// Size: 0x62c
function function_42464dce035ea59b(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "center_struct";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (105.11, -15.83, -1.33), (0, 0, 0), "MERC_CAMP_B_RAILWAY_JUNCTION", undefined, "merc_camp_b_railway_junction", "link_merc_camp_b_railway_junction", undefined, (12062, 34535, 1260.9), (0, 0, 0), 500);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    s.name = "drone_start";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (659.01, 88.6, 576), (0, 182, 0), "s_merc_camp_drone", "cspf_12_auto8038584816154551323", undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0), undefined, 7, 1);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (196.44, 512.5, 576), (0, 326, 0), "cspf_12_auto8038584816154551323", "cspf_12_auto9475429086340380124", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-949.03, 224.36, 576), (0, 326, 0), "cspf_12_auto9475429086340380124", "cspf_12_auto15594446451652560491", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (674.97, -575.64, 576), (0, 326, 0), "cspf_12_auto11234176457572567615", "cspf_12_auto17516803655815917800", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-845.03, -471.64, 576), (0, 326, 0), "cspf_12_auto15594446451652560491", "cspf_12_auto6226715010739024097", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2304, -1096, -60.91), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "guard";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (107.98, -21.13, -1.67), (0, 0, 0), "s_merc_camp_guard", undefined, undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0), 250);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-112.15, -1188.97, 576), (0, 326, 0), "cspf_12_auto6226715010739024097", "cspf_12_auto11234176457572567615", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.ishelistruct = 1;
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (931.98, 232.78, 576), (0, 145.3, 0), "cspf_12_auto17516803655815917800", "cspf_12_auto8038584816154551323", undefined, undefined, undefined, (12062, 34535, 1260.9), (0, 0, 0), undefined, 7);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-2440, 1536, 15.1), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "sentry";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (87.49, 172.74, 9.62), (0, 93.28, 0), "s_merc_camp_sentry", undefined, undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    s.name = "zombies_v_mercs_spawn";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (2968, -632, -301.78), (0, 0, 0), "s_merc_camp_zombie", undefined, undefined, undefined, "link_merc_camp_b_railway_junction", (12062, 34535, 1260.9), (0, 0, 0));
}

// Namespace mp_jup_st_b_ob_activities_merc_camp_cs/namespace_57a41b7787d9a192
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c9
// Size: 0xcb5
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-829.61, -450.32, 17.5);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-478, 18676, 1014);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-648, -120, -8)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-632, -232, -16)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-696, -104, -16)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.locationorigin = [0:(-496, -232, -16)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-478, 18676, 1014)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_INDUSTRIAL_GASSOUTH"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1599.51, 1318.04, 16);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (14398, 24438, 1538);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-1912, 1280, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:3000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-1936, 1344, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-2016, 1392, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.locationorigin = [0:(-1896, 1288, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(14398, 24438, 1538)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_INDUSTRIAL_BRIDGE"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (2534, -4378, -242);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (2784, 31550, 1240);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(2640, -4608, -232)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(2480, -4488, -232)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(2608, -4472, -232)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2300];
    var_5f614235e4cbbd5b.locationorigin = [0:(2472, -4344, -232)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(2784, 31550, 1240)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_INDUSTRIAL_GASCENTER"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (6086, 378, 54.71);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (-9942, 32962, 1272);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(6080, 440, 48)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(6080, 400, 48)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(6144, 352, 48)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.locationorigin = [0:(5872, 600, 48)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(-9942, 32962, 1272)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_B_HIGHWAY_UNDERPASS"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (844, 480, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (7182, 20072, 1000);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(1144, 856, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2200];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(1048, 432, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:1900];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(1048, 432, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.locationorigin = [0:(1048, 432, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(7182, 20072, 1000)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_B_REACTOR_PORT"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydefinition_merccamp";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_b_ob_activities_merc_camp_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (128, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (12062, 34535, 1260.9);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(8, -176, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].locationorigin = [0:(-113.5, -337, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["ai_exclusion_radius"].var_a19931107c2774a8 = [0:2160];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(8, -176, 0)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:1920];
    var_5f614235e4cbbd5b.locationorigin = [0:(8, -176, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(12062, 34535, 1260.9)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1800];
    var_fdc9acdc19473f08["MERC_CAMP_B_RAILWAY_JUNCTION"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
