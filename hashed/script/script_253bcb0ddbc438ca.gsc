#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_hydro_ob_locked_spaces_cs;

// Namespace mp_jup_hydro_ob_locked_spaces_cs / namespace_f1cbe04e1535b396
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_hydro_ob_locked_spaces_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_hydro_ob_locked_spaces_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_hydro_ob_locked_spaces_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_hydro_ob_locked_spaces_cs / namespace_f1cbe04e1535b396
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15c
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_hydro_ob_locked_spaces_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_hydro_ob_locked_spaces_cs");
}

// Namespace mp_jup_hydro_ob_locked_spaces_cs / namespace_f1cbe04e1535b396
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb
// Size: 0x40
function createstructs(fe, us, cf) {
    f = &strike_additem;
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_hydro_ob_locked_spaces_cs / namespace_f1cbe04e1535b396
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x213
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_hydro_ob_locked_spaces_cs / namespace_f1cbe04e1535b396
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_hydro_ob_locked_spaces_cs");
}
