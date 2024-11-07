#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_3433ee6b63c7e243;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using script_13d1c402f1421c35;
#using scripts\common\utility.gsc;
#using scripts\asm\juggernaut\juggernaut.gsc;

#namespace juggernaut;

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0xa2
function juggernaut(asmname) {
    self endon("asm_terminated");
    self endon("death");
    if (isdefined(self.subclass) && self.subclass == "juggernaut" || isdefined(self.agent_type) && self.agent_type == "juggernaut") {
        if (self.animsetname == "juggernaut" || self.animsetname == "juggernaut_cp" || self.animsetname == "juggernaut_lw") {
            scripts\asm\juggernaut\juggernaut::initanimspeedthresholds_juggernaut(self.animsetname);
        }
    }
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27a
// Size: 0x4a
function initanimspeedthresholds_juggernaut(animsetname) {
    if (animspeedthresholdsexist(animsetname)) {
        return;
    }
    anim.juggernautspeedthreholdsinitialized = 1;
    setspeedthreshold(animsetname, "walk", 40);
    setspeedthreshold(animsetname, "jog", 113);
    setspeedthreshold(animsetname, "run", 170);
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x1e4
function enable_casual_killer() {
    if (isdefined(self.combatmode)) {
        self.ck_combatmode = self.combatmode;
    }
    self function_9f82c74eb1b7caf9(0);
    self allowedstances("stand");
    self.cautiousnavigation = 1;
    self.dontmeleeme = 1;
    self.dontmelee = 1;
    self.ck_grenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    self.ck_aggressivemode = istrue(self.aggressivemode);
    self.aggressivemode = 1;
    self.ignoresuppression = 1;
    set_movement_speed(50);
    self.turnrate = 0.1;
    self.allowstrafe = 0;
    self.disablepistol = 1;
    self.dontsyncmelee = 1;
    self.disablebulletwhizbyreaction = 1;
    self.neversprintforvariation = 1;
    self.disablerunngun = 1;
    self.casualkiller = 1;
    self.dontgiveuponsuppression = 1;
    self.forcesuppressai = 1;
    self.pathenemyfightdist = 0;
    self.var_98add129a7ecb962 = 0;
    weapclass = weaponclass(self.weapon);
    scripts\asm\juggernaut\juggernaut::initanimspeedthresholds_juggernaut("juggernaut");
    self setbasearchetype("juggernaut");
    archetypeoverride = "casual_killer";
    if (weapclass == "mg") {
        archetypeoverride = "casual_killer_lmg";
    }
    self setoverridearchetype("demeanor", archetypeoverride, 1);
    thread casual_killer_targeting();
    if (weapclass == "mg" || weapclass == "rifle" || weapclass == "smg") {
        thread casual_killer_sweep();
    }
    if (weapclass == "rifle" || weapclass == "smg") {
        self.shootstyleoverride = "full";
    }
    thread casual_killer_enemy_reaction();
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x17
function disable_casual_killer() {
    if (!istrue(self.leavecasualkiller)) {
        thread disable_casual_killer_internal();
    }
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7
// Size: 0x269
function disable_casual_killer_internal() {
    if (!isdefined(level.casualkillernewenemyreaction) || gettime() > level.casualkillernewenemyreaction) {
        self.newenemyreactiontime = gettime() + 3000;
        self.newenemyreaction = 1;
        self.forcenewenemyreaction = 1;
    }
    self.leavecasualkiller = 1;
    self clearentitytarget();
    self.favoriteenemy = undefined;
    self.gunposeoverride = undefined;
    if (isdefined(self.pathgoalpos)) {
        self setbtgoalpos(4, self getposonpath(64));
    }
    /#
        if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
            thread function_f8bf65b96ea0085e();
        }
    #/
    waittill_any_2("leaveCasualKiller", "death");
    if (!isalive(self) || !isdefined(self)) {
        return;
    }
    self.cautiousnavigation = 0;
    self.dontmeleeme = 0;
    self.grenadeammo = self.ck_grenadeammo;
    if (istrue(self.ck_aggressivemode)) {
        self.aggressivemode = 1;
    }
    utility::lookatentity(undefined);
    utility::lookatpos(undefined);
    self.ignoresuppression = 0;
    self.dontmelee = 0;
    self.turnrate = 0.3;
    utility::clear_movement_speed();
    self.disablepistol = 0;
    self.allowstrafe = 1;
    self.dontsyncmelee = undefined;
    self.disablebulletwhizbyreaction = 0;
    self.neversprintforvariation = undefined;
    self.disablerunngun = 0;
    self.casualkiller = 0;
    self.casualkillershootpos = undefined;
    self.pathenemyfightdist = 192;
    self.dontevershoot = 0;
    self.shootstyleoverride = undefined;
    self.dontgiveuponsuppression = undefined;
    self.forcesuppressai = 0;
    self.gunposeoverride = undefined;
    self.aimyawspeed = 0;
    self clearbtgoal(4);
    if (isdefined(self.ck_target)) {
        self.ck_target delete();
    }
    self.var_98add129a7ecb962 = 1;
    self allowedstances("stand", "crouch", "prone");
    self function_9f82c74eb1b7caf9(1);
    if (isdefined(self.ck_combatmode)) {
        self.combatmode = self.ck_combatmode;
        self.ck_combatmode = undefined;
        return;
    }
    self.combatmode = "cover";
}

/#

    // Namespace juggernaut / scripts\asm\juggernaut\juggernaut
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x748
    // Size: 0x4b
    function function_f8bf65b96ea0085e() {
        self endon("<dev string:x1c>");
        self endon("<dev string:x2e>");
        while (true) {
            sphere(self.origin + (0, 0, 60), 4, (0, 1, 0), 0, 1);
            waitframe();
        }
    }

#/

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x79b
// Size: 0x6f
function casual_killer_damage_func(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon) {
    if (is_equal(attacker, level.player)) {
        self notify("ck_player_attacked_me");
    }
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x812
// Size: 0x66
function casual_killer_enemy_reaction() {
    self endon("leaveCasualKiller");
    self endon("death");
    if (!isdefined(self.damage_functions)) {
        self.damage_functions = [];
    }
    self.damage_functions[self.damage_functions.size] = &casual_killer_damage_func;
    self waittill("ck_player_attacked_me");
    self.favoriteenemy = undefined;
    self clearentitytarget();
    self setthreatbiasgroup("axis");
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x880
// Size: 0x46d
function casual_killer_targeting() {
    self endon("leaveCasualKiller");
    self endon("death");
    wait 1;
    self.ck_target = spawn("script_origin", self.origin);
    thread delete_on_death(self.ck_target);
    currentenemy = undefined;
    var_47bccb924d51b014 = 0;
    enemydeathtime = undefined;
    var_d9f67b70125e4d15 = undefined;
    while (true) {
        waitframe();
        if (!isdefined(self) || !isalive(self) || istrue(self.leavecasualkiller)) {
            return;
        }
        self.gunposeoverride = "disable";
        forward = anglestoforward(self.angles);
        var_63a5b32b096323be = self getshootfrompos();
        if (var_47bccb924d51b014) {
            if (!isalive(currentenemy)) {
                enemydeathtime = gettime();
                self setentitytarget(self.ck_target);
                self forcethreatupdate();
                var_47bccb924d51b014 = 0;
                var_d9f67b70125e4d15 = undefined;
            } else {
                self.ck_target.origin = currentenemy.origin;
            }
        }
        framecount = int(gettime() / 50);
        if (self getentitynumber() % 4 != framecount % 4) {
            if (isdefined(enemydeathtime) && enemydeathtime + 3000 > gettime()) {
                totarget = self.ck_target.origin - self.origin;
                if (length(totarget) > 100) {
                    totarget = vectornormalize(totarget);
                    var_b38f9f63c4ae4218 = abs(angleclamp180(acos(clamp(vectordot(forward, totarget), -1, 1))));
                    if (var_b38f9f63c4ae4218 > 30 && gettime() < enemydeathtime + 1500) {
                        continue;
                    }
                    if (var_b38f9f63c4ae4218 < 90) {
                        continue;
                    }
                }
            }
            enemydeathtime = undefined;
            if (!isdefined(var_d9f67b70125e4d15) || gettime() > var_d9f67b70125e4d15 + 3000) {
                self clearentitytarget();
                self forcethreatupdate();
                if (isalive(self.enemy)) {
                    if (var_47bccb924d51b014 && self.enemy == currentenemy) {
                        potentialtarget = self.enemy;
                        toenemy = self.enemy.origin - self.origin;
                        toenemy = vectornormalize(toenemy);
                        dot = clamp(vectordot(forward, toenemy), -1, 1);
                        angletoenemy = abs(angleclamp180(acos(dot)));
                        if (angletoenemy > 70) {
                            secondarytargets = self getsecondarytargets();
                            if (isdefined(secondarytargets)) {
                                foreach (secondarytarget in secondarytargets) {
                                    totarget = secondarytarget.origin - self.origin;
                                    totarget = vectornormalize(totarget);
                                    var_b38f9f63c4ae4218 = abs(angleclamp180(acos(clamp(vectordot(forward, totarget), -1, 1))));
                                    if (var_b38f9f63c4ae4218 < angletoenemy) {
                                        angletoenemy = var_b38f9f63c4ae4218;
                                        potentialtarget = secondarytarget;
                                    }
                                }
                                if (potentialtarget != self.enemy) {
                                    if (issentient(potentialtarget)) {
                                        self.favoriteenemy = potentialtarget;
                                        self forcethreatupdate();
                                        self.favoriteenemy = undefined;
                                        var_d9f67b70125e4d15 = gettime();
                                    }
                                }
                            }
                        }
                    }
                    var_47bccb924d51b014 = isalive(self.enemy);
                    if (var_47bccb924d51b014) {
                        currentenemy = self.enemy;
                    } else {
                        currentenemy = undefined;
                    }
                    continue;
                }
                self setentitytarget(self.ck_target);
                self forcethreatupdate();
                if (isdefined(enemydeathtime) && enemydeathtime + 7000 > gettime()) {
                    if (vectordot(forward, self.ck_target.origin - var_63a5b32b096323be) > 0) {
                        continue;
                    }
                }
                self.ck_target.origin = self.origin + (0, 0, 40) + forward * 400;
            }
        }
    }
}

// Namespace juggernaut / scripts\asm\juggernaut\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5
// Size: 0x6b8
function casual_killer_sweep() {
    self endon("leaveCasualKiller");
    self endon("death");
    var_cc9867c158efea96 = 100;
    sweepmaxdistance = 1000;
    var_455248ba6a05b7f6 = 20;
    sweepdirection = -1;
    sweepspeeds = [40, 50, 60];
    var_6d41eacb164da117 = [20, 25, 30];
    var_4ac58fb63979cc4 = 0;
    var_728f77917e6cf88f = 0;
    sweepspeed = random(sweepspeeds);
    sweepmaxangle = random(var_6d41eacb164da117);
    sweepstoptime = 0;
    shootatpos = undefined;
    var_3085bde8d3b9f336 = undefined;
    foreach (maxangle in var_6d41eacb164da117) {
        if (maxangle > var_4ac58fb63979cc4) {
            var_4ac58fb63979cc4 = maxangle;
        }
    }
    while (isalive(self) && isdefined(self)) {
        waitframe();
        self.leftaimlimit = 90;
        self.rightaimlimit = -90;
        self.aimyawspeed = 180;
        forward = anglestoforward(self.angles);
        var_63a5b32b096323be = self getshootfrompos();
        if (isdefined(self.enemy)) {
            if (!isdefined(self.pathgoalpos) || self.lookaheaddist > self aigetdesiredspeed()) {
                shootatpos = self.enemy getshootatpos();
            }
        }
        var_7dff387edf36893b = asm_currentstatehasflag(self.var_a709fbd9fea148f6, "aim") || asm_currentstatehasflag(self.var_a709fbd9fea148f6, "notetrackAim");
        if (var_7dff387edf36893b) {
            var_7dff387edf36893b = isdefined(shootatpos);
        }
        currentstate = asm_getcurrentstate(self.asmname);
        if (currentstate == "exposed_arrival" || currentstate == "exposed_reload") {
            var_7dff387edf36893b = 0;
        }
        if (var_7dff387edf36893b) {
            var_f58d35ffffdf0e30 = self getposonpath(self aigetdesiredspeed());
            var_778d002d5be90b60 = shootatpos - var_f58d35ffffdf0e30;
            var_778d002d5be90b60 = (var_778d002d5be90b60[0], var_778d002d5be90b60[1], 0);
            var_3c8323340d37bffd = vectornormalize(var_778d002d5be90b60);
            aimlimit = self.leftaimlimit;
            if (!istrue(var_3085bde8d3b9f336)) {
                aimlimit = max(0, self.leftaimlimit - 20);
            }
            var_9625b7f28569e37a = abs(angleclamp180(acos(clamp(vectordot(var_3c8323340d37bffd, forward), -1, 1))));
            if (var_9625b7f28569e37a >= aimlimit) {
                shootatpos = undefined;
                sweepstoptime = 0;
                var_7dff387edf36893b = 0;
            }
        }
        if (!istrue(var_7dff387edf36893b)) {
            utility::lookatentity(undefined);
            utility::lookatpos(var_63a5b32b096323be + forward * 200);
            self.casualkillershootpos = var_63a5b32b096323be + forward * 200;
            var_455248ba6a05b7f6 = 20 * sweepdirection;
            sweepdirection *= -1;
            sweepstoptime = 0;
            self.dontevershoot = 1;
            var_3085bde8d3b9f336 = 0;
            continue;
        }
        var_3085bde8d3b9f336 = 1;
        self.dontevershoot = 0;
        if (isdefined(shootatpos)) {
            utility::lookatpos(shootatpos);
            /#
                if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
                    line(var_63a5b32b096323be, shootatpos, (1, 0, 0), 1, 0, 1);
                    sphere(shootatpos, 4, (1, 0, 0), 0, 1);
                }
            #/
        } else {
            utility::lookatentity(undefined);
            utility::lookatpos(undefined);
        }
        var_778d002d5be90b60 = shootatpos - var_63a5b32b096323be;
        var_10f0ce3cffed6abb = length(var_778d002d5be90b60);
        var_3c8323340d37bffd = vectornormalize(var_778d002d5be90b60);
        var_9625b7f28569e37a = abs(angleclamp180(acos(clamp(vectordot(forward, var_3c8323340d37bffd), -1, 1))));
        var_40577e9afa2538df = axistoangles(var_3c8323340d37bffd, anglestoright(self.angles), anglestoup(self.angles));
        var_1d68d29c186725d1 = var_40577e9afa2538df[1];
        if (istrue(self.leavecasualkiller)) {
            if (var_455248ba6a05b7f6 > 0) {
                var_455248ba6a05b7f6 -= min(var_455248ba6a05b7f6, sweepspeed * level.framedurationseconds);
                sweepdirection = -1;
            } else if (var_455248ba6a05b7f6 < 0) {
                var_455248ba6a05b7f6 += min(var_455248ba6a05b7f6 * -1, sweepspeed * level.framedurationseconds);
                sweepdirection = 1;
            }
        } else if (var_9625b7f28569e37a + var_4ac58fb63979cc4 < abs(self.leftaimlimit) && var_9625b7f28569e37a + var_4ac58fb63979cc4 < abs(self.rightaimlimit) && var_10f0ce3cffed6abb > var_cc9867c158efea96 && (var_10f0ce3cffed6abb < sweepmaxdistance || isdefined(self.enemy) && self.enemy == level.player)) {
            if (gettime() > var_728f77917e6cf88f) {
                var_f661d02c9f3036b = level.framedurationseconds * sweepspeed * sweepdirection;
                var_455248ba6a05b7f6 += var_f661d02c9f3036b;
                if (sign(var_455248ba6a05b7f6) == sign(sweepdirection) && abs(var_455248ba6a05b7f6) > sweepmaxangle) {
                    sweepdirection *= -1;
                    sweepspeed = random(sweepspeeds);
                    sweepmaxangle = random(var_6d41eacb164da117);
                    var_728f77917e6cf88f = gettime() + 350;
                }
            }
            var_1d68d29c186725d1 += var_455248ba6a05b7f6;
        }
        var_a1142e485a655fec = axistoangles(var_3c8323340d37bffd, anglestoright(self.angles), anglestoup(self.angles));
        var_a1142e485a655fec = (var_a1142e485a655fec[0], var_1d68d29c186725d1, var_a1142e485a655fec[2]);
        var_3c8323340d37bffd = anglestoforward(var_a1142e485a655fec);
        self.casualkillershootpos = var_3c8323340d37bffd * var_10f0ce3cffed6abb + var_63a5b32b096323be;
        /#
            if (getdvarint(@"hash_d7f290f0d986c37", 0) == 1) {
                if (isdefined(self.casualkillershootpos)) {
                    var_63a5b32b096323be = self getshootfrompos();
                    line(var_63a5b32b096323be, self.casualkillershootpos, (0, 1, 0), 1, 0, 1);
                    sphere(self.casualkillershootpos, 5, (0, 1, 0), 0, 1);
                }
            }
            if (getdvarint(@"hash_960706093ece3d0c", 0) == 1) {
                sphere(self.origin, var_cc9867c158efea96, (1, 1, 1), 0, 1);
                sphere(self.origin, sweepmaxdistance, (0, 0, 0), 0, 1);
            }
        #/
        if (istrue(self.leavecasualkiller) && var_455248ba6a05b7f6 == 0) {
            return;
        }
    }
}
