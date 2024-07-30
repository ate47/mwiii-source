#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_g_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333
// Size: 0x83
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_g_ob_contracts_sabotage_cs";
    }
    switch (instancename) {
    case #"hash_9ff567c0be3caae4": 
        function_3225c9b7434ac55b(fe, us, cf);
        break;
    case #"hash_7180e6fb4ea40a1d": 
        function_af28e710f3543e84(fe, us, cf);
        break;
    case #"hash_d3669e3027f6f47e": 
        function_2c7874ae513e71db(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be
// Size: 0x96
function function_3225c9b7434ac55b(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (-25665.5, -27424, 1762.25), (0, 0, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_G_WAREHOUSES", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x96
function function_af28e710f3543e84(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (-3461, -15745.5, 1802.52), (360, 319.11, -0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_G_OCEANSIDE_NORTH", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fa
// Size: 0x96
function function_2c7874ae513e71db(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_ob_contracts_sabotage_cs";
    fe [[ f ]](s, us, cf, (-6914, -33572.5, 1788.5), (0, 71.27, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_G_APARTMENT_COURTYARD", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_g_ob_contracts_sabotage_cs / namespace_45414989879aa2f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x598
// Size: 0x52b
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_g_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (-25754, -20840, 1701);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-25764, -20852, 1701)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3200];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-25762, -20848, 1701)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(-25774, -20860, 1701)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [3200];
    activityinstances["SABOTAGE_G_WAREHOUSES"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_g_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (-7048, -12260, 1688);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-7048, -12268, 1688)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [2700];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-7038, -12276, 1688)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(-7048, -12276, 1688)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [2700];
    activityinstances["SABOTAGE_G_OCEANSIDE_NORTH"] = instancestruct;
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydef_sabotage";
    instancestruct.cf = "mp_jup_st_g_ob_contracts_sabotage_cs";
    instancestruct.scriptstructorigin = (-11920, -40180, 2293.5);
    instancestruct.scriptstructoriginoffset = (0, 0, 0);
    instancestruct.var_5b156d1fa702b37f = [];
    instancestruct.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationorigin = [(-11918, -40202, 2294)];
    instancestruct.var_5b156d1fa702b37f["join_radius"].locationradius = [3000];
    instancestruct.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationorigin = [(-11932, -40206, 2294)];
    instancestruct.var_5b156d1fa702b37f["participation_radius"].locationradius = [5000];
    instancestruct.locationorigin = [(-11920, -40188, 2293.5)];
    instancestruct.locationoriginoffset = [(0, 0, 0)];
    instancestruct.var_45283ef87b6e04b6 = [(0, 0, 0)];
    instancestruct.locationradius = [4000];
    activityinstances["SABOTAGE_G_APARTMENT_COURTYARD"] = instancestruct;
    return activityinstances;
}
