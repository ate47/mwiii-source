// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\create_script_utility.gsc;

#namespace mp_jup_st_h_ob_mysteryboxes_cs;

// Namespace mp_jup_st_h_ob_mysteryboxes_cs / namespace_7364490eabcde8d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7
// Size: 0x6d
function main(unused, us) {
    if (flag_exist("mp_jup_st_h_ob_mysteryboxes_cs")) {
        return;
    }
    if (!isdefined(us)) {
        us = function_b055d49370405173();
    }
    flag_init("mp_jup_st_h_ob_mysteryboxes_cs");
    s = spawnstruct();
    level thread cs_return_and_wait_for_flag(us, s, "mp_jup_st_h_ob_mysteryboxes_cs");
    if (!cs_is_starttime()) {
        endcreatescript(s);
    }
}

// Namespace mp_jup_st_h_ob_mysteryboxes_cs / namespace_7364490eabcde8d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b
// Size: 0x68
function cs_return_and_wait_for_flag(us, s, cf) {
    level endon("game_ended");
    wait_for_cs_flag(cf);
    if (!isdefined(us)) {
        us = "pfx";
    }
    s cs_setup_arrays(us, "mp_jup_st_h_ob_mysteryboxes_cs");
    cs_flags_init(s);
    level thread createstructs(s, us, cf);
    level thread wait_for_flags(s, "mp_jup_st_h_ob_mysteryboxes_cs");
}

// Namespace mp_jup_st_h_ob_mysteryboxes_cs / namespace_7364490eabcde8d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0x193
function createstructs(fe, us, cf) {
    f = &strike_additem;
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "magicbox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (1849.61, -35879.4, 1983), (359.97, 285.01, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "magicbox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (14661, -23512, 1963), (359.98, 360, 0));
    s = s();
    s.var_ca7eef470d1b0ef2 = "mp_jup_st_h_ob_mysteryboxes_cs";
    s.content_key = "magicbox_spawn";
    s.name = "magicbox_spawn";
    s.variantname = "content_struct";
    fe [[ f ]](s, us, cf, (2758.25, -23413.8, 1759), (359.97, 75.75, 0));
    fe ent_flag_set("cs_objects_created");
    function_7af6d59eef91a7dd();
}

// Namespace mp_jup_st_h_ob_mysteryboxes_cs / namespace_7364490eabcde8d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354
// Size: 0x3
function function_7af6d59eef91a7dd() {
    
}

// Namespace mp_jup_st_h_ob_mysteryboxes_cs / namespace_7364490eabcde8d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35e
// Size: 0xf
function cleanup() {
    function_71a564b3bc009618("mp_jup_st_h_ob_mysteryboxes_cs");
}

