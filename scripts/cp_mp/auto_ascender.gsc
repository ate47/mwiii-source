// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\anim.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\ent_manager.gsc;

#namespace namespace_57e06969aa061fce;

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6de
// Size: 0x137
function init() {
    setdvarifuninitialized(@"hash_1726c98446555f2", 360);
    setdvarifuninitialized(@"hash_89e4c06f52246b50", 460);
    setdvarifuninitialized(@"hash_23ed39c8f9324ffe", 540);
    level.ascendstarts = getstructarray("ascend_begin", "script_noteworthy");
    level.descendstarts = getstructarray("descend_begin", "script_noteworthy");
    level.ascendstructs = [];
    foreach (a in level.ascendstarts) {
        markupascenderstruct(a, 1);
    }
    foreach (a in level.descendstarts) {
        markupascenderstruct(a, 0);
    }
    initanimtree();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("ascender", &ascenderscriptableused);
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81c
// Size: 0x8
function function_68fe08d119bbd54f() {
    return 360;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82c
// Size: 0x8
function function_9412c45e2bc1218b() {
    return 460;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c
// Size: 0x8
function function_f3c35aacfbe68158() {
    return 540;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0x8
function function_99e7d00e9d903c57() {
    return 0.4;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85c
// Size: 0x8
function function_ca18084bdcc82ea8() {
    return 0.15;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c
// Size: 0x6
function function_211b63898ba23e96() {
    return 12100;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87a
// Size: 0x5
function function_9bb960f8f80f543f() {
    return 72;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x887
// Size: 0x495
function initanimtree() {
    level.scr_animtree["player"] = %script_model;
    level.scr_anim["player"]["ascender_up_in"] = script_model%vm_eq_ascender_up_get_on_plr;
    level.scr_eventanim["player"]["ascender_up_in"] = %"ascender_up_in";
    level.scr_anim["player"]["ascender_up_loop"] = script_model%vm_eq_ascender_up_loop_plr;
    level.scr_eventanim["player"]["ascender_up_loop"] = %"ascender_up_loop";
    level.scr_anim["player"]["ascender_up_out"] = script_model%vm_eq_ascender_up_get_off_plr;
    level.scr_eventanim["player"]["ascender_up_out"] = %"ascender_up_out";
    level.scr_anim["player"]["ascender_down_in"] = script_model%vm_eq_ascender_down_get_on_plr;
    level.scr_eventanim["player"]["ascender_down_in"] = %"ascender_down_in";
    level.scr_anim["player"]["ascender_down_loop"] = script_model%vm_eq_ascender_down_loop_plr;
    level.scr_eventanim["player"]["ascender_down_loop"] = %"ascender_down_loop";
    level.scr_anim["player"]["ascender_down_out"] = script_model%vm_eq_ascender_down_get_off_plr;
    level.scr_eventanim["player"]["ascender_down_out"] = %"ascender_down_out";
    level.scr_animtree["device"] = %script_model;
    level.scr_anim["device"]["ascender_up_in"] = script_model%vm_eq_ascender_up_get_on_ascender;
    level.scr_eventanim["device"]["ascender_up_in"] = %"ascender_up_in";
    level.scr_anim["device"]["ascender_up_loop"] = script_model%vm_eq_ascender_up_loop_ascender;
    level.scr_eventanim["device"]["ascender_up_loop"] = %"ascender_up_loop";
    level.scr_anim["device"]["ascender_up_out"] = script_model%vm_eq_ascender_up_get_off_ascender;
    level.scr_eventanim["device"]["ascender_up_out"] = %"ascender_up_out";
    level.scr_anim["device"]["ascender_down_in"] = script_model%vm_eq_ascender_down_get_on_ascender;
    level.scr_eventanim["device"]["ascender_down_in"] = %"ascender_down_in";
    level.scr_anim["device"]["ascender_down_loop"] = script_model%vm_eq_ascender_down_loop_ascender;
    level.scr_eventanim["device"]["ascender_down_loop"] = %"ascender_down_loop";
    level.scr_anim["device"]["ascender_down_out"] = script_model%vm_eq_ascender_down_get_off_ascender;
    level.scr_eventanim["device"]["ascender_down_out"] = %"ascender_down_out";
    level.scr_animtree["device"] = %script_model;
    level.scr_anim["device"]["ascender_up_in_wm"] = script_model%wm_eq_ascender_up_get_on_ascender;
    level.scr_eventanim["device"]["ascender_up_in_wm"] = %"ascender_up_in";
    level.scr_anim["device"]["ascender_up_loop_wm"] = script_model%wm_eq_ascender_up_loop_ascender;
    level.scr_eventanim["device"]["ascender_up_loop_wm"] = %"ascender_up_loop";
    level.scr_anim["device"]["ascender_up_out_wm"] = script_model%wm_eq_ascender_up_get_off_ascender;
    level.scr_eventanim["device"]["ascender_up_out_wm"] = %"ascender_up_out";
    level.scr_anim["device"]["ascender_down_in_wm"] = script_model%wm_eq_ascender_down_get_on_ascender;
    level.scr_eventanim["device"]["ascender_down_in_wm"] = %"ascender_down_in";
    level.scr_anim["device"]["ascender_down_loop_wm"] = script_model%wm_eq_ascender_down_loop_ascender;
    level.scr_eventanim["device"]["ascender_down_loop_wm"] = %"ascender_down_loop";
    level.scr_anim["device"]["ascender_down_out_wm"] = script_model%wm_eq_ascender_down_get_off_ascender;
    level.scr_eventanim["device"]["ascender_down_out_wm"] = %"ascender_down_out";
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x1db
function markupascenderstruct(struct, dir) {
    if (!isdefined(struct.targetname)) {
        msg = "auto_ascender.gsc::markupAscenderStruct() passed struct with no targetname at pos " + " x:" + struct.origin[0] + " y:" + struct.origin[1] + " z:" + struct.origin[2];
        error(msg);
        return;
    }
    var_d0697af2eca83d63 = getstruct(struct.target, "targetname");
    var_edd7dfcccad431f8 = getstruct(var_d0697af2eca83d63.target, "targetname");
    level.ascendstructs[struct.targetname] = struct;
    struct.ascendstructend = var_d0697af2eca83d63;
    struct.ascendstructout = var_edd7dfcccad431f8;
    struct.inuse = 0;
    struct.exitangle = struct.angles + (0, 180, 0);
    struct.startangle = struct.angles;
    struct.dir = dir;
    if (struct.targetname == "pf57045_auto38" || struct.targetname == "pf57045_auto41") {
        struct.origin = struct.origin + (0, 0, 8);
        var_d0697af2eca83d63.origin = var_d0697af2eca83d63.origin + (0, 0, 8);
        var_edd7dfcccad431f8.origin = var_edd7dfcccad431f8.origin + (0, 0, 8);
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf05
// Size: 0x68
function ascenderscriptableused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    /#
        assert(part == "ascender");
    #/
    if (state == "on") {
        if (istrue(player.usingascender)) {
            return;
        }
        thread ascenderuse(instance, player);
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf74
// Size: 0x6c
function function_3af132aed5f667c5() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("denyAscendMessage");
    self endon("denyAscendMessage");
    self playsoundtoplayer("ui_select_purchase_deny", self);
    if (isdefined(level.ascendermsgfunc)) {
        self [[ level.ascendermsgfunc ]]("ascender_blocked_generic", 4);
    } else {
        setlowermessageomnvar("ascender_blocked_generic");
        wait(4);
        setlowermessageomnvar("clear_lower_msg");
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe7
// Size: 0x6c
function denyascendmessagelaststand() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("denyAscendMessageLastStand");
    self endon("denyAscendMessageLastStand");
    self playsoundtoplayer("ui_select_purchase_deny", self);
    if (isdefined(level.ascendermsgfunc)) {
        self [[ level.ascendermsgfunc ]]("ascender_blocked_laststand", 4);
    } else {
        setlowermessageomnvar("ascender_blocked_laststand");
        wait(4);
        setlowermessageomnvar("clear_lower_msg");
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105a
// Size: 0x6c
function denyascendmessage() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("denyAscendMessage");
    self endon("denyAscendMessage");
    self playsoundtoplayer("ui_select_purchase_deny", self);
    if (isdefined(level.ascendermsgfunc)) {
        self [[ level.ascendermsgfunc ]]("ascender_blocked", 4);
    } else {
        setlowermessageomnvar("ascender_blocked");
        wait(4);
        setlowermessageomnvar("clear_lower_msg");
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cd
// Size: 0x4e
function ascenddeathlistener(var_da39c6d2e190d5c9) {
    level endon("game_ended");
    self endon("ascend_complete");
    self endon("ascend_solo_complete");
    self endon("ascender_cancel");
    namespace_3c37cb17ade254d::waittill_any_2("death_or_disconnect", "last_stand_start");
    if (isdefined(self)) {
        self stopanimscriptsceneevent();
    }
    var_da39c6d2e190d5c9 cleanupascenduse(self);
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1122
// Size: 0x74
function endascenderanim(player, dir, ascendermodelview, ascendermodelworld) {
    player endon("death_or_disconnect");
    player endon("ascender_cancel");
    if (dir) {
        var_45ae85538855919b = "ascender_up_out";
    } else {
        var_45ae85538855919b = "ascender_down_out";
    }
    thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, var_45ae85538855919b);
    namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_45ae85538855919b + "_wm");
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119d
// Size: 0x304
function startascenderanim(player, dir, ascendermodelview, ascendermodelworld) {
    player endon("death_or_disconnect");
    player endon("ascender_cancel");
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("player", player.origin, player.angles);
    ascendermodelview.animname = "device";
    ascendermodelview namespace_bc4a4b9456315863::setanimtree();
    ascendermodelworld.animname = "device";
    ascendermodelworld namespace_bc4a4b9456315863::setanimtree();
    ascendermodelworld hide();
    var_a08d86a9e7aafc47 = (1, 0, 0);
    if (dir) {
        var_9150bc085d41f530 = "TAG_ACCESSORY_RIGHT";
        var_298ee9614ae698ae = "ascender_up_in";
        var_a08d86a9e7aafc47 = rotatevector((-40.9464, 22.9807, 0), self.angles);
    } else {
        var_9150bc085d41f530 = "TAG_ACCESSORY_LEFT";
        var_298ee9614ae698ae = "ascender_down_in";
        var_a08d86a9e7aafc47 = rotatevector((-42.2388, -23.4915, 0), self.angles);
    }
    player.player_rig moveto(self.origin + var_a08d86a9e7aafc47, 0.4, 0.1, 0.1);
    fwd = vectornormalize(var_a08d86a9e7aafc47 * -1);
    goalangles = vectortoanglessafe(fwd, (0, 0, 1));
    player.player_rig rotateto(goalangles, 0.4, 0.1, 0.1);
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = 0.4 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait(waittime);
    ascendermodelworld show();
    ascendermodelworld hidefromplayer(player);
    player.player_rig linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    ascendermodelview linkto(player.player_rig, var_9150bc085d41f530, (0, 0, 0), (0, 0, 0));
    ascendermodelworld linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    player.player_rig showonlytoplayer(player);
    namespace_bc4a4b9456315863::anim_first_frame_solo(player.player_rig, var_298ee9614ae698ae);
    thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, var_298ee9614ae698ae);
    thread namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_298ee9614ae698ae + "_wm");
    var_5018a9a0d40ed758 = getanimlength(level.scr_anim["player"][var_298ee9614ae698ae]);
    wait(var_5018a9a0d40ed758);
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a8
// Size: 0xbe
function loopwaitanim(scenenode, ascendermodelview, ascendermodelworld, dir) {
    self endon("death_or_disconnect");
    self endon("ascender_loop_done");
    self endon("ascender_cancel");
    if (dir) {
        var_b164ebced1cbe96c = "ascender_up_loop";
    } else {
        var_b164ebced1cbe96c = "ascender_down_loop";
    }
    animlength = getanimlength(level.scr_anim["player"][var_b164ebced1cbe96c]);
    while (1) {
        if (!isdefined(self)) {
            break;
        }
        scenenode thread namespace_4e680905778c0f0f::anim_player_solo(self, self.player_rig, var_b164ebced1cbe96c);
        scenenode namespace_bc4a4b9456315863::anim_single_solo(ascendermodelworld, var_b164ebced1cbe96c + "_wm");
        if (!isdefined(animlength) || animlength == 0) {
            break;
        }
        wait(animlength);
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156d
// Size: 0x11d
function function_3070aab95202a0e6(instance, player) {
    if (player isswitchingweapon()) {
        player thread function_3af132aed5f667c5();
        return 0;
    }
    if (player namespace_f8065cafc523dba5::isinvehicle()) {
        player thread function_3af132aed5f667c5();
        return 0;
    }
    if (istrue(player.insertingarmorplate)) {
        player thread function_3af132aed5f667c5();
        return 0;
    }
    if (istrue(player.inlaststand)) {
        player thread denyascendmessagelaststand();
        return 0;
    }
    if (istrue(player.isreviving)) {
        return 0;
    }
    if (!player val::get("ascender_use")) {
        player thread function_3af132aed5f667c5();
        return 0;
    }
    if (player isskydiving()) {
        return 0;
    }
    var_da39c6d2e190d5c9 = level.ascendstructs[instance.target];
    if (!isdefined(var_da39c6d2e190d5c9)) {
        return 0;
    }
    if (var_da39c6d2e190d5c9.inuse) {
        player thread denyascendmessage();
        return 0;
    }
    if (isdefined(var_da39c6d2e190d5c9.sololink) && istrue(var_da39c6d2e190d5c9.sololink.inuse)) {
        player thread denyascendmessage();
        return 0;
    }
    return 1;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0x4ad
function ascenderuse(instance, player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("ascender_cancel");
    if (getdvarint(@"hash_a24172489f2b8a69", 0) > 0) {
        player endon("last_stand");
    }
    if (!function_3070aab95202a0e6(instance, player)) {
        return;
    }
    var_da39c6d2e190d5c9 = level.ascendstructs[instance.target];
    if (getdvarint(@"hash_a24172489f2b8a69", 0) <= 0) {
        player.shouldskiplaststand = 1;
    }
    var_da39c6d2e190d5c9.ascender = spawn("script_model", var_da39c6d2e190d5c9.origin);
    var_da39c6d2e190d5c9.ascender setmodel("tag_origin");
    var_da39c6d2e190d5c9.scriptable = instance;
    if (player getstance() != "stand") {
        player setstance("stand");
    }
    player val::set("ascender", "melee", 0);
    player val::set("ascender", "ads", 0);
    player val::set("ascender", "fire", 0);
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("juggernaut", "canUseWeaponPickups")) {
            canUseWeaponPickups = player [[ getsharedfunc("juggernaut", "canUseWeaponPickups") ]]();
            if (istrue(canUseWeaponPickups)) {
                player val::set("ascender", "weapon_switch", 0);
            }
        }
    } else {
        player val::set("ascender", "offhand_weapons", 0);
        player val::set("ascender", "killstreaks", 0);
        player val::set("ascender", "weapon_switch", 0);
    }
    var_da39c6d2e190d5c9.ascender namespace_2a9588dfac284b77::registerspawncount(2);
    var_da39c6d2e190d5c9.inuse = 1;
    player.usingascender = 1;
    player val::set("ascender", "usability", 0);
    var_b1f6e33c254d1d38 = var_da39c6d2e190d5c9.ascendstructend;
    var_21315f3bbb4a8a3d = var_da39c6d2e190d5c9.ascendstructout;
    var_da39c6d2e190d5c9.ascender dontinterpolate();
    var_da39c6d2e190d5c9.ascender.origin = var_da39c6d2e190d5c9.origin;
    var_da39c6d2e190d5c9.ascender.angles = var_da39c6d2e190d5c9.angles;
    ascendermodelview = spawn("script_model", var_da39c6d2e190d5c9.origin);
    ascendermodelview setmodel("misc_wm_ascender");
    ascendermodelview showonlytoplayer(player);
    ascendermodelworld = spawn("script_model", var_da39c6d2e190d5c9.origin);
    ascendermodelworld setmodel("misc_wm_ascender");
    ascendermodelworld hidefromplayer(player);
    player.ascenderstart = var_da39c6d2e190d5c9;
    player.ascendermodelview = ascendermodelview;
    player.ascendermodelworld = ascendermodelworld;
    player function_75bceb766d71dd0a(1);
    player thread ascenddeathlistener(var_da39c6d2e190d5c9);
    var_da39c6d2e190d5c9.ascender startascenderanim(player, var_da39c6d2e190d5c9.dir, ascendermodelview, ascendermodelworld);
    player thread loopwaitanim(var_da39c6d2e190d5c9.ascender, ascendermodelview, ascendermodelworld, var_da39c6d2e190d5c9.dir);
    var_6c29ccc8d58c68e3 = distance(var_b1f6e33c254d1d38.origin, var_da39c6d2e190d5c9.origin);
    if (!var_da39c6d2e190d5c9.dir) {
        if (utility::iscp()) {
            var_2451a07aca478bf6 = getdvarfloat(@"hash_23ed39c8f9324ffe", function_f3c35aacfbe68158());
        } else {
            var_2451a07aca478bf6 = getdvarfloat(@"hash_89e4c06f52246b50", function_9412c45e2bc1218b());
        }
    } else {
        var_2451a07aca478bf6 = getdvarfloat(@"hash_1726c98446555f2", function_68fe08d119bbd54f());
    }
    var_6bba8ad63924e722 = var_6c29ccc8d58c68e3 / var_2451a07aca478bf6;
    var_e1085fbf185d9d57 = function_99e7d00e9d903c57() * var_6bba8ad63924e722;
    var_6aa5b76b245ab989 = function_ca18084bdcc82ea8() * var_6bba8ad63924e722;
    var_da39c6d2e190d5c9.ascender moveto(var_b1f6e33c254d1d38.origin, var_6bba8ad63924e722, var_e1085fbf185d9d57, var_6aa5b76b245ab989);
    wait(var_6bba8ad63924e722);
    player notify("ascender_loop_done");
    var_da39c6d2e190d5c9.ascender endascenderanim(player, var_da39c6d2e190d5c9.dir, ascendermodelview, ascendermodelworld);
    var_da39c6d2e190d5c9 cleanupascenduse(player);
    player notify("ascend_complete");
    player function_75bceb766d71dd0a(0);
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b46
// Size: 0x1e4
function cleanupascenduse(player) {
    self.inuse = 0;
    if (isdefined(player)) {
        player.usingascender = 0;
        player.lastascenderusetime = gettime();
        player val::function_c9d0b43701bdba00("ascender");
        if (getdvarint(@"hash_a24172489f2b8a69", 0) <= 0) {
            player.shouldskiplaststand = undefined;
        }
        if (isdefined(player.ascendermodelview)) {
            player.ascendermodelview unlink();
            player.ascendermodelview delete();
        }
        if (isdefined(player.ascendermodelworld)) {
            player.ascendermodelworld unlink();
            player.ascendermodelworld delete();
        }
    }
    self.ascender.angles = self.startangle;
    self.ascender namespace_2a9588dfac284b77::deregisterspawn();
    self.ascender delete();
    if (isdefined(player)) {
        if (isdefined(player.ascenderstart.sololink)) {
            self.scriptable setscriptablepartstate("ascender_solo", "on");
        } else {
            self.scriptable setscriptablepartstate("ascender", "on");
        }
        player.ascenderstart = undefined;
        player.ascendermodelview = undefined;
        player.ascendermodelworld = undefined;
        player.player_rig unlink();
    } else if (isdefined(self.sololink)) {
        self.scriptable setscriptablepartstate("ascender_solo", "on");
    } else {
        self.scriptable setscriptablepartstate("ascender", "on");
    }
    waitframe();
    if (isdefined(player)) {
        player thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
        player notify("remove_rig");
    }
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d31
// Size: 0xbe
function ascenderinstantstop() {
    player = self;
    if (!istrue(player.usingascender)) {
        /#
            /#
                assertmsg("disconnect");
            #/
        #/
        return;
    }
    startorigin = player.ascenderstart.ascendstructout.origin;
    startangles = player.ascenderstart.ascendstructout.angles;
    player.ascenderstart cleanupascenduse(player);
    player setorigin(startorigin);
    player setplayerangles(startangles);
    player notify("ascender_cancel");
    player notify("ascender_solo_cancel");
    player stopanimscriptsceneevent();
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df6
// Size: 0x43
function vectortoanglessafe(forward, up) {
    right = vectorcross(forward, up);
    up = vectorcross(right, forward);
    angles = axistoangles(forward, right, up);
    return angles;
}

// Namespace namespace_57e06969aa061fce/namespace_c851aa543ccfe72f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e41
// Size: 0x9a
function function_ff57f9acf27bbc3c(point) {
    foreach (a in level.ascendstructs) {
        if (distance2dsquared(a.origin, point) < function_211b63898ba23e96()) {
            if (abs(point[2] - a.origin[2]) < function_9bb960f8f80f543f()) {
                return 1;
            }
        }
    }
    return 0;
}
