#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_d_ob_activities_doghouse_cs;

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_d_ob_activities_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_d_ob_activities_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_d_ob_activities_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_d_ob_activities_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_d_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_d_ob_activities_doghouse_cs");
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276
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

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e7
// Size: 0x6a
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_d_ob_activities_doghouse_cs";
    }
    switch (instancename) {
    case #"hash_355050a7545a5642": 
        function_282aedc1db4a9195(fe, us, cf);
        break;
    case #"hash_58d6b33804993c3f": 
        function_e251c30284e3e8da(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359
// Size: 0xa7
function function_282aedc1db4a9195(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_D_AUTO", undefined, undefined, undefined, (-16813, -11180, 1504), (0, 89.5, 0));
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408
// Size: 0xa7
function function_e251c30284e3e8da(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_d_ob_activities_doghouse_cs";
    s.name = "doghouse_scriptable_struct";
    fe [[ f ]](s, us, cf, (57, 0, 0), (0, 0, 0), "doghouse_scriptable_struct", "DOGHOUSE_D_HOUSE", undefined, undefined, undefined, (-19943, 4580.5, 1269.5), (0, 359.8, 0));
}

// Namespace mp_jup_st_d_ob_activities_doghouse_cs / namespace_2b66e8182cceb9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7
// Size: 0x148
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_d_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-16813, -11180, 1504);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_D_AUTO"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_doghouse";
    instancestruct.cf = "mp_jup_st_d_ob_activities_doghouse_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-19943, 4580.5, 1269.5);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["DOGHOUSE_D_HOUSE"] = instancestruct;
    return activityinstances;
}
