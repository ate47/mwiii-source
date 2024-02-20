// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\common\gameskill.gsc;
#using scripts\engine\trace.gsc;

#namespace utility;

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x434
// Size: 0xc
function initialize(type) {
    
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447
// Size: 0x141
function updateanimpose() {
    /#
        assertex(self.a.movement == "stop" || self.a.movement == "walk" || self.a.movement == "run", "UpdateAnimPose " + self.currentpose + " " + self.a.movement);
    #/
    if (isdefined(self.desired_anim_pose) && self.desired_anim_pose != self.currentpose) {
        if (self.currentpose == "prone") {
            exitpronewrapper(0.5);
        }
        if (self.desired_anim_pose == "prone") {
            self setproneanimnodes(-45, 45, generic_human%prone_legs_down, generic_human%exposed_aiming, generic_human%prone_legs_up);
            enterpronewrapper(0.5);
            self setanimknoball(lookupanim("default_prone", "straight_level"), generic_human%body, 1, 0.1, 1);
        }
    }
    self.desired_anim_pose = undefined;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x58f
// Size: 0xcf
function function_5e5e4284e2d68a41(animscript) {
    /#
        self endon("stop personal effect");
        if (animscript == "secondary" || animscript == "][") {
            wait(0.05);
            waittillframeend();
        }
        attachsize = self getattachsize();
        for (i = 0; i < attachsize; i++) {
            model = tolower(self getattachmodelname(i));
            /#
                assertex(model != "offhand_fired", "<unknown string>" + self.origin);
            #/
            /#
                assertex(model != "<unknown string>", "<unknown string>" + self.origin);
            #/
            /#
                assertex(model != "<unknown string>", "<unknown string>" + self.origin);
            #/
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x665
// Size: 0x5e
function printdisplaceinfo() {
    self endon("death");
    self notify("displaceprint");
    self endon("displaceprint");
    for (;;) {
        /#
            print3d(self.origin + (0, 0, 60), "<unknown string>", (0, 0.4, 0.7), 0.85, 0.5);
        #/
        wait(0.05);
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ca
// Size: 0x35
function isdebugon() {
    /#
        return getdvarint(@"hash_e5888a4dbf301822") == 1 || isdefined(anim.debugent) && anim.debugent == self;
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x706
// Size: 0x4e
function drawdebuglineinternal(frompoint, topoint, color, durationframes) {
    /#
        for (i = 0; i < durationframes; i++) {
            line(frompoint, topoint, color);
            wait(0.05);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x75b
// Size: 0x3c
function drawdebugline(frompoint, topoint, color, durationframes) {
    /#
        if (isdebugon()) {
            thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x79e
// Size: 0x51
function debugline(frompoint, topoint, color, durationframes) {
    /#
        for (i = 0; i < durationframes * 20; i++) {
            line(frompoint, topoint, color);
            wait(0.05);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f6
// Size: 0x2c
function notifyaftertime(notifystring, killmestring, time) {
    self endon("death");
    self endon(killmestring);
    wait(time);
    self notify(notifystring);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x61
function drawstringtime(msg, org, color, timer) {
    maxtime = timer * 20;
    for (i = 0; i < maxtime; i++) {
        /#
            print3d(org, msg, color, 1, 1);
        #/
        wait(0.05);
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x891
// Size: 0xaf
function showlastenemysightpos(string) {
    self notify("got known enemy2");
    self endon("got known enemy2");
    self endon("death");
    if (!isdefined(self.enemy)) {
        return;
    }
    if (self.enemy.team == "allies") {
        color = (0.4, 0.7, 1);
    } else {
        color = (1, 0.7, 0.4);
    }
    while (1) {
        wait(0.05);
        if (!isdefined(self.lastenemysightpos)) {
            continue;
        }
        /#
            print3d(self.lastenemysightpos, string, color, 1, 2.15);
        #/
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x947
// Size: 0x8b
function function_f5e6ad17591107bc(string, org, printtime, color) {
    /#
        level notify("<unknown string>" + org);
        level endon("<unknown string>" + org);
        if (!isdefined(color)) {
            color = (0.3, 0.9, 0.6);
        }
        timer = printtime * 20;
        i = 0;
        while (i < timer) {
            wait(0.05);
            print3d(org, string, color, 1, 1);
            i = i + 1;
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9d9
// Size: 0x4b
function function_e125b2100c281c9c(string, org, printtime, color) {
    /#
        if (getdvar(@"hash_9f7713320782588b") != "<unknown string>") {
            level thread function_f5e6ad17591107bc(string, org, printtime, color);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x35
function hasenemysightpos() {
    if (isdefined(self.node)) {
        return (canseeenemyfromexposed() || self cansuppressenemyfromexposed());
    } else {
        return (canseeenemy() || cansuppressenemy());
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa67
// Size: 0xc
function getenemysightpos() {
    return self.goodshootpos;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7b
// Size: 0xe
function debugtimeout() {
    wait(5);
    self notify("timeout");
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90
// Size: 0xb9
function debugposinternal(org, string, size) {
    self endon("death");
    self notify("stop debug " + org);
    self endon("stop debug " + org);
    ent = spawnstruct();
    ent thread debugtimeout();
    ent endon("timeout");
    if (self.enemy.team == "allies") {
        color = (0.4, 0.7, 1);
    } else {
        color = (1, 0.7, 0.4);
    }
    /#
        while (1) {
            wait(0.05);
            print3d(org, string, color, 1, size);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb50
// Size: 0x23
function debugpos(org, string) {
    thread debugposinternal(org, string, 2.15);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0x27
function debugpossize(org, string, size) {
    thread debugposinternal(org, string, size);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba8
// Size: 0xbe
function debugburstprint(numshots, var_3e92cd336a99ce02) {
    var_f7a22274947d27dc = numshots / var_3e92cd336a99ce02;
    var_67c3f18015d8d33b = undefined;
    if (numshots == self.bulletsinclip) {
        var_67c3f18015d8d33b = "all rounds";
    } else if (var_f7a22274947d27dc < 0.25) {
        var_67c3f18015d8d33b = "small burst";
    } else if (var_f7a22274947d27dc < 0.5) {
        var_67c3f18015d8d33b = "med burst";
    } else {
        var_67c3f18015d8d33b = "long burst";
    }
    thread debugpossize(self.origin + (0, 0, 42), var_67c3f18015d8d33b, 1.5);
    thread debugpos(self.origin + (0, 0, 60), "Suppressing");
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6d
// Size: 0xa3
function printshootproc() {
    /#
        self endon("][");
        self notify("<unknown string>" + self.export);
        self endon("<unknown string>" + self.export);
        printtime = 0.25;
        timer = printtime * 20;
        i = 0;
        while (i < timer) {
            wait(0.05);
            print3d(self.origin + (0, 0, 70), "<unknown string>", (1, 0, 0), 1, 1);
            i = i + 1;
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd17
// Size: 0x25
function printshoot() {
    /#
        if (getdvar(@"hash_9f7713320782588b") == "<unknown string>") {
            thread printshootproc();
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd43
// Size: 0x67
function showdebugproc(frompoint, topoint, color, printtime) {
    /#
        self endon("][");
        timer = printtime * 20;
        i = 0;
        while (i < timer) {
            wait(0.05);
            line(frompoint, topoint, color);
            i = i + 1;
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdb1
// Size: 0x3e
function showdebugline(frompoint, topoint, color, printtime) {
    thread showdebugproc(frompoint, topoint + (0, 0, -5), color, printtime);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0xe6
function shootenemywrapper_normal(var_9bc9d0ee2a8a46f5) {
    self._blackboard.var_60dcaa3d3be97ab = gettime();
    namespace_2f36c2cc5a44d845::set_accuracy_based_on_situation();
    self notify("shooting");
    if (self function_e8ca4080d02a0bb4() && istrue(self._blackboard.shootparams_valid) && isdefined(self._blackboard.shootparams_pos)) {
        if (isdefined(self.var_3568703b0bab6334) && self.var_145c08825430f207 > gettime() - 250) {
            self shoot(1, self.var_3568703b0bab6334, 1, 0, 1);
        } else {
            self shoot(1, self._blackboard.shootparams_pos, 1, 0, 1);
        }
    } else {
        if (isagent(self)) {
            var_9bc9d0ee2a8a46f5 = 1;
        }
        self shoot(1, undefined, var_9bc9d0ee2a8a46f5);
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee3
// Size: 0x1d
function shootenemywrapper_shootnotify(var_9bc9d0ee2a8a46f5) {
    level notify("an_enemy_shot", self);
    shootenemywrapper_normal(var_9bc9d0ee2a8a46f5);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf07
// Size: 0xb4
function shootposwrapper(shootpos, var_9bc9d0ee2a8a46f5) {
    self._blackboard.var_60dcaa3d3be97ab = gettime();
    if (!isdefined(var_9bc9d0ee2a8a46f5)) {
        var_9bc9d0ee2a8a46f5 = 1;
    }
    self notify("shooting");
    if (self function_e8ca4080d02a0bb4()) {
        self shoot(1, shootpos, 1, 1, 1);
    } else {
        var_6da568df7fced105 = 0;
        if (isdefined(self.enemy) && istrue(self.enemy.underlowcover)) {
            var_6da568df7fced105 = 1;
        }
        endpos = bulletspread(self getmuzzlepos(), shootpos, 4);
        self shoot(1, endpos, var_9bc9d0ee2a8a46f5, var_6da568df7fced105);
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc2
// Size: 0x21f
function throwgun() {
    org = spawn("script_model", (0, 0, 0));
    org setmodel("temp");
    org.origin = self gettagorigin("tag_weapon_right") + (50, 50, 0);
    org.angles = self gettagangles("tag_weapon_right");
    right = anglestoright(org.angles);
    right = right * 15;
    forward = anglestoforward(org.angles);
    forward = forward * 15;
    org movegravity((0, 50, 150), 100);
    weaponclass = "weapon_" + getcompleteweaponname(self.weapon);
    weapon = spawn(weaponclass, org.origin);
    weapon.angles = self gettagangles("tag_weapon_right");
    weapon linkto(org);
    lastorigin = org.origin;
    while (isdefined(weapon) && isdefined(weapon.origin)) {
        start = lastorigin;
        end = org.origin;
        angles = vectortoangles(end - start);
        forward = anglestoforward(angles);
        forward = forward * 4;
        trace = namespace_2a184fc4902783dc::_bullet_trace(end, end + forward, 1, weapon);
        if (isalive(trace["entity"]) && trace["entity"] == self) {
            wait(0.05);
            continue;
        }
        if (trace["fraction"] < 1) {
            break;
        }
        lastorigin = org.origin;
        wait(0.05);
    }
    if (isdefined(weapon) && isdefined(weapon.origin)) {
        weapon unlink();
    }
    org delete();
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e8
// Size: 0xc1
function personalcoldbreath() {
    tag = "TAG_EYE";
    self endon("death");
    self notify("stop personal effect");
    self endon("stop personal effect");
    while (isdefined(self)) {
        wait(0.05);
        if (!isdefined(self)) {
            break;
        }
        if (isdefined(self.a.movement) && self.a.movement == "stop") {
            if (isdefined(self.isindoor) && self.isindoor == 1) {
                continue;
            }
            playfxontag(level._effect["cold_breath"], self, tag);
            wait(2.5 + randomfloat(3));
        } else {
            wait(0.5);
        }
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b0
// Size: 0x27
function ispartiallysuppressedwrapper() {
    if (self.suppressionmeter <= self.suppressionthreshold * 0.25) {
        return 0;
    }
    return self issuppressed();
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12df
// Size: 0x5c
function showlines(start, end, end2) {
    /#
        for (;;) {
            line(start, end, (1, 0, 0), 1);
            wait(0.05);
            line(start, end2, (0, 0, 1), 1);
            wait(0.05);
        }
    #/
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1342
// Size: 0x11
function usingboltactionweapon() {
    return weaponisboltaction(self.weapon);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x135b
// Size: 0x86
function setfootstepeffect(type, name, fx) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type.");
    #/
    /#
        assertex(isdefined(fx), "Need to define the footstep effect.");
    #/
    /#
        assertex(isdefined(type), "Need to define the footstep unittype.");
    #/
    if (!isdefined(anim.optionalstepeffects)) {
        anim.optionalstepeffects = [];
    }
    anim.optionalstepeffects[name] = 1;
    level._effect["step_" + name][type] = fx;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13e8
// Size: 0x86
function setfootstepeffectsmall(type, name, fx) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type.");
    #/
    /#
        assertex(isdefined(fx), "Need to define the footstep effect.");
    #/
    /#
        assertex(isdefined(type), "Need to define the footstep unittype.");
    #/
    if (!isdefined(anim.optionalstepeffectssmall)) {
        anim.optionalstepeffectssmall = [];
    }
    anim.optionalstepeffectssmall[name] = 1;
    level._effect["step_small_" + name][type] = fx;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1475
// Size: 0x9d
function setfootprinteffect(type, name, fx) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type.");
    #/
    /#
        assertex(isdefined(fx), "Need to define the footstep effect.");
    #/
    /#
        assertex(isdefined(type), "Need to define the footstep unittype.");
    #/
    if (!isdefined(anim.optionalfootprinteffects)) {
        anim.optionalfootprinteffects = [];
    }
    if (!isdefined(anim.flirfootprinteffects)) {
        anim.flirfootprinteffects = 0;
    }
    anim.optionalfootprinteffects[name] = 1;
    level._effect["footprint_" + name][type] = fx;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0x45
function unsetfootstepeffect(name) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    #/
    if (isdefined(anim.optionalstepeffects)) {
        anim.optionalstepeffects[name] = undefined;
    }
    level._effect["step_" + name] = undefined;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1565
// Size: 0x45
function unsetfootstepeffectsmall(name) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    #/
    if (isdefined(anim.optionalstepeffectssmall)) {
        anim.optionalstepeffectssmall[name] = undefined;
    }
    level._effect["step_small_" + name] = undefined;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15b1
// Size: 0x45
function unsetfootprinteffect(name) {
    /#
        assertex(isdefined(name), "Need to define the footstep surface type to unset.");
    #/
    if (isdefined(anim.optionalfootprinteffects)) {
        anim.optionalfootprinteffects[name] = undefined;
    }
    level._effect["footprint_" + name] = undefined;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x15fd
// Size: 0xdc
function setnotetrackeffect(notetrack, tag, var_2e697115fa7cf3cb, fx, sound_prefix, sound_suffix) {
    /#
        assert(isdefined(notetrack));
    #/
    /#
        assert(isdefined(tag));
    #/
    /#
        assert(isdefined(fx));
    #/
    /#
        assertex(isstring(notetrack), "Notetrack name must be a string");
    #/
    if (!isdefined(var_2e697115fa7cf3cb)) {
        var_2e697115fa7cf3cb = "all";
    }
    if (!isdefined(level._notetrackfx)) {
        level._notetrackfx = [];
    }
    level._notetrackfx[notetrack][var_2e697115fa7cf3cb] = spawnstruct();
    level._notetrackfx[notetrack][var_2e697115fa7cf3cb].tag = tag;
    level._notetrackfx[notetrack][var_2e697115fa7cf3cb].fx = fx;
    setnotetracksound(notetrack, var_2e697115fa7cf3cb, sound_prefix, sound_suffix);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e0
// Size: 0xad
function setnotetracksound(notetrack, var_2e697115fa7cf3cb, sound_prefix, sound_suffix) {
    if (!isdefined(var_2e697115fa7cf3cb)) {
        var_2e697115fa7cf3cb = "all";
    }
    if (!isdefined(level._notetrackfx)) {
        level._notetrackfx = [];
    }
    if (isdefined(level._notetrackfx[notetrack][var_2e697115fa7cf3cb])) {
        struct = level._notetrackfx[notetrack][var_2e697115fa7cf3cb];
    } else {
        struct = spawnstruct();
        level._notetrackfx[notetrack][var_2e697115fa7cf3cb] = struct;
    }
    if (isdefined(sound_prefix)) {
        struct.sound_prefix = sound_prefix;
    }
    if (isdefined(sound_suffix)) {
        struct.sound_suffix = sound_suffix;
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1794
// Size: 0x15
function enterpronewrapper(timer) {
    thread enterpronewrapperproc(timer);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b0
// Size: 0x7e
function enterpronewrapperproc(timer) {
    self endon("death");
    self notify("anim_prone_change");
    self endon("anim_prone_change");
    self enterprone(timer, isdefined(self.a.onback));
    self waittill("killanimscript");
    if (self.currentpose != "prone" && !isdefined(self.a.onback)) {
        self.currentpose = "prone";
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1835
// Size: 0x22
function stoponback() {
    exitpronewrapper(1);
    self.a.onback = undefined;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185e
// Size: 0x15
function exitpronewrapper(timer) {
    thread exitpronewrapperproc(timer);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187a
// Size: 0x52
function exitpronewrapperproc(timer) {
    self endon("death");
    self notify("anim_prone_change");
    self endon("anim_prone_change");
    self exitprone(timer);
    self waittill("killanimscript");
    if (self.currentpose == "prone") {
        self.currentpose = "crouch";
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18d3
// Size: 0xc
function getaiprimaryweapon() {
    return self.primaryweapon;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e7
// Size: 0xc
function getaisecondaryweapon() {
    return self.secondaryweapon;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18fb
// Size: 0xc
function getaisidearmweapon() {
    return self.sidearm;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0xc
function getaicurrentweapon() {
    return self.weapon;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1923
// Size: 0x6e
function getaicurrentweaponslot() {
    if (self.weapon == self.primaryweapon) {
        return "primary";
    } else if (self.weapon == self.secondaryweapon) {
        return "secondary";
    } else if (self.weapon == self.sidearm) {
        return "sidearm";
    } else {
        /#
            assertmsg("self.weapon does not match any known slot");
        #/
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1998
// Size: 0x3f
function aihasweapon(objweapon) {
    /#
        assert(isweapon(objweapon));
    #/
    weaponname = getcompleteweaponname(objweapon);
    if (isdefined(self.weaponinfo[weaponname])) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19df
// Size: 0x27
function getanimendpos(theanim) {
    movedelta = getmovedelta(theanim, 0, 1);
    return self localtoworldcoords(movedelta);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0e
// Size: 0xc7
function ragdolldeath(moveanim) {
    self endon("killanimscript");
    lastorg = self.origin;
    movevec = (0, 0, 0);
    for (;;) {
        wait(0.05);
        force = distance(self.origin, lastorg);
        lastorg = self.origin;
        if (self.health == 1) {
            self.a.nodeath = 1;
            self startragdoll();
            self clearanim(moveanim, 0.1);
            wait(0.05);
            physicsexplosionsphere(lastorg, 600, 0, force * 0.1);
            self notify("killanimscript");
            return;
        }
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1adc
// Size: 0xd
function iscqbwalkingorfacingenemy() {
    return !self.facemotion;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1af1
// Size: 0x1e
function randomizeidleset() {
    self.a.idleset = randomint(2);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b16
// Size: 0x43
function getrandomintfromseed(intseed, intmax) {
    /#
        assert(intmax > 0);
    #/
    index = intseed % anim.randominttablesize;
    return anim.randominttable[index] % intmax;
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b61
// Size: 0x31
function getcurrentweaponslotname() {
    /#
        assert(isdefined(self));
    #/
    if (isusingsecondary()) {
        return "secondary";
    }
    if (isusingsidearm()) {
        return "sidearm";
    }
    return "primary";
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b9a
// Size: 0xee
function lookupanim(var_4cabf1b2b096a23a, var_b94d3ff91445983f) {
    /#
        assert(isai(self));
    #/
    if (isdefined(self.animarchetype)) {
        /#
            assertex(isdefined(anim.archetypes[self.animarchetype]), "Invalid anim archetype: " + self.animarchetype);
        #/
        if (isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a]) && isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a][var_b94d3ff91445983f])) {
            return anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a][var_b94d3ff91445983f];
        }
    }
    /#
        assertex(isdefined(anim.archetypes["soldier"][var_4cabf1b2b096a23a][var_b94d3ff91445983f]), "Missing anim for soldier archetype: [" + var_4cabf1b2b096a23a + "][" + var_b94d3ff91445983f + "]");
    #/
    return anim.archetypes["soldier"][var_4cabf1b2b096a23a][var_b94d3ff91445983f];
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c90
// Size: 0x122
function lookupanimarray(var_4cabf1b2b096a23a) {
    /#
        assert(isai(self));
    #/
    if (isdefined(self.animarchetype)) {
        /#
            assertex(isdefined(anim.archetypes[self.animarchetype]), "Invalid anim archetype: " + self.animarchetype);
        #/
        if (isdefined(anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a])) {
            animset = anim.archetypes["soldier"][var_4cabf1b2b096a23a];
            foreach (key, value in anim.archetypes[self.animarchetype][var_4cabf1b2b096a23a]) {
                animset[key] = value;
            }
            return animset;
        }
    }
    /#
        assertex(isdefined(anim.archetypes["soldier"][var_4cabf1b2b096a23a]), "Missing anim array for soldier archetype: [" + var_4cabf1b2b096a23a + "]");
    #/
    return anim.archetypes["soldier"][var_4cabf1b2b096a23a];
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dba
// Size: 0x12
function isenergyweapon(weapon) {
    return weaponusesenergybullets(weapon);
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd4
// Size: 0x8c
function function_b5216a6d7bd17210(var_125494b52c06759c, var_d160dd91a3ae5bb8) {
    /#
        assertex(isdefined(var_125494b52c06759c), "Gesture weapon must be defined");
    #/
    var_d160dd91a3ae5bb8 = function_53c4c53197386572(var_d160dd91a3ae5bb8, 0);
    if (var_d160dd91a3ae5bb8) {
        self cancelreload();
    }
    gestureweapon = makeweapon(var_125494b52c06759c);
    self giveandfireoffhand(gestureweapon);
    if (!self hasweapon(gestureweapon)) {
        return;
    }
    if (var_d160dd91a3ae5bb8) {
        thread function_422595121745c8a1(gestureweapon);
        self allowreload(0);
        waittill_any_2("offhand_fired", "weapon_gesture_failed");
        self allowreload(1);
    }
}

// Namespace utility/namespace_f87a4b6569ce73b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e67
// Size: 0x30
function function_422595121745c8a1(gestureweapon) {
    self endon("offhand_fired");
    self endon("death_or_disconnect");
    while (self hasweapon(gestureweapon)) {
        waitframe();
    }
    self notify("weapon_gesture_failed");
}

