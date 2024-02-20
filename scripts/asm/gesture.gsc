// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;

#namespace gesture;

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x39
function ai_request_gesture(gesture, target_obj, var_25163a76776676d, notify_name) {
    if (!isdefined(var_25163a76776676d)) {
        var_25163a76776676d = 1000;
    }
    ai_request_gesture_internal(gesture, target_obj, var_25163a76776676d, notify_name);
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x74
function ai_cancel_gesture() {
    if (!isdefined(self._blackboard.gesturerequest)) {
        return;
    }
    if (isdefined(self._blackboard.gesturerequest.notifyname)) {
        self notify(self._blackboard.gesturerequest.notifyname, "gesture_cancel");
    }
    self._blackboard.gesturerequest = undefined;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af
// Size: 0x1a3
function handlegesturenotetrack(flagname) {
    notes = self waittill(flagname);
    if (!isdefined(notes)) {
        notes = [0:"undefined"];
    }
    if (!isarray(notes)) {
        notes = [0:notes];
    }
    /#
        assert(isdefined(self.fnasm_handlenotetrack));
    #/
    var_fc9a12fe1f57542a = undefined;
    foreach (note in notes) {
        if (note == "start_gundown") {
            self.gunposeoverride_internal = undefined;
            /#
                if (getdvarint(@"hash_7528066c9678d0a0", 0) == 1) {
                    print3d(self.origin + (0, 0, 60), "_finished", (1, 1, 1), 1, 0.5, 20);
                }
            #/
            continue;
        } else if (note == "finish_early") {
            /#
                if (getdvarint(@"hash_7528066c9678d0a0", 0) == 1) {
                    print3d(self.origin + (0, 0, 52), "<unknown string>", (1, 1, 1), 1, 0.5, 20);
                }
            #/
            self._blackboard.partialgestureplaying = 0;
            continue;
        } else {
            val = [[ self.fnasm_handlenotetrack ]](note, flagname);
        }
        if (isdefined(val)) {
            var_fc9a12fe1f57542a = val;
        }
    }
    return var_fc9a12fe1f57542a;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x44
function gesturedonotetracks(animlength) {
    self endon("gesture_timeout");
    thread gesturenotetracktimeoutthread(animlength);
    for (;;) {
        val = handlegesturenotetrack("gesture");
        if (isdefined(val)) {
            return val;
        }
    }
    self notify("gesture_finished");
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0x1d
function gesturenotetracktimeoutthread(var_cf54c5297431fef6) {
    self endon("gesture_finished");
    wait(var_cf54c5297431fef6);
    self notify("gesture_timeout");
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c9
// Size: 0x343
function gesture(asmname) {
    self endon("asm_terminated");
    self endon("death");
    /#
        assertex(!isdefined(self._blackboard.gesturerequest), "Gesture requested before gesture service started");
    #/
    while (1) {
        if (!isdefined(self._blackboard.gesturerequest)) {
            self waittill("gesture_requested");
        }
        /#
            assert(isdefined(self._blackboard.gesturerequest));
        #/
        while (1) {
            if (!isdefined(self._blackboard.gesturerequest)) {
                break;
            }
            if (self._blackboard.gesturerequest.timeoutms < gettime()) {
                ai_cancel_gesture();
                break;
            }
            if (namespace_28edc79fcf2fe234::bb_moverequested()) {
                target_speed = self aigettargetspeed();
                if (!istrue(self.allowrunninggesture) && target_speed > 135) {
                    wait(0.1);
                    continue;
                }
                if (self pathdisttogoal() < target_speed * 2.5) {
                    wait(0.1);
                    continue;
                }
            }
            self._blackboard.gesturerequest.latestalias = get_gesture_alias(self._blackboard.gesturerequest.gesture, self._blackboard.gesturerequest.target);
            var_4edb516a81e6b468 = self aiplaygesture(self._blackboard.gesturerequest.latestalias);
            if (!isdefined(var_4edb516a81e6b468)) {
                wait(0.1);
                continue;
            }
            /#
                if (getdvarint(@"hash_7528066c9678d0a0", 0) == 1) {
                    var_228c1f2f3a2d92f1 = getanimlength(var_4edb516a81e6b468);
                    print3d(self.origin + (0, 0, 72), self._blackboard.gesturerequest.gesture + "<unknown string>", (1, 1, 1), 1, 1, int(var_228c1f2f3a2d92f1 * 20));
                }
            #/
            self.gunposeoverride_internal = "disable";
            self.baimedataimtarget = 0;
            if (self._blackboard.gesturerequest.disablelookat) {
                self.disableautolookat = 1;
                self stoplookat();
            }
            notify_name = self._blackboard.gesturerequest.notifyname;
            self._blackboard.gesturerequest = undefined;
            self._blackboard.partialgestureplaying = 1;
            gesturedonotetracks(getanimlength(var_4edb516a81e6b468));
            self._blackboard.partialgestureplaying = 0;
            if (isdefined(notify_name)) {
                self notify(notify_name, "gesture_finish");
                self asmfireephemeralevent("gesture", "end");
            }
            self.disableautolookat = 0;
            self.gunposeoverride_internal = undefined;
            self aicleargesture();
            wait(0.4);
        }
    }
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x813
// Size: 0x8a
function gesture_should_disable_lookat(gesture) {
    var_a0ac7796b5ece550 = [0:"casual_point", 1:"military_point", 2:"beckon", 3:"nvg_on", 4:"nvg_off", 5:"wrist_com_lower", 6:"wrist_com_raise"];
    if (isdefined(self._blackboard.civilianfocuscurvalue) && gesture == "beckon") {
        return 0;
    }
    if (array_contains(var_a0ac7796b5ece550, gesture)) {
        return 1;
    }
    return 0;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a5
// Size: 0x163
function ai_request_gesture_internal(gesture, var_5110585bd4e933fe, var_25163a76776676d, notify_name) {
    if (isdefined(self._blackboard.gesturerequest)) {
        ai_cancel_gesture();
    }
    /#
        if (getdvarint(@"hash_7528066c9678d0a0", 0) == 1) {
            print3d(self.origin + (0, 0, 84), gesture + "<unknown string>", (1, 1, 1), 1, 1, int(var_25163a76776676d / 50));
        }
    #/
    self._blackboard.gesturerequest = spawnstruct();
    self._blackboard.gesturerequest.gesture = gesture;
    self._blackboard.gesturerequest.target = var_5110585bd4e933fe;
    self._blackboard.gesturerequest.timeoutms = gettime() + var_25163a76776676d;
    self._blackboard.gesturerequest.notifyname = notify_name;
    self._blackboard.gesturerequest.disablelookat = gesture_should_disable_lookat(gesture);
    self notify("gesture_requested");
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f
// Size: 0x19
function civisfocusingleft() {
    return self._blackboard.civilianfocusstate == 3;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa30
// Size: 0x19
function civisfocusingright() {
    return self._blackboard.civilianfocusstate == 4;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa51
// Size: 0x1a8
function get_gesture_alias(gesture, gesture_target) {
    if (isdefined(self._blackboard.civilianfocuscurvalue)) {
        if (gesture == "beckon") {
            var_34df158b62b8d82 = randomint(3) + 1;
            if (civisfocusingleft()) {
                gesture = gesture + "_" + var_34df158b62b8d82 + "_l";
            } else if (civisfocusingright()) {
                gesture = gesture + "_" + var_34df158b62b8d82 + "_r";
            }
        } else if (gesture == "glance") {
            var_34df158b62b8d82 = randomint(2) + 1;
            if (civisfocusingleft()) {
                gesture = gesture + "_" + var_34df158b62b8d82 + "_l";
            } else if (civisfocusingright()) {
                gesture = gesture + "_" + var_34df158b62b8d82 + "_r";
            }
        }
    }
    if (isdefined(gesture_target) && (gesture == "casual_point" || gesture == "military_point" || gesture == "beckon" || gesture == "stop" || gesture == "look" || gesture == "hide")) {
        if (isvector(gesture_target)) {
            targetorigin = gesture_target;
        } else {
            targetorigin = gesture_target.origin;
        }
        var_935ce979bb3ef270 = vectortoyaw(targetorigin - self.origin);
        anglediff = angleclamp180(var_935ce979bb3ef270 - self.angles[1]);
        angleindex = getangleindex(anglediff, 22.5);
        angleindex = namespace_34bf5965727c0922::mapangleindextonumpad(angleindex);
        return (gesture + angleindex);
    }
    return gesture;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc01
// Size: 0x79
function ai_finish_gesture() {
    /#
        assert(isdefined(self._blackboard.gesturerequest));
    #/
    if (isdefined(self._blackboard.gesturerequest.notifyname)) {
        self notify(self._blackboard.gesturerequest.notifyname, "gesture_finished");
    }
    self._blackboard.gesturerequest = undefined;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc81
// Size: 0x74
function chooseanim_gesture(asmname, statename, params) {
    /#
        assert(isdefined(self._blackboard.gesturerequest));
    #/
    var_4edb516a81e6b468 = asm_lookupanimfromalias(statename, self._blackboard.gesturerequest.latestalias);
    /#
        assert(isdefined(var_4edb516a81e6b468));
    #/
    return var_4edb516a81e6b468;
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcfd
// Size: 0x1cb
function playcoveranim_gesture(asmname, statename, params) {
    self endon(statename + "_finished");
    self._blackboard.activegesturenotify = self._blackboard.gesturerequest.notifyname;
    self setuseanimgoalweight(0.2);
    var_d6dd63cefb3c4ee = asm_getanim(asmname, statename);
    var_66aebe1d33f3b18 = asm_getxanim(statename, var_d6dd63cefb3c4ee);
    self orientmode("face current");
    if (asm_currentstatehasflag(asmname, "notetrackAim")) {
        angledelta = getangledelta(var_66aebe1d33f3b18, 0, 1);
        self.stepoutyaw = self.angles[1] + angledelta;
    }
    /#
        if (getdvarint(@"hash_7528066c9678d0a0", 0) == 1) {
            print3d(self.origin + (0, 0, 72), self._blackboard.gesturerequest.gesture + "<unknown string>", (1, 1, 1), 1, 1, 80);
        }
    #/
    self._blackboard.gesturerequest = undefined;
    self aisetanim(statename, var_d6dd63cefb3c4ee);
    asm_playfacialanim(asmname, statename, var_66aebe1d33f3b18);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    self orientmode("face current");
    if (isdefined(self._blackboard.activegesturenotify)) {
        self notify(self._blackboard.activegesturenotify, "gesture_finished");
        self._blackboard.activegesturenotify = undefined;
    }
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xecf
// Size: 0x61
function cleargestureanim(asmname, statename, params) {
    if (isdefined(self._blackboard.activegesturenotify)) {
        self notify(self._blackboard.activegesturenotify, "gesture_cancel");
        self._blackboard.activegesturenotify = undefined;
    }
}

// Namespace gesture/namespace_d3b312ec98e9299b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf37
// Size: 0xeb
function gesture_finishearly(asmname, statename, var_f2b19b25d457c2a6, gesture) {
    if (bb_moverequested() && istrue(self.gestureinterruptible)) {
        if (isdefined(self.gestureinterruptibleifplayerwithindist)) {
            if (distancesquared(self.origin, level.player.origin) < self.gestureinterruptibleifplayerwithindist * self.gestureinterruptibleifplayerwithindist) {
                self asmfireephemeralevent("gesture", "end");
                return 1;
            }
        } else {
            self asmfireephemeralevent("gesture", "end");
            return 1;
        }
    }
    if (asm_eventfired(asmname, "finish_early") && bb_moverequested()) {
        self asmfireephemeralevent("gesture", "end");
    }
    return asm_eventfired(asmname, "finish_early") && bb_moverequested();
}

