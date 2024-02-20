// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\player.gsc;
#using script_40f4c8f2b94c5cd9;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_e172762c9e742745;

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe05
// Size: 0xa
function function_e04bd99e1bb6430b() {
    chopperexif_fx_init();
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16
// Size: 0xed8
function chopperexfil_pack(var_cbfc3ba10cefc8ce) {
    if (!isdefined(var_cbfc3ba10cefc8ce)) {
        var_cbfc3ba10cefc8ce = (0, 0, 0);
    }
    thread chopperexfil_introsound(5, var_cbfc3ba10cefc8ce);
    if (!getdvarint(@"hash_19a406e3c51ce52f")) {
        self.transientname = get_chopperexfil_transient();
        loadinfiltransient(self.transientname);
        setomnvarforallclients("ui_br_end_game_splash_type", 18);
        var_24b79087f3897e94 = 0;
        while (!var_24b79087f3897e94) {
            waitframe();
            var_24b79087f3897e94 = function_2030cc4ad67d1634(self.transientname);
        }
    }
    chopper = spawn_script_model("veh8_mil_air_blima_scriptmodel");
    chopper hidepart("tag_main_rotor_blade_01");
    chopper hidepart("tag_main_rotor_blade_02");
    chopper hidepart("tag_main_rotor_blade_03");
    chopper hidepart("tag_main_rotor_blade_04");
    chopper hidepart("tag_tail_rotor_blade_01");
    chopper hidepart("tag_tail_rotor_blade_02");
    chopper hidepart("tag_tail_rotor_blade_03");
    chopper hidepart("tag_tail_rotor_blade_04");
    self.exfilchopper = chopper;
    chopperexfil_set_brcircle();
    head = [0:"head_mp_helicopter_crew", 1:"j_spine4"];
    var_31093158b2292193 = [0:head];
    body = "body_pilot_helicopter_british";
    ropeguy = spawn_script_model(body, undefined, var_31093158b2292193);
    self.ropeguy = ropeguy;
    self.winners = array_removeundefined(self.winners);
    if (self.winners.size == 0) {
        create_disconnectplayer(self);
    }
    rope = spawn_script_model("equipment_fast_rope_wm_01_infil_heli_l");
    self.rope = rope;
    self.cam = create_cam();
    ascenders = [];
    ascenders[0] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender0");
    if (self.winners.size > 1) {
        ascenders[1] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender1");
    }
    if (self.winners.size > 2) {
        ascenders[2] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender2");
    }
    if (self.winners.size > 3) {
        ascenders[3] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender3");
    }
    self.ascenders = ascenders;
    self.packs = [];
    n = 0;
    self.packs[n] = create_animpack("scene1");
    self.packs[n] add_pack_startfunc([], &chopperexfil_sh010_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh010"]);
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_co_sh010"]);
    self.packs[n] add_pack_modelanim(rope, level.var_1a209bd995a7fa83["br_exfil_rope_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh010"]);
    self.packs[n] add_pack_fx("chopperExfil_gas", self.origin, self.angles);
    n++;
    self.packs[n] = create_animpack("scene2");
    self.packs[n] add_pack_startfunc(self.winners, &chopperexfil_sh020_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"]);
    if (!isdefined(level.scr_notetrack["veh8_mil_air_blima_scriptmodel"]) || !isdefined(level.scr_notetrack["veh8_mil_air_blima_scriptmodel"]["any"]["guy0_aboard"])) {
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy0_aboard", &chopperexfil_skip_ascend0);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy1_aboard", &chopperexfil_skip_ascend1);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy2_aboard", &chopperexfil_skip_ascend2);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "slamtoblack", &chopperexfil_slamtoblack);
    }
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_pilot_sh020"]);
    self.packs[n] add_pack_modelanim(rope, level.var_1a209bd995a7fa83["br_exfil_rope_sh020"]);
    self.packs[n] add_pack_modelanim(ascenders[0], level.var_1a209bd995a7fa83["br_exfil_ascender0_sh020"]);
    if (self.winners.size > 1) {
        self.packs[n] add_pack_modelanim(ascenders[1], level.var_1a209bd995a7fa83["br_exfil_ascender1_sh020"]);
    }
    if (self.winners.size > 2) {
        self.packs[n] add_pack_modelanim(ascenders[2], level.var_1a209bd995a7fa83["br_exfil_ascender2_sh020"]);
    }
    if (self.winners.size > 3) {
        self.packs[n] add_pack_modelanim(ascenders[3], level.var_1a209bd995a7fa83["br_exfil_ascender3_sh020"]);
    }
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh020_fem"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh020"]);
    n++;
    self.packs[n] = create_animpack("scene2.5");
    self.packs[n] add_pack_startfunc(self.winners, &chopperexfil_sh025_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"]);
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_pilot_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh025"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh025"]);
    n++;
    self.packs[n] = create_animpack("scene3");
    self.packs[n] add_pack_startfunc(self.winners, &chopperexfil_sh030_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh030"]);
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_pilot_sh030"]);
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh030"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh030_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh030"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh030_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh030"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh030_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh030"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh030_fem"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh030"]);
    if (self.winners.size >= 2) {
        n++;
        self.packs[n] = create_animpack("scene4");
        self.packs[n] add_pack_startfunc([0:ropeguy], &chopperexfil_sh040_start);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh040"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh040_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh040"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh040_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh040"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh040_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh040"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh040_fem"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh040"]);
    }
    if (self.winners.size >= 3) {
        n++;
        self.packs[n] = create_animpack("scene5");
        self.packs[n] add_pack_startfunc([], &chopperexfil_sh050_start);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh050"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh050_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh050"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh050_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh050"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh050_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh050"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh050_fem"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh050"]);
    }
    if (self.winners.size == 4) {
        n++;
        self.packs[n] = create_animpack("scene6");
        self.packs[n] add_pack_startfunc([], &chopperexfil_sh060_start);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh060"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh060_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh060"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh060_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh060"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh060_fem"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh060"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh060_fem"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh060"]);
    }
    n++;
    self.packs[n] = create_animpack("scene7");
    self.packs[n] add_pack_startfunc([], &chopperexfil_sh070_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"]);
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh070"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh070"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh070"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh070"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh070"]);
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf5
// Size: 0x2ea
function function_a5538b1593309bb0() {
    var_79a78f73d2d4925d = [];
    var_78258ca0b59079a = 30;
    var_e4c66fc441e3f497 = 68;
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy0_sh020"], 0, undefined, var_78258ca0b59079a, var_e4c66fc441e3f497);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy1_sh020"], 0, undefined, var_78258ca0b59079a, var_e4c66fc441e3f497);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy2_sh020"], 0, undefined, var_78258ca0b59079a, var_e4c66fc441e3f497);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy3_sh020"], 0, undefined, var_78258ca0b59079a, var_e4c66fc441e3f497);
    var_a5c6d4f05fa73949 = "veh8_mil_air_blima_scriptmodel";
    var_fb88f2d5ecebb3e1 = (0, 0, -70);
    var_ea07460c784be362 = 350;
    var_aba9da4be1ce5ce2 = 10;
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh030"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh040"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh050"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh060"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], 0, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], 0.99, var_fb88f2d5ecebb3e1, var_ea07460c784be362);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh010"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh030"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh040"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh050"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh060"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, var_a5c6d4f05fa73949, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], var_fb88f2d5ecebb3e1, var_ea07460c784be362, var_aba9da4be1ce5ce2);
    return var_79a78f73d2d4925d;
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fe7
// Size: 0x51
function private chopperexif_fx_init() {
    level._effect["chopperExfil_rotorwash"] = loadfx("vfx/iw8_br/gameplay/vfx_br_blima_rotor_infil.vfx");
    level._effect["chopperExfil_gas"] = loadfx("vfx/iw8_br/gameplay/circle/vfx_br_circle_gas_exfil_01.vfx");
    level._effect["player_disconnect"] = loadfx("vfx/iw8_br/gameplay/vfx_br_disconnect_player.vfx");
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x203f
// Size: 0x8f
function private chopperexfil_introsound(time, var_cbfc3ba10cefc8ce) {
    endorigin = self.origin + (0, 0, 1000);
    forward = vectornormalize(endorigin - var_cbfc3ba10cefc8ce);
    startorigin = endorigin + forward * 3000;
    temp = spawn("script_model", startorigin);
    temp playsound("br_exfil_incoming_heli_lr");
    temp moveto(endorigin, time);
    wait(time);
    temp delete();
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d5
// Size: 0x12d
function get_chopperexfil_transient() {
    switch (level.script) {
    case #"hash_d7b993f67c508b1d":
        return "mp_infil_br_donetsk_ending_chopper_tr";
    case #"hash_e9af1c05b2cb1afd":
        return "mp_infil_br_donetsk2_ending_chopper_tr";
    case #"hash_914054ef261f122":
    case #"hash_c9458e4403b73c27":
        return "mp_infil_br_don3_ending_chopper_tr";
    case #"hash_20e8ae1b499051a1":
        return "mp_infil_br_ftue_downtown_ending_chopper_tr";
    case #"hash_5bdc66d44b83f826":
        return "mp_infil_br_quarry_ending_chopper_tr";
    case #"hash_2ad5096943807dfb":
    case #"hash_4aa5d6e97851bdbd":
        return "mp_infil_br_mechanics_ending_chopper_tr";
    case #"hash_2de697274b41ff79":
        return "mp_infil_br_kstenod_ending_chopper_tr";
    case #"hash_4486e35de937847c":
        return "mp_infil_br_escape2_ending_chopper_tr";
    case #"hash_4486e45de937860f":
        return "mp_infil_br_escape2_ending_chopper_tr";
    case #"hash_2ca9e474cad5e079":
        return "mp_infil_br_escape4_ending_chopper_tr";
    case #"hash_57eba45b7ddbdcd6":
    case #"hash_63326ac3e12f8da0":
        return "mp_infil_br_saba_ending_chopper_tr";
    case #"hash_3eff14ec1d9395c1":
    case #"hash_636b409bbce21729":
    case #"hash_e817308cc606e9e1":
        return "mp_infil_br_saba_ending_chopper_tr";
        break;
    }
    return "";
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220a
// Size: 0x189
function chopperexfil_music_start() {
    if (level.br_ending.winners.size == 0) {
        return;
    }
    var_134aea3cdf65b674 = "mus_br_exfil_intro_3player_intro";
    var_4de75e7f916838a0 = "br_exfil_part1_3person_lr";
    switch (level.br_ending.winners.size) {
    case 1:
        var_134aea3cdf65b674 = "mus_br_exfil_intro_1player_intro";
        var_4de75e7f916838a0 = "br_exfil_part1_1person_lr";
        break;
    case 2:
        var_134aea3cdf65b674 = "mus_br_exfil_intro_2player_intro";
        var_4de75e7f916838a0 = "br_exfil_part1_2person_lr";
        break;
    case 3:
        var_134aea3cdf65b674 = "mus_br_exfil_intro_3player_intro";
        var_4de75e7f916838a0 = "br_exfil_part1_3person_lr";
        break;
    case 4:
        var_134aea3cdf65b674 = "mus_br_exfil_intro_4player_intro";
        var_4de75e7f916838a0 = "br_exfil_part1_4person_lr";
        break;
    }
    foreach (player in level.players) {
        player playlocalsound(var_4de75e7f916838a0);
        player playlocalsound(var_134aea3cdf65b674);
    }
    waitframe();
    setmusicstate("");
    foreach (player in level.players) {
        player setsoundsubmix("mp_br_exfil_fade", 4);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239a
// Size: 0xa8
function private chopperexfil_music_sh025() {
    if (level.br_ending.winners.size == 0) {
        return;
    }
    musicstate = "br_exfil_main_3player";
    switch (level.br_ending.winners.size) {
    case 1:
        musicstate = "br_exfil_main_1player";
        break;
    case 2:
        musicstate = "br_exfil_main_2player";
        break;
    case 3:
        musicstate = "br_exfil_main_3player";
        break;
    case 4:
        musicstate = "br_exfil_main_4player";
        break;
    }
    setmusicstate(musicstate);
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2449
// Size: 0x6c
function private chopperexfil_sfx_before_sh070(waittime) {
    if (isdefined(waittime)) {
        wait(waittime);
    }
    foreach (player in level.players) {
        player playlocalsound("br_exfil_end_part_lr");
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24bc
// Size: 0xd7
function private chopperexfil_sh010_start(array) {
    level.br_ending.exfilchopper thread chopper_playfx();
    thread chopperexfil_music_start();
    if (!namespace_d3d40f75bb4e4c32::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    if (isdefined(level.br_ending_debugmode)) {
        level.br_ending.ropeguy show();
        foreach (player in level.players) {
            player.player_rig unlink();
        }
    }
    allplayers_setphysicaldof(2.8, 200);
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x259a
// Size: 0xfa
function private chopperexfil_sh020_start(players) {
    allplayers_setphysicaldof(2.8, 250);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (isdefined(level.br_ending_debugmode)) {
        foreach (ascender in level.br_ending.ascenders) {
            ascender show();
        }
    }
    foreach (player in players) {
        if (isdefined(player)) {
            player setwind("60", 1);
        }
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x269b
// Size: 0x369
function private chopperexfil_sh025_start(players) {
    allplayers_setphysicaldof(2.8, 250);
    thread chopperexfil_music_sh025();
    if (!isdefined(level.br_ending_debugmode)) {
        if (level.br_ending.winners.size < 4) {
            if (isdefined(level.br_ending.rope)) {
                level.br_ending.rope delete();
            }
        }
    }
    level.br_ending.exfilchopper thread chopper_playfx();
    if (isdefined(level.br_ending_debugmode)) {
        foreach (ascender in level.br_ending.ascenders) {
            ascender hide();
        }
    } else {
        foreach (ascender in level.br_ending.ascenders) {
            ascender delete();
        }
    }
    tags = [0:"tag_guy0", 1:"tag_guy2", 2:"tag_guy4", 3:"tag_guy5"];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.winindex)) {
            continue;
        }
        player.player_rig linkto(level.br_ending.exfilchopper, tags[player.winindex], (0, 0, 0), (0, 0, 0));
        player.linkedtoent = level.br_ending.exfilchopper;
        player.linkedtotag = tags[player.winindex];
    }
    foreach (rig in level.br_ending.player_rigs) {
        if (isdefined(rig.player)) {
            continue;
        }
        if (!isdefined(rig.winindex)) {
            continue;
        }
        rig linkto(level.br_ending.exfilchopper, tags[rig.winindex], (0, 0, 0), (0, 0, 0));
        rig.linkedtoent = level.br_ending.exfilchopper;
        rig.linkedtotag = tags[rig.winindex];
    }
    chopperexfil_sitting_wind(players);
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a0b
// Size: 0xcd
function private chopperexfil_sh030_start(array) {
    foreach (player in level.players) {
        player setclienttriggeraudiozone("br_exfil_heli_int", 0.05);
    }
    setomnvarforallclients("ui_br_end_game_splash_type", 13);
    allplayers_setfov(45);
    allplayers_setphysicaldof(10, 18);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (level.br_ending.winners.size == 1) {
        thread chopperexfil_sfx_before_sh070(1.266);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2adf
// Size: 0xd3
function private chopperexfil_sh040_start(entarray) {
    setomnvarforallclients("ui_br_end_game_splash_type", 14);
    allplayers_setfov(50);
    allplayers_setphysicaldof(11, 30);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (isdefined(level.br_ending_debugmode)) {
        foreach (ent in entarray) {
            ent hide();
        }
    } else {
        delete_entarray(entarray);
    }
    if (level.br_ending.winners.size == 2) {
        thread chopperexfil_sfx_before_sh070(2.033);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bb9
// Size: 0x72
function private chopperexfil_sh050_start(array) {
    setomnvarforallclients("ui_br_end_game_splash_type", 15);
    allplayers_setfov(50);
    allplayers_setphysicaldof(8, 14.5);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (level.br_ending.winners.size == 3) {
        thread chopperexfil_sfx_before_sh070(2);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c32
// Size: 0x6f
function private chopperexfil_sh060_start(array) {
    setomnvarforallclients("ui_br_end_game_splash_type", 16);
    allplayers_setfov(55);
    allplayers_setphysicaldof(3, 29);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (level.br_ending.winners.size == 4) {
        thread chopperexfil_sfx_before_sh070(2.5);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ca8
// Size: 0x98
function private chopperexfil_sh070_start(array) {
    foreach (player in level.players) {
        player clearclienttriggeraudiozone(0.1);
    }
    allplayers_setfov(65);
    allplayers_setphysicaldof(2.8, 500);
    level.br_ending.exfilchopper thread chopper_playfx();
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d47
// Size: 0x65
function chopperexfil_sitting_wind(players) {
    foreach (player in players) {
        if (isdefined(player)) {
            player setwind("30", 1);
        }
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2db3
// Size: 0x2d
function private chopperexfil_skip_ascend0(ent) {
    if (level.br_ending.winners.size == 1) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2de7
// Size: 0x2d
function private chopperexfil_skip_ascend1(ent) {
    if (level.br_ending.winners.size == 2) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e1b
// Size: 0x2d
function private chopperexfil_skip_ascend2(ent) {
    if (level.br_ending.winners.size == 3) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e4f
// Size: 0x26
function private chopperexfil_slamtoblack(ent) {
    if (!isdefined(level.br_ending_debugmode)) {
        setomnvarforallclients("ui_world_fade", 1);
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e7c
// Size: 0x27
function chopper_playfx() {
    self endon("death");
    wait(0.1);
    playfxontag(getfx("chopperExfil_rotorwash"), self, "tag_origin");
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2eaa
// Size: 0x79
function private delete_entarray(array) {
    foreach (ent in array) {
        if (isdefined(ent.linkedents)) {
            array_delete(ent.linkedents);
        }
        ent delete();
    }
}

// Namespace namespace_e172762c9e742745/namespace_d0436b1a1618abfc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f2a
// Size: 0x22
function private stop_all_ascend_anims() {
    level.br_ending.cam notify("single anim", "end");
}
