#using scripts\asm\asm.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\asm\shared\mp\utility.gsc;

#namespace utility;

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x373
// Size: 0x42
function dotraversal() {
    self endon("killanimscript");
    startnode = self getnegotiationstartnode();
    animscript = startnode.animscript;
    self notify("traverse_begin", animscript, startnode);
    self waittill("traverse_end");
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd
// Size: 0x1c
function chooseanimwithoverride(asmname, statename, params) {
    return false;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x88
function loopanimfortime(asmname, statename, params) {
    self endon(statename + "_finished");
    self endon("terminate_ai_threads");
    endevent = "loop_end";
    t = 2;
    if (isarray(params)) {
        if (params.size > 0) {
            t = params[0];
        }
        if (params.size > 1) {
            endevent = params[1];
        }
    } else {
        t = params;
    }
    thread function_fb56c9527636713f(asmname, statename, 1);
    wait t;
    asm_fireevent(asmname, endevent);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x472
// Size: 0x8f
function waitforpathchange(asmname, statename) {
    self endon(statename + "_finished");
    self waittill("path_set");
    var_2920e731907ba823 = self.lookaheaddir * self.lookaheaddist;
    turnparams = [0, var_2920e731907ba823, 0, self.origin, self.lookaheaddist];
    asm_fireevent(asmname, "sharp_turn", turnparams);
    thread waitforpathchange(asmname, statename);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x509
// Size: 0x86
function playmoveloop_mp(asmname, statename, params) {
    thread waitforpathchange(asmname, statename);
    rate = 1;
    if (isdefined(self.asm.moveplaybackrate)) {
        rate = self.asm.moveplaybackrate;
    } else if (isdefined(self.moveplaybackrate)) {
        rate = self.moveplaybackrate;
    }
    function_fb56c9527636713f(asmname, statename, rate);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0x79
function isfacingenemy(mindot) {
    if (!isdefined(mindot)) {
        mindot = 0.5;
    }
    forward = anglestoforward(self.angles);
    dirtoenemy = vectornormalize(self.enemy.origin - self.origin);
    dot = vectordot(forward, dirtoenemy);
    if (dot < mindot) {
        return false;
    }
    return true;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x619
// Size: 0xf
function isweaponfacingenemy() {
    if (isaimedataimtarget()) {
        return true;
    }
    return false;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x631
// Size: 0x15
function wantstocrouch() {
    if (bb_getrequestedstance() == "crouch") {
        return true;
    }
    return false;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f
// Size: 0xa5
function function_71eefa1c0da64a21(var_63a5b32b096323be) {
    if (!istrue(self._blackboard.shootparams_valid)) {
        return undefined;
    } else if (isdefined(self._blackboard.shootparams_ent)) {
        return self._blackboard.shootparams_ent getshootatpos();
    } else if (isdefined(self._blackboard.shootparams_pos)) {
        return self._blackboard.shootparams_pos;
    } else if (isdefined(self.enemy)) {
        return self.enemy getshootatpos();
    }
    return undefined;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fd
// Size: 0xf1
function isaimedataimtarget() {
    if (!isdefined(self._blackboard.shootparams_pos) && !isdefined(self._blackboard.shootparams_ent)) {
        return true;
    }
    weaponangles = self getmuzzleangle();
    var_63a5b32b096323be = self getshootfrompos();
    shootpos = function_71eefa1c0da64a21(var_63a5b32b096323be);
    if (!isdefined(shootpos)) {
        return false;
    }
    var_17ffbc15989cd7cb = vectortoangles(shootpos - var_63a5b32b096323be);
    absyawdiff = absangleclamp180(weaponangles[1] - var_17ffbc15989cd7cb[1]);
    if (absyawdiff > anim.aimyawdifffartolerance) {
        if (distancesquared(self geteye(), shootpos) > anim.aimyawdiffclosedistsq || absyawdiff > anim.aimyawdiffclosetolerance) {
        }
    }
    aimpitchdifftolerance = getaimpitchdifftolerance();
    return absangleclamp180(weaponangles[0] - var_17ffbc15989cd7cb[0]) <= aimpitchdifftolerance;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f7
// Size: 0x26
function getaimpitchdifftolerance() {
    if (isdefined(self.aimpitchdifftolerance)) {
        return self.aimpitchdifftolerance;
    }
    return anim.aimpitchdifftolerance;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x825
// Size: 0x23
function delayslowmotion(delay, start, end, time) {
    
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x850
// Size: 0x1b
function delaymodifybasefov(delay, fov, time) {
    
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x873
// Size: 0x79
function animscriptmp(archetype, statename, aliasname, loop, playbackrate, customendon, scriptednode, tag) {
    if (isdefined(customendon)) {
        thread animscriptmp_watchcancel(customendon);
    }
    if (istrue(loop)) {
        thread animscriptmp_loop_internal(archetype, statename, aliasname, playbackrate, scriptednode, tag);
        return;
    }
    thread animscriptmp_single_internal(archetype, statename, aliasname, playbackrate, scriptednode, tag);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x1c
function cancelanimscriptmp() {
    if (!scripts\asm\asm_bb::bb_isanimscripted()) {
        return 0;
    }
    cancelanimscriptmp_internal();
    self notify("CancelAnimscriptMP");
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918
// Size: 0x2b
function animscriptmp_watchcancel(customendon) {
    self endon("AnimscriptMP_Complete");
    self endon("death");
    self endon("CancelAnimscriptMP");
    self waittill(customendon);
    cancelanimscriptmp();
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94b
// Size: 0x97
function animscriptmp_single_internal(archetype, statename, aliasname, playbackrate, scriptnode, tag) {
    animscriptmp_internal(archetype, statename, aliasname, playbackrate, scriptnode, tag);
    var_e1940c994503c932 = isdefined(playbackrate) && playbackrate == 0;
    if (!var_e1940c994503c932 && isdefined(self) && isalive(self)) {
        cancelanimscriptmp_internal();
        self notify("AnimscriptMP_Complete");
        self notify("single anim", "end");
        self notify("looping anim", "end");
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ea
// Size: 0x56
function animscriptmp_loop_internal(archetype, statename, aliasname, playbackrate, scriptnode, tag) {
    self endon("CancelAnimscriptMP");
    self endon("death");
    while (true) {
        animscriptmp_internal(archetype, statename, aliasname, playbackrate, scriptnode, tag);
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa48
// Size: 0xb9
function private function_7618d8f3ba2fbcea(xanim, scriptnode, tag, animindex) {
    if (isdefined(tag)) {
        assert(isent(scriptnode));
        startpos = scriptnode gettagorigin(tag);
        startangles = scriptnode gettagangles(tag);
    } else {
        startpos = scriptnode.origin;
        startangles = scriptnode.angles;
    }
    animstartpos = getstartorigin(startpos, startangles, xanim);
    animstartangles = getstartangles(startpos, startangles, xanim);
    self dontinterpolate();
    self forceteleport(animstartpos, animstartangles, 9999999, 0);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb09
// Size: 0xed
function animscriptmp_internal(archetype, statename, aliasname, playbackrate, scriptnode, tag) {
    self endon("CancelAnimscriptMP");
    self endon("death");
    if (!isdefined(playbackrate)) {
        playbackrate = 1;
    }
    self setoverridearchetype("animscript", archetype, 1);
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = archetypegetrandomalias(archetype, statename, aliasname, asm_isfrantic());
    xanim = animsetgetanimfromindex(archetype, statename, animindex);
    if (isdefined(scriptnode)) {
        function_7618d8f3ba2fbcea(xanim, scriptnode, tag, animindex);
    }
    self aisetanim(statename, animindex, playbackrate);
    self aisetanimrate(statename, animindex, playbackrate);
    animlength = getanimlength(xanim);
    self.scripted_mode = 1;
    self.ignoreall = 1;
    if (playbackrate > 0) {
        wait animlength / playbackrate;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfe
// Size: 0x32
function cancelanimscriptmp_internal() {
    scripts\asm\asm_bb::bb_clearanimscripted();
    self scriptedanimfinished();
    self clearoverridearchetype("animscript", 0, 0);
    self.scripted_mode = 0;
    self.ignoreall = 0;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc38
// Size: 0x9f
function animscripted_single(aliasname, var_1a11aea0c900b403, statename) {
    assertex(isalive(self), "animscripted_single cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        xanim = asm_getxanim(statename, animindex);
        if (isdefined(xanim)) {
            animlength = getanimlength(xanim);
            wait animlength;
        }
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x65
function function_dd94e74da0ad6ead(aliasname, statename) {
    assertex(isalive(self), "animscripted_first_frame cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    animindex = asm_lookupanimfromalias(statename, aliasname);
    self aisetanim(statename, animindex, 0);
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd4c
// Size: 0x9a
function animscripted_single_earlyend(aliasname, time) {
    assertex(isalive(self), "animscripted_single_earlyend cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    assert(time > 0);
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    self aisetanim("animscripted", animindex);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (time < animlength) {
        wait animlength - time;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdee
// Size: 0x97
function animscripted_loop(aliasname) {
    assertex(isalive(self), "animscripted_loop cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (true) {
        self aisetanim("animscripted", animindex);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xaa
function animscripted_loop_earlyend(aliasname, time) {
    assertex(isalive(self), "animscripted_loop_earlyend cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (time < animlength) {
        animlength -= time;
    }
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (true) {
        self aisetanim("animscripted", animindex);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0xbd
function animscripted_loop_for_time(aliasname, time) {
    assert(time > 0);
    assertex(isalive(self), "animscripted_loop_for_time cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    for (timeremaining = time; timeremaining >= 0; timeremaining -= animlength) {
        self aisetanim("animscripted", animindex);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0xad
function animscripted_loop_n_times(aliasname, numloops) {
    assert(numloops);
    assertex(isalive(self), "animscripted_loop_n_times cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animlength = getanimlength(xanim);
    if (animlength < 0.05) {
        animlength = 0.05;
    }
    while (numloops > 0) {
        self aisetanim("animscripted", animindex);
        wait animlength;
        numloops--;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10b9
// Size: 0xcb
function animscripted_loop_relative(aliasname, ent, tag) {
    self endon("death");
    assert(isdefined(ent));
    assertex(isalive(self), "animscripted_loop_n_times cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    function_7618d8f3ba2fbcea(xanim, ent, tag, animindex);
    while (true) {
        if (!istrue(self._blackboard.animscriptedactive)) {
            return;
        }
        self aisetanim("animscripted", animindex);
        animlength = getanimlength(xanim);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118c
// Size: 0xc3
function animscripted_single_relative(aliasname, ent, tag, var_1a11aea0c900b403, statename) {
    assert(isdefined(ent));
    assertex(isalive(self), "animscripted_single_relative cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    if (!isdefined(statename)) {
        statename = "animscripted";
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias(statename, aliasname);
    xanim = asm_getxanim(statename, animindex);
    function_7618d8f3ba2fbcea(xanim, ent, tag, animindex);
    self aisetanim(statename, animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        animlength = getanimlength(xanim);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1257
// Size: 0x10c
function animscripted_single_arrive_at(aliasname, pos, angles, var_1a11aea0c900b403) {
    assertex(isalive(self), "animscripted_single_arrive_at cannot be used on a dead AI");
    if (!isalive(self)) {
        return;
    }
    scripts\asm\asm_mp::asm_setanimscripted();
    animindex = asm_lookupanimfromalias("animscripted", aliasname);
    xanim = asm_getxanim("animscripted", animindex);
    animdelta = getmovedelta(xanim);
    var_8c94765ca587f86c = getangledelta3d(xanim);
    startangles = combineangles(angles, invertangles(var_8c94765ca587f86c));
    startpos = pos - rotatevector(animdelta, startangles);
    self dontinterpolate();
    self forceteleport(startpos, startangles, 9999999, 0);
    self aisetanim("animscripted", animindex);
    if (!isdefined(var_1a11aea0c900b403)) {
        var_1a11aea0c900b403 = 0;
    }
    if (!var_1a11aea0c900b403) {
        animlength = getanimlength(xanim);
        wait animlength;
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136b
// Size: 0x10
function animscripted_clear() {
    scripts\asm\asm_bb::bb_clearanimscripted();
    self scriptedanimfinished();
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1383
// Size: 0x5d
function function_8fa69650e33c84ef(anime) {
    if (!isdefined(level.scr_anim) || !isdefined(self.animname) || !isdefined(level.scr_anim[self.animname]) || !isdefined(level.scr_anim[self.animname][anime])) {
        return false;
    }
    return true;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e9
// Size: 0xef
function function_577d8abff6067c23(anime, anim_string, org, var_8c94765ca587f86c, anim_flag) {
    self endon("death");
    if (isstring(anim_flag)) {
        ent_flag_set(anim_flag);
    }
    aliasname = level.scr_anim[self.animname][anime];
    callback_name = anime + "_animscripted";
    callback::callback(callback_name, {#aliasname:aliasname});
    if (isdefined(org)) {
        anim_node = spawnstruct();
        anim_node.origin = org;
        anim_node.angles = var_8c94765ca587f86c;
        scripts\asm\shared\mp\utility::animscripted_single_relative(aliasname, anim_node);
    } else {
        scripts\asm\shared\mp\utility::animscripted_single(aliasname);
    }
    scripts\asm\shared\mp\utility::animscripted_clear();
    self notify(anim_string, "end");
    if (isstring(anim_flag)) {
        ent_flag_clear(anim_flag);
    }
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e0
// Size: 0x67
function function_8efc1cbdaa97f95e(anime) {
    spawn_anim = scripts\asm\asm::asm_lookupanimfromalias("animscripted", level.scr_anim[self.animname][anime]);
    spawn_xanim = animsetgetanimfromindex(scripts\asm\shared\utility::function_2285421dfc79c4d5(), "animscripted", spawn_anim);
    var_7d881d4e81293ae5 = getmovedelta(spawn_xanim, 0, 1);
    return var_7d881d4e81293ae5;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1550
// Size: 0x67
function function_5173aedda202662(anime) {
    spawn_anim = scripts\asm\asm::asm_lookupanimfromalias("animscripted", level.scr_anim[self.animname][anime]);
    spawn_xanim = animsetgetanimfromindex(scripts\asm\shared\utility::function_2285421dfc79c4d5(), "animscripted", spawn_anim);
    var_7d881d4e81293ae5 = getangledelta(spawn_xanim, 0, 1);
    return var_7d881d4e81293ae5;
}

// Namespace utility / scripts\asm\shared\mp\utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c0
// Size: 0x7e
function ai_anim_first_frame(animation, animname) {
    var_1ed6bbc02282dd5 = "agent_scripted_" + getdvar(@"hash_687fb8f9b7a23245");
    aliasname = getanimname(animation);
    if (archetypeassetloaded(var_1ed6bbc02282dd5)) {
        thread scripts\asm\shared\mp\utility::animscriptmp(var_1ed6bbc02282dd5, "animscripted", aliasname, undefined, 0);
        return;
    }
    statename = "animscripted";
    thread scripts\asm\shared\mp\utility::function_dd94e74da0ad6ead(aliasname, statename);
}
