// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_contracts_sabotage_cs;

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_contracts_sabotage_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_contracts_sabotage_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_contracts_sabotage_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_contracts_sabotage_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c
// Size: 0x40
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_contracts_sabotage_cs");
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b3
// Size: 0x69
function function_fd69cf02ba4d90a2() {
    var_d13c18af4084bdfd = spawnstruct();
    var_d13c18af4084bdfd.name = "REV_OB_SABOTAGE";
    var_d13c18af4084bdfd.scriptbundle = "jup_activitydef_sabotage";
    var_d13c18af4084bdfd.var_dc10941a425d283c = &main;
    var_d13c18af4084bdfd.var_6e7eb28b2997b5b4 = &function_82613e20fba2deb9;
    var_d13c18af4084bdfd.var_ad1dcd56d202e9ac = &function_6da2952367672ac0;
    return var_d13c18af4084bdfd;
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x84
function function_82613e20fba2deb9(var_44fe95ae31b81c6d, var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    if (!isdefined(var_ce173d78f5680530)) {
        var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    }
    switch (var_44fe95ae31b81c6d) {
    case #"hash_53d2595a5f8e7677":
        function_eabdb13361e20852(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_70329fde07d566d3":
        function_23e5fc48465229a4(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    case #"hash_43abae9860084656":
        function_95397b1f6dc7f819(var_ce2d3c78f5803630, us, var_ce173d78f5680530);
        break;
    }
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af
// Size: 0x97
function function_eabdb13361e20852(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (6908.5, -35421, 2840.95), (0.02, 94.08, 0.01), "activity_nexus_instance_joiner", undefined, "SABOTAGE_H_RESIDENTIAL", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44d
// Size: 0x97
function function_23e5fc48465229a4(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (9164.5, -25679, 1806.72), (1.74, 117.24, 0.48), "activity_nexus_instance_joiner", undefined, "SABOTAGE_H_MARKET", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x97
function function_95397b1f6dc7f819(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (-1933.5, -38149, 2529.5), (0, 293.18, 0), "activity_nexus_instance_joiner", undefined, "SABOTAGE_H_CONSTRUCTION", undefined, undefined, (0, 0, 0), (0, 0, 0));
}

// Namespace mp_jup_st_h_ob_contracts_sabotage_cs/namespace_e625182b151dea91
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0x52c
function function_6da2952367672ac0() {
    var_fdc9acdc19473f08 = [];
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (13696, -34830, 2735);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(13703.5, -34830, 2735)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2400];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(13704.5, -34823.5, 2735)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:5000];
    var_5f614235e4cbbd5b.locationorigin = [0:(100.47, -35563.8, 2737.75)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2400];
    var_fdc9acdc19473f08["SABOTAGE_H_RESIDENTIAL"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (15143.5, -22893, 1704);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(15145, -22891, 1704)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2100];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(15144, -22891, 1704)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(15143.5, -22890, 1704)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2100];
    var_fdc9acdc19473f08["SABOTAGE_H_MARKET"] = var_5f614235e4cbbd5b;
    var_5f614235e4cbbd5b = spawnstruct();
    var_5f614235e4cbbd5b.scriptbundle = "jup_activitydef_sabotage";
    var_5f614235e4cbbd5b.var_ce173d78f5680530 = "mp_jup_st_h_ob_contracts_sabotage_cs";
    var_5f614235e4cbbd5b.var_f58ef0ea93d6d695 = (-1451.5, -32392, 1789);
    var_5f614235e4cbbd5b.var_79974a5ccd2183ba = (0, 0, 0);
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f = [];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].locationorigin = [0:(-1449, -32391.5, 1788.98)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["join_radius"].var_a19931107c2774a8 = [0:2000];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"] = spawnstruct();
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].locationorigin = [0:(-1456.5, -32391.5, 1789)];
    var_5f614235e4cbbd5b.var_5b156d1fa702b37f["participation_radius"].var_a19931107c2774a8 = [0:4000];
    var_5f614235e4cbbd5b.locationorigin = [0:(-1451.5, -32392, 1789)];
    var_5f614235e4cbbd5b.var_aed7dd4b5484e1d7 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_45283ef87b6e04b6 = [0:(0, 0, 0)];
    var_5f614235e4cbbd5b.var_a19931107c2774a8 = [0:2000];
    var_fdc9acdc19473f08["SABOTAGE_H_CONSTRUCTION"] = var_5f614235e4cbbd5b;
    return var_fdc9acdc19473f08;
}

