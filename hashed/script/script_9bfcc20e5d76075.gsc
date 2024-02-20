// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_f_ob_intel_cs;

// Namespace mp_jup_st_f_ob_intel_cs/namespace_36260b098cf2fcf9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f9
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_f_ob_intel_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_f_ob_intel_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_f_ob_intel_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_f_ob_intel_cs/namespace_36260b098cf2fcf9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, var_ce173d78f5680530) {
    level endon("game_ended");
    wait_for_cs_flag(var_ce173d78f5680530);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_f_ob_intel_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, var_ce173d78f5680530);
    level thread wait_for_flags(s, "mp_jup_st_f_ob_intel_cs");
}

// Namespace mp_jup_st_f_ob_intel_cs/namespace_36260b098cf2fcf9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc
// Size: 0x41e
function createstructs(var_ce2d3c78f5803630, us, var_ce173d78f5680530) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "deadbolt";
    s.name = "deadbolt_radio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42962.5, -7993.5, 3112), (0, 267, 0), "deadbolt_radio_intel", undefined, "intel_s0_deadbolt_radio_taomangler");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "terminus";
    s.name = "terminus_audio_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27103.5, -1930, 2689.15), (0, 327.94, 0), "terminus_audio_intel", undefined, "intel_s0_terminus_audio_beginning");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.name = "note_intel";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (32493, -12022, 2965), (0, 191.8, 0), "note_intel", undefined, "jup_zm_ob_intel_notes_10");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_rural_shop_md_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (34644.8, 917.58, 2554.04), (0, 0.29, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_rural_packing_building_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (42411.7, -4171.42, 3176), (0, 270.29, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_rural_house_md_06_abandoned";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (41247, 14662.3, 3413.52), (0, 321.37, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_rural_house_md_06";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (28186.5, 10412.5, 2112), (0, 141.37, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_rural_house_md_2s_03";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (27113.2, -2021, 2532.5), (0, 351.18, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_house_lg_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (31878.4, 1864.64, 2381.3), (0, 90.29, 0), "terminus_audio_intel_warlord");
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_f_ob_intel_cs";
    s.groupid = "stronghold";
    s.name = "terminus_audio_intel_stronghold_f_police_station_01";
    var_ce2d3c78f5803630 [[ f ]](s, us, var_ce173d78f5680530, (24491.5, -14978.4, 2994.57), (0, 38.95, 0), "terminus_audio_intel_warlord");
    var_ce2d3c78f5803630 ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_f_ob_intel_cs/namespace_36260b098cf2fcf9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x801
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_f_ob_intel_cs/namespace_36260b098cf2fcf9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80b
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_f_ob_intel_cs");
}

