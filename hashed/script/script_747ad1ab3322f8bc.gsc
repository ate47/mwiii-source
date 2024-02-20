// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_72f3711d95f0e465;

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f
// Size: 0x148
function function_35669831b02dc8fa(spawnorigin, targetorigin, var_44eb7c4eafc2e56e) {
    /#
        assert(isdefined(spawnorigin), "para_ac130SpawnAndFlyToDropoff: No spawnOrigin specified");
    #/
    /#
        assert(isdefined(targetorigin), "para_ac130SpawnAndFlyToDropoff: No dropOffOrigin specified");
    #/
    ac130 = spawn("script_model", spawnorigin);
    ac130 setmodel("veh9_mil_air_cargo_plane_wm_dmz");
    ac130.angles = vectortoangles(targetorigin - spawnorigin);
    ac130.spawnorigin = spawnorigin;
    ac130 playloopsound("iw8_bradley_drop_c130");
    ac130 setscriptablepartstate("lights2", "on", 0);
    ac130 setscriptablepartstate("contrails", "on", 0);
    if (!isdefined(level.ac130_paratrooper_veh)) {
        level.ac130_paratrooper_veh = [];
    }
    level.ac130_paratrooper_veh[level.ac130_paratrooper_veh.size] = ac130;
    forwarddist = ter_op(isdefined(var_44eb7c4eafc2e56e), var_44eb7c4eafc2e56e, 4500);
    droporigin = targetorigin + anglestoforward(ac130.angles) * forwarddist;
    var_5aa0d059a6ed7c56 = distance2d(spawnorigin, droporigin);
    time = var_5aa0d059a6ed7c56 / 2000;
    ac130 moveto(droporigin, time);
    wait(time);
    return ac130;
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bf
// Size: 0x1ae
function function_16dfd690940ae271(exitorigin) {
    ac130 = self;
    var_5e99effa86ef3af = ac130.origin + anglestoforward(ac130.angles) * 64500;
    if (isdefined(exitorigin)) {
        var_a211bd3ffa8e8b6e = exitorigin;
        var_ba8d59c006ab07c1 = var_5e99effa86ef3af[0];
        var_ba8d58c006ab058e = var_5e99effa86ef3af[1];
        startx = ac130.spawnorigin[0];
        starty = ac130.spawnorigin[1];
        endx = var_a211bd3ffa8e8b6e[0];
        endy = var_a211bd3ffa8e8b6e[1];
        if (var_ba8d59c006ab07c1 > endx) {
            if (var_ba8d59c006ab07c1 > startx) {
                var_ba8d59c006ab07c1 = endx;
            }
        } else if (var_ba8d59c006ab07c1 < endx) {
            if (var_ba8d59c006ab07c1 < startx) {
                var_ba8d59c006ab07c1 = endx;
            }
        }
        if (var_ba8d58c006ab058e > endy) {
            if (var_ba8d58c006ab058e > starty) {
                var_ba8d58c006ab058e = endy;
            }
        } else if (var_ba8d58c006ab058e < endy) {
            if (var_ba8d58c006ab058e < starty) {
                var_ba8d58c006ab058e = endy;
            }
        }
        var_5e99effa86ef3af = (var_ba8d59c006ab07c1, var_ba8d58c006ab058e, var_5e99effa86ef3af[2]);
    }
    var_5aa0d059a6ed7c56 = distance2d(ac130.origin, var_5e99effa86ef3af);
    time = var_5aa0d059a6ed7c56 / 2000;
    ac130 moveto(var_5e99effa86ef3af, time);
    wait(time);
    level.ac130_paratrooper_veh = array_remove(level.ac130_paratrooper_veh, ac130);
    ac130 stoploopsound();
    ac130 setscriptablepartstate("lights2", "off", 0);
    ac130 setscriptablepartstate("contrails", "off", 0);
    ac130 delete();
    /#
        println("prone");
    #/
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x574
// Size: 0x5a
function create_paratrooper(var_19fa2154a6002ec3, var_4f200828059689db) {
    self endon("death");
    thread watch_for_death();
    parachute_set_spawn_values();
    parachute_get_path(0, undefined);
    parachute_skydive();
    if (isdefined(self.var_48713689eb4db4b4)) {
        [[ self.var_48713689eb4db4b4 ]]();
    }
    parachute_idle();
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d5
// Size: 0x17d
function parachute_set_spawn_values() {
    self allowedstances("stand");
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.scripted_mode = 1;
    self.playing_skit = 1;
    self.do_immediate_ragdoll = 1;
    var_d57de274b5c1d827 = 128;
    ac130 = undefined;
    if (isdefined(level.ac130_paratrooper_veh)) {
        foreach (veh in level.ac130_paratrooper_veh) {
            if (veh.spawngroup != self.enemy_group) {
                continue;
            }
            if (isdefined(self.ac130) && veh != self.ac130) {
                continue;
            }
            ac130 = veh;
        }
    }
    self asmsetstate(self.asmname, "parachute_freefall");
    self._blackboard.parachutestate = "freefall";
    if (isdefined(ac130)) {
        self.ac130 = ac130;
        var_5856c0b118701a9f = (randomfloatrange(var_d57de274b5c1d827 * -1, var_d57de274b5c1d827), randomfloatrange(var_d57de274b5c1d827 * -1, var_d57de274b5c1d827), 0);
        self setorigin(ac130.origin + (0, 0, 50) + var_5856c0b118701a9f, 0);
    }
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x300
function parachute_get_path(var_c225e4dd6095fdcd, var_c201cedd606d52b3, var_7dc1df4ff378a6f4) {
    self endon("death");
    if (!isdefined(var_c225e4dd6095fdcd)) {
        var_c225e4dd6095fdcd = 100;
    }
    if (!isdefined(var_c201cedd606d52b3)) {
        var_c201cedd606d52b3 = 500;
    }
    var_767d3482b0029903 = rotatepointaroundvector((0, 0, 1), (1, 0, 0), randomfloatrange(0, 359));
    startorigin = self.spawnpoint.parachute_land_origin + var_767d3482b0029903 * randomfloatrange(var_c225e4dd6095fdcd, var_c201cedd606d52b3);
    landing_spot = getclosestpointonnavmesh(getgroundposition(startorigin, 64, 15000, 15000) + (0, 0, 32));
    contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
    ignoreents = [0:self];
    if (isdefined(self.ac130) && self.ac130 != self) {
        ignoreents[ignoreents.size] = self.ac130;
    }
    trace = namespace_2a184fc4902783dc::sphere_trace(self.origin, landing_spot + (0, 0, 128), 64, ignoreents, contents);
    if (trace["fraction"] < 1) {
        landing_spot = getclosestpointonnavmesh(trace["position"]);
        trace = namespace_2a184fc4902783dc::sphere_trace(self.origin, landing_spot + (0, 0, 128), 64, ignoreents, contents);
        if (trace["fraction"] < 1) {
            nodes = getnodesinradiussorted(landing_spot, 1024, 0, 2048, "Exposed");
            var_1e8afdd8574541cb = 0;
            if (isdefined(nodes) && nodes.size > 0) {
                var_7898211d070bae3c = 2;
                foreach (index, node in nodes) {
                    if (index >= var_7898211d070bae3c) {
                        break;
                    }
                    if (!isdefined(self.var_b767444b528bf22)) {
                        self.var_b767444b528bf22 = [];
                    }
                    if (array_contains(self.var_b767444b528bf22, node)) {
                        continue;
                    }
                    trace = namespace_2a184fc4902783dc::sphere_trace(self.origin, node.origin + (0, 0, 128), 64, ignoreents, contents);
                    if (trace["fraction"] == 1) {
                        landing_spot = node.origin;
                        var_1e8afdd8574541cb = 1;
                        break;
                    } else {
                        self.var_b767444b528bf22[self.var_b767444b528bf22.size] = node;
                    }
                }
            }
            if (var_1e8afdd8574541cb) {
                function_f69c1c88941df67a(landing_spot);
                return;
            } else if (var_c201cedd606d52b3 < 2000) {
                parachute_get_path(var_c201cedd606d52b3, var_c201cedd606d52b3 * 2);
            } else {
                function_f69c1c88941df67a(landing_spot);
            }
        }
    }
    function_f69c1c88941df67a(landing_spot);
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa60
// Size: 0xc1
function function_f69c1c88941df67a(landing_spot) {
    if (istrue(self.var_faeb5e8cc0f1400a)) {
        return;
    }
    self.var_b767444b528bf22 = undefined;
    self.landing_spot = landing_spot;
    self.var_faeb5e8cc0f1400a = 1;
    offset = (0, 0, 0);
    if (isdefined(self.spawnpoint.allow_momentum)) {
        fwd = vectortoangles(self.origin - self.landing_spot);
        offset = anglestoforward(fwd) * 3500;
    }
    self.skydive_dest = self.landing_spot + (0, 0, 1200) + (offset[0], offset[1], 0);
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0x16a
function parachute_skydive(var_19fa2154a6002ec3) {
    self endon("death");
    if (isdefined(self.ac130)) {
        dest = self.spawnpoint.parachute_land_origin;
        dir = dest - self.origin;
        yaw = vectortoyaw(dir);
        self.angles = (self.angles[0], yaw, self.angles[2]);
        self.anchor = spawn("script_origin", self.origin);
        self.anchor.angles = (0, self.angles[1], 0);
        self linkto(self.anchor);
        movetime = 9;
        movetime = movetime + randomfloatrange(-1, 1);
        rotatetime = 2;
        self.anchor rotateto((0, yaw, 0), rotatetime);
        self.anchor moveto(self.skydive_dest, movetime);
        wait(movetime - 3);
        parachute_spawn();
        parachute_deploy();
        wait(2);
    } else {
        self.nocorpse = 1;
        self dodamage(self.health + 100, self.origin);
    }
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc99
// Size: 0x81
function parachute_spawn() {
    chute = spawn("script_model", self gettagorigin("j_spine4"));
    chute.angles = self gettagangles("j_spine4");
    chute setmodel("misc_wm_br_parachute");
    chute linkto(self, "j_spine4", (0, 0, 0), (0, 0, 0));
    self.chute = chute;
    chute thread unlink_on_ai_death(self);
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd21
// Size: 0x4d
function parachute_deploy() {
    self.chute scriptmodelplayanim("sdr_com_parachute_pullcord");
    self._blackboard.parachutestate = "parachuting";
    self asmsetstate(self.asmname, "parachute_deploy");
    thread delayeventfired();
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd75
// Size: 0x25
function delayeventfired() {
    self endon("death");
    wait(2.5);
    self asmfireevent(self.asmname, "finish");
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1
// Size: 0x13
function parachute_idle() {
    thread parachute_move();
    thread parachute_idle_internal();
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbb
// Size: 0x24
function parachute_idle_internal() {
    self endon("death");
    wait(1.5);
    self.chute scriptmodelplayanim("sdr_com_parachute_idle");
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde6
// Size: 0x156
function parachute_move() {
    self endon("death");
    move_time = 6;
    if (isdefined(self.spawnpoint.allow_momentum)) {
        move_time = 9;
    }
    move_time = move_time + randomfloatrange(-1, 1);
    decel_time = 1.5;
    self.anchor moveto(self.landing_spot, move_time, 0.1, 1.5);
    point1 = (self.origin[0], self.origin[1], 0);
    waitframe();
    point2 = (self.origin[0], self.origin[1], 0);
    self.anchor rotateto(vectortoangles(point2 - point1), 3, 1, 1);
    wait(move_time - 1.5);
    self._blackboard.parachutestate = "landing";
    self.chute scriptmodelplayanim("sdr_com_parachute_prepare_for_landing");
    wait(1);
    self.chute.parachute_landed = 1;
    wait(2.4);
    self.chute delete();
    self.chute notify("parachute_detached");
    thread do_landing();
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf43
// Size: 0x124
function do_landing() {
    self endon("death");
    self.anchor.origin = self.landing_spot;
    self.angles = (0, self.anchor.angles[1], 0);
    self motionwarpcancel();
    self unlink();
    self.angles = (0, self.anchor.angles[1], 0);
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
    self allowedstances("prone", "stand", "crouch");
    self.playing_skit = undefined;
    self.ignoreall = 0;
    self.ignoreme = 0;
    self.scripted_mode = 0;
    self.ac130 = undefined;
    if (isdefined(self.var_55ddeb59df2dee74)) {
        [[ self.var_55ddeb59df2dee74 ]]();
    }
    if (isdefined(level.var_6d98a0934d4e3ca9)) {
        [[ level.var_6d98a0934d4e3ca9 ]]();
    }
    self notify("delete_chute");
    wait(1);
    self.do_immediate_ragdoll = undefined;
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106e
// Size: 0x2e
function watch_for_death() {
    self endon("parachute_detached");
    self waittill("death");
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
}

// Namespace namespace_72f3711d95f0e465/namespace_c0945f72aac1f0a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a3
// Size: 0x4b
function unlink_on_ai_death(ai) {
    self endon("death");
    ai endon("parachute_detached");
    ai waittill("death");
    self unlink();
    if (!istrue(self.parachute_landed)) {
        self movez(100, 2);
        wait(2);
    }
    self delete();
}
