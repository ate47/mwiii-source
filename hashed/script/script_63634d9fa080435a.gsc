// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\hud_util.gsc;
#using script_104e3370b024f998;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_63634d9fa080435a;

#namespace namespace_fdd19a154a441b5c;

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x336
// Size: 0xdb
function function_d45fd98510d7b7e9() {
    var_f7b6cc6c062a7a43 = "super_high_jump" + "_activate";
    if (getdvarint(@"hash_a6321fc4dc1000d7", 0)) {
        var_f7b6cc6c062a7a43 = var_f7b6cc6c062a7a43 + "_alt";
    }
    thread namespace_44abc05161e2e2cb::showsplash(var_f7b6cc6c062a7a43, undefined, self, undefined, undefined, undefined, 1);
    var_af06892358a3c2f4 = 200;
    var_6c9d93d4584e15f7 = spawnstruct();
    var_6c9d93d4584e15f7.hudelem = playerpowersaddhudelem("MP_ZXP/CHARGED_JUMP", var_af06892358a3c2f4);
    var_6c9d93d4584e15f7.cooldownsec = getdvarint(@"hash_e45cb58aa0483dcf", 6);
    var_6c9d93d4584e15f7.ref = "super_jump";
    self.var_6c9d93d4584e15f7 = var_6c9d93d4584e15f7;
    function_bd0e084afb0d192f(1);
    thread function_6a991bfd08ea6fc5();
    thread function_1a0b6d22fd3a0ba();
    thread function_2a8b83e2773640c0();
    thread function_4291eedaa7d05e6d();
    return 1;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x419
// Size: 0x9
function function_8bea7151cf43738d() {
    return function_e0a9daa14c0b948b();
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a
// Size: 0xa4
function function_e0a9daa14c0b948b() {
    self endon("disconnect");
    while (!self isonground() && namespace_7e17181d03156026::isreallyalive(self)) {
        wait(0.1);
    }
    thread function_e4470e4135f2aacc();
    self setclientomnvar("ui_field_upgrade_use", 0);
    self.var_6c9d93d4584e15f7.hudelem.barelem namespace_52f6938dd902c7d0::destroyelem();
    self.var_6c9d93d4584e15f7.hudelem namespace_52f6938dd902c7d0::destroyelem();
    self.var_6c9d93d4584e15f7 = undefined;
    function_bd0e084afb0d192f(0);
    self notify("superJump_end");
    thread namespace_416e533f6ed17708::function_269b97f3d86eb172(undefined, undefined, "super_use_finished");
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d5
// Size: 0x55
function function_e4470e4135f2aacc() {
    self endon("disconnect");
    level endon("game_ended");
    if (!self isonground() && !self isswimming()) {
        self.var_b6aa5954bf6a457a = 1;
        while (namespace_7e17181d03156026::function_ad443bbcdcf37b85(self)) {
            if (self isonground()) {
                waitframe();
                break;
            }
            waitframe();
        }
    }
    self.var_b6aa5954bf6a457a = undefined;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x531
// Size: 0x1e
function function_4291eedaa7d05e6d() {
    waittill_any_5("death", "last_stand_start", "player_killed", "tempV_end");
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x556
// Size: 0x31
function function_bd0e084afb0d192f(isactive) {
    if (isactive) {
        namespace_1cd9f6896754adb0::set("jump_superpower", "allow_jump", 0);
    } else {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("jump_superpower");
    }
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e
// Size: 0x56
function function_1a0b6d22fd3a0ba() {
    self endon("superJump_end");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        if (self jumpbuttonpressed() && self isonground() && !istrue(self.var_6c9d93d4584e15f7.incooldown)) {
            function_567bde1e6acc007b();
        } else {
            waitframe();
        }
    }
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eb
// Size: 0x56
function function_2a8b83e2773640c0() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("superJump_end");
    while (1) {
        self waittill("perform_hero_drop");
        self radiusdamage(self.origin, 256, function_751f1fe07d7bf833(), 50, self, "MOD_CRUSH", "high_jump_mp");
        thread function_f5f070b3d96a1c1e();
    }
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x648
// Size: 0x74
function function_751f1fe07d7bf833() {
    if (!isdefined(self.var_6c9d93d4584e15f7) || !isdefined(self.var_6c9d93d4584e15f7.var_501056bcda9531c2)) {
        return 50;
    }
    var_4ca7b6a31270c32a = getdvarfloat(@"hash_710b8f0737994439", 3);
    var_8a3ebc608be39514 = clamp(self.var_6c9d93d4584e15f7.var_501056bcda9531c2 / var_4ca7b6a31270c32a, 0, 1);
    return 500 * var_8a3ebc608be39514;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c4
// Size: 0x38
function function_f5f070b3d96a1c1e() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("heroDiveVfx", "impact", 0);
    wait(1);
    self setscriptablepartstate("heroDiveVfx", "off", 0);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x703
// Size: 0x44c
function function_567bde1e6acc007b(var_6c9d93d4584e15f7, var_ef7579be51267bdb) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("tempV_end");
    var_2c602bb60dab6883 = 0.025;
    var_ea41c3f0bdbf3f3a = 0;
    var_a2d1e16b613b535c = 0;
    var_92b09cf3a4719720 = 1300;
    var_3b3681f0d6aae16e = 0.25;
    var_47784f0c32fa1ae1 = 1;
    var_4ca6e232b3a08ae5 = 3;
    var_943d5ecbd9a29e50 = getdvarint(@"hash_5e1d6a08a06aab7a", var_ea41c3f0bdbf3f3a);
    var_57bd73d0ecaee169 = getdvarfloat(@"hash_2fc6c2dc7f9c722a", var_2c602bb60dab6883);
    var_eec1ca5327266614 = getdvarfloat(@"hash_f3adfe2ba0c4e72e", var_3b3681f0d6aae16e);
    var_e5482b00771c4909 = getdvarint(@"hash_2a5201ccbcd3b1a1", var_47784f0c32fa1ae1);
    var_6b00aa3867c7f0d9 = getdvarint(@"hash_69111e35067f9d8f", getdvarfloat(@"hash_fc090d66639284d3", var_4ca6e232b3a08ae5));
    var_f71d03f58af1672a = getdvarfloat(@"hash_fd6822a1c2607510", var_92b09cf3a4719720);
    while (!self jumpbuttonpressed()) {
        waitframe();
    }
    var_ffdfc86379cfc071 = getdvarint(@"hash_7c6a7ce1709f1eff", var_a2d1e16b613b535c);
    if (var_ffdfc86379cfc071) {
        self.var_c561b8c04b423cbd = spawn("script_model", self.origin);
        self.var_c561b8c04b423cbd setmodel("tag_player");
        self playerlinkto(self.var_c561b8c04b423cbd, "tag_player");
    }
    self.var_19191156b87b7cd4 = 1;
    var_3d3f9fb3bc8c8626 = self.var_6c9d93d4584e15f7.hudelem.barelem;
    fraction = 0;
    up = 1;
    var_715d7709363e068c = undefined;
    while (self jumpbuttonpressed()) {
        var_3d3f9fb3bc8c8626 namespace_52f6938dd902c7d0::updatebar(fraction, 0);
        var_9d6d9b43b9128e64 = fraction;
        if (up) {
            if (function_eda9454efb18adfe()) {
                self setscriptablepartstate("heroDiveVfx", "charge_pause", 0);
                waitframe();
                continue;
            } else if (function_6653ad92a0329507()) {
                up = 0;
            } else {
                self setscriptablepartstate("heroDiveVfx", "charge_begin", 0);
                fraction = fraction + var_57bd73d0ecaee169;
                if (fraction >= 1) {
                    fraction = 1;
                    if (var_943d5ecbd9a29e50) {
                        up = 0;
                    } else if (var_6b00aa3867c7f0d9 >= 0) {
                        if (!isdefined(var_715d7709363e068c)) {
                            var_715d7709363e068c = gettime() + var_6b00aa3867c7f0d9 * 1000;
                            thread playerzombiejumpmaxholdwarning(var_ef7579be51267bdb, var_6b00aa3867c7f0d9);
                        }
                        if (gettime() >= var_715d7709363e068c) {
                            break;
                        }
                    }
                }
                if (var_9d6d9b43b9128e64 < var_eec1ca5327266614 && fraction >= var_eec1ca5327266614) {
                    var_3d3f9fb3bc8c8626.bar.color = (0, 1, 0);
                }
            }
        } else {
            self setscriptablepartstate("heroDiveVfx", "charge_fail", 0);
            fraction = fraction - var_57bd73d0ecaee169;
            if (fraction <= 0) {
                fraction = 0;
                up = 1;
            }
            if (var_9d6d9b43b9128e64 > var_eec1ca5327266614 && fraction <= var_eec1ca5327266614) {
                var_3d3f9fb3bc8c8626.bar.color = (1, 1, 1);
            }
        }
        waitframe();
    }
    self notify("jumpChargeEnd");
    if (var_ffdfc86379cfc071) {
        self unlink();
    }
    var_cb0c533702adee19 = function_d2667047a1186849();
    if (fraction >= var_eec1ca5327266614 && var_cb0c533702adee19) {
        if (fraction < 0.33) {
            self setscriptablepartstate("heroDiveVfx", "jump_begin_small", 0);
        } else if (fraction < 0.66) {
            self setscriptablepartstate("heroDiveVfx", "jump_begin_med", 0);
        } else {
            self setscriptablepartstate("heroDiveVfx", "jump_begin_lrg", 0);
        }
        player_angles = self getplayerangles();
        self setscriptablepartstate("heroDiveVfx", "jump_begin", 0);
        thread function_856a49ad2900cff6();
        playerapplyjumpvelocity(player_angles, var_f71d03f58af1672a, fraction);
    } else {
        self setscriptablepartstate("heroDiveVfx", "charge_fail", 0);
        if (var_e5482b00771c4909) {
            var_3d3f9fb3bc8c8626.bar.frac = 0;
        }
    }
    function_d59d137d348a395d(var_6c9d93d4584e15f7, var_ef7579be51267bdb, 1);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb56
// Size: 0xa
function function_55ce74e815a78a70() {
    return !function_d2667047a1186849();
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb68
// Size: 0x102
function function_d2667047a1186849() {
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return 0;
    }
    if (self ismantling()) {
        return 0;
    }
    if (!self isonground() || self isswimming()) {
        return 0;
    }
    if (!namespace_7e17181d03156026::function_ad443bbcdcf37b85(self)) {
        return 0;
    }
    if (self getstance() == "prone") {
        return 0;
    }
    if (isdefined(self.carryobject)) {
        return 0;
    }
    var_e880af5898ec6fd1 = namespace_7e17181d03156026::getstancecenter();
    radius = 16;
    var_4e18bf6f5eeee2f0 = namespace_7e17181d03156026::getstancetop() + anglestoup(self.angles) * 100;
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    /#
        level thread namespace_d028276791d9cff6::drawsphere(var_e880af5898ec6fd1, radius, 10, (0, 1, 0));
        level thread namespace_d028276791d9cff6::drawsphere(var_4e18bf6f5eeee2f0, radius, 10, (0, 1, 0));
    #/
    if (!namespace_2a184fc4902783dc::sphere_trace_passed(var_e880af5898ec6fd1, var_4e18bf6f5eeee2f0, radius, self, contents)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc72
// Size: 0x4e
function function_6653ad92a0329507() {
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return 1;
    }
    if (!self isonground() || self isswimming()) {
        return 1;
    }
    if (!namespace_7e17181d03156026::function_ad443bbcdcf37b85(self)) {
        return 1;
    }
    if (isdefined(self.carryobject)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc8
// Size: 0x22
function function_eda9454efb18adfe() {
    if (self ismantling()) {
        return 1;
    }
    if (self getstance() == "prone") {
        return 1;
    }
    return 0;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf2
// Size: 0x19c
function playerpowersaddhudelem(label, currenthudy) {
    hudelem = namespace_52f6938dd902c7d0::createfontstring("default", 1.5);
    hudelem.alignx = "left";
    hudelem.aligny = "top";
    hudelem.horzalign = "left_adjustable";
    hudelem.vertalign = "top_adjustable";
    hudelem.alpha = 1;
    hudelem.glowalpha = 0;
    hudelem.hidewheninmenu = 1;
    hudelem.archived = 0;
    if (isdefined(label)) {
        hudelem.label = label;
    }
    barelem = namespace_52f6938dd902c7d0::createbar((1, 1, 1), 160, 14);
    barelem.x = 13;
    barelem.y = currenthudy;
    barelem.alignx = "left";
    barelem.aligny = "top";
    barelem.horzalign = "left_adjustable";
    barelem.vertalign = "top_adjustable";
    barelem shiftbar();
    barelem.archived = 0;
    barelem.hidewheninmenu = 1;
    barelem.bar.archived = 0;
    barelem.bar.hidewheninmenu = 1;
    hudelem.barelem = barelem;
    return hudelem;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe96
// Size: 0xee
function shiftbar(point, relativepoint, xoffset, yoffset) {
    self.bar.horzalign = self.horzalign;
    self.bar.vertalign = self.vertalign;
    self.bar.alignx = "left";
    self.bar.aligny = self.aligny;
    self.bar.y = self.y + 2;
    self.bar.x = self.x + 2;
    namespace_52f6938dd902c7d0::updatebar(self.bar.frac);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8b
// Size: 0xfe
function playerzombiejumpmaxholdwarning(var_ef7579be51267bdb, time) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("zombie_unset");
    self endon("playerZombieJumpStop");
    self endon("jumpChargeEnd");
    if (time <= 0) {
        return;
    }
    var_3d3f9fb3bc8c8626 = self.var_6c9d93d4584e15f7.hudelem.barelem;
    var_2c728360e4c9326a = namespace_c5622898120e827f::array_init_distribute(time, int(time * 5), 1);
    color = 1;
    for (i = 0; i < var_2c728360e4c9326a.size; i++) {
        if (color) {
            var_3d3f9fb3bc8c8626.bar.color = (1, 0, 0);
        } else {
            var_3d3f9fb3bc8c8626.bar.color = (0, 1, 0);
        }
        wait(var_2c728360e4c9326a[i]);
        color = !color;
    }
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1090
// Size: 0x28f
function playerapplyjumpvelocity(var_44aae8e966034513, var_f71d03f58af1672a, fraction) {
    var_355760d151d56e05 = 1;
    player_angles = var_44aae8e966034513;
    movementdir = vectornormalize(self getvelocity());
    forwarddir = anglestoforward(self.angles);
    dot = vectordot(movementdir, forwarddir);
    var_441b8b8d8d1bbe0 = dot > 0.875 || dot == 0;
    if (!var_441b8b8d8d1bbe0) {
        var_5a2182bedeba5ed9 = vectortoangles(movementdir);
        player_angles = (player_angles[0], var_5a2182bedeba5ed9[1], var_5a2182bedeba5ed9[2]);
    }
    if (getdvarint(@"hash_ce6d7d66848cdbcc", var_355760d151d56e05)) {
        var_aa4ea3b3807e1650 = get_ground_normal();
        if (!isdefined(var_aa4ea3b3807e1650)) {
            var_aa4ea3b3807e1650 = (0, 0, 1);
        }
        yawangles = (0, player_angles[1], 0);
        right = anglestoright(yawangles);
        fwd = vectorcross(var_aa4ea3b3807e1650, right);
        var_19ae114150bfc887 = vectortoangles(fwd);
        var_b184911d23195923 = var_19ae114150bfc887[0];
        min_pitch = -85;
        max_pitch = var_b184911d23195923;
        player_pitch = player_angles[0];
        if (var_b184911d23195923 > 90 || var_b184911d23195923 < -90) {
            var_b184911d23195923 = var_b184911d23195923 % 90 * -1;
        }
        if (player_pitch > var_b184911d23195923) {
            player_pitch = var_b184911d23195923;
        }
        var_e6bc250926c6d64d = getdvarfloat(@"hash_9ec479015407c245", -45);
        var_e6980f09269e2b33 = getdvarfloat(@"hash_9ee78301542e1ffb", 0);
        frac = (player_pitch - min_pitch) / (max_pitch - min_pitch);
        var_aee49e405bf58492 = var_e6980f09269e2b33 + frac * (var_e6bc250926c6d64d - var_e6980f09269e2b33);
        player_angles = (player_pitch + var_aee49e405bf58492, player_angles[1], player_angles[2]);
    }
    var_179db9acb8f30e85 = getdvarfloat(@"hash_cf56037c34ea141f", 0);
    if (var_179db9acb8f30e85 != 0) {
        player_angles = (player_angles[0] + var_179db9acb8f30e85, player_angles[1], player_angles[2]);
    }
    dir = anglestoforward(player_angles);
    velocity = dir * fraction * var_f71d03f58af1672a;
    self setorigin(self.origin + (0, 0, 20));
    self setvelocity(velocity);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1326
// Size: 0x51
function function_d59d137d348a395d(var_6c9d93d4584e15f7, var_ef7579be51267bdb, var_1fc7e7ddba5d5771) {
    if (istrue(var_1fc7e7ddba5d5771)) {
        thread playerpowerstartcooldown(var_6c9d93d4584e15f7, var_ef7579be51267bdb);
    }
    if (isdefined(self.var_c561b8c04b423cbd)) {
        self.var_c561b8c04b423cbd delete();
    }
    self.var_19191156b87b7cd4 = undefined;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137e
// Size: 0x1ae
function playerpowerstartcooldown(var_6c9d93d4584e15f7, var_ef7579be51267bdb) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("tempV_unset");
    self endon("tempV_set");
    self endon("superJump_end");
    self endon("disableCooldown");
    if (!isdefined(self.var_6c9d93d4584e15f7) || istrue(self.var_6c9d93d4584e15f7.incooldown)) {
        return;
    }
    powerbar = self.var_6c9d93d4584e15f7.hudelem.barelem;
    if (powerbar.bar.frac > 0) {
        self.var_6c9d93d4584e15f7.incooldown = 1;
        cooldownsec = self.var_6c9d93d4584e15f7.cooldownsec;
        fraction = powerbar.bar.frac;
        cooldownsec = cooldownsec * fraction;
        powerbar.bar.color = (1, 0.6, 0);
        powerbar.bar scaleovertime(cooldownsec, 0, powerbar.height);
        self setclientomnvar("ui_super_high_jump_progress", int(fraction * 100));
        wait(cooldownsec);
        namespace_1f2efdb89e5f3a6e::function_bd0e084afb0d192f(1);
        self.var_6c9d93d4584e15f7.incooldown = 0;
        self notify("superJump_cooldownEnd");
    } else {
        powerbar namespace_52f6938dd902c7d0::updatebar(0, 0);
    }
    powerbar.bar.color = (1, 1, 1);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1533
// Size: 0x277
function get_ground_normal(var_31caef840b7ac074, debug) {
    if (!isdefined(var_31caef840b7ac074)) {
        ignore = self;
    } else {
        ignore = var_31caef840b7ac074;
    }
    if (!isdefined(debug)) {
        debug = 0;
    }
    ignorelist = [0:ignore];
    tracepoints = [0:self.origin];
    i = -1;
    while (i <= 1) {
        j = -1;
        while (j <= 1) {
            corner = ignore getpointinbounds(i, j, 0);
            corner = (corner[0], corner[1], self.origin[2]);
            tracepoints[tracepoints.size] = corner;
            j = j + 2;
        }
        i = i + 2;
    }
    avgnormal = (0, 0, 0);
    var_97d8f5a9eb04c1f2 = 0;
    foreach (point in tracepoints) {
        trace = namespace_2a184fc4902783dc::_bullet_trace(point + (0, 0, 4), point + (0, 0, -16), 0, ignorelist);
        tracehit = trace["fraction"] > 0 && trace["fraction"] < 1;
        if (tracehit) {
            avgnormal = avgnormal + trace["normal"];
            var_97d8f5a9eb04c1f2++;
        }
        /#
            if (debug) {
                if (tracehit) {
                    line(point, point + trace["jumpChargeEnd"] * 30, (0, 1, 0));
                } else {
                    sphere(point, 3, (1, 0, 0));
                }
            }
        #/
    }
    if (var_97d8f5a9eb04c1f2 > 0) {
        avgnormal = avgnormal / var_97d8f5a9eb04c1f2;
        /#
            if (debug) {
                line(self.origin, self.origin + avgnormal * 20, (1, 1, 1));
            }
        #/
        return avgnormal;
    } else {
        /#
            if (debug) {
                sphere(self.origin, 5, (1, 0, 0));
            }
        #/
        return undefined;
    }
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17b1
// Size: 0x11
function function_c0d0374f0a3d354e() {
    level endon("game_ended");
    self endon("death_or_disconnect");
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c9
// Size: 0x43
function function_95adb84c5ca51c36() {
    return isdefined(self.var_6c9d93d4584e15f7) && isdefined(self.var_6c9d93d4584e15f7.ref) && istrue(self.var_6c9d93d4584e15f7.ref == "super_jump");
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1814
// Size: 0x1c
function function_3a307fd8eb4f27eb() {
    if (self isskydiving()) {
        self skydive_interrupt();
    }
    self notify("perform_hero_drop");
    return 0;
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1838
// Size: 0xac
function function_856a49ad2900cff6() {
    self endon("death_or_disconnect");
    self endon("superJump_end");
    level endon("game_ended");
    if (!isdefined(self.var_6c9d93d4584e15f7)) {
        return;
    }
    self.var_6c9d93d4584e15f7.var_501056bcda9531c2 = 0;
    while (isdefined(self.var_6c9d93d4584e15f7)) {
        if (self isonground()) {
            if (self.var_6c9d93d4584e15f7.var_501056bcda9531c2 > 0) {
                break;
            }
        } else {
            self.var_6c9d93d4584e15f7.var_501056bcda9531c2 = self.var_6c9d93d4584e15f7.var_501056bcda9531c2 + level.framedurationseconds;
        }
        waitframe();
    }
    namespace_1f2efdb89e5f3a6e::function_bd0e084afb0d192f(0);
}

// Namespace namespace_fdd19a154a441b5c/namespace_1f2efdb89e5f3a6e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18eb
// Size: 0x4f
function function_6a991bfd08ea6fc5() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("superJump_end");
    self endon("temp_v_finished");
    while (1) {
        if (self isonladder() || self function_415fe9eeca7b2e2b()) {
            namespace_1f2efdb89e5f3a6e::function_bd0e084afb0d192f(0);
        } else {
            namespace_1f2efdb89e5f3a6e::function_bd0e084afb0d192f(1);
        }
        waitframe();
    }
}
