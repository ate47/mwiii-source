#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_interactions_aethertear_cs;

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_interactions_aethertear_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_interactions_aethertear_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_interactions_aethertear_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_interactions_aethertear_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x215
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x266
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_interactions_aethertear_cs");
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_AETHERTEAR";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_aethertear";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_g_ob_interactions_aethertear_cs";
    }
    switch (instancename) {
    case #"hash_16b80ba97286b622": 
        function_b5b4f5e2a533b969(fe, us, cf);
        break;
    case #"hash_506215da96d953c7": 
        function_b94a5713ec8b0c4e(fe, us, cf);
        break;
    case #"hash_b855ad14016f41de": 
        function_e793373333b70917(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x2b
function function_b5b4f5e2a533b969(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab
// Size: 0x2b
function function_b94a5713ec8b0c4e(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de
// Size: 0x2b
function function_e793373333b70917(fe, us, cf) {
    f = &strike_additem;
}

// Namespace mp_jup_st_g_ob_interactions_aethertear_cs / namespace_3fd3f3e1f48d8c00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x1e0
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_g_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (671.5, -14591, 1708);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_G_BRIDGE"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_g_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-12894, -9566, 1542);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_G_SEWER"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_st_g_ob_interactions_aethertear_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-27634, -34000.5, 2449);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_G_TRUCK"] = instancestruct;
    return activityinstances;
}
