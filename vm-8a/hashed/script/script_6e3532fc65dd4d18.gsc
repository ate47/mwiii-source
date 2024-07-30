#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_ob_objectives_aethertear_test_cs;

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x118
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_ob_objectives_aethertear_test_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_ob_objectives_aethertear_test_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_ob_objectives_aethertear_test_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18c
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_ob_objectives_aethertear_test_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_ob_objectives_aethertear_test_cs");
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x242
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
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

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2bd
// Size: 0x51
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_ob_objectives_aethertear_test_cs";
    }
    switch (instancename) {
    case #"hash_9cb80d91f9052f25": 
        function_c36b5cec5932ce6(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x316
// Size: 0x81
function function_c36b5cec5932ce6(fe, us, cf) {
    f = &strike_additem;
    s = s();
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "s_aethertear_test", undefined, undefined, undefined, undefined, (44961.5, -5371, 1284), (0, 0, 0));
}

// Namespace mp_jup_ob_objectives_aethertear_test_cs / namespace_1763a657f75c77ea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39f
// Size: 0xb0
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_aethertear";
    instancestruct.cf = "mp_jup_ob_objectives_aethertear_test_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (44961.5, -5371, 1284);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["AETHERTEAR_TEST"] = instancestruct;
    return activityinstances;
}

