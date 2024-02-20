// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\killstreaks\helicopter.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace helicopter_pilot;

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x542
// Size: 0x1ea
function init() {
    /#
        assertmsg("If this killstreak is used in the future, it needs to be updated to do it's own deployment.");
    #/
    level.heli_pilot = [];
    level.helipilotsettings = [];
    level.helipilotsettings["heli_pilot"] = spawnstruct();
    level.helipilotsettings["heli_pilot"].timeout = 60;
    level.helipilotsettings["heli_pilot"].maxhealth = 2000;
    level.helipilotsettings["heli_pilot"].streakname = "heli_pilot";
    level.helipilotsettings["heli_pilot"].vehicleinfo = "heli_pilot_mp";
    level.helipilotsettings["heli_pilot"].modelbase = "vehicle_aas_72x_killstreak";
    level.helipilotsettings["heli_pilot"].teamsplash = "used_heli_pilot";
    helipilot_setairstartnodes();
    level.heli_pilot_mesh = namespace_36f464722d326bbe::getlocaleent("heli_pilot_mesh");
    if (!isdefined(level.heli_pilot_mesh)) {
        /#
            println("ui_heli_pilot_flare_ammo" + level.script);
        #/
    } else {
        level.heli_pilot_mesh.origin = level.heli_pilot_mesh.origin + gethelipilotmeshoffset();
    }
    config = spawnstruct();
    config.scorepopup = "destroyed_helo_pilot";
    config.vodestroyed = undefined;
    config.callout = "callout_destroyed_helo_pilot";
    config.samdamagescale = 0.09;
    config.enginevfxtag = "tag_engine_right";
    level.heliconfigs["heli_pilot"] = config;
    /#
        setdevdvarifuninitialized(@"hash_9d27a693c0c7d81b", 60);
    #/
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x733
// Size: 0xfe
function tryusehelipilot(lifeid, streakname) {
    helipilottype = "heli_pilot";
    var_4440147083abaf0a = 1;
    if (isdefined(self.underwater) && self.underwater) {
        return 0;
    } else if (exceededmaxhelipilots(self.team)) {
        self iprintlnbold("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        return 0;
    } else if (currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + var_4440147083abaf0a >= maxvehiclesallowed()) {
        self iprintlnbold("KILLSTREAKS/TOO_MANY_VEHICLES");
        return 0;
    }
    incrementfauxvehiclecount();
    heli = createhelipilot(helipilottype);
    if (!isdefined(heli)) {
        decrementfauxvehiclecount();
        return 0;
    }
    level.heli_pilot[self.team] = heli;
    result = starthelipilot(heli);
    if (!isdefined(result)) {
        result = 0;
    }
    return result;
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839
// Size: 0x64
function exceededmaxhelipilots(team) {
    if (getgametype() == "dm") {
        if (isdefined(level.heli_pilot[team]) || isdefined(level.heli_pilot[getotherteam(team)[0]])) {
            return 1;
        } else {
            return 0;
        }
    } else if (isdefined(level.heli_pilot[team])) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a4
// Size: 0x3a
function watchhostmigrationfinishedinit(player) {
    player endon("disconnect");
    level endon("game_ended");
    self endon("death");
    for (;;) {
        level waittill("host_migration_end");
        player setclientomnvar("ui_heli_pilot", 1);
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e5
// Size: 0x2d8
function createhelipilot(helipilottype) {
    var_71306135050de8 = helipilot_getcloseststartnode(self.origin);
    var_d6eb01b1dc33ffdc = helipilot_getlinkedstruct(var_71306135050de8);
    startang = vectortoangles(var_d6eb01b1dc33ffdc.origin - var_71306135050de8.origin);
    forward = anglestoforward(self.angles);
    targetpos = var_d6eb01b1dc33ffdc.origin + forward * -100;
    startpos = var_71306135050de8.origin;
    heli = spawnhelicopter(self, startpos, startang, level.helipilotsettings[helipilottype].vehicleinfo, level.helipilotsettings[helipilottype].modelbase);
    if (!isdefined(heli)) {
        return;
    }
    heli makevehiclesolidcapsule(18, -9, 18);
    heli addtolittlebirdlist(heli getentitynumber());
    heli thread removefromlittlebirdlistondeath(heli getentitynumber());
    heli.maxhealth = level.helipilotsettings[helipilottype].maxhealth;
    heli.speed = 40;
    heli.owner = self;
    heli setotherent(self);
    heli.team = self.team;
    heli.helitype = "littlebird";
    heli.helipilottype = "heli_pilot";
    heli setmaxpitchroll(45, 45);
    heli vehicle_setspeed(heli.speed, 40, 40);
    heli setyawspeed(120, 60);
    heli setneargoalnotifydist(32);
    heli sethoverparams(100, 100, 100);
    heli namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Air", self);
    heli.targetpos = targetpos;
    heli.currentnode = var_d6eb01b1dc33ffdc;
    heli.attract_strength = 10000;
    heli.attract_range = 150;
    heli.attractor = missile_createattractorent(heli, heli.attract_strength, heli.attract_range);
    heli thread namespace_f88f890445eec227::heli_damage_monitor("heli_pilot");
    heli thread helipilot_lightfx();
    heli thread helipilot_watchtimeout();
    heli thread helipilot_watchownerloss();
    heli thread helipilot_watchroundend();
    heli thread helipilot_watchobjectivecam();
    heli thread helipilot_watchdeath();
    heli thread watchhostmigrationfinishedinit(self);
    heli.owner utility::trycall(level.matchdata_logkillstreakevent, level.helipilotsettings[heli.helipilottype].streakname, heli.targetpos);
    return heli;
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc5
// Size: 0x99
function helipilot_lightfx() {
    playfxontag(level.chopper_fx["light"]["left"], self, "tag_light_nose");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["belly"], self, "tag_light_belly");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["tail"], self, "tag_light_tail1");
    wait(0.05);
    playfxontag(level.chopper_fx["light"]["tail"], self, "tag_light_tail2");
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc65
// Size: 0x291
function starthelipilot(heli) {
    level endon("game_ended");
    heli endon("death");
    setusingremote(heli.helipilottype);
    if (getdvarint(@"hash_c00e244ea59d530e")) {
        setthirdpersondof(0);
    }
    self.restoreangles = self.angles;
    heli thread namespace_dc0d47ddf0ead8a3::ks_setup_manual_flares(2, "+smoke", "ui_heli_pilot_flare_ammo", "ui_heli_pilot_warn");
    thread watchintrocleared(heli);
    _freezecontrols(1, undefined, "heliStartRide");
    result = namespace_58a74e7d54b56e8d::initridekillstreak(heli.helipilottype);
    if (result != "success") {
        val::function_c9d0b43701bdba00("ride_killstreak");
        heli notify("death");
        return 0;
    }
    _freezecontrols(0, undefined, "heliStartRide");
    traceoffset = gethelipilottraceoffset();
    tracestart = heli.currentnode.origin + gethelipilotmeshoffset() + traceoffset;
    traceend = heli.currentnode.origin + gethelipilotmeshoffset() - traceoffset;
    traceresult = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 0, undefined, 0, 0, 1);
    if (!isdefined(traceresult["entity"])) {
        /#
            thread drawsphere(traceresult["<unknown string>"] - gethelipilotmeshoffset(), 32, 10000, (1, 0, 0));
            thread drawsphere(heli.currentnode.origin, 16, 10000, (0, 1, 0));
            thread drawline(tracestart - gethelipilotmeshoffset(), traceend - gethelipilotmeshoffset(), 10000, (0, 0, 1));
        #/
        /#
            assertmsg("The trace didn't hit the heli_pilot_mesh. Please grab an MP scripter.");
        #/
    }
    targetorigin = traceresult["position"] - gethelipilotmeshoffset() + (0, 0, 250);
    targetnode = spawn("script_origin", targetorigin);
    self remotecontrolvehicle(heli);
    heli thread heligotostartposition(targetnode);
    heli thread helipilot_watchads();
    level thread teamplayercardsplash(level.helipilotsettings[heli.helipilottype].teamsplash, self);
    heli.killcament = spawn("script_origin", self getvieworigin());
    return 1;
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefe
// Size: 0x38
function heligotostartposition(targetnode) {
    self endon("death");
    level endon("game_ended");
    self remotecontrolvehicletarget(targetnode);
    self waittill("goal_reached");
    self remotecontrolvehicletargetoff();
    targetnode delete();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3d
// Size: 0x131
function watchintrocleared(heli) {
    self endon("disconnect");
    self endon("joined_team");
    self endon("joined_spectators");
    level endon("game_ended");
    heli endon("death");
    self waittill("intro_cleared");
    self setclientomnvar("ui_heli_pilot", 1);
    id = outlineenableforplayer(self, self, "outline_nodepth_cyan", "killstreak");
    removeoutline(id, heli);
    foreach (player in level.participants) {
        if (!isreallyalive(player) || player.sessionstate != "playing") {
            continue;
        }
        if (namespace_f8065cafc523dba5::isenemy(player)) {
            if (!player _hasperk("specialty_noplayertarget")) {
                id = outlineenableforplayer(player, self, "outline_nodepth_orange", "killstreak");
                player removeoutline(id, heli);
            } else {
                player thread watchforperkremoval(heli);
            }
        }
    }
    heli thread watchplayersspawning();
    thread watchearlyexit(heli);
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1075
// Size: 0x5a
function watchforperkremoval(heli) {
    self notify("watchForPerkRemoval");
    self endon("watchForPerkRemoval");
    self endon("death");
    self waittill("removed_specialty_noplayertarget");
    id = outlineenableforplayer(self, heli.owner, "outline_nodepth_orange", "killstreak");
    removeoutline(id, heli);
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d6
// Size: 0x5e
function watchplayersspawning() {
    self endon("leaving");
    self endon("death");
    while (1) {
        player = level waittill("player_spawned");
        if (player.sessionstate == "playing" && self.owner namespace_f8065cafc523dba5::isenemy(player)) {
            player thread watchforperkremoval(self);
        }
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113b
// Size: 0x28
function removeoutline(id, heli) {
    thread heliremoveoutline(id, heli);
    thread playerremoveoutline(id, heli);
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116a
// Size: 0x75
function heliremoveoutline(id, heli) {
    self notify("heliRemoveOutline");
    self endon("heliRemoveOutline");
    self endon("outline_removed");
    self endon("disconnect");
    level endon("game_ended");
    var_819382a0fc083b42 = [0:"leaving", 1:"death"];
    heli waittill_any_in_array_return_no_endon_death(var_819382a0fc083b42);
    if (isdefined(self)) {
        outlinedisable(id, self);
        self notify("outline_removed");
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e6
// Size: 0x66
function playerremoveoutline(id, heli) {
    self notify("playerRemoveOutline");
    self endon("playerRemoveOutline");
    self endon("outline_removed");
    self endon("disconnect");
    level endon("game_ended");
    var_819382a0fc083b42 = [0:"death"];
    waittill_any_in_array_return_no_endon_death(var_819382a0fc083b42);
    outlinedisable(id, self);
    self notify("outline_removed");
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1253
// Size: 0x5b
function helipilot_watchdeath() {
    level endon("game_ended");
    self endon("gone");
    self waittill("death");
    if (isdefined(self.owner)) {
        self.owner helipilot_endride(self);
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    thread namespace_f88f890445eec227::lbonkilled();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b5
// Size: 0x6c
function helipilot_watchobjectivecam() {
    level endon("game_ended");
    self endon("gone");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level waittill("objective_cam");
    thread namespace_f88f890445eec227::lbonkilled();
    if (isdefined(self.owner)) {
        self.owner helipilot_endride(self);
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1328
// Size: 0x89
function helipilot_watchtimeout() {
    level endon("game_ended");
    self endon("death");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    timeout = level.helipilotsettings[self.helipilottype].timeout;
    /#
        timeout = getdvarfloat(@"hash_9d27a693c0c7d81b");
    #/
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(timeout);
    thread helipilot_leave();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b8
// Size: 0x3f
function helipilot_watchownerloss() {
    level endon("game_ended");
    self endon("death");
    self endon("leaving");
    self.owner waittill_any_3("disconnect", "joined_team", "joined_spectators");
    thread helipilot_leave();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fe
// Size: 0x58
function helipilot_watchroundend() {
    self endon("death");
    self endon("leaving");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    self.owner endon("joined_spectators");
    level waittill_any_2("round_end_finished", "game_ended");
    thread helipilot_leave();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145d
// Size: 0xde
function helipilot_leave() {
    self endon("death");
    self notify("leaving");
    if (isdefined(self.owner)) {
        self.owner helipilot_endride(self);
    }
    targetpos = self.origin + (0, 0, 850);
    self vehicle_setspeed(140, 60);
    self setmaxpitchroll(45, 180);
    self setvehgoalpos(targetpos);
    self waittill("goal");
    targetpos = targetpos + anglestoforward(self.angles) * 15000;
    var_60347fd2432f3a63 = spawn("script_origin", targetpos);
    if (isdefined(var_60347fd2432f3a63)) {
        self setlookatent(var_60347fd2432f3a63);
        var_60347fd2432f3a63 thread wait_and_delete(3);
    }
    self setvehgoalpos(targetpos);
    self waittill("goal");
    self notify("gone");
    namespace_f88f890445eec227::removelittlebird();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1542
// Size: 0x23
function wait_and_delete(waittime) {
    self endon("death");
    level endon("game_ended");
    wait(waittime);
    self delete();
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156c
// Size: 0x70
function helipilot_endride(heli) {
    if (isdefined(heli)) {
        self setclientomnvar("ui_heli_pilot", 0);
        heli notify("end_remote");
        if (isusingremote()) {
            clearusingremote();
        }
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            setthirdpersondof(1);
        }
        self remotecontrolvehicleoff(heli);
        self setplayerangles(self.restoreangles);
        thread helipilot_freezebuffer();
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e3
// Size: 0x34
function helipilot_freezebuffer() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    _freezecontrols(1, undefined, "heliEndRide");
    wait(0.5);
    _freezecontrols(0, undefined, "heliEndRide");
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161e
// Size: 0x8e
function helipilot_watchads() {
    self endon("leaving");
    self endon("death");
    level endon("game_ended");
    var_48f5a6465cacb79c = 0;
    while (1) {
        if (isdefined(self.owner)) {
            if (self.owner adsbuttonpressed()) {
                if (!var_48f5a6465cacb79c) {
                    self.owner setclientomnvar("ui_heli_pilot", 2);
                    var_48f5a6465cacb79c = 1;
                }
            } else if (var_48f5a6465cacb79c) {
                self.owner setclientomnvar("ui_heli_pilot", 1);
                var_48f5a6465cacb79c = 0;
            }
        }
        wait(0.1);
    }
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b3
// Size: 0x1c
function helipilot_setairstartnodes() {
    level.air_start_nodes = getstructarray("chopper_boss_path_start", "targetname");
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d6
// Size: 0x67
function helipilot_getlinkedstruct(struct) {
    if (isdefined(struct.script_linkto)) {
        var_b11f91c17feeab8f = struct get_links();
        for (i = 0; i < var_b11f91c17feeab8f.size; i++) {
            ent = getstruct(var_b11f91c17feeab8f[i], "script_linkname");
            if (isdefined(ent)) {
                return ent;
            }
        }
    }
    return undefined;
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1745
// Size: 0x9f
function helipilot_getcloseststartnode(pos) {
    var_d6eb01b1dc33ffdc = undefined;
    closestdistance = 999999;
    foreach (loc in level.air_start_nodes) {
        var_a2fbfa1ac218a716 = distance(loc.origin, pos);
        if (var_a2fbfa1ac218a716 < closestdistance) {
            var_d6eb01b1dc33ffdc = loc;
            closestdistance = var_a2fbfa1ac218a716;
        }
    }
    return var_d6eb01b1dc33ffdc;
}

// Namespace helicopter_pilot/namespace_7b6b19120baab6f6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ec
// Size: 0x3b
function watchearlyexit(heli) {
    level endon("game_ended");
    heli endon("death");
    self endon("leaving");
    heli thread namespace_58a74e7d54b56e8d::allowridekillstreakplayerexit();
    heli waittill("killstreakExit");
    heli thread helipilot_leave();
}
