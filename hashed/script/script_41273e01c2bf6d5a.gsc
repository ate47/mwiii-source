// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_activities_harvesterorb_cs;

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_activities_harvesterorb_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_activities_harvesterorb_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_activities_harvesterorb_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_activities_harvesterorb_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_activities_harvesterorb_cs");
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_HARVESTERORB";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_harvesterorb";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_7ab7f74cef183398":
        function_b1a5459603cf7723(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_b7edc9e08de6b930":
        function_4bd4e14bc6859ad3(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_1bb2640ac1c00c1":
        function_d10749764b6d37ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0x2c
function function_b1a5459603cf7723(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x2c
function function_4bd4e14bc6859ad3(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df
// Size: 0x2c
function function_d10749764b6d37ee(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
}

// Namespace mp_jup_st_f_ob_activities_harvesterorb_cs/namespace_cc7ac595d2133a92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x28f
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_harvesterorb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (24579, -11303.5, 2804);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(24579, -11303.5, 2804)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["HARVESTERORB_F_FARM"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_harvesterorb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (39907.5, 17499.5, 3349.5);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(39907.5, 17499.5, 3349.5)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["HARVESTERORB_F_TOWN"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_harvesterorb";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_f_ob_activities_harvesterorb_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (0, 0, 0);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (42510, -461, 2907);
    var_5f614235e4cbbd5b.locationorigin = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(42510, -461, 2907)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:1000];
    var_fdc9acdc19473f08["HARVESTERORB_F_FIELDS"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}
