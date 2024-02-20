// mwiii decomp prototype
#using scripts\common\anim.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\door.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\flags.gsc;

#namespace door;

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x96
function door_dynamic_setup(var_42ecb50ba6ddae43) {
    if (isdefined(level.doors)) {
        return;
    }
    /#
        setdevdvarifuninitialized(@"hash_a35456ddcb0a6051", 0);
        setdevdvarifuninitialized(@"hash_b75e6afff090e790", 0);
    #/
    setdvar(@"hash_60f76e342fa97cce", 150);
    level.doors = [];
    level.doorsetupstarted = 0;
    thread door_dynamic_setup_adapter("dynamic_door", 0);
    thread door_dynamic_setup_adapter("lean_dynamic_door", 1, var_42ecb50ba6ddae43);
    script_model_anims();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc0
// Size: 0x73a
function door_dynamic_setup_adapter(var_497a14a8727744f4, lean, var_42ecb50ba6ddae43) {
    doors = getentarray(var_497a14a8727744f4, "targetname");
    level.doorsetupstarted++;
    level.doorsetupfinished = 0;
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip", 6:"physicscontents_item"];
    contentoverride = physics_createcontents(content);
    level.doorcontentoverride = contentoverride;
    foreach (door in doors) {
        if (isdefined(door.script_parameters)) {
            door door_dynamic_parse_parameters(door.script_parameters);
        }
        door.doors = [];
        door.doors[0] = door;
        door.islean = lean;
        door.baseangles = door.angles;
        if (door.baseangles[1] == 360) {
            door.baseangles = (door.baseangles[0], 0, door.baseangles[2]);
        }
        door.state = 0;
        doortarget = door.target;
        var_95a8d8addb57380e = isdefined(door.script_noteworthy) && door.script_noteworthy == "OPEN" || getdvarint(@"hash_a35456ddcb0a6051", 0) != 0;
        var_74fb145ec8b5103d = isdefined(door.script_noteworthy) && door.script_noteworthy == "LOCKED";
        door.length = 52;
        door.height = 96;
        door.leftplantorg = door.origin + anglestoforward(door.angles) * door.length * 0.5 + anglestoright(door.angles) * -24.5;
        door.leftplantang = (0, door.baseangles[1] - 90, 0);
        door.rightplantorg = door.origin + anglestoforward(door.angles) * door.length * 0.5 + anglestoright(door.angles) * 24.5;
        door.rightplantang = (0, door.baseangles[1] + 90, 0);
        door.doorcenter = door.origin + anglestoforward(door.angles) * door.length * 0.5 + anglestoup(door.angles) * door.height * 0.5;
        door.max_yaw_left = 90;
        door.max_yaw_right = 90;
        var_70be37a43c5b39d5 = door gettagorigin("tag_door_handle", 1);
        if (isdefined(var_70be37a43c5b39d5)) {
            door namespace_19b4203b51d56488::sethintobject("tag_door_handle", "HINT_BUTTON", undefined, "MP/DOOR_USE_OPEN_DOUBLE", undefined, "duration_none", undefined, 200, 90, 72, 90);
            door.useprompt = door;
            door.useprompt setusewhenhandsoccupied(1);
            if (!lean && !namespace_36f464722d326bbe::isBRStyleGameType()) {
                door.lockprompt = namespace_19b4203b51d56488::createhintobject(var_70be37a43c5b39d5, "HINT_BUTTON", undefined, "MP/DOOR_USE_LOCK", undefined, undefined, "show", 200, 90, 72, 90);
                door.lockprompt linkto(door, "tag_door_handle", (3, 0, 15), (0, 0, 0));
                door.lockprompt setusewhenhandsoccupied(1);
                door.alarmprompts = [];
                var_32fac41ab88d1e04 = [0:(4, 0, 4), 1:(4, 0, 90)];
                foreach (offset in var_32fac41ab88d1e04) {
                    var_ae098e74b36ddbc4 = namespace_19b4203b51d56488::createhintobject(var_70be37a43c5b39d5, "HINT_BUTTON", undefined, "MP/DOOR_USE_ALARM", undefined, undefined, "show", 100, 90, 80, 20);
                    var_ae098e74b36ddbc4 linkto(door, "tag_origin", offset, (0, 0, 0));
                    var_ae098e74b36ddbc4 setusewhenhandsoccupied(0);
                    var_3fa8302c3eb6f7b6 = var_ae098e74b36ddbc4 getentitynumber();
                    door.alarmprompts[var_3fa8302c3eb6f7b6] = var_ae098e74b36ddbc4;
                }
                clip = undefined;
                if (isdefined(doortarget)) {
                    clip = getent(doortarget, "targetname");
                }
                if (isdefined(clip)) {
                    door.clipent = clip;
                    door.clipent linkto(door);
                    door.clipent.unresolved_collision_func = &namespace_d7b023c7eb3949d0::unresolved_collision_void;
                    door.clipent connectpaths();
                    if (isdefined(clip.target)) {
                        var_71e2fad940312adb = getent(clip.target, "targetname");
                        door.audioportalent = var_71e2fad940312adb;
                    }
                }
            }
            if (var_95a8d8addb57380e) {
                door thread changestate(2);
                door.angles = (door.angles[0], door.angles[1] + 90, door.angles[2]);
            } else if (var_74fb145ec8b5103d) {
                door thread changestate(7);
            } else {
                door thread changestate(0);
            }
        }
        level.doors[level.doors.size] = door;
        waitframe();
    }
    if (!lean) {
        level thread amortizeyawtraces();
        foreach (door in level.doors) {
            door thread get_max_yaws();
        }
        level thread linkdoubledoors();
    }
    level.doorsetupstarted--;
    level.doorsetupfinished = level.doorsetupstarted == 0;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1501
// Size: 0x94
function door_dynamic_setup_post_init() {
    waitframe();
    if (getdvarint(@"hash_a35456ddcb0a6051", 0) != 0) {
        foreach (door in level.doors) {
            door.statecurr = 2;
            door.angles = door.doortarget.angles;
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159c
// Size: 0x221
function triggerlisten(door) {
    self notify("disableTrigger");
    self endon("disableTrigger");
    level endon("game_ended");
    if (!door.islean && door.statecurr == 0) {
        door thread bashmonitor();
    }
    while (1) {
        player = self waittill("trigger");
        self makeunusable();
        var_b53a2d724c54182 = door.doortarget;
        if (isdefined(door.doortargetccw)) {
            var_ac46b1d56b50f400 = anglestoforward(door.angles);
            var_f85f26257033c0f2 = vectorcross((0, 0, 1), var_ac46b1d56b50f400);
            var_e227374d9d756c2d = anglestoforward((0, player.angles[1], 0));
            if (vectordot(var_e227374d9d756c2d, var_f85f26257033c0f2) < 0) {
                var_b53a2d724c54182 = door.doortargetccw;
            }
        }
        transitiontime = 0.666;
        if (door.statecurr == 0) {
            self notify("stop_bash_monitor");
            door.statecurr = 3;
            door rotateto(var_b53a2d724c54182.angles, transitiontime, 0, 0.333);
            hintstring = "MP/DOOR_USE_CLOSE";
        } else {
            door.statecurr = 1;
            door rotateto(door.baseangles, transitiontime, 0, 0.333);
            hintstring = "MP/DOOR_USE_OPEN";
        }
        door namespace_391de535501b0143::doorused(player, door.statecurr == 3);
        wait(0.1);
        door childthread door_state_update_sound();
        wait(transitiontime);
        if (door.statecurr == 1) {
            door.statecurr = 0;
            if (!door.islean) {
                door thread bashmonitor();
            }
        } else {
            door.statecurr = 2;
        }
        self makeusable();
        self sethintstring(hintstring);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c4
// Size: 0x1a5
function door_dynamic_parse_parameters(parameters) {
    door = self;
    door.button_sound = undefined;
    if (!isdefined(parameters)) {
        parameters = "";
    }
    params = strtok(parameters, ";");
    foreach (param in params) {
        toks = strtok(param, "=");
        if (toks.size != 2) {
            continue;
        }
        if (toks[1] == "undefined" || toks[1] == "default") {
            door.params[toks[0]] = undefined;
        } else {
            switch (toks[0]) {
            case #"hash_5c3e74aaa13bc78d":
                door.stop_sound = toks[1];
                break;
            case #"hash_9e73d538861d053c":
                door.interrupt_sound = toks[1];
                break;
            case #"hash_78225775c0698cc3":
                door.loop_sound = toks[1];
                break;
            case #"hash_1e106e4c46349825":
                door.open_interrupt = string_to_bool(toks[1]);
                break;
            case #"hash_4d982a4c5ddaeacf":
                door.start_sound = toks[1];
                break;
            case #"hash_edda8e2907d42dc0":
                door.material = toks[1];
                break;
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1970
// Size: 0xd7
function door_system_init(triggername) {
    buttons = getentarray(triggername, "targetname");
    foreach (button in buttons) {
        if (isdefined(button.script_parameters)) {
            button button_parse_parameters(button.script_parameters);
        }
        button door_setup();
    }
    foreach (button in buttons) {
        button thread door_think();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4e
// Size: 0x4c5
function door_setup() {
    button = self;
    /#
        assertex(isdefined(button.target), "door_setup() found switch without at least one door target.");
    #/
    button.doors = [];
    button.hasbeenused = 0;
    if (isdefined(button.script_index)) {
        button.doormovetime = max(0.1, float(button.script_index) / 1000);
    }
    var_fd5ef62c4bde358e = getentarray(button.target, "targetname");
    foreach (ent in var_fd5ef62c4bde358e) {
        if (issubstr(ent.classname, "trigger")) {
            if (!isdefined(button.trigblock)) {
                button.trigblock = [];
            }
            if (isdefined(ent.script_parameters)) {
                ent trigger_parse_parameters(ent.script_parameters);
            }
            if (isdefined(ent.script_linkto)) {
                var_651359b7e3625955 = getent(ent.script_linkto, "script_linkname");
                ent enablelinkto();
                ent linkto(var_651359b7e3625955);
            }
            button.trigblock[button.trigblock.size] = ent;
        } else if (ent.classname == "script_brushmodel" || ent.classname == "script_model") {
            if (isdefined(ent.script_noteworthy) && issubstr(ent.script_noteworthy, "light")) {
                if (issubstr(ent.script_noteworthy, "light_on")) {
                    if (!isdefined(button.lights_on)) {
                        button.lights_on = [];
                    }
                    ent hide();
                    button.lights_on[button.lights_on.size] = ent;
                } else if (issubstr(ent.script_noteworthy, "light_off")) {
                    if (!isdefined(button.lights_off)) {
                        button.lights_off = [];
                    }
                    ent hide();
                    button.lights_off[button.lights_off.size] = ent;
                } else {
                    /#
                        assertmsg("Invalid light ent with script_noteworthy of: " + ent.script_noteworthy);
                    #/
                }
            } else if (ent.spawnflags & 2) {
                if (!isdefined(button.ai_sight_brushes)) {
                    button.ai_sight_brushes = [];
                }
                ent notsolid();
                ent hide();
                button.ai_sight_brushes[button.ai_sight_brushes.size] = ent;
            } else {
                button.doors[button.doors.size] = ent;
            }
        } else if (ent.classname == "script_origin") {
            button.entsound = ent;
        }
    }
    if (!isdefined(button.entsound) && button.doors.size) {
        button.entsound = sortbydistance(button.doors, button.origin)[0];
    }
    foreach (door in button.doors) {
        /#
            assertex(isdefined(door.target), "door_setup() found door without a close position struct target.");
        #/
        door.posclosed = door.origin;
        door.posopen = getstruct(door.target, "targetname").origin;
        door.distmove = distance(door.posopen, door.posclosed);
        door.no_moving_unresolved_collisions = 0;
        if (!istrue(button.start_closed)) {
            door.origin = door.posopen;
        }
        if (isdefined(door.script_parameters)) {
            door door_parse_parameters(door.script_parameters);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1a
// Size: 0xec
function door_think() {
    button = self;
    var_f4db5b4567f88914 = ter_op(istrue(button.start_closed), 0, 2);
    button door_state_change(var_f4db5b4567f88914, 1);
    while (1) {
        button.statedone = undefined;
        button.stateinterrupted = undefined;
        button waittill_any_2("door_state_done", "door_state_interrupted");
        if (isdefined(button.statedone) && button.statedone) {
            var_16eb9f9803646fdf = button door_state_next(button.statecurr);
            button door_state_change(var_16eb9f9803646fdf, 0);
        } else if (isdefined(button.stateinterrupted) && button.stateinterrupted) {
            button door_state_change(4, 0);
        } else {
            /#
                assertmsg("state finished without being flagged as done or interrupted.");
            #/
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200d
// Size: 0x9c
function door_state_next(state) {
    button = self;
    var_16eb9f9803646fdf = undefined;
    if (state == 0) {
        var_16eb9f9803646fdf = 3;
    } else if (state == 2) {
        var_16eb9f9803646fdf = 1;
    } else if (state == 1) {
        var_16eb9f9803646fdf = 0;
    } else if (state == 3) {
        var_16eb9f9803646fdf = 2;
    } else if (state == 4) {
        /#
            assertex(isdefined(button.stateprev), "door_state_next() was passed STATE_DOOR_PAUSED without a previous state to go to.");
        #/
        var_16eb9f9803646fdf = button.stateprev;
    } else {
        /#
            assertmsg("Unhandled state value of: " + state);
        #/
    }
    return var_16eb9f9803646fdf;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b1
// Size: 0xb5c
function door_state_update(nosound) {
    button = self;
    button endon("door_state_interrupted");
    button.statedone = undefined;
    if (button.statecurr == 0 || button.statecurr == 2) {
        if (!nosound) {
            foreach (door in button.doors) {
                if (isdefined(door.stop_sound)) {
                    door stoploopsound();
                    door playsoundonmovingent(door.stop_sound);
                }
            }
        }
        if (isdefined(button.lights_on)) {
            foreach (light in button.lights_on) {
                light show();
            }
        }
        foreach (door in button.doors) {
            if (button.statecurr == 0) {
                if (isdefined(button.ai_sight_brushes)) {
                    foreach (var_e7fe58b8bf035286 in button.ai_sight_brushes) {
                        var_e7fe58b8bf035286 show();
                    }
                }
                if (door.spawnflags & 1) {
                }
            } else {
                if (isdefined(button.ai_sight_brushes)) {
                    foreach (var_e7fe58b8bf035286 in button.ai_sight_brushes) {
                        var_e7fe58b8bf035286 hide();
                    }
                }
                if (door.spawnflags & 1) {
                    if (isdefined(door.script_noteworthy) && door.script_noteworthy == "always_disconnect") {
                        goto LOC_00000363;
                    }
                LOC_00000363:
                }
            LOC_00000363:
            }
        LOC_00000363:
            if (isdefined(door.script_noteworthy)) {
                if (door.script_noteworthy == "clockwise_wheel" || door.script_noteworthy == "counterclockwise_wheel") {
                    door rotatevelocity((0, 0, 0), 0.1);
                }
            }
            if (door.no_moving_unresolved_collisions) {
                door.unresolved_collision_func = undefined;
            }
        }
        isusable = !istrue(button.one_time_use) || !button.hasbeenused;
        if (isusable) {
            hintstring = ter_op(button.statecurr == 0, "MP/DOOR_USE_OPEN", "MP/DOOR_USE_CLOSE");
            button makeusable();
            if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
                button sethintstring(hintstring);
            }
            button waittill("trigger");
            if (isdefined(button.button_sound)) {
                button playsound(button.button_sound);
            }
            button.hasbeenused = 1;
        } else {
            button waittill("forever");
        }
    } else if (button.statecurr == 1 || button.statecurr == 3) {
        if (isdefined(button.lights_off)) {
            foreach (light in button.lights_off) {
                light show();
            }
        }
        button makeunusable();
        if (button.statecurr == 1) {
            button thread door_state_on_interrupt();
            foreach (door in button.doors) {
                if (isdefined(door.script_noteworthy)) {
                    var_cad92bffbde8f755 = ter_op(isdefined(button.doormovetime), button.doormovetime, 3);
                    var_7f02cda7a3b89bb6 = ter_op(button.statecurr == 1, door.posclosed, door.posopen);
                    var_78e602ab4a4ed223 = distance(door.origin, var_7f02cda7a3b89bb6);
                    time = max(0.1, var_78e602ab4a4ed223 / door.distmove * var_cad92bffbde8f755);
                    var_5669bab8cf462e92 = max(time * 0.25, 0.05);
                    var_a14444a704bd237a = 360 * var_78e602ab4a4ed223 / 94.2;
                    if (door.script_noteworthy == "clockwise_wheel") {
                        door rotatevelocity((0, 0, -1 * var_a14444a704bd237a / time), time, var_5669bab8cf462e92, var_5669bab8cf462e92);
                    } else if (door.script_noteworthy == "counterclockwise_wheel") {
                        door rotatevelocity((0, 0, var_a14444a704bd237a / time), time, var_5669bab8cf462e92, var_5669bab8cf462e92);
                    }
                }
            }
        } else if (button.statecurr == 3) {
            if (isdefined(button.open_interrupt) && button.open_interrupt) {
                button thread door_state_on_interrupt();
            }
            foreach (door in button.doors) {
                if (isdefined(door.script_noteworthy)) {
                    var_cad92bffbde8f755 = ter_op(isdefined(button.doormovetime), button.doormovetime, 3);
                    var_7f02cda7a3b89bb6 = ter_op(button.statecurr == 1, door.posclosed, door.posopen);
                    var_78e602ab4a4ed223 = distance(door.origin, var_7f02cda7a3b89bb6);
                    time = max(0.1, var_78e602ab4a4ed223 / door.distmove * var_cad92bffbde8f755);
                    var_5669bab8cf462e92 = max(time * 0.25, 0.05);
                    var_a14444a704bd237a = 360 * var_78e602ab4a4ed223 / 94.2;
                    if (door.script_noteworthy == "clockwise_wheel") {
                        door rotatevelocity((0, 0, var_a14444a704bd237a / time), time, var_5669bab8cf462e92, var_5669bab8cf462e92);
                    } else if (door.script_noteworthy == "counterclockwise_wheel") {
                        door rotatevelocity((0, 0, -1 * var_a14444a704bd237a / time), time, var_5669bab8cf462e92, var_5669bab8cf462e92);
                    }
                }
            }
        }
        wait(0.1);
        button childthread door_state_update_sound();
        var_cad92bffbde8f755 = ter_op(isdefined(button.doormovetime), button.doormovetime, 3);
        var_416dbda00eb39926 = undefined;
        foreach (door in button.doors) {
            var_7f02cda7a3b89bb6 = ter_op(button.statecurr == 1, door.posclosed, door.posopen);
            if (door.origin != var_7f02cda7a3b89bb6) {
                time = max(0.1, distance(door.origin, var_7f02cda7a3b89bb6) / door.distmove * var_cad92bffbde8f755);
                var_5669bab8cf462e92 = max(time * 0.25, 0.05);
                door moveto(var_7f02cda7a3b89bb6, time, var_5669bab8cf462e92, var_5669bab8cf462e92);
                door namespace_d7b023c7eb3949d0::notify_moving_platform_invalid();
                if (door.no_moving_unresolved_collisions) {
                    door.unresolved_collision_func = &namespace_d7b023c7eb3949d0::unresolved_collision_void;
                }
                if (!isdefined(var_416dbda00eb39926) || time > var_416dbda00eb39926) {
                    var_416dbda00eb39926 = time;
                }
            }
        }
        if (isdefined(var_416dbda00eb39926)) {
            wait(var_416dbda00eb39926);
        }
    } else if (button.statecurr == 4) {
        foreach (door in button.doors) {
            door moveto(door.origin, 0.05, 0, 0);
            door namespace_d7b023c7eb3949d0::notify_moving_platform_invalid();
            if (door.no_moving_unresolved_collisions) {
                door.unresolved_collision_func = undefined;
            }
            if (isdefined(door.script_noteworthy)) {
                if (door.script_noteworthy == "clockwise_wheel" || door.script_noteworthy == "counterclockwise_wheel") {
                    door rotatevelocity((0, 0, 0), 0.05);
                }
            }
        }
        /#
            assertex(isdefined(button.stateprev) && (button.stateprev == 1 || button.stateprev == 3), "door_state_init() called with pause state without a valid previous state.");
        #/
        if (isdefined(button.lights_off)) {
            foreach (light in button.lights_off) {
                light show();
            }
        }
        button.entsound stoploopsound();
        foreach (door in button.doors) {
            if (isdefined(door.interrupt_sound)) {
                door playsound(door.interrupt_sound);
            }
        }
        wait(1);
    } else {
        /#
            assertmsg("Unhandled state value of: " + button.statecurr);
        #/
    }
    button.statedone = 1;
    foreach (door in button.doors) {
        door.statedone = 1;
    }
    button notify("door_state_done");
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c14
// Size: 0x273
function door_state_update_sound() {
    button = self;
    var_b11324d10bc5b631 = 1;
    var_d1eab7ec60299bd1 = 1;
    var_40cdbacda5cca105 = 0;
    if (button.statecurr == 3 || button.statecurr == 1) {
        foreach (door in button.doors) {
            if (isdefined(door.start_sound)) {
                door playsoundonmovingent(door.start_sound);
                var_40cdbacda5cca105 = lookupsoundlength(door.start_sound) / 1000;
                var_b11324d10bc5b631 = 0;
            }
        }
        if (var_b11324d10bc5b631) {
            if (!isdefined(button.entsound)) {
                button.entsound = button;
            }
            if (button.statecurr == 3) {
                if (soundexists("scrpt_door_wood_double_open")) {
                    var_40cdbacda5cca105 = lookupsoundlength("scrpt_door_wood_double_open") / 1000;
                    playsoundatpos(button.entsound.origin, "scrpt_door_wood_double_open");
                }
            } else if (button.statecurr == 1) {
                if (soundexists("scrpt_door_wood_double_close")) {
                    var_40cdbacda5cca105 = lookupsoundlength("scrpt_door_wood_double_close") / 1000;
                    playsoundatpos(button.entsound.origin, "scrpt_door_wood_double_close");
                }
            }
        }
    }
    wait(var_40cdbacda5cca105 * 0.3);
    if (button.statecurr == 3 || button.statecurr == 1) {
        foreach (door in button.doors) {
            if (isdefined(door.loop_sound)) {
                if (door.loop_sound != "none") {
                    door playloopsound(door.loop_sound);
                }
                var_d1eab7ec60299bd1 = 0;
            }
        }
        if (var_d1eab7ec60299bd1) {
            if (soundexists("")) {
                button.entsound playloopsound("");
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8e
// Size: 0x6f
function door_state_change(state, nosound) {
    button = self;
    if (isdefined(button.statecurr)) {
        door_state_exit(button.statecurr);
        button.stateprev = button.statecurr;
    }
    button.statecurr = state;
    button thread door_state_update(nosound);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f04
// Size: 0x194
function door_state_exit(state) {
    button = self;
    if (state == 0 || state == 2) {
        if (isdefined(button.lights_on)) {
            foreach (light in button.lights_on) {
                light hide();
            }
        }
    } else if (state == 1 || state == 3) {
        if (isdefined(button.lights_off)) {
            foreach (light in button.lights_off) {
                light hide();
            }
        }
        button.entsound stoploopsound();
        foreach (door in button.doors) {
            if (isdefined(door.loop_sound)) {
                door stoploopsound();
            }
        }
    } else {
        if (state == 4) {
            goto LOC_00000192;
        }
        /#
            assertmsg("Unhandled state value of: " + state);
        LOC_00000192:
        #/
    LOC_00000192:
    }
LOC_00000192:
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309f
// Size: 0x145
function door_state_on_interrupt() {
    button = self;
    button endon("door_state_done");
    if (!isdefined(button.trigblock)) {
        return;
    }
    var_ff46604c829cbb2e = [];
    foreach (trigger in button.trigblock) {
        if (button.statecurr == 1) {
            if (isdefined(trigger.not_closing) && trigger.not_closing == 1) {
                continue;
            }
        } else if (button.statecurr == 3) {
            if (isdefined(trigger.not_opening) && trigger.not_opening == 1) {
                continue;
            }
        }
        var_ff46604c829cbb2e[var_ff46604c829cbb2e.size] = trigger;
    }
    if (var_ff46604c829cbb2e.size > 0) {
        interrupter = button waittill_any_triggered_return_triggerer(var_ff46604c829cbb2e);
        if (!isdefined(interrupter.fauxdead) || interrupter.fauxdead == 0) {
            button.stateinterrupted = 1;
            button notify("door_state_interrupted");
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31eb
// Size: 0x7a
function waittill_any_triggered_return_triggerer(triggers) {
    button = self;
    foreach (trigger in triggers) {
        button thread return_triggerer(trigger);
    }
    button waittill("interrupted");
    return button.interrupter;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326d
// Size: 0x107
function return_triggerer(trigger) {
    button = self;
    button endon("door_state_done");
    button endon("interrupted");
    while (1) {
        ent = trigger waittill("trigger");
        if (isdefined(trigger.prone_only) && trigger.prone_only == 1) {
            if (isplayer(ent)) {
                stance = ent getstance();
                if (stance != "prone") {
                    continue;
                } else {
                    var_5074d4cee390d757 = vectornormalize(anglestoforward(ent.angles));
                    var_40d98d9c533fd919 = vectornormalize(trigger.origin - ent.origin);
                    dot = vectordot(var_5074d4cee390d757, var_40d98d9c533fd919);
                    if (dot > 0) {
                        continue;
                    }
                }
            }
        }
        break;
    }
    button.interrupter = ent;
    button notify("interrupted");
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337b
// Size: 0x182
function button_parse_parameters(parameters) {
    button = self;
    button.button_sound = undefined;
    if (!isdefined(parameters)) {
        parameters = "";
    }
    params = strtok(parameters, ";");
    foreach (param in params) {
        toks = strtok(param, "=");
        if (toks.size != 2) {
            continue;
        }
        if (toks[1] == "undefined" || toks[1] == "default") {
            button.params[toks[0]] = undefined;
        } else {
            switch (toks[0]) {
            case #"hash_1e106e4c46349825":
                button.open_interrupt = string_to_bool(toks[1]);
                break;
            case #"hash_6b61f3acb03c8ba1":
                button.button_sound = toks[1];
                break;
            case #"hash_4f3615defbb56240":
                button.start_closed = string_to_bool(toks[1]);
                break;
            case #"hash_cf9b0fd30cea035":
                button.one_time_use = string_to_bool(toks[1]);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3504
// Size: 0x223
function door_parse_parameters(parameters) {
    door = self;
    door.start_sound = undefined;
    door.stop_sound = undefined;
    door.loop_sound = undefined;
    door.interrupt_sound = undefined;
    if (!isdefined(parameters)) {
        parameters = "";
    }
    params = strtok(parameters, ";");
    foreach (param in params) {
        toks = strtok(param, "=");
        if (toks.size != 2) {
            continue;
        }
        if (toks[1] == "undefined" || toks[1] == "default") {
            door.params[toks[0]] = undefined;
        } else {
            switch (toks[0]) {
            case #"hash_5c3e74aaa13bc78d":
                door.stop_sound = toks[1];
                break;
            case #"hash_9e73d538861d053c":
                door.interrupt_sound = toks[1];
                break;
            case #"hash_78225775c0698cc3":
                door.loop_sound = toks[1];
                break;
            case #"hash_1e106e4c46349825":
                door.open_interrupt = string_to_bool(toks[1]);
                break;
            case #"hash_4d982a4c5ddaeacf":
                door.start_sound = toks[1];
                break;
            case #"hash_82406ab59ce5c4df":
                door.unresolved_collision_nodes = getnodearray(toks[1], "targetname");
                break;
            case #"hash_16b31759aeac5f43":
                door.no_moving_unresolved_collisions = string_to_bool(toks[1]);
                break;
            case #"hash_edda8e2907d42dc0":
                door.material = toks[1];
                break;
            default:
                break;
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x372e
// Size: 0x158
function trigger_parse_parameters(parameters) {
    trigger = self;
    if (!isdefined(parameters)) {
        parameters = "";
    }
    params = strtok(parameters, ";");
    foreach (param in params) {
        toks = strtok(param, "=");
        if (toks.size != 2) {
            continue;
        }
        if (toks[1] == "undefined" || toks[1] == "default") {
            trigger.params[toks[0]] = undefined;
        } else {
            switch (toks[0]) {
            case #"hash_9d83eef6d488a45":
                trigger.not_opening = string_to_bool(toks[1]);
                break;
            case #"hash_5f7e7fdb9440ae8e":
                trigger.not_closing = string_to_bool(toks[1]);
                break;
            case #"hash_74a33663cf817e18":
                trigger.prone_only = string_to_bool(toks[1]);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388d
// Size: 0x12a
function bashmonitor() {
    if (self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self endon("stateChanged");
    self notify("bashMonitor");
    self endon("bashMonitor");
    thread monitordamage();
    while (1) {
        self.doorcenter = self.origin + anglestoforward(self.angles) * self.length * 0.5 + anglestoup(self.angles) * self.height * 0.5;
        players = getplayersinradius(self.origin, 250);
        if (players.size > 0) {
            foreach (player in players) {
                if (bashproxcheck(player) && shouldbashopen(player)) {
                    thread bashopen(player, player.origin);
                }
            }
            waitframe();
        } else {
            wait(0.1);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39be
// Size: 0x41
function bashproxcheck(player) {
    d = distancesquared(player.origin, self.doorcenter);
    range = 4900;
    return d < range;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a07
// Size: 0x1b7
function shouldbashopen(player) {
    if (!isreallyalive(player)) {
        return 0;
    }
    var_e227374d9d756c2d = anglestoforward(player.angles);
    if (within_fov(player.origin + var_e227374d9d756c2d * -45, player.angles, self.doorcenter, cos(43))) {
        var_7bf201849ae293cd = anglestoright(self.angles);
        var_d3310de4c428a779 = vectornormalize(self.doorcenter - player geteye());
        var_88516b40c2f83b3c = vectordot(var_e227374d9d756c2d, var_d3310de4c428a779);
        var_f77a6113861d6cfd = vectordot(var_e227374d9d756c2d, var_7bf201849ae293cd);
        var_1d0dfdfee6cacb97 = player getvelocity();
        var_9b69954f476c76fe = vectordot(vectornormalize(var_1d0dfdfee6cacb97), (0, 0, 1));
        if ((length(var_1d0dfdfee6cacb97) >= 200 || player namespace_a2f809133c566621::isjuggernaut() && length(var_1d0dfdfee6cacb97) >= 140) && abs(var_9b69954f476c76fe) < 0.75 && abs(var_f77a6113861d6cfd) > 0.75 && var_88516b40c2f83b3c > 0.75) {
            var_70be37a43c5b39d5 = self gettagorigin("tag_door_handle", 1);
            if (isdefined(var_70be37a43c5b39d5)) {
                trace = namespace_2a184fc4902783dc::ray_trace(player geteye(), var_70be37a43c5b39d5, player, level.doorcontentoverride, 0);
                if (isdefined(trace["entity"]) && trace["entity"] == self) {
                    return 1;
                }
            } else {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc6
// Size: 0x410
function bashopen(player, pos) {
    thread checktriggeralarm(player);
    thread changestate(5);
    if (istrue(self.bashed)) {
        return;
    }
    if (!isdefined(self.useprompt)) {
        self.bashed = 1;
    }
    origin = self.origin;
    angles = self.angles;
    right = anglestoright(angles);
    normal = vectornormalize(pos - self.origin);
    dot = vectordot(right, normal);
    var_4fbd3851a4b84b8 = dot > 0;
    var_62ed0570f5e80a07 = undefined;
    if (isdefined(player) && isplayer(player)) {
        if (!isai(player)) {
            thread bashpresentation(player);
        } else {
            self notify("ai_opened");
        }
    }
    if (isdefined(self.material)) {
        if (self.material == "metal") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_heavy_metal_single_bash");
        } else if (self.material == "wood") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_barn_bash");
        }
    } else {
        playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_double_bash");
    }
    if (var_4fbd3851a4b84b8) {
        var_62ed0570f5e80a07 = self.baseangles[1] + self.max_yaw_left;
    } else {
        var_62ed0570f5e80a07 = self.baseangles[1] - self.max_yaw_right;
    }
    if (var_62ed0570f5e80a07 > 360) {
        var_62ed0570f5e80a07 = var_62ed0570f5e80a07 - 360;
    } else if (var_62ed0570f5e80a07 < 0) {
        var_62ed0570f5e80a07 = var_62ed0570f5e80a07 + 360;
    }
    var_5e7a100369fafe1e = 0.35;
    var_11b200101076bc6c = 0.15;
    timefactor = math::normalize_value(0, 170, var_62ed0570f5e80a07);
    bashtime = math::factor_value(var_5e7a100369fafe1e, var_11b200101076bc6c, timefactor);
    var_73d0c62ee90ef3c3 = self.angles;
    var_bba965ddeffb21fe = var_73d0c62ee90ef3c3[1];
    if (var_bba965ddeffb21fe > 360) {
        var_bba965ddeffb21fe = var_bba965ddeffb21fe - 360;
    } else if (var_bba965ddeffb21fe < 0) {
        var_bba965ddeffb21fe = var_bba965ddeffb21fe + 360;
    }
    var_55a531282afd5f1d = angle_diff(var_bba965ddeffb21fe, self.baseangles[1]);
    var_5e0f89cf0c167e08 = angle_diff(var_62ed0570f5e80a07, self.baseangles[1]);
    var_c3f370dcf88fb5bb = anglestoforward(var_73d0c62ee90ef3c3);
    var_59ee6658d03630a6 = anglestoright(self.baseangles);
    var_397e59a9937b07db = vectordot(var_c3f370dcf88fb5bb, var_59ee6658d03630a6) < 0;
    if (var_4fbd3851a4b84b8) {
        if (!var_397e59a9937b07db) {
            var_5e0f89cf0c167e08 = var_5e0f89cf0c167e08 + var_55a531282afd5f1d;
        } else {
            var_5e0f89cf0c167e08 = var_5e0f89cf0c167e08 - var_55a531282afd5f1d;
        }
    } else {
        if (var_397e59a9937b07db) {
            var_5e0f89cf0c167e08 = var_5e0f89cf0c167e08 + var_55a531282afd5f1d;
        } else {
            var_5e0f89cf0c167e08 = var_5e0f89cf0c167e08 - var_55a531282afd5f1d;
        }
        var_5e0f89cf0c167e08 = var_5e0f89cf0c167e08 * -1;
    }
    var_41e917596d6bf09f = (0, var_5e0f89cf0c167e08, 0);
    self rotateby(var_41e917596d6bf09f, bashtime);
    wait(bashtime);
    self.lastpushtime = gettime();
    thread changestate(6);
    if (!isdefined(self.useprompt)) {
        self.statecurr = 2;
        if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            self.trigger sethintstring("MP/DOOR_USE_CLOSE");
        }
    }
    self.bashed = 0;
    var_b492b99eb62e16f2 = randomfloatrange(3, 5);
    var_6e09cabeb82b5356 = randomfloatrange(0.25, 2.5);
    if (var_4fbd3851a4b84b8) {
        var_6e09cabeb82b5356 = var_6e09cabeb82b5356 * -1;
    }
    self rotateyaw(var_6e09cabeb82b5356, var_b492b99eb62e16f2, 0.5, var_b492b99eb62e16f2 - 0.5);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fdd
// Size: 0x36
function bashpresentation(player) {
    player playrumbleonentity("grenade_rumble");
    player earthquakeforplayer(0.35, 0.5, player.origin, 200);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x401a
// Size: 0x23f
function monitordamage() {
    self endon("stateChanged");
    self notify("monitorDamage");
    self endon("monitorDamage");
    self setcandamage(1);
    damage = undefined;
    attacker = undefined;
    direction_vec = undefined;
    meansofdeath = undefined;
    modelname = undefined;
    tagname = undefined;
    partname = undefined;
    idflags = undefined;
    objweapon = undefined;
    origin = undefined;
    angles = undefined;
    normal = undefined;
    inflictor = undefined;
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isdefined(meansofdeath)) {
            if (meansofdeath == "MOD_MELEE") {
                if (istrue(self.issaloonstyle)) {
                    self.otherdoor thread bashopen(attacker, attacker.origin);
                }
                thread bashopen(attacker, attacker.origin);
            } else if (meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE") {
                var_c81a61ae7e6e7025 = isdefined(objweapon) && isdefined(objweapon.basename) && (objweapon.basename == "molotov_mp" || objweapon.basename == "thermite_mp" || objweapon.basename == "thermite_ap_mp" || objweapon.basename == "thermite_av_mp");
                if (damage > 10 && !var_c81a61ae7e6e7025) {
                    thread bashopen(inflictor, point);
                }
            } else if (isdefined(objweapon) && objweapon.basename == "pac_sentry_turret_mp" && (meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH")) {
                thread bashopen(inflictor, point);
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4260
// Size: 0x196
function openmonitor() {
    self endon("stateChanged");
    if (self.state == 7 || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    if (self.islean || 0 || -1) {
        if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            self.useprompt sethintstring("MP/DOOR_USE_OPEN");
        }
    } else if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        self.useprompt sethintstring("MP/DOOR_USE_OPEN_DOUBLE");
    }
    self.useprompt sethintdisplayrange(200);
    while (1) {
        player = self.useprompt waittill("trigger_progress");
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        buttontime = 0;
        while (buttontime < 0.1) {
            if (!player usebuttonpressed()) {
                break;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        if (self.state == 7) {
            var_70be37a43c5b39d5 = self gettagorigin("tag_door_handle", 1);
            if (isdefined(var_70be37a43c5b39d5)) {
                playsoundatpos(var_70be37a43c5b39d5, "door_locked");
            } else {
                playsoundatpos(self.origin + (0, 0, 42), "door_locked");
            }
            continue;
        }
        if (self.islean) {
            thread cheapopen(player);
            return;
        }
        if (-1 && player playerads() > 0.9) {
            thread ajar(player);
            return;
        }
        thread cheapopen(player);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43fd
// Size: 0x2b3
function cheapopen(player) {
    thread checktriggeralarm(player);
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright(angles);
    normal = vectornormalize(player.origin - origin);
    dot = vectordot(right, normal);
    var_4fbd3851a4b84b8 = dot > 0;
    if (isdefined(self.material)) {
        if (self.material == "metal") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_heavy_metal_single_open");
        } else if (self.material == "wood") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_barn_open");
        }
    } else {
        playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_double_open");
    }
    thread changestate(3);
    targetyaw = ter_op(var_4fbd3851a4b84b8, self.max_yaw_left, self.max_yaw_right * -1);
    openangles = (self.baseangles[0], self.baseangles[1] + targetyaw, self.baseangles[2]);
    self rotateto(openangles, 0.666, 0, 0.333);
    if (isdefined(self.otherdoor) && istrue(self.issaloonstyle)) {
        targetyaw = ter_op(!var_4fbd3851a4b84b8, self.otherdoor.max_yaw_left, self.otherdoor.max_yaw_right * -1);
        openangles = (self.otherdoor.baseangles[0], self.otherdoor.baseangles[1] + targetyaw, self.otherdoor.baseangles[2]);
        self.otherdoor rotateto(openangles, 0.666, 0, 0.333);
    }
    wait(0.666);
    self.lastpushtime = gettime();
    thread changestate(2);
    if (isdefined(self.otherdoor) && istrue(self.issaloonstyle)) {
        self.otherdoor thread changestate(2);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b7
// Size: 0x1f2
function ajar(player) {
    thread checktriggeralarm(player);
    thread changestate(6);
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright(angles);
    normal = vectornormalize(player.origin - origin);
    dot = vectordot(right, normal);
    var_4fbd3851a4b84b8 = dot > 0;
    time = 0.5;
    var_96cc1618573ad3cc = ter_op(var_4fbd3851a4b84b8, 15, -15);
    player playrumbleonentity("damage_heavy");
    if (isdefined(self.material)) {
        if (self.material == "metal") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_heavy_metal_single_start_peek");
        } else if (self.material == "wood") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_barn_start_peek");
        }
    } else {
        playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_double_start_peek");
    }
    self rotateyaw(var_96cc1618573ad3cc, time, time * 0.25, time * 0.75);
    if (isdefined(self.otherdoor) && istrue(self.issaloonstyle)) {
        self.otherdoor thread changestate(6);
        var_96cc1618573ad3cc = ter_op(!var_4fbd3851a4b84b8, 15, -15);
        self.otherdoor rotateyaw(var_96cc1618573ad3cc, time, time * 0.25, time * 0.75);
    }
    self.lastpushtime = gettime();
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b0
// Size: 0xee
function pushmonitor() {
    if (self.islean) {
        return;
    }
    self endon("stateChanged");
    self notify("pushMonitor");
    self endon("pushMonitor");
    wait(0.5);
    while (1) {
        players = getplayersinradius(self.origin, 250);
        if (players.size > 0) {
            foreach (player in players) {
                if (pushproxcheck(player)) {
                    push(player);
                    self.lastpushtime = gettime();
                    door_destroynavobstacle();
                }
            }
        }
        if (isdefined(self.lastpushtime) && gettime() > self.lastpushtime + 2000) {
            door_createnavobstacle();
        }
        waitframe();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a5
// Size: 0xdd
function pushproxcheck(player) {
    self.doorcenter = self.origin + anglestoforward(self.angles) * self.length * 0.5 + anglestoup(self.angles) * self.height * 0.5;
    if (player.origin[2] > self.origin[2] + self.height || player.origin[2] + 70 < self.origin[2]) {
        return 0;
    }
    d = distance2dsquared(player.origin, self.doorcenter);
    range = 900;
    return d < range;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8a
// Size: 0x282
function push(player) {
    max_dist = 26;
    min_dist = 0;
    var_8928780331ce6436 = 25;
    endpoint = self.origin + anglestoforward(self.angles) * 28;
    dist = distance2d(player.origin, endpoint);
    percent = math::normalize_value(min_dist, max_dist, dist);
    amount = var_8928780331ce6436 * (1 - percent);
    if (amount == 0) {
        return;
    }
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright(angles);
    normal = vectornormalize(player.origin - origin);
    dot = vectordot(right, normal);
    var_4fbd3851a4b84b8 = dot > 0;
    currentyaw = self.angles[1];
    isright = ter_op(var_4fbd3851a4b84b8 == 1, 1, -1);
    target_yaw = currentyaw + amount * isright;
    angle_diff = angle_diff(target_yaw, self.baseangles[1]);
    if (var_4fbd3851a4b84b8) {
        if (angle_diff > self.max_yaw_left) {
            self.debug_activity = "Pushed to max left yaw of " + self.max_yaw_left;
            self.angles = (self.angles[0], self.baseangles[1] + self.max_yaw_left, self.angles[2]);
            return;
        }
    } else if (angle_diff > self.max_yaw_right) {
        self.debug_activity = "Pushed to max right yaw of " + self.max_yaw_right;
        self.angles = (self.angles[0], self.baseangles[1] - self.max_yaw_right, self.angles[2]);
        return;
    }
    /#
        self.debug_activity = ";" + target_yaw;
    #/
    self.angles = (self.angles[0], target_yaw, self.angles[2]);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d13
// Size: 0xa9
function autoclosemonitor() {
    if (self.islean) {
        return;
    }
    self endon("stateChanged");
    self notify("autoCloseMonitor");
    self endon("autoCloseMonitor");
    wait(0.5);
    while (1) {
        if (angle_diff(self.angles[1], self.baseangles[1]) < 40) {
            if (isdefined(self.lastpushtime) && gettime() > self.lastpushtime + 3000) {
                players = getplayersinradius(self.origin, 250);
                if (players.size == 0) {
                    thread closedoor(1);
                }
            }
        }
        waitframe();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc3
// Size: 0x2aa
function changestate(newstate) {
    if (!isdefined(self.useprompt)) {
        return;
    }
    switch (self.state) {
    case 0:
        break;
    case 1:
        break;
    case 2:
        break;
    case 3:
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        break;
    case 7:
        if (isdefined(self.useprompt)) {
            self.useprompt sethinticon("icon_door_unlocked");
        }
        break;
    case 8:
        break;
    }
    self.state = newstate;
    self notify("stateChanged");
    switch (newstate) {
    case 0:
        door_destroynavobstacle();
        door_disableaudioportal();
        thread openmonitor();
        thread bashmonitor();
        thread lockmonitor();
        thread alarmmonitor();
        thread ajarmonitor();
        break;
    case 1:
        door_destroynavobstacle();
        break;
    case 2:
        door_createnavobstacle();
        door_enableaudioportal();
        thread closemonitor();
        thread bashmonitor();
        break;
    case 3:
        door_destroynavobstacle();
        door_enableaudioportal();
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        door_enableaudioportal();
        thread closemonitor();
        thread pushmonitor();
        thread bashmonitor();
        thread autoclosemonitor();
        break;
    case 7:
        if (isdefined(self.useprompt)) {
            self.useprompt sethintdisplayrange(300);
            self.useprompt sethinticon("icon_door_locked");
            self.useprompt sethintstring("MP/DOOR_USE_LOCKED");
        }
        thread openmonitor();
        thread breachmonitor();
        break;
    case 8:
        thread openmonitor();
        thread bashmonitor();
        thread removealarmmonitor();
        thread disownalarmmonitor();
        break;
    }
    thread updatelockpromptvisibility();
    thread updatealarmpromptvisibility();
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread updatealarmpromptvisibility();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5074
// Size: 0x9b
function updatestate() {
    switch (self.state) {
    case 0:
        break;
    case 1:
        break;
    case 2:
        break;
    case 3:
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        break;
    case 7:
        break;
    case 8:
        break;
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5116
// Size: 0xfb
function closemonitor() {
    self endon("stateChanged");
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self.useprompt makeusable();
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        self.useprompt sethintstring("MP/DOOR_USE_CLOSE");
    }
    self.useprompt sethintdisplayrange(200);
    self.useprompt sethintdisplayfov(120);
    self.useprompt setuserange(125);
    self.useprompt setusefov(120);
    while (1) {
        player = self.useprompt waittill("trigger_progress");
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        buttontime = 0;
        while (buttontime < 0.1) {
            if (!player usebuttonpressed()) {
                break;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        thread closedoor();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5218
// Size: 0x1e9
function closedoor(var_c81f097ebbbed511) {
    if (isdefined(self.material)) {
        if (self.material == "metal") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_heavy_metal_single_close");
        } else if (self.material == "wood") {
            playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_barn_close");
        }
    } else {
        playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_double_close");
    }
    thread changestate(1);
    var_b9f754ef90aff45b = 0.666;
    if (istrue(var_c81f097ebbbed511)) {
        var_b9f754ef90aff45b = var_b9f754ef90aff45b * 3;
    }
    self rotateto(self.baseangles, var_b9f754ef90aff45b, 0, 0.333);
    if (isdefined(self.otherdoor) && istrue(self.issaloonstyle)) {
        self.otherdoor rotateto(self.otherdoor.baseangles, var_b9f754ef90aff45b, 0, 0.333);
    }
    wait(var_b9f754ef90aff45b);
    waitframe();
    if (angle_diff(self.angles[1], self.baseangles[1]) < 1) {
        thread changestate(0);
    } else {
        thread changestate(6);
    }
    if (isdefined(self.otherdoor) && istrue(self.issaloonstyle)) {
        if (angle_diff(self.otherdoor.angles[1], self.otherdoor.baseangles[1]) < 1) {
            self.otherdoor thread changestate(0);
        } else {
            self.otherdoor thread changestate(6);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5408
// Size: 0x27
function angle_diff(value1, value2) {
    return 180 - abs(abs(value1 - value2) - 180);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5437
// Size: 0x25f
function amortizeyawtraces() {
    level.doorphase = 0;
    level.doortracequeue = 0;
    var_cdf4a830ecf21001 = [];
    var_438903624c7ec6c9 = [];
    level.doortracemetrics = spawnstruct();
    level.doortracemetrics.doorcount = level.doors.size;
    level.doortracemetrics.totaltracecount = 0;
    level.doortracemetrics.tracecountbyphase = [];
    level.doortracemetrics.tracetimebyphase = [];
    level.doortracemetrics.totaltime = 0;
    level.doortracemetrics.totalwaitframes = 0;
    level.waitcycles = 0;
    level.doortraces = 0;
    waitframe();
    level.doortracemetrics.totaltime = gettime();
    var_438903624c7ec6c9[0] = level.doortracemetrics.totaltime;
    while (1) {
        if (level.doortracequeue == 0) {
            currenttime = gettime();
            var_438903624c7ec6c9[level.doorphase] = currenttime - var_438903624c7ec6c9[level.doorphase];
            var_cdf4a830ecf21001[level.doorphase] = level.doortraces;
            level.doortracemetrics.totaltracecount = level.doortracemetrics.totaltracecount + level.doortraces;
            level.doortraces = 0;
            level.doortracemetrics.totalwaitframes = level.doortracemetrics.totalwaitframes + level.waitcycles;
            level.waitcycles = 0;
            level.doorphase++;
            level notify("advance_door_trace");
            if (level.doorphase < 3) {
                var_438903624c7ec6c9[level.doorphase] = currenttime;
            } else {
                break;
            }
        }
        waitframe();
    }
    level.doortracemetrics.totaltime = gettime() - level.doortracemetrics.totaltime;
    level.doortracemetrics.tracecountbyphase = var_cdf4a830ecf21001;
    level.doortracemetrics.tracetimebyphase = var_438903624c7ec6c9;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569d
// Size: 0x16
function get_max_yaws() {
    thread get_max_yaw(1);
    thread get_max_yaw(0);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56ba
// Size: 0xfa
function get_max_yaw(left) {
    if (left) {
        if (isdefined(self.script_max_left_angle)) {
            self.max_yaw_left = self.script_max_left_angle;
            return;
        }
    } else if (isdefined(self.script_max_right_angle)) {
        self.max_yaw_right = self.script_max_right_angle;
        return;
    }
    var_fd30805dc79751c = 90;
    var_7654c3f9d638aaea = 10;
    var_57e78339c006d1ef = 0;
    while (level.doorphase < 3) {
        var_57e78339c006d1ef = get_max_yaw_internal(var_fd30805dc79751c, var_7654c3f9d638aaea, left);
        if (left) {
            self.max_yaw_left = var_57e78339c006d1ef;
        } else {
            self.max_yaw_right = var_57e78339c006d1ef;
        }
        if (var_57e78339c006d1ef == 100) {
            break;
        }
        var_7654c3f9d638aaea = var_7654c3f9d638aaea * 0.5;
        var_fd30805dc79751c = var_57e78339c006d1ef + var_7654c3f9d638aaea;
        level waittill("advance_door_trace");
    }
    var_57e78339c006d1ef = max(var_57e78339c006d1ef, 90);
    if (left) {
        self.max_yaw_left = var_57e78339c006d1ef;
    } else {
        self.max_yaw_right = var_57e78339c006d1ef;
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57bb
// Size: 0x1ab
function get_max_yaw_internal(var_86e2597cacc185b5, increment, left) {
    if (!isdefined(self.traces)) {
        self.traces = 0;
    }
    if (!isdefined(level.doortraces)) {
        level.doortraces = 0;
    }
    var_fc50f7f1ec656b5c = 0;
    finished = 0;
    level.doortracequeue++;
    waitframe();
    while (!finished) {
        if (var_86e2597cacc185b5 > 100) {
            level.currentdoor = undefined;
            level.doortracequeue--;
            return 100;
        }
        while (isdefined(level.currentdoor) && self != level.currentdoor) {
            waitframe();
        }
        if (!isdefined(level.currentdoor)) {
            level.currentdoor = self;
        }
        var_e79f8e052557004 = yaw_collision_check(var_86e2597cacc185b5, increment, left);
        if (var_e79f8e052557004) {
            if (var_fc50f7f1ec656b5c) {
                finish = 1;
            }
            var_86e2597cacc185b5 = var_86e2597cacc185b5 + increment;
        } else {
            if (!var_fc50f7f1ec656b5c) {
                var_fc50f7f1ec656b5c = 1;
            }
            var_86e2597cacc185b5 = var_86e2597cacc185b5 - increment;
            finished = 1;
        }
        self.traces++;
        level.doortraces++;
        currenttime = gettime();
        if (!isdefined(level.doortraceframetime) || level.doortraceframetime != currenttime) {
            level.doortraceframetime = currenttime;
            level.doortracesthisframe = 0;
        }
        level.doortracesthisframe++;
        if (level.doortracesthisframe == 3) {
            level.doortracesthisframe = 0;
            level.waitcycles++;
            waitframe();
        }
    }
    level.currentdoor = undefined;
    level.doortracequeue--;
    return var_86e2597cacc185b5;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596e
// Size: 0x1f7
function yaw_collision_check(yaw, increment, left) {
    if (!left) {
        yaw = yaw * -1;
    }
    trace_angles = self.baseangles + (0, yaw, 0);
    var_29afc51db09e2830 = self.origin + (0, 0, 8);
    var_13b5e69a1d26edde = self.height - 8 * 2;
    var_f85f26257033c0f2 = anglestoforward(trace_angles);
    var_7bf201849ae293cd = anglestoright(trace_angles);
    if (left) {
        var_7bf201849ae293cd = var_7bf201849ae293cd * -1;
    }
    start = var_29afc51db09e2830 + var_f85f26257033c0f2 * self.length * 0.2;
    end = var_29afc51db09e2830 + var_f85f26257033c0f2 * (self.length - 2);
    trace = namespace_2a184fc4902783dc::capsule_trace(start, end, 2, var_13b5e69a1d26edde, trace_angles, ter_op(isdefined(self.clip), [0:self, 1:self.clip], [0:self]), level.doorcontentoverride, 0);
    if (getdvarint(@"hash_6985e82f27803483")) {
        color = (1, 1, 1);
        if (trace["fraction"] == 1) {
            color = (0, 1, 0);
        } else {
            color = (1, 0, 0);
        }
        thread drawline(start, end, 600, color);
        thread drawline(start + (0, 0, var_13b5e69a1d26edde), end + (0, 0, var_13b5e69a1d26edde), 600, color);
        thread drawline(start, start + (0, 0, var_13b5e69a1d26edde), 600, color);
        thread drawline(end, end + (0, 0, var_13b5e69a1d26edde), 600, color);
    }
    return trace["fraction"] == 1;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6d
// Size: 0x11d
function perk_doorsensethink() {
    level endon("game_ended");
    while (1) {
        foreach (door in level.doors) {
            if (door.state != 0) {
                continue;
            }
            if (isdefined(level.playerswithdoorsense) && level.playerswithdoorsense <= 0) {
                continue;
            }
            var_b0aeb7fba823276f = getplayersinradius(door.origin, 128);
            if (var_b0aeb7fba823276f.size == 0) {
                continue;
            }
            foreach (player in var_b0aeb7fba823276f) {
                if (player _hasperk("specialty_door_sense")) {
                    perk_doorsense_outlinedoor(player, var_b0aeb7fba823276f, door);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c91
// Size: 0x117
function perk_doorsense_outlinedoor(var_dadbe427bdd6c4d, var_b0aeb7fba823276f, door) {
    enemies = [];
    foreach (player in var_b0aeb7fba823276f) {
        if (player.team != var_dadbe427bdd6c4d.team) {
            enemies[enemies.size] = player;
        }
    }
    if (enemies.size == 0) {
        return;
    }
    foreach (enemy in enemies) {
        if (perk_doorsense_othersideofdoorcheck(var_dadbe427bdd6c4d, enemy, door)) {
            outlineid = namespace_cbd3754a0c69cc63::outlineenableforplayer(door, var_dadbe427bdd6c4d, "outline_nodepth_orange", "equipment");
            thread perk_doorsense_trackoutlinedisable(outlineid, door);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5daf
// Size: 0x115
function perk_doorsense_outlineenemies(var_dadbe427bdd6c4d, var_b0aeb7fba823276f, door) {
    enemies = [];
    foreach (player in var_b0aeb7fba823276f) {
        if (player.team != var_dadbe427bdd6c4d.team) {
            enemies[enemies.size] = player;
        }
    }
    if (enemies.size == 0) {
        return;
    }
    foreach (enemy in enemies) {
        if (perk_doorsense_othersideofdoorcheck(var_dadbe427bdd6c4d, enemy, door)) {
            outlineid = namespace_cbd3754a0c69cc63::outlineenableforplayer(enemy, var_dadbe427bdd6c4d, "outline_nodepth_orange", "equipment");
            thread perk_doorsense_trackoutlinedisable(outlineid, enemy);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ecb
// Size: 0xcd
function perk_doorsense_othersideofdoorcheck(player1, player2, door) {
    var_6555b4d96764d0bb = vectornormalize(anglestoright(door.angles));
    var_8711ec2c9d549d05 = vectornormalize(player1.origin - door.origin);
    var_a663fe911064ac1c = vectornormalize(player2.origin - door.origin);
    var_7f2dacbcad6f9180 = vectordot(var_6555b4d96764d0bb, var_8711ec2c9d549d05);
    var_7f2dafbcad6f9819 = vectordot(var_6555b4d96764d0bb, var_a663fe911064ac1c);
    if (var_7f2dacbcad6f9180 > 0 && var_7f2dafbcad6f9819 < 0 || var_7f2dacbcad6f9180 < 0 && var_7f2dafbcad6f9819 > 0) {
        return 1;
    }
    return 0;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa0
// Size: 0x23
function perk_doorsense_trackoutlinedisable(outlineid, player) {
    wait(0.2);
    namespace_cbd3754a0c69cc63::outlinedisable(outlineid, player);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fca
// Size: 0x57
function onplayerspawned() {
    var_66ee62bfcef7c9e5 = _hasperk("specialty_door_breach") || getdvarint(@"hash_b75e6afff090e790", 0) == 1;
    namespace_66efdc90612cfc0a::updatealldoorslockvisibilityforplayer(self, var_66ee62bfcef7c9e5);
    var_1e635a556969499b = _hasperk("specialty_door_alarm");
    namespace_66efdc90612cfc0a::updatealldoorsalarmvisibilityforplayer(self, var_1e635a556969499b);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6028
// Size: 0xa1
function updatelockpromptvisibility() {
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    while (!isdefined(level.players)) {
        waitframe();
    }
    foreach (player in level.players) {
        var_66ee62bfcef7c9e5 = player _hasperk("specialty_door_breach") || getdvarint(@"hash_b75e6afff090e790", 0) == 1;
        updatelockpromptvisibilityforplayer(player, var_66ee62bfcef7c9e5);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d0
// Size: 0x6b
function updatealldoorslockvisibilityforplayer(player, var_66ee62bfcef7c9e5) {
    foreach (door in level.doors) {
        door updatelockpromptvisibilityforplayer(player, var_66ee62bfcef7c9e5);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6142
// Size: 0x108
function updatelockpromptvisibilityforplayer(player, visibility) {
    if (!isdefined(self.lockprompt)) {
        return;
    }
    var_37914a1eabcaebe2 = self.state == 0 || self.state == 7;
    if (var_37914a1eabcaebe2 && isdefined(self.otherdoor)) {
        var_37914a1eabcaebe2 = self.otherdoor.state == 0 || self.otherdoor.state == 7;
    }
    if (!istrue(self.breaching) && var_37914a1eabcaebe2) {
        if (visibility) {
            self.lockprompt showtoplayer(player);
            self.lockprompt enableplayeruse(player);
        } else {
            self.lockprompt hidefromplayer(player);
            self.lockprompt disableplayeruse(player);
        }
    } else {
        self.lockprompt hidefromplayer(player);
        self.lockprompt disableplayeruse(player);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6251
// Size: 0xd9
function lockmonitor() {
    if (!isdefined(self.lockprompt) || self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self endon("stateChanged");
    if (isdefined(self.otherdoor)) {
        while (self.otherdoor.state != 0) {
            waitframe();
        }
    }
    self.lockprompt sethintstring("MP/DOOR_USE_LOCK");
    self.lockprompt setuseholdduration("duration_medium");
    updatelockpromptvisibility();
    while (1) {
        player = self.lockprompt waittill("trigger");
        if (!isreallyalive(player)) {
            continue;
        }
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        thread lockdoor();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6331
// Size: 0x2d
function lockdoor() {
    thread changestate(7);
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread changestate(7);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6365
// Size: 0x8b
function updatealarmpromptvisibility() {
    if (namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    while (!isdefined(level.players)) {
        waitframe();
    }
    foreach (player in level.players) {
        var_1e635a556969499b = player _hasperk("specialty_door_alarm");
        updatealarmpromptsvisibilityforplayer(player, var_1e635a556969499b);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f7
// Size: 0x6b
function updatealldoorsalarmvisibilityforplayer(player, var_1e635a556969499b) {
    foreach (door in level.doors) {
        door updatealarmpromptsvisibilityforplayer(player, var_1e635a556969499b);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6469
// Size: 0x12b
function updatealarmpromptsvisibilityforplayer(player, var_647ad2e497e12892) {
    if (!isdefined(self.alarmprompts)) {
        return;
    }
    foreach (var_ae098e74b36ddbc4 in self.alarmprompts) {
        var_4e57934d9471dd9e = var_647ad2e497e12892 && self.state == 0 || self.state == 8 && isdefined(self.dooralarmprompt) && var_ae098e74b36ddbc4 == self.dooralarmprompt;
        if (var_4e57934d9471dd9e && isdefined(self.otherdoor)) {
            var_4e57934d9471dd9e = var_647ad2e497e12892 && self.otherdoor.state == 0 || self.state == 8 && var_ae098e74b36ddbc4 == self.dooralarmprompt;
        }
        if (var_4e57934d9471dd9e) {
            var_ae098e74b36ddbc4 showtoplayer(player);
            var_ae098e74b36ddbc4 enableplayeruse(player);
        } else {
            var_ae098e74b36ddbc4 hidefromplayer(player);
            var_ae098e74b36ddbc4 disableplayeruse(player);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x659b
// Size: 0x103
function alarmmonitor() {
    if (self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self endon("stateChanged");
    if (isdefined(self.otherdoor)) {
        while (self.otherdoor.state != 0) {
            waitframe();
        }
    }
    foreach (var_ae098e74b36ddbc4 in self.alarmprompts) {
        var_ae098e74b36ddbc4 sethintstring("MP/DOOR_USE_ALARM");
        var_ae098e74b36ddbc4 setuseholdduration("duration_medium");
    }
    updatealarmpromptvisibility();
    foreach (var_ae098e74b36ddbc4 in self.alarmprompts) {
        thread _alarmmonitorinternal(var_ae098e74b36ddbc4);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a5
// Size: 0x6f
function _alarmmonitorinternal(var_ae098e74b36ddbc4) {
    self endon("stateChanged");
    while (1) {
        player = var_ae098e74b36ddbc4 waittill("trigger");
        if (self.state != 0) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        thread alarmdoor(player, var_ae098e74b36ddbc4);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x671b
// Size: 0x18b
function alarmdoor(var_c1e072a8515cd2c1, var_ae098e74b36ddbc4) {
    doorpos = self gettagorigin("tag_door_handle");
    playsoundatpos(var_ae098e74b36ddbc4.origin, "mp_door_alarm_on");
    self.dooralarment = spawn("script_model", var_ae098e74b36ddbc4.origin);
    self.dooralarment setmodel("shardball_wm");
    self.dooralarment.angles = self.angles;
    self.dooralarment linkto(self);
    self.dooralarment setentityowner(var_c1e072a8515cd2c1);
    self.dooralarment setotherent(var_c1e072a8515cd2c1);
    self.dooralarment setscriptablepartstate("effects", "planted", 0);
    self.dooralarmowner = var_c1e072a8515cd2c1;
    self.dooralarmprompt = var_ae098e74b36ddbc4;
    self.dooralarmowner.alarmeddoors = array_add(self.dooralarmowner.alarmeddoors, self);
    while (self.dooralarmowner.alarmeddoors.size > 3) {
        var_3ac146be30c82b22 = self.dooralarmowner.alarmeddoors[0];
        var_3ac146be30c82b22 removealarmdoor(0);
    }
    thread changestate(8);
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread changestate(8);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68ad
// Size: 0x132
function removealarmmonitor() {
    if (!isdefined(self.dooralarmprompt) || self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self endon("stateChanged");
    if (isdefined(self.otherdoor)) {
        while (self.otherdoor.state != 8) {
            waitframe();
        }
    }
    self.dooralarmprompt sethintstring("MP/DOOR_USE_REMOVE_ALARM");
    self.dooralarmprompt setuseholdduration("duration_medium");
    self.dooralarmprompt.owner = self.dooralarmowner;
    self.dooralarmprompt.team = self.dooralarmowner.team;
    updatealarmpromptvisibility();
    while (1) {
        player = self.dooralarmprompt waittill("trigger");
        if (self.state != 8) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        thread removealarmdoor(1);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e6
// Size: 0x9a
function disownalarmmonitor() {
    if (!isdefined(self.dooralarmprompt) || self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    self endon("stateChanged");
    if (isdefined(self.otherdoor)) {
        while (self.otherdoor.state != 8) {
            waitframe();
        }
    }
    while (1) {
        self.dooralarmowner waittill_any_3("joined_team", "joined_spectators", "disconnect");
        if (self.state != 8) {
            return;
        }
        thread removealarmdoor(0);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a87
// Size: 0xb4
function removealarmdoor(playsound) {
    if (playsound) {
        playsoundatpos(self.dooralarment.origin, "mp_door_alarm_off");
    }
    if (isdefined(self.dooralarmowner)) {
        self.dooralarmowner.alarmeddoors = array_remove(self.dooralarmowner.alarmeddoors, self);
    }
    self.dooralarment delete();
    self.dooralarmowner = undefined;
    self.dooralarmprompt = undefined;
    thread changestate(0);
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread changestate(0);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b42
// Size: 0x18f
function checktriggeralarm(victim) {
    if (self.state != 8) {
        return;
    }
    var_49a4ee9cdb34af57 = self;
    if (!isdefined(self.dooralarment) && isdefined(self.otherdoor)) {
        var_49a4ee9cdb34af57 = self.otherdoor;
    }
    if (!isdefined(var_49a4ee9cdb34af57.dooralarmowner)) {
        return;
    }
    var_dd7de82cb1c47a2b = var_49a4ee9cdb34af57.dooralarment;
    var_c1e072a8515cd2c1 = var_49a4ee9cdb34af57.dooralarmowner;
    var_49a4ee9cdb34af57.dooralarmowner.alarmeddoors = array_remove(var_49a4ee9cdb34af57.dooralarmowner.alarmeddoors, var_49a4ee9cdb34af57);
    var_49a4ee9cdb34af57.dooralarment = undefined;
    var_49a4ee9cdb34af57.dooralarmowner = undefined;
    var_49a4ee9cdb34af57.dooralarmprompt = undefined;
    var_c1e072a8515cd2c1 namespace_58a74e7d54b56e8d::givescorefortriggeredalarmeddoor();
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread changestate(0);
    }
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(victim, var_c1e072a8515cd2c1))) {
        var_dd7de82cb1c47a2b playloopsound("mp_door_alarm_lp");
        pinglocationenemyteams(self.origin, victim.team);
        var_dd7de82cb1c47a2b setscriptablepartstate("effects", "triggered", 0);
        wait(4);
        var_dd7de82cb1c47a2b stoploopsound();
        var_dd7de82cb1c47a2b delete();
    } else {
        playsoundatpos(var_dd7de82cb1c47a2b.origin, "mp_door_alarm_off");
        var_dd7de82cb1c47a2b setscriptablepartstate("effects", "neutral", 0);
        var_dd7de82cb1c47a2b delete();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd8
// Size: 0x6a
function ajarmonitor() {
    if (self.islean || namespace_cd0b2d039510b38d::runleanthreadmode()) {
        return;
    }
    if (!istrue(self.issaloonstyle)) {
        return;
    }
    self endon("stateChanged");
    self notify("ajarMonitor");
    self endon("ajarMonitor");
    while (1) {
        waitframe();
        waittillframeend();
        if (self.otherdoor.state != 0) {
            thread changestate(6);
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d49
// Size: 0x122
function breachmonitor() {
    self endon("stateChanged");
    thread monitorbreachmelee();
    self.lockprompt sethintstring("MP/DOOR_USE_BREACH");
    self.lockprompt setuseholdduration("duration_short");
    updatelockpromptvisibility();
    if (!isdefined(self.otherdoor)) {
        self.doorcenter = self.origin + anglestoforward(self.angles) * self.length * 0.5 + anglestoup(self.angles) * self.height * 0.5;
    }
    thread updatelocklight("lockedDoor");
    while (1) {
        player = self.lockprompt waittill("trigger");
        if (player meleebuttonpressed()) {
            continue;
        }
        if (player isusingremote()) {
            continue;
        }
        if (player issprinting() || player issprintsliding()) {
            continue;
        }
        if (player ismantling()) {
            continue;
        }
        if (istrue(self.breaching)) {
            continue;
        }
        thread breachdoor(player);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e72
// Size: 0x15
function breachdoor(player) {
    thread plantbreach(player);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e8e
// Size: 0x2b7
function monitorbreachmelee() {
    self endon("stateChanged");
    self notify("monitorBreachMelee");
    self endon("monitorBreachMelee");
    self.lockedmeleehealth = 150;
    self setcandamage(1);
    damage = undefined;
    attacker = undefined;
    direction_vec = undefined;
    meansofdeath = undefined;
    modelname = undefined;
    tagname = undefined;
    partname = undefined;
    idflags = undefined;
    objweapon = undefined;
    origin = undefined;
    angles = undefined;
    normal = undefined;
    inflictor = undefined;
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        if (isdefined(meansofdeath) && !istrue(self.breaching)) {
            if (meansofdeath == "MOD_MELEE" || meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE") {
                var_c81a61ae7e6e7025 = isdefined(objweapon) && isdefined(objweapon.basename) && (objweapon.basename == "molotov_mp" || objweapon.basename == "thermite_mp" || objweapon.basename == "thermite_ap_mp" || objweapon.basename == "thermite_av_mp");
                if (var_c81a61ae7e6e7025) {
                    continue;
                }
                self.lockedmeleehealth = self.lockedmeleehealth - damage;
                if (isdefined(self.otherdoor)) {
                    self.otherdoor.lockedmeleehealth = self.otherdoor.lockedmeleehealth - damage;
                }
                if (self.lockedmeleehealth < 1) {
                    if (isdefined(self.otherdoor) || istrue(self.issaloonstyle)) {
                        self.otherdoor thread updatelocklight("off");
                        self.otherdoor thread bashopen(attacker, attacker.origin);
                    }
                    thread updatelocklight("off");
                    thread bashopen(attacker, attacker.origin);
                } else {
                    playsoundatpos(self.origin + (0, 0, 42), "scrpt_door_wood_double_bash");
                }
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x714c
// Size: 0x3df
function plantbreach(player) {
    if (isdefined(self.otherdoor) && istrue(self.otherdoor.breaching)) {
        return;
    }
    self.breaching = 1;
    thread updatelockpromptvisibility();
    thread watchplayerdeath(player);
    origin = self.origin;
    angles = self.angles;
    right = anglestoright(angles);
    normal = vectornormalize(player.origin - self.origin);
    dot = vectordot(right, normal);
    var_4fbd3851a4b84b8 = dot > 0;
    if (var_4fbd3851a4b84b8) {
        var_c5b5db793ca45dd3 = self.rightplantorg;
        var_8ec84979cf48b441 = self.rightplantang;
    } else {
        var_c5b5db793ca45dd3 = self.leftplantorg;
        var_8ec84979cf48b441 = self.leftplantang;
    }
    player.linktoent = player spawn_tag_origin();
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 0, 0, 0);
    scenenode = spawn_tag_origin(var_c5b5db793ca45dd3, var_8ec84979cf48b441);
    player.linktoent moveto(var_c5b5db793ca45dd3, 0.25, 0.1, 0.1);
    player.linktoent rotateto(var_8ec84979cf48b441, 0.25, 0.1, 0.1);
    player setstance("stand");
    if (!istrue(player givegunless())) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    if (istrue(self.cancelplant)) {
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(var_c5b5db793ca45dd3);
    player setplayerangles(var_8ec84979cf48b441);
    faction = ter_op(player.team == "allies", "usp1", "afp1");
    if (level.mapname == "mp_hackney_yard") {
        faction = ter_op(player.team == "allies", "ukp1", "abp1");
    }
    player queuedialogforplayer("dx_mpp_" + faction + "_breach_plant", "cop_breach_plant", 2);
    thread create_player_rig(player, "planter");
    scenenode thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "plant");
    var_f9faefd9721cae01 = spawn("script_model", var_c5b5db793ca45dd3);
    var_f9faefd9721cae01 setmodel("offhand_wm_c4");
    var_f9faefd9721cae01.animname = "c4";
    var_f9faefd9721cae01 useanimtree(%script_model);
    self.plantedbomb = var_f9faefd9721cae01;
    scenenode thread anim_single_solo(var_f9faefd9721cae01, "plant");
    animlength = getanimlength(level.scr_anim["planter"]["plant"]);
    var_84d825d7e4a24fde = 0.5;
    wait(animlength - var_84d825d7e4a24fde);
    if (istrue(self.cancelplant)) {
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    thread bomb_planted_think(player, var_4fbd3851a4b84b8);
    givebreachscore(player);
    wait(var_84d825d7e4a24fde);
    if (player isviewmodelanimplaying()) {
        player stopviewmodelanim();
    }
    player thread takegunless();
    remove_player_rig(player);
    return 1;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7533
// Size: 0x34d
function bomb_planted_think(player, var_4fbd3851a4b84b8) {
    var_9d423f29a3f3ffe = player.team;
    self.defused = 0;
    if (!isdefined(self.breachindex)) {
        if (!isdefined(level.breachindex)) {
            level.breachindex = 0;
        } else {
            level.breachindex++;
        }
        self.breachindex = level.breachindex;
    }
    bomb_fuse_think(var_9d423f29a3f3ffe);
    if (!self.defused) {
        self.doorcenter = self.origin + anglestoforward(self.angles) * self.length * 0.5 + anglestoup(self.angles) * self.height * 0.5;
        explosionorigin = self.doorcenter;
        if (var_4fbd3851a4b84b8) {
            var_383cfb84041052a4 = self.rightplantang;
        } else {
            var_383cfb84041052a4 = self.leftplantang;
        }
        explosioneffect = spawnfx(level._effect["breach_explode"], explosionorigin, anglestoforward(var_383cfb84041052a4) * -1, (0, 0, 1));
        triggerfx(explosioneffect);
        physicsexplosionsphere(explosionorigin, 200, 100, 3);
        playrumbleonposition("grenade_rumble", explosionorigin);
        earthquake(0.5, 1, explosionorigin, 1500);
        player _launchgrenade("flash_grenade_mp", self.plantedbomb.origin + anglestoforward(var_383cfb84041052a4) * 100, (0, 0, 0), 0.05, 1);
        player _launchgrenade("concussion_grenade_mp", self.plantedbomb.origin + anglestoforward(var_383cfb84041052a4) * 100, (0, 0, 0), 0.05, 1);
        wait(0.1);
        if (isdefined(player)) {
            self.plantedbomb radiusdamage(self.plantedbomb.origin, 50, 10, 5, player, "MOD_EXPLOSIVE", "bomb_site_mp");
        } else {
            self.plantedbomb radiusdamage(self.plantedbomb.origin, 100, 50, 5, undefined, "MOD_EXPLOSIVE", "bomb_site_mp");
        }
        thread bashopen(player, self.plantedbomb.origin);
        if (isdefined(self.otherdoor)) {
            self.otherdoor thread bashopen(player, self.plantedbomb.origin);
        }
    }
    self.plantedbomb delete();
    self.plantedbomb = undefined;
    setomnvar("ui_ingame_timer_" + self.breachindex, 0);
    setomnvar("ui_ingame_timer_ent_" + self.breachindex, undefined);
    self.breaching = 0;
    thread updatelockpromptvisibility();
    thread updatelocklight("off");
    if (isdefined(self.otherdoor)) {
        self.otherdoor thread updatelocklight("off");
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7887
// Size: 0x18f
function bomb_fuse_think(team) {
    self notify("breach_planted");
    self.timerobject = spawn("script_model", self.plantedbomb.origin);
    currenttime = gettime();
    var_f28399727742eb23 = int(currenttime + 1000);
    setomnvar("ui_ingame_timer_" + self.breachindex, var_f28399727742eb23);
    setomnvar("ui_ingame_timer_ent_" + self.breachindex, self.timerobject);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (!self.defused && var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 1500) {
            if (var_c301d652d9a73075 <= 250) {
                self.plantedbomb playsound("breach_warning_beep_05");
            } else if (var_c301d652d9a73075 < 500) {
                self.plantedbomb playsound("breach_warning_beep_04");
            } else if (var_c301d652d9a73075 < 1500) {
                self.plantedbomb playsound("breach_warning_beep_03");
            } else {
                self.plantedbomb playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 < 3500) {
            self.plantedbomb playsound("breach_warning_beep_02");
            wait(0.5);
        } else {
            self.plantedbomb playsound("breach_warning_beep_01");
            wait(1);
        }
        if (var_c301d652d9a73075 < 0) {
            break;
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a1d
// Size: 0x75
function watchplayerdeath(player) {
    self endon("breach_planted");
    self.cancelplant = 0;
    while (1) {
        if (!isdefined(player) || !isreallyalive(player)) {
            if (isdefined(self.plantedbomb)) {
                self.plantedbomb delete();
                self.plantedbomb = undefined;
                self.plantedkey = undefined;
            }
            self.cancelplant = 1;
            break;
        }
        waitframe();
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a99
// Size: 0x3
function script_model_anims() {
    
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa3
// Size: 0xe9
function create_player_rig(player, animname, var_486db5fa512a3b6b) {
    if (!isdefined(player) || isdefined(player.player_rig)) {
        return;
    }
    player.animname = animname;
    if (!isdefined(var_486db5fa512a3b6b)) {
        var_486db5fa512a3b6b = "viewhands_base_iw8";
    }
    player.player_rig = spawn("script_model", player.origin);
    player.player_rig setmodel(var_486db5fa512a3b6b);
    player.player_rig hide();
    player.player_rig.animname = animname;
    player.player_rig useanimtree(%script_model);
    player playerlinktodelta(player.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 0);
    player watch_remove_rig();
    remove_player_rig(player);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b93
// Size: 0x92
function remove_player_rig(player) {
    if (!isdefined(player) || !isdefined(player.player_rig)) {
        return;
    }
    player unlink();
    droppos = player getdroptofloorposition(player.origin);
    if (isdefined(droppos)) {
        player setorigin(droppos);
    } else {
        player setorigin(player.origin + (0, 0, 100));
    }
    player.player_rig delete();
    player.player_rig = undefined;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c2c
// Size: 0x1d
function watch_remove_rig(struct) {
    waittill_any_2("remove_rig", "death_or_disconnect");
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c50
// Size: 0x47
function givebreachscore(player) {
    event = #"breach";
    points = namespace_62c556437da28f50::getscoreinfovalue(event);
    player thread namespace_62c556437da28f50::giverankxp(event, points);
    player thread namespace_62c556437da28f50::scoreeventpopup(event);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c9e
// Size: 0x95
function givegunless() {
    self endon("death_or_disconnect");
    gunless = makeweapon("iw8_gunless");
    _giveweapon(gunless, undefined, undefined, 1);
    success = domonitoredweaponswitch(gunless, 0);
    if (success) {
        self.gunnlessweapon = gunless;
        val::set("gunless", "weapon_switch", 0);
        val::set("gunless", "offhand_weapons", 0);
        val::set("gunless", "melee", 0);
    } else {
        _takeweapon(gunless);
        forcevalidweapon();
    }
    return success;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3b
// Size: 0xa9
function takegunless() {
    self endon("death_or_disconnect");
    if (!isdefined(self.gunnlessweapon) || !self hasweapon(self.gunnlessweapon)) {
        return;
    }
    self.takinggunless = 1;
    while (self hasweapon(self.gunnlessweapon)) {
        if (!iscurrentweapon(self.gunnlessweapon)) {
            abortmonitoredweaponswitch(self.gunnlessweapon);
        } else {
            _takeweapon(self.gunnlessweapon);
            forcevalidweapon();
        }
        waitframe();
    }
    self.takinggunless = 0;
    self.gunnlessweapon = undefined;
    val::function_c9d0b43701bdba00("gunless");
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7deb
// Size: 0x58
function updatelocklight(state) {
    if (!isdefined(self.locklight)) {
        return;
    }
    self notify("updateLockLight");
    self endon("updateLockLight");
    if (!namespace_4b0406965e556711::levelflag("scriptables_ready")) {
        namespace_4b0406965e556711::levelflagwait("scriptables_ready");
    }
    self.locklight setscriptablepartstate("marker", state);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4a
// Size: 0x37e
function linkdoubledoors() {
    foreach (door in level.doors) {
        if (isdefined(door.otherdoor)) {
            continue;
        }
        foreach (otherdoor in level.doors) {
            if (otherdoor == door) {
                continue;
            }
            var_349fa0ac676f930 = door gettagorigin("tag_door_handle", 1);
            var_349fd0ac676ffc9 = otherdoor gettagorigin("tag_door_handle", 1);
            if (!isdefined(var_349fa0ac676f930) || !isdefined(var_349fd0ac676ffc9)) {
                continue;
            }
            distsq = distancesquared(var_349fa0ac676f930, var_349fd0ac676ffc9);
            if (distsq < 225) {
                if (distsq < 100) {
                    door.issaloonstyle = 1;
                    otherdoor.issaloonstyle = 1;
                }
                otherdoor.otherdoor = door;
                door.otherdoor = otherdoor;
                if (isdefined(door.lockprompt) && isdefined(otherdoor.lockprompt)) {
                    otherdoor.lockprompt delete();
                    otherdoor.lockprompt = door.lockprompt;
                    var_f95feb63c772e28f = (var_349fa0ac676f930 + var_349fd0ac676ffc9) * 0.5 + (0, 0, 15);
                    door.lockprompt unlink();
                    door.lockprompt.origin = var_f95feb63c772e28f;
                    door thread changestate(door.state);
                    otherdoor thread changestate(otherdoor.state);
                    door.leftplantorg = (var_f95feb63c772e28f[0], var_f95feb63c772e28f[1], door.origin[2]) + anglestoright(door.baseangles) * -24.5;
                    door.leftplantang = (0, door.baseangles[1] - 90, 0);
                    door.rightplantorg = (var_f95feb63c772e28f[0], var_f95feb63c772e28f[1], door.origin[2]) + anglestoright(door.baseangles) * 24.5;
                    door.rightplantang = (0, door.baseangles[1] + 90, 0);
                    otherdoor.leftplantorg = (var_f95feb63c772e28f[0], var_f95feb63c772e28f[1], otherdoor.origin[2]) + anglestoright(otherdoor.baseangles) * -24.5;
                    otherdoor.leftplantang = (0, otherdoor.baseangles[1] - 90, 0);
                    otherdoor.rightplantorg = (var_f95feb63c772e28f[0], var_f95feb63c772e28f[1], otherdoor.origin[2]) + anglestoright(otherdoor.baseangles) * 24.5;
                    otherdoor.rightplantang = (0, otherdoor.baseangles[1] + 90, 0);
                }
            }
        }
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81cf
// Size: 0x36
function door_createnavobstacle() {
    if (!isdefined(self.clipent)) {
        return;
    }
    if (isdefined(self.doornavobstacle)) {
        return;
    }
    self.doornavobstacle = createnavobstaclebyent(self.clipent);
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x820c
// Size: 0x2a
function door_destroynavobstacle() {
    if (!isdefined(self.doornavobstacle)) {
        return;
    }
    destroynavobstacle(self.doornavobstacle);
    self.doornavobstacle = undefined;
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x823d
// Size: 0x21
function door_enableaudioportal() {
    if (isdefined(self.audioportalent)) {
        self.audioportalent enableaudioportal(1);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8265
// Size: 0x7b
function door_disableaudioportal() {
    if (isdefined(self.otherdoor) && self.otherdoor.state != 0 && self.otherdoor.state != 7 && self.otherdoor.state != 8) {
        return;
    }
    if (isdefined(self.audioportalent)) {
        self.audioportalent enableaudioportal(0);
    }
}

// Namespace door/namespace_66efdc90612cfc0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82e7
// Size: 0x1e
function door_can_open_check() {
    return self.state == 6 || self.state == 0;
}

