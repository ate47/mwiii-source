#using scripts\engine\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using script_3ed005fe9b78b9da;
#using scripts\mp\hud_util.gsc;
#using script_5e2dcb7fb9811781;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_f46cce884171ed03;

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51f
// Size: 0x97
function function_51e961150661d4b4() {
    cooldowntime = getdvarfloat(@"hash_1003a1525408b1fb", 7);
    addpowerbutton(self, "jump", ["+speed_throw", "+toggleads_throw", "+ads_akimbo_accessible"], &playerzombiejump, 0, undefined, &playerzombiejumpcleanup, undefined, %MP_ZXP/CHARGED_JUMP, undefined, cooldowntime, "jumpStatus", "jumpProgress");
    addpowerbutton(self, "jumpStop", ["-speed_throw", "-toggleads_throw", "-ads_akimbo_accessible"], &playerzombiejumpstop, 0);
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5be
// Size: 0x97
function function_58b5b82e9532c92b() {
    cooldowntime = getdvarfloat(@"hash_5c6f048df99cb933", 4.5);
    addpowerbutton(self, "jump", ["+speed_throw", "+toggleads_throw", "+ads_akimbo_accessible"], &playerzombiejump, 0, undefined, &playerzombiejumpcleanup, undefined, %MP_ZXP/CHARGED_JUMP, undefined, cooldowntime, "jumpStatus", "jumpProgress");
    addpowerbutton(self, "jumpStop", ["-speed_throw", "-toggleads_throw", "-ads_akimbo_accessible"], &playerzombiejumpstop, 0);
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65d
// Size: 0x381
function playerzombiejump(powerstruct, powerref) {
    if (!isdefined(self)) {
        return;
    }
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("zombie_unset");
    self endon("playerZombieJumpStop");
    var_4ca6e232b3a08ae5 = -1;
    self.var_ee75699e65f68166 = undefined;
    if (function_77bab0532bc12f0e()) {
        function_e63114420500fb();
        function_ae8ecf6e5f68f1ea(self.var_ee75699e65f68166);
        thread function_f2ddb7c78178c1be(powerstruct, powerref);
        return;
    }
    var_e8b1539c9f6ccbc1 = getdvarfloat(@"hash_2fc6c2dc7f9c722a", 1);
    var_eec1ca5327266614 = getdvarfloat(@"hash_f3adfe2ba0c4e72e", 0.25);
    var_6b00aa3867c7f0d9 = getdvarint(@"hash_69111e35067f9d8f", var_4ca6e232b3a08ae5);
    var_57bd73d0ecaee169 = var_e8b1539c9f6ccbc1 * level.framedurationseconds;
    self.var_17c60a92aea65107 = 0;
    self allowmelee(0);
    self disableoffhandweapons();
    thread function_647ba9e9a0d700c7();
    thread function_7a9b3f5644b41347();
    var_715d7709363e068c = undefined;
    progress = 0;
    if (!isdefined(self.var_741cb4edf0f0590c) || gettime() > self.var_741cb4edf0f0590c) {
        self playsound("jup_mp_mode_mutation_zombie_superjump_charge");
        self.var_741cb4edf0f0590c = gettime() + 500;
    }
    if (isdefined(powerstruct.powers[powerref].var_84f872ff989aaf52)) {
        function_936f0ef6e203a7fc(powerstruct.powers[powerref].var_84f872ff989aaf52, 0);
    }
    while (!function_77bab0532bc12f0e()) {
        if (level.var_ec4da42b3bbf344c.var_a4a60d445462181d) {
            self.powershud[powerref].barelem updatebar(self.var_17c60a92aea65107, 0);
        } else {
            self.powershud[powerref].frac = self.var_17c60a92aea65107;
        }
        prevfrac = self.var_17c60a92aea65107;
        self.var_17c60a92aea65107 += var_57bd73d0ecaee169;
        if (self.var_17c60a92aea65107 >= 1) {
            self.var_17c60a92aea65107 = 1;
            if (var_6b00aa3867c7f0d9 >= 0) {
                if (!isdefined(var_715d7709363e068c)) {
                    var_715d7709363e068c = gettime() + var_6b00aa3867c7f0d9 * 1000;
                    if (level.var_ec4da42b3bbf344c.var_a4a60d445462181d) {
                        thread playerzombiejumpmaxholdwarning(powerref, var_6b00aa3867c7f0d9);
                    }
                }
                if (gettime() >= var_715d7709363e068c) {
                    break;
                }
            }
        }
        if (level.var_ec4da42b3bbf344c.var_a4a60d445462181d && prevfrac < var_eec1ca5327266614 && self.var_17c60a92aea65107 >= var_eec1ca5327266614) {
            self.powershud[powerref].barelem.bar.color = (0, 1, 0);
        }
        if (prevfrac < 1 && self.var_17c60a92aea65107 >= 1) {
            self playlocalsound("zxp_charge_jump_full");
        }
        if (isdefined(powerstruct.powers[powerref].var_b11f66f8bf2c2553)) {
            progress = max(int(self.var_17c60a92aea65107 * 100), 0);
            function_936f0ef6e203a7fc(powerstruct.powers[powerref].var_b11f66f8bf2c2553, progress);
        }
        waitframe();
    }
    thread function_a1b195bc24dae315(powerstruct, powerref);
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9e6
// Size: 0x4d
function playerzombiejumpcleanup(powerstruct, powerref, docooldown) {
    if (istrue(docooldown)) {
        thread playerpowerstartcooldown(powerstruct, powerref);
    }
    self setcamerathirdperson(0);
    self enableoffhandweapons();
    self.var_e11136acf00d18f = undefined;
    self.var_17c60a92aea65107 = undefined;
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b
// Size: 0xa5
function function_77bab0532bc12f0e() {
    zombie = self;
    if (!isdefined(zombie) || !zombie scripts\mp\utility\game::function_6c88a48a9e942c3d()) {
        return true;
    }
    if (zombie meleebuttonpressed() || zombie attackbuttonpressed()) {
        zombie.var_e11136acf00d18f = 1;
        return true;
    }
    if (zombie getstance() == "prone") {
        zombie.var_ee75699e65f68166 = "MP_BR_INGAME/ZMB_CHARGED_JUMP_ERROR_PRONE";
        return true;
    }
    if (zombie isswimunderwater()) {
        zombie.var_ee75699e65f68166 = "MP_BR_INGAME/ZMB_CHARGED_JUMP_ERROR_UNDERWATER";
        return true;
    }
    if (zombie ishanging()) {
        zombie.var_ee75699e65f68166 = "MP_BR_INGAME/ZMB_CHARGED_JUMP_ERROR_HANGING";
        return true;
    }
    return false;
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae9
// Size: 0x107
function function_d4e7d5bfedb0b977() {
    if (level.var_ec4da42b3bbf344c.var_854edaec88caf865 != 0) {
        end = self.origin + (0, 0, level.var_ec4da42b3bbf344c.var_854edaec88caf865);
        result = playerphysicstrace(self.origin, end);
        if (result != end) {
            return false;
        }
    }
    if (level.var_ec4da42b3bbf344c.var_854ed7ec88caf1cc != 0) {
        start = self geteye();
        end = start + (0, 0, level.var_ec4da42b3bbf344c.var_854ed7ec88caf1cc);
        radius = 10;
        height = 20;
        contents = scripts\engine\trace::create_contents(0, 1, 0, 1, 0, 0, 1);
        result = scripts\engine\trace::capsule_trace(start, end, radius, height, (0, 0, 0), self, contents);
        if (result["fraction"] != 1) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf9
// Size: 0x45
function function_7a9b3f5644b41347() {
    player = self;
    player endon("death_or_disconnect");
    player notify("applyFOVPresentation");
    player endon("applyFOVPresentation");
    player lerpfovbypreset("zombiearcade");
    player waittill("endSuperJumpFov");
    player lerpfovbypreset("zombiedefault");
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc46
// Size: 0xfc
function playerzombiejumpmaxholdwarning(powerref, time) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("zombie_unset");
    self endon("playerZombieJumpStop");
    self endon("playerZombieJumpChargeEnd");
    if (time <= 0) {
        return;
    }
    waittimes = scripts\mp\gametypes\br_circle::array_init_distribute(time, int(time * 5), 1);
    color = 1;
    for (i = 0; i < waittimes.size; i++) {
        if (color) {
            self.powershud[powerref].barelem.bar.color = (1, 0, 0);
        } else {
            self.powershud[powerref].barelem.bar.color = (0, 1, 0);
        }
        wait waittimes[i];
        color = !color;
    }
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a
// Size: 0x1eb
function function_a3335da8620d547c(var_dd967d0c568c7873) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self allowjump(0);
    self setscriptablepartstate("skydiveVfx", "enabled_zombie", 0);
    wait 0.2;
    self enableoffhandweapons();
    self notify("endSuperJumpFov");
    if (!isbot(self)) {
        self forceplaygestureviewmodel("ges_zombie_superjump");
    }
    thread function_a0810cb7bb46ccdb();
    while (!function_bd2a29feef8f2889()) {
        waitframe();
    }
    self notify("zombie_jump_complete");
    fwd = vectornormalize(anglestoforward(flat_angle(self.angles)));
    grenadeorigin = self.origin + fwd * 16 + (0, 0, 4);
    jumpdistance = distance2d(var_dd967d0c568c7873, self.origin);
    if (jumpdistance < getdvarint(@"hash_bd303228300d36d7", 715)) {
        self.var_f56a71aaddbdd434 = 1;
    }
    if (is_equal(self.curclass, "default2")) {
        gren = magicgrenademanual("jup_mutant_leap_emp_impact_mp", grenadeorigin, (0, 0, 0), 0.1);
        gren detonate(self);
        thread function_58a7c3eb64d82c49();
    } else {
        gren = magicgrenademanual("jup_mutant_leap_impact_mp", grenadeorigin, (0, 0, 0), 0.1);
        gren detonate(self);
    }
    self stopgestureviewmodel("ges_zombie_superjump");
    self setscriptablepartstate("skydiveVfx", "default", 0);
    self playsoundtoplayer("zxp_splat_plr", self, self);
    self playsound("zmb_npc_breath_land_hi", self, self);
    self playsound("zxp_splat_npc", self, self);
    wait 0.2;
    self allowmelee(1);
    self allowjump(1);
    self.var_f56a71aaddbdd434 = undefined;
    self.var_1a7940ce78dd1720 = undefined;
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3d
// Size: 0x16a
function function_58a7c3eb64d82c49() {
    position = self.origin;
    ents = empdebuff_get_emp_ents(position, 500);
    objweapon = makeweapon("jup_mutant_leap_emp_impact_mp");
    self.var_3ff0b2483ea046e3 = [];
    foreach (ent in ents) {
        entowner = ent.owner;
        if (isdefined(entowner)) {
            if (!playersareenemies(self, entowner)) {
                continue;
            }
        }
        data = packdamagedata(self, ent, 1, objweapon, "MOD_EXPLOSIVE", self, position);
        thread function_25310643899068a8(data, 4);
    }
    players = getplayersinradius(position, 500);
    foreach (player in players) {
        if (!function_641436d9bd65f63c(self, player)) {
            continue;
        }
        data = packdamagedata(self, player, 1, objweapon, "MOD_EXPLOSIVE", self, position);
        thread empPulse_apply_player(data, 4);
    }
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10af
// Size: 0x3c
function function_a0810cb7bb46ccdb() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("zombie_jump_complete");
    while (true) {
        waittill_any_2("gas_grenade_finished", "zombie_shouting_finished");
        self forceplaygestureviewmodel("ges_zombie_superjump");
    }
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f3
// Size: 0x136
function function_dd8a4b0712217000() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("zombie_unset");
    var_4992594dd7ee57b6 = getdvarfloat(@"hash_1df491267fcc6307", 400);
    if (var_4992594dd7ee57b6 <= 0) {
        return;
    }
    maxspeed = getdvarfloat(@"hash_a60f6bc28d9bc0c6", 1400);
    wait 0.2;
    while (!function_bd2a29feef8f2889()) {
        movementinput = self getnormalizedmovement();
        if (length(movementinput) > 0) {
            worlddir = rotatevector((movementinput[0], -1 * movementinput[1], 0), self.angles);
            velocity = self getvelocity();
            speed = length(velocity);
            var_3b61b63c7e59f697 = worlddir * var_4992594dd7ee57b6 * level.framedurationseconds;
            newvel = velocity + var_3b61b63c7e59f697;
            newspeed = length(newvel);
            if (newspeed <= maxspeed) {
                self setvelocity(newvel);
            } else if (speed < maxspeed) {
                newvel = vectornormalize(newvel) * maxspeed;
                self setvelocity(newvel);
            }
        }
        waitframe();
    }
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1231
// Size: 0x26
function function_bd2a29feef8f2889() {
    return self isonground() || self isonladder() || self ismantling() || self isswimming();
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1260
// Size: 0x2c3
function playerapplyjumpvelocity(angledir, maxjumpvelocity, fraction, startoffset) {
    var_355760d151d56e05 = 1;
    var_b2d80e99c4ea7f00 = (0, 0, 20);
    if (!isdefined(startoffset)) {
        startoffset = var_b2d80e99c4ea7f00;
    }
    player_angles = angledir;
    ground_normal = (0, 0, 1);
    fwd = (1, 0, 0);
    if (getdvarint(@"hash_ce6d7d66848cdbcc", var_355760d151d56e05)) {
        if (istrue(level.var_ec4da42b3bbf344c.var_5ba111ae6c83effe)) {
            ground_normal = get_ground_normal();
            if (!isdefined(ground_normal)) {
                ground_normal = (0, 0, 1);
            }
        }
        yawangles = (0, player_angles[1], 0);
        right = anglestoright(yawangles);
        fwd = vectorcross(ground_normal, right);
        var_829ceac2f5ec057b = vectortoangles(fwd);
        ground_pitch = angleclamp180(var_829ceac2f5ec057b[0]);
        min_pitch = -85;
        max_pitch = ground_pitch;
        player_pitch = player_angles[0];
        if (player_pitch > ground_pitch) {
            player_pitch = ground_pitch;
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
    velocity = dir * fraction * maxjumpvelocity;
    velocity = (velocity[0], velocity[1], 450);
    startorg = self.origin + startoffset;
    self setorigin(startorg, 0);
    self setvelocity(velocity);
    glassradiusdamage(self.origin + (0, 0, 30), 30, 50, 51);
    var_3a4a04b6ca3bf17d = anglestoforward(self.angles);
    var_cc05c7fa92d3f6ba = self.origin + (0, 0, 30) + var_3a4a04b6ca3bf17d * 15;
    radiusdamage(var_cc05c7fa92d3f6ba, 100, 1, 1);
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x152b
// Size: 0x26b
function get_ground_normal(traceignore, debug) {
    if (!isdefined(traceignore)) {
        ignore = self;
    } else {
        ignore = traceignore;
    }
    if (!isdefined(debug)) {
        debug = 0;
    }
    ignorelist = [ignore];
    tracepoints = [self.origin];
    for (i = -1; i <= 1; i += 2) {
        for (j = -1; j <= 1; j += 2) {
            corner = ignore getpointinbounds(i, j, 0);
            corner = (corner[0], corner[1], self.origin[2]);
            tracepoints[tracepoints.size] = corner;
        }
    }
    avgnormal = (0, 0, 0);
    tracehitcount = 0;
    foreach (point in tracepoints) {
        trace = scripts\engine\trace::_bullet_trace(point + (0, 0, 4), point + (0, 0, -16), 0, ignorelist);
        tracehit = trace["fraction"] > 0 && trace["fraction"] < 1;
        if (tracehit) {
            avgnormal += trace["normal"];
            tracehitcount++;
        }
        /#
            if (debug) {
                if (tracehit) {
                    line(point, point + trace["<dev string:x1c>"] * 30, (0, 1, 0));
                    continue;
                }
                sphere(point, 3, (1, 0, 0));
            }
        #/
    }
    if (tracehitcount > 0) {
        avgnormal /= tracehitcount;
        /#
            if (debug) {
                line(self.origin, self.origin + avgnormal * 20, (1, 1, 1));
            }
        #/
        return avgnormal;
    }
    /#
        if (debug) {
            sphere(self.origin, 5, (1, 0, 0));
        }
    #/
    return undefined;
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x179e
// Size: 0x47
function playerzombiejumpstop(powerstruct, powerref) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    waittillframeend();
    if (isdefined(self.var_17c60a92aea65107)) {
        function_a1b195bc24dae315(powerstruct, "jump");
        return;
    }
    self notify("playerZombieJumpStop");
}

// Namespace namespace_f46cce884171ed03 / namespace_e9836a64147a29e8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ed
// Size: 0x22d
function function_a1b195bc24dae315(powerstruct, powerref) {
    self stopgestureviewmodel("ges_zombie_superjumpcharge");
    self notify("playerZombieJumpChargeEnd");
    self notify("playerZombieJumpStop");
    var_eec1ca5327266614 = getdvarfloat(@"hash_f3adfe2ba0c4e72e", 0.25);
    var_e5482b00771c4909 = getdvarint(@"hash_2a5201ccbcd3b1a1", 1);
    var_b13a0e71ef0de57c = 1;
    if (self.var_17c60a92aea65107 >= var_eec1ca5327266614 && !function_77bab0532bc12f0e() && function_d4e7d5bfedb0b977() && !self ismantling()) {
        self playsoundtoplayer("zxp_superjump_vo", self, self);
        self playsoundonmovingent("zxp_superjump_sfx_npc");
        self playsoundonmovingent("jup_mp_mode_mutation_zombie_superjump_leap");
        self playsoundonmovingent("jup_mp_mode_mutation_zombie_superjump_whoosh");
        maxjumpvelocity = getdvarfloat(@"hash_fd6822a1c2607510", 1300);
        player_angles = self getplayerangles();
        self.var_1a7940ce78dd1720 = 1;
        thread function_a3335da8620d547c(self.origin);
        playerapplyjumpvelocity(player_angles, maxjumpvelocity, self.var_17c60a92aea65107);
        thread function_dd8a4b0712217000();
        self.var_f07121951ba8e9a5 = undefined;
        self.var_741cb4edf0f0590c = undefined;
    } else {
        if (var_e5482b00771c4909) {
            if (level.var_ec4da42b3bbf344c.var_a4a60d445462181d) {
                self.powershud[powerref].barelem.bar.frac = 0;
            } else {
                self.powershud[powerref].frac = 0;
            }
            function_936f0ef6e203a7fc(powerstruct.powers[powerref].var_b11f66f8bf2c2553, 0);
            self enableoffhandweapons();
            self allowmelee(1);
            self notify("endSuperJumpFov");
        }
        function_e63114420500fb();
        thread function_f2ddb7c78178c1be(powerstruct, powerref);
        if (istrue(self.var_e11136acf00d18f)) {
            function_936f0ef6e203a7fc(powerstruct.powers[powerref].var_b11f66f8bf2c2553, 100);
            var_b13a0e71ef0de57c = 0;
        }
    }
    playerzombiejumpcleanup(powerstruct, powerref, var_b13a0e71ef0de57c);
}
