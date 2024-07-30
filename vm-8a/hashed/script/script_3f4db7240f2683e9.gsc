#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_a_ob_activities_doghouse_cs;

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_a_ob_activities_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_a_ob_activities_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_a_ob_activities_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_a_ob_activities_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_a_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_a_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_DOGHOUSE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_doghouse";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_a_ob_activities_doghouse_cs";
    }
    switch (instancename) {
    case #"hash_bed6c660c4d87ecd": 
        function_a47c01f80043fbf0(fe, us, cf);
        break;
    case #"hash_29a6b07afab7c029": 
        function_b052722819b1ff3e(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361
// Size: 0xa7
function function_a47c01f80043fbf0(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_A_POWER", undefined, undefined, undefined, (-13397.5, 34027.5, 2664), (0, 180.34, 0));
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410
// Size: 0xa7
function function_b052722819b1ff3e(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_a_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_A_CONSTRUCTION", undefined, undefined, undefined, (-31410.5, 14049.5, 983.5), (0, 84.81, 0));
}

// Namespace mp_jup_st_a_ob_activities_doghouse_cs / namespace_bdf6f22a57667e71
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bf
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_a_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-13397.5, 34027.5, 2664);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_A_POWER"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_a_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-31410.5, 14049.5, 983.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_A_CONSTRUCTION"] = instancestruct;
    return activityinstances;
}
