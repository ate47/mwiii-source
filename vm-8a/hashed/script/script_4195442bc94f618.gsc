#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs;

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf6
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_activity_lowtown_doghouse_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_activity_lowtown_doghouse_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_activity_lowtown_doghouse_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_activity_lowtown_doghouse_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_activity_lowtown_doghouse_cs");
}

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
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

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x2f
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_e_ob_activity_lowtown_doghouse_cs";
    }
}

// Namespace mp_jup_st_e_ob_activity_lowtown_doghouse_cs / namespace_cc69d5b187b6b5d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0xf
function function_6da2952367672ac0() {
    activityinstances = [];
    return activityinstances;
}
