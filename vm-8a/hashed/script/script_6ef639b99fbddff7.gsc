#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs;

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_e_ob_contracts_pvpve_assassination_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_e_ob_contracts_pvpve_assassination_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_e_ob_contracts_pvpve_assassination_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_e_ob_contracts_pvpve_assassination_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_e_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239
// Size: 0x3f
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_e_ob_contracts_pvpve_assassination_cs");
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0
// Size: 0x68
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_ASSASSINATION";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydefinition_assassination";
    var_d13c18af4084bdfd.mainfunction = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x51
function function_82613e20fba2deb9(instancename, fe, us, cf) {
    if (!isdefined(cf)) {
        cf = "mp_jup_st_e_ob_contracts_pvpve_assassination_cs";
    }
    switch (instancename) {
    case #"hash_224d80f7a2c253b1": 
        function_38a9b758dd250c34(fe, us, cf);
        break;
    }
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a
// Size: 0x10d
function function_38a9b758dd250c34(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_pvpve_assassination_cs";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "activity_nexus_instance_joiner", "ASSASSINATION_E_PORT", "ASSASSINATION_E_PORT", undefined, undefined, (-10399, 1477.5, 1244), (0, 303.2, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_e_ob_contracts_pvpve_assassination_cs";
    s.name = "region";
    fe [[ f ]](s, us, cf, (0, 0, 0), (0, 0, 0), "assassination_region", undefined, "E", undefined, undefined, (-10399, 1477.5, 1244), (0, 303.2, 0));
}

// Namespace mp_jup_st_e_ob_contracts_pvpve_assassination_cs / namespace_5ea9848627a81537
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f
// Size: 0xb0
function function_6da2952367672ac0() {
    activityinstances = [];
    instancestruct = spawnstruct();
    instancestruct.scriptbundle = "jup_activitydefinition_assassination";
    instancestruct.cf = "mp_jup_st_e_ob_contracts_pvpve_assassination_cs";
    instancestruct.scriptstructorigin = (0, 0, 0);
    instancestruct.scriptstructoriginoffset = (-10399, 1477.5, 1244);
    instancestruct.locationorigin = [];
    instancestruct.locationoriginoffset = [];
    instancestruct.var_45283ef87b6e04b6 = [];
    instancestruct.locationradius = [];
    activityinstances["ASSASSINATION_E_PORT"] = instancestruct;
    return activityinstances;
}

