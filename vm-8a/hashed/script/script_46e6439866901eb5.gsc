#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_g_gas_stations;

// Namespace mp_jup_st_g_gas_stations / namespace_2ca3dad2d6898e0d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2
// Size: 0x6c
function main(unused, us) {
    if (flag_exist("mp_jup_st_g_gas_stations")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_g_gas_stations");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_g_gas_stations");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_g_gas_stations / namespace_2ca3dad2d6898e0d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146
// Size: 0x67
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_g_gas_stations");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_g_gas_stations");
}

// Namespace mp_jup_st_g_gas_stations / namespace_2ca3dad2d6898e0d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x150
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (-26488, -33493.5, 2446.5), (0, 0, 0), "gas_station", undefined, undefined, undefined, undefined, undefined, undefined, 400);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (-34536, -19888, 864), (0, 0, 0), "gas_station_marine", undefined, undefined, undefined, undefined, undefined, undefined, 650);
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_g_gas_stations";
    s.height = 1000;
    fe [[ f ]](s, us, cf, (-10162, -30074.5, 1710), (0, 0, 0), "gas_station", undefined, undefined, undefined, undefined, undefined, undefined, 400);
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_g_gas_stations / namespace_2ca3dad2d6898e0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x2
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_g_gas_stations / namespace_2ca3dad2d6898e0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317
// Size: 0xe
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_g_gas_stations");
}
