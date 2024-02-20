// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using script_3a9930dfe832ae05;
#using script_427ce33ec0c820cf;
#using script_4c770a9a4ad7659c;

#namespace nuke;

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x263
// Size: 0xa
function autoexec main() {
    function_c9b9001ef7ca2f45();
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x5b
function function_c9b9001ef7ca2f45() {
    register_powerup("nuke", &grab_nuke, &function_f23ad00303ba63e2);
    /#
        function_6e7290c8ee4f558b("left");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x15
function private function_f23ad00303ba63e2() {
    if (flag("powerup_disable_nuke")) {
        return 0;
    }
    return 1;
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3
// Size: 0x2c8
function grab_nuke(str_powerup, var_4d44d70760d7ad71, var_e3f071c0be79ecce, var_1c0c489113c9d46a, var_8d1aa1efbf8b3c6e, var_2bb5673b997944c1, var_82bc4143d5c2c838, var_814381e1413d3514) {
    if (!istrue(var_2bb5673b997944c1) && !isent(var_4d44d70760d7ad71) && !var_4d44d70760d7ad71 function_73cc0f04c4c5001d()) {
        /#
            assertmsg("Trying to grab a nuke powerup but it's not an entity or scriptable");
        #/
    }
    root = function_ecdae672c660149e();
    v_origin = var_4d44d70760d7ad71.origin;
    a_players = function_a56a8b17eae57b09(str_powerup, v_origin);
    var_c54afb6fced819b6 = function_896f9300bcde23c2(str_powerup);
    level thread function_989aab7b4cf26796(str_powerup);
    a_ai = [];
    if (var_c54afb6fced819b6 > 0) {
        a_ai = getaiarrayinradius(v_origin, var_c54afb6fced819b6);
    } else {
        a_ai = getaiarray();
    }
    var_97ab608af336843f = [];
    foreach (player in a_players) {
        player notify("nuke_triggered");
        if (!istrue(var_82bc4143d5c2c838)) {
            player thread function_eb311aca5b70cd9c();
        }
        if (!istrue(var_1c0c489113c9d46a)) {
            player thread function_676437737684783f(str_powerup);
        }
        foreach (ai in a_ai) {
            if (ai.team == player.team || ai.team == "neutral" || array_contains(var_97ab608af336843f, ai)) {
                continue;
            }
            var_97ab608af336843f = array_add(var_97ab608af336843f, ai);
        }
    }
    params = spawnstruct();
    params.player = self;
    callback::callback("on_powerup_nuke_pickup", params);
    if (!isdefined(var_814381e1413d3514)) {
        function_8b529500146929b8(v_origin, var_97ab608af336843f, str_powerup, var_8d1aa1efbf8b3c6e);
    } else {
        function_8b529500146929b8(v_origin, var_814381e1413d3514, str_powerup, var_8d1aa1efbf8b3c6e);
    }
    var_4d44d70760d7ad71 notify("picked_up");
    level notify("nuke_complete");
    if (isdefined(root.var_cc680f1d779ccc51) && !istrue(var_e3f071c0be79ecce)) {
        foreach (player in a_players) {
            player [[ root.var_cc680f1d779ccc51 ]]("powerup_nuke");
        }
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c2
// Size: 0x4f0
function private function_8b529500146929b8(var_f8307191d62cc285, var_e936931c04ab9b3c, str_powerup, var_8d1aa1efbf8b3c6e) {
    foreach (ai in var_e936931c04ab9b3c) {
        if (isalive(ai) && !istrue(ai.var_9469c4af69070d96)) {
            ai function_b9fd0ad5dff0ced6(1.5);
        }
    }
    wait(0.5);
    var_473ff5b31f1ed342 = array_removedead(var_e936931c04ab9b3c);
    var_473ff5b31f1ed342 = get_array_of_closest(var_f8307191d62cc285, var_473ff5b31f1ed342);
    var_3162896c2041ab88 = [];
    foreach (ai in var_473ff5b31f1ed342) {
        if (!isalive(ai)) {
            continue;
        }
        b_skip = 0;
        if (istrue(ai.ignore_nuke) || istrue(ai.var_9469c4af69070d96) || istrue(ai.magic_bullet_shield)) {
            b_skip = 1;
        }
        if (istrue(ai.marked_for_death)) {
            b_skip = 1;
        }
        if (isdefined(ai.nuke_damage_func)) {
            ai thread [[ ai.nuke_damage_func ]]();
            b_skip = 1;
        }
        if (b_skip) {
            if (!istrue(ai.var_9469c4af69070d96)) {
                ai function_d4e0b51ec4d153cd();
            }
        } else {
            ai function_f6ac370ea1b13ec7(100);
            ai.marked_for_death = 1;
            if (!istrue(ai.nuked)) {
                ai.nuked = 1;
                ai.no_powerups = 1;
                ai.var_7e4b076a06c6df27 = 1;
                ai.full_gib = 1;
                ai.var_745cd904c1ec804c = 1;
                if (isdefined(level.gametype) && level.gametype == "zm_rb") {
                    ai.var_745cd904c1ec804c = 0;
                }
                var_3162896c2041ab88 = array_add(var_3162896c2041ab88, ai);
                if (issharedfuncdefined("zombie_utils", "setMoveSpeed")) {
                    ai utility::function_f3bb4f4911a1beb2("zombie_utils", "setMoveSpeed", "walk", "nuke", 26);
                }
            }
        }
    }
    var_c2d52e003c2c7866 = undefined;
    foreach (var_3cdcdcf5e55b2be7 in var_3162896c2041ab88) {
        wait(randomfloatrange(0.1, 0.3));
        if (!isalive(var_3cdcdcf5e55b2be7)) {
            continue;
        }
        var_3cdcdcf5e55b2be7 function_d4e0b51ec4d153cd();
        if (istrue(var_3cdcdcf5e55b2be7.magic_bullet_shield)) {
            continue;
        }
        var_3cdcdcf5e55b2be7 playsound("evt_zm_core_powerup_nuke_soul");
        var_bc8818c262ac2b04 = undefined;
        if (isdefined(var_3cdcdcf5e55b2be7.aicategory) && !istrue(var_8d1aa1efbf8b3c6e)) {
            if (var_3cdcdcf5e55b2be7.aicategory == "special") {
                var_bc8818c262ac2b04 = var_3cdcdcf5e55b2be7.maxhealth * function_519d44e54a9b8ae5(str_powerup).var_74576b4dd247d7b1;
            } else if (var_3cdcdcf5e55b2be7.aicategory == "elite") {
                var_bc8818c262ac2b04 = var_3cdcdcf5e55b2be7.maxhealth * function_519d44e54a9b8ae5(str_powerup).var_e896465ad8ccd911;
            } else if (var_3cdcdcf5e55b2be7.aicategory == "boss") {
                var_bc8818c262ac2b04 = var_3cdcdcf5e55b2be7.maxhealth * function_519d44e54a9b8ae5(str_powerup).var_ef9e49bce3c346a3;
            }
        }
        if (isagent(var_3cdcdcf5e55b2be7) && isdefined(var_3cdcdcf5e55b2be7.unittype) && var_3cdcdcf5e55b2be7.unittype == "soldier") {
            var_3cdcdcf5e55b2be7 notify("flashbang", var_3cdcdcf5e55b2be7.origin);
            var_bc8818c262ac2b04 = 0;
        }
        if (isdefined(var_bc8818c262ac2b04) && var_bc8818c262ac2b04 < var_3cdcdcf5e55b2be7.health) {
            if (!isdefined(var_c2d52e003c2c7866)) {
                var_c2d52e003c2c7866 = spawn("script_model", var_f8307191d62cc285);
            }
            if (var_bc8818c262ac2b04 > 0) {
                var_3cdcdcf5e55b2be7 dodamage(int(var_bc8818c262ac2b04), var_3cdcdcf5e55b2be7.origin, isdefined(self) ? undefined : self, var_c2d52e003c2c7866, "MOD_UNKNOWN", "none", "none", undefined, 65536);
            }
            var_3cdcdcf5e55b2be7.marked_for_death = 0;
            var_3cdcdcf5e55b2be7.nuked = 0;
            var_3cdcdcf5e55b2be7.var_745cd904c1ec804c = 0;
            var_3cdcdcf5e55b2be7.no_powerups = 0;
            var_3cdcdcf5e55b2be7.var_7e4b076a06c6df27 = 0;
            var_3cdcdcf5e55b2be7.full_gib = 0;
        } else {
            var_3cdcdcf5e55b2be7 kill();
        }
    }
    if (isdefined(var_c2d52e003c2c7866)) {
        var_c2d52e003c2c7866 delete();
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab9
// Size: 0x5e
function private function_989aab7b4cf26796(str_powerup) {
    level endon("game_ended");
    function_32bcd3aa4ea61fef(1);
    level waittill("nuke_complete");
    var_7cdde71f8305d204 = function_53c4c53197386572(function_519d44e54a9b8ae5(str_powerup).var_35b3bfa760c6734a, 1);
    level waittill_notify_or_timeout("abort_nuke", var_7cdde71f8305d204);
    function_32bcd3aa4ea61fef(0);
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb1e
// Size: 0x24
function private function_c50deed1f3c001cd(var_9611ccf0d8d1a3b1) {
    self.nuke_damage_func = &nuke_damage_func;
    self.var_a9b5b540de6a20da = var_9611ccf0d8d1a3b1;
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb49
// Size: 0x3d
function private nuke_damage_func() {
    self endon("death");
    wait(randomfloatrange(0.1, 0.7));
    self dodamage(self.maxhealth * self.var_a9b5b540de6a20da, self.origin);
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb8e
// Size: 0x1de
function private function_eb311aca5b70cd9c() {
    self notify("play_nuke_screen_flash");
    self endon("death_or_disconnect");
    self endon("play_nuke_screen_flash");
    if (!isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 = newclienthudelem(self);
        self.var_ad173ac833a970d4.x = 0;
        self.var_ad173ac833a970d4.y = 0;
        self.var_ad173ac833a970d4 setshader("white", 640, 480);
        self.var_ad173ac833a970d4.alignx = "left";
        self.var_ad173ac833a970d4.aligny = "top";
        self.var_ad173ac833a970d4.sort = 1;
        self.var_ad173ac833a970d4.horzalign = "fullscreen";
        self.var_ad173ac833a970d4.vertalign = "fullscreen";
        self.var_ad173ac833a970d4.alpha = 0;
        self.var_ad173ac833a970d4.foreground = 1;
        self.var_ad173ac833a970d4.archived = 0;
        self.var_ad173ac833a970d4.var_79a4133f925e83f8 = 1;
    }
    var_52bee65a8171b558 = 0.2;
    n_target_alpha = 0.8;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = n_target_alpha;
    wait(0.5);
    var_52bee65a8171b558 = 0.5;
    self.var_ad173ac833a970d4 fadeovertime(var_52bee65a8171b558);
    self.var_ad173ac833a970d4.alpha = 0;
    wait(var_52bee65a8171b558);
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4 destroy();
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd73
// Size: 0x36
function private function_66f6f1eccfecf8b2(var_806601cbadcdd456) {
    if (isdefined(self.var_ad173ac833a970d4)) {
        self.var_ad173ac833a970d4.alpha = clamp(var_806601cbadcdd456, 0, 1);
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x82
function private function_32bcd3aa4ea61fef(var_cc3537297eff0ba9) {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_52a317ac50778cc2)) {
        return;
    }
    foreach (var_6727329a89208345 in root.var_52a317ac50778cc2) {
        level [[ var_6727329a89208345 ]](var_cc3537297eff0ba9);
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x31
function private function_f6ac370ea1b13ec7(var_5e136651ea7d5f51) {
    if (utility::issharedfuncdefined("zombie", "stunZombie")) {
        utility::function_f3bb4f4911a1beb2("zombie", "stunZombie", var_5e136651ea7d5f51);
    }
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe71
// Size: 0x4d
function private function_b9fd0ad5dff0ced6(var_8c28aac0b76c1e2e) {
    function_f6ac370ea1b13ec7(var_8c28aac0b76c1e2e);
    params = spawnstruct();
    params.attacker = undefined;
    params.var_51357609845cf128 = gettime();
    callback::callback("burned", params);
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x60
function private function_d4e0b51ec4d153cd() {
    if (utility::issharedfuncdefined("zombie", "clearStunZombie")) {
        utility::function_f3bb4f4911a1beb2("zombie", "clearStunZombie");
    }
    params = spawnstruct();
    params.attacker = undefined;
    params.var_51357609845cf128 = gettime();
    callback::callback("burned_end", params);
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c
// Size: 0x53
function function_15bb2ab41d66232b(var_74eaaa06e59a9abe) {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_52a317ac50778cc2)) {
        root.var_52a317ac50778cc2 = [];
    }
    root.var_52a317ac50778cc2[root.var_52a317ac50778cc2.size] = var_74eaaa06e59a9abe;
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf86
// Size: 0x2a
function function_5e61eba5db66a9d4(var_c73f22604801c8a8) {
    root = function_ecdae672c660149e();
    root.var_c88dfab5f7fb9cdb = var_c73f22604801c8a8;
}

// Namespace nuke/namespace_46474fbe41dfa60d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb7
// Size: 0x31
function function_3204683321678438() {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_c88dfab5f7fb9cdb)) {
        return 1;
    }
    return root.var_c88dfab5f7fb9cdb;
}

