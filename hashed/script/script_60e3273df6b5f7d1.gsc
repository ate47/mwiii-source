// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using script_5def7af2a9f04234;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\stealth\debug.gsc;

#namespace ai_sentry_turret;

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x3f0
function init() {
    if (getdvarint(@"hash_70d8cba45c5014ec", 1) == 0) {
        return;
    }
    level.aiSentryTurrets = spawnstruct();
    level.aiSentryTurrets.var_545db13b94c9e4d = getdvarint(@"hash_e2a4ecaa972fb581", 15);
    level.aiSentryTurrets.var_a4186f089a36d2f0 = getdvarint(@"hash_6a8c234b065d124c", 3);
    level.aiSentryTurrets.var_a4cd5b9ae4a509f4 = [];
    level.aiSentryTurrets.var_325f9f15252b4928 = &function_2d24ee630d6c37e2;
    level.sentrysettings["ai_sentry_turret"] = spawnstruct();
    level.sentrysettings["ai_sentry_turret"].health = 999999;
    level.sentrysettings["ai_sentry_turret"].maxhealth = 650;
    level.sentrysettings["ai_sentry_turret"].burstmin = 20;
    level.sentrysettings["ai_sentry_turret"].burstmax = 120;
    level.sentrysettings["ai_sentry_turret"].pausemin = 0.15;
    level.sentrysettings["ai_sentry_turret"].pausemax = 0.35;
    level.sentrysettings["ai_sentry_turret"].lockstrength = 6;
    level.sentrysettings["ai_sentry_turret"].sentrymodeon = "sentry";
    level.sentrysettings["ai_sentry_turret"].var_7c46d96a6fedd4cd = "manual";
    level.sentrysettings["ai_sentry_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["ai_sentry_turret"].spinuptime = 1.5;
    level.sentrysettings["ai_sentry_turret"].overheattime = 8;
    level.sentrysettings["ai_sentry_turret"].cooldowntime = 0.3;
    level.sentrysettings["ai_sentry_turret"].var_aa507124549d7490 = 4;
    level.sentrysettings["ai_sentry_turret"].var_6265b628c3ed1103 = 3;
    level.sentrysettings["ai_sentry_turret"].var_87d927a08cbfdf3f = 1;
    level.sentrysettings["ai_sentry_turret"].leftarc = 80;
    level.sentrysettings["ai_sentry_turret"].rightarc = 80;
    level.sentrysettings["ai_sentry_turret"].fxtime = 0.3;
    level.sentrysettings["ai_sentry_turret"].var_951af53d31931d09 = 1024;
    level.sentrysettings["ai_sentry_turret"].weaponinfo = "sentry_turret_mp";
    level.sentrysettings["ai_sentry_turret"].playerweaponinfo = "sentry_turret_mp";
    level.sentrysettings["ai_sentry_turret"].modelbaseground = "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings["ai_sentry_turret"].modeldestroyedground = "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings["ai_sentry_turret"].var_d7a3afc17fe9204b = "tag_flash";
    level.sentrysettings["ai_sentry_turret"].scorepopup = "destroyed_sentry";
    level.sentrysettings["ai_sentry_turret"].lightfxtag = "tag_fx";
    if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
        namespace_37f0fb6355a4618a::function_44739fe1cf82e29a("aiSentryTurrets");
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c9
// Size: 0x2a1
function function_2d24ee630d6c37e2() {
    while (!flag_exist("create_script_initialized")) {
        if (!flag_exist("poi_initialized")) {
            waitframe();
        } else {
            break;
        }
    }
    while (!flag_exist("poi_initialized")) {
        flag_wait("create_script_initialized");
    }
    /#
        level thread function_fc46b0f912ca62f();
    #/
    var_76bc16f4e15dec1c = namespace_37f0fb6355a4618a::function_47d356083884f913();
    poiName = undefined;
    level.aiSentryTurrets.var_fd5ea9cb37c309d3 = array_randomize(getstructarray("aiSentryTurret", "script_noteworthy"));
    foreach (spawnloc in level.aiSentryTurrets.var_fd5ea9cb37c309d3) {
        var_de58ca0235ee107b = 1;
        if (level.aiSentryTurrets.var_a4cd5b9ae4a509f4.size >= level.aiSentryTurrets.var_545db13b94c9e4d) {
            var_de58ca0235ee107b = 0;
        } else if (var_76bc16f4e15dec1c) {
            if (!isdefined(spawnloc.poi)) {
                spawnloc.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(spawnloc.origin);
            }
            if (!isdefined(spawnloc.poi) || !namespace_37f0fb6355a4618a::poi_isPOIActive(spawnloc.poi)) {
                var_de58ca0235ee107b = 0;
            } else if (level.poi[spawnloc.poi]["aiSentryTurrets"].size >= level.aiSentryTurrets.var_a4186f089a36d2f0) {
                var_de58ca0235ee107b = 0;
            }
        }
        if (var_de58ca0235ee107b) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("ai_sentry_turret", "additionalApproveSpawn")) {
                var_de58ca0235ee107b = [[ namespace_3c37cb17ade254d::getsharedfunc("ai_sentry_turret", "additionalApproveSpawn") ]](spawnloc);
            }
        }
        if (var_de58ca0235ee107b) {
            spawnloc.var_1b096843a2175f92 = 1;
            turret = function_f33b0afadf9107eb(spawnloc);
            level.aiSentryTurrets.var_a4cd5b9ae4a509f4[level.aiSentryTurrets.var_a4cd5b9ae4a509f4.size] = turret;
            if (var_76bc16f4e15dec1c && isdefined(spawnloc.poi)) {
                level.poi[spawnloc.poi]["aiSentryTurrets"][level.poi[spawnloc.poi]["aiSentryTurrets"].size] = turret;
                namespace_37f0fb6355a4618a::function_d0e7647e5538eb9d(spawnloc.poi, "aiSentryTurrets", turret);
            }
        }
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa71
// Size: 0x79
function function_2dd8dd0ebc078f25() {
    wait(10);
    config = level.sentrysettings["ai_sentry_turret"];
    var_b5deff62ba0378ca = spawnstruct();
    var_b5deff62ba0378ca.origin = (2644, -4359, 10);
    var_b5deff62ba0378ca.angles = (0, 180, 0);
    if (isdefined(var_b5deff62ba0378ca)) {
        turret = function_f33b0afadf9107eb(var_b5deff62ba0378ca);
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1
// Size: 0x3df
function function_f33b0afadf9107eb(var_b5deff62ba0378ca, team) {
    if (getdvarint(@"hash_70d8cba45c5014ec", 1) == 0) {
        return;
    }
    if (!isdefined(team)) {
        team = "team_hundred_ninety_five";
    }
    config = level.sentrysettings["ai_sentry_turret"];
    if (!isdefined(var_b5deff62ba0378ca.angles)) {
        var_b5deff62ba0378ca.angles = (0, 0, 0);
    }
    turret = spawnturret("misc_turret", var_b5deff62ba0378ca.origin, config.weaponinfo);
    turret.angles = var_b5deff62ba0378ca.angles;
    turret.health = 9999;
    turret.maxhealth = config.maxhealth;
    turret.ammocount = config.ammo;
    turret.timeout = config.timeout;
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 0.1;
    turret.sentrytype = "ai_sentry_turret";
    turret.owningteam = team;
    turret.team = team;
    turret setmodel(config.modelbaseground);
    turret setturretteam(turret.owningteam);
    turret setcandamage(1);
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret setautorotationdelay(0.5);
    turret maketurretinoperable();
    leftarc = float(ter_op(isdefined(var_b5deff62ba0378ca.leftarc), var_b5deff62ba0378ca.leftarc, config.leftarc));
    turret.leftarc = leftarc;
    turret setleftarc(leftarc);
    rightarc = float(ter_op(isdefined(var_b5deff62ba0378ca.rightarc), var_b5deff62ba0378ca.rightarc, config.rightarc));
    turret.rightarc = rightarc;
    turret setrightarc(rightarc);
    turret setbottomarc(50);
    turret settoparc(60);
    turret setconvergencetime(1, "pitch");
    turret setconvergencetime(1, "yaw");
    turret setconvergenceheightpercent(0.9);
    turret setdefaultdroppitch(-89);
    turret setturretmodechangewait(1);
    turret namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_76189206d67bd21c);
    turret namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_1ef2976b1357c651);
    turret laseron();
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    turret thread namespace_3e725f3cc58bddd3::monitordamage(turret.maxhealth, "hitequip", &function_4424088da3075b69, &function_cb32fe838a62170f, 1);
    turret thread function_b0faca885d335f8b(turret);
    turret thread function_f9dcbe0ab7aac5f6();
    turret thread function_9e099b94cb9fc336();
    turret thread function_352e4c58083275a4();
    turret.turreton = 1;
    turret setmode(config.sentrymodeon);
    return turret;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed8
// Size: 0x172
function function_4424088da3075b69(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.sentrytype];
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    if (isdefined(attacker)) {
        guy = ter_op(isdefined(attacker.owner), attacker.owner, attacker);
        if (isplayer(guy)) {
            var_7ec7671a1e0c788f = spawnstruct();
            var_7ec7671a1e0c788f.var_b421b1d42317ccb2 = 1;
            guy thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2b5885666af24123", objweapon, undefined, undefined, self, undefined, undefined, 0, var_7ec7671a1e0c788f, 1);
        }
    }
    self.var_1e0eb63ecb3f1e2 = 0;
    self.stopfiring = 1;
    self laseroff();
    self notify("kill_turret", explosivedamage);
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1051
// Size: 0x7b
function function_cb32fe838a62170f(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    return damage;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d4
// Size: 0xf0
function function_f9dcbe0ab7aac5f6() {
    self endon("death");
    self endon("kill_turret");
    config = level.sentrysettings[self.sentrytype];
    while (1) {
        if (!istrue(self.turreton) || istrue(self.turretdisabled)) {
            waitframe();
            continue;
        }
        besttarget = function_22deb1e23a622fff();
        var_1b951c4e47ba5c35 = 1;
        if (isdefined(besttarget)) {
            if (issharedfuncdefined("player", "isReallyAlive")) {
                if (![[ getsharedfunc("player", "isReallyAlive") ]](besttarget)) {
                    var_1b951c4e47ba5c35 = 0;
                }
            }
            if (var_1b951c4e47ba5c35) {
                thread namespace_f2ffc0540883e1ad::drawline(besttarget.origin, self.origin, 5, (0, 0, 1));
                function_eb48fdf891a4e9ee(besttarget);
                namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(config.cooldowntime);
            }
        }
        waitframe();
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11cb
// Size: 0xad
function function_eb48fdf891a4e9ee(besttarget) {
    config = level.sentrysettings[self.sentrytype];
    while (istrue(self.turreton) && !istrue(self.stopfiring) && function_c5754fdac13fc2a5(besttarget)) {
        self settargetentity(besttarget);
        if (isplayer(besttarget)) {
            var_6e7b6acdc197a7ec = config.var_6265b628c3ed1103;
        } else {
            var_6e7b6acdc197a7ec = config.var_87d927a08cbfdf3f;
        }
        function_ba7df6eeacb835f6(config.var_aa507124549d7490, besttarget);
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_6e7b6acdc197a7ec);
        self cleartargetentity(besttarget);
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127f
// Size: 0x140
function function_22deb1e23a622fff() {
    config = level.sentrysettings[self.sentrytype];
    var_951af53d31931d09 = config.var_951af53d31931d09;
    var_52edc18a611b938d = var_951af53d31931d09 * var_951af53d31931d09;
    var_b80dbedf22c6d394 = utility::playersinsphere(self.origin, var_951af53d31931d09);
    besttarget = undefined;
    var_b3f7f2ddf0fd4828 = undefined;
    foreach (potentialtarget in var_b80dbedf22c6d394) {
        var_e85a3b23195a0fe0 = function_10f997ed68f4fcef(potentialtarget);
        if (!istrue(var_e85a3b23195a0fe0)) {
            continue;
        }
        startpoint = self gettagorigin("tag_flash");
        endpoint = potentialtarget.origin;
        var_5e048634c072b43b = distancesquared(startpoint, endpoint);
        if (var_5e048634c072b43b <= var_52edc18a611b938d) {
            if (!isdefined(besttarget) && !isdefined(var_b3f7f2ddf0fd4828) || var_5e048634c072b43b < var_b3f7f2ddf0fd4828) {
                besttarget = potentialtarget;
                var_b3f7f2ddf0fd4828 = var_5e048634c072b43b;
            }
        }
    }
    return besttarget;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c7
// Size: 0x73
function function_10f997ed68f4fcef(potentialtarget) {
    if (issharedfuncdefined("player", "isReallyAlive")) {
        if (![[ getsharedfunc("player", "isReallyAlive") ]](potentialtarget)) {
            return 0;
        }
    }
    if (istrue(potentialtarget.notarget)) {
        return 0;
    }
    if (istrue(potentialtarget.var_f6f8549c6fd27e85)) {
        return 0;
    }
    if (!function_bc0708b3cc5719c9(potentialtarget)) {
        return 0;
    }
    if (!function_f6f04fc4e42cf2c4(potentialtarget)) {
        return 0;
    }
    return 1;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1442
// Size: 0x7c
function function_c5754fdac13fc2a5(besttarget) {
    config = level.sentrysettings[self.sentrytype];
    maxrangesq = config.var_951af53d31931d09 * config.var_951af53d31931d09;
    if (distancesquared(self gettagorigin("tag_flash"), besttarget.origin) > maxrangesq) {
        return 0;
    }
    if (!function_10f997ed68f4fcef(besttarget)) {
        return 0;
    }
    return 1;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c6
// Size: 0x53
function function_bc0708b3cc5719c9(potentialtarget) {
    offset = vectornormalize(self.origin - potentialtarget.origin);
    dotproduct = vectordot(anglestoforward(self.angles), offset);
    return dotproduct < 0;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1521
// Size: 0xc9
function function_f6f04fc4e42cf2c4(potentialtarget) {
    var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    var_7e7a5a3c0a297a0b = [0:"j_mainroot", 1:"tag_origin", 2:"j_head"];
    canseetarget = 0;
    foreach (point in var_7e7a5a3c0a297a0b) {
        canseetarget = namespace_2a184fc4902783dc::ray_trace_passed(self gettagorigin("tag_flash"), potentialtarget gettagorigin(point), self, var_c3fbb6661b91750f);
        if (istrue(canseetarget)) {
            break;
        }
    }
    return canseetarget;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f2
// Size: 0x12c
function function_b0faca885d335f8b(turret) {
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = turret waittill("kill_turret");
    turret.killed = 1;
    turret function_caea36dc6c3ce373("destroyed");
    turret setturretowner(undefined);
    if (!istrue(var_b2797481a55c620)) {
        turret playsound("sentry_explode_smoke");
        turret setscriptablepartstate("shutdown", "on");
        turret.turreton = 0;
        turret.turretdisabled = 1;
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
        turret setscriptablepartstate("explode", "regular");
    } else {
        turret setscriptablepartstate("explode", "violent");
    }
    turret playsound("mp_equip_destroyed");
    if (isdefined(turret.colmodel)) {
        turret.colmodel delete();
    }
    wait(0.2);
    if (0) {
        level thread function_92fa86c7825c72e1(turret.origin, turret.angles, turret.leftarc, turret.rightarc, 4);
    }
    turret delete();
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1725
// Size: 0x85
function function_92fa86c7825c72e1(origin, angles, leftarc, rightarc, var_68faa79e3e6058fb) {
    wait(var_68faa79e3e6058fb);
    var_b5deff62ba0378ca = spawnstruct();
    var_b5deff62ba0378ca.origin = origin;
    var_b5deff62ba0378ca.angles = angles;
    var_b5deff62ba0378ca.leftarc = leftarc;
    var_b5deff62ba0378ca.rightarc = rightarc;
    turret = function_f33b0afadf9107eb(var_b5deff62ba0378ca);
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b1
// Size: 0x59
function function_caea36dc6c3ce373(type) {
    turretmodel = undefined;
    if (type == "destroyed") {
        turretmodel = level.sentrysettings[self.sentrytype].modeldestroyedground;
    }
    /#
        assertex(isdefined(turretmodel), "For some reason turretModel is not defined, this should never happen");
    #/
    self setmodel(turretmodel);
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1811
// Size: 0x2d
function function_9e099b94cb9fc336() {
    self endon("death");
    level waittill("game_ended");
    if (isdefined(self)) {
        self.colmodel delete();
        self delete();
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1845
// Size: 0x3d
function function_1279fb3b42ff8e1() {
    self endon("death");
    self endon("stop_shooting");
    self endon("kill_turret");
    level endon("game_ended");
    self playsound("sentry_gun_target_lock_beep");
    wait(0.19);
    self playsound("sentry_gun_target_lock_beep");
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1889
// Size: 0x1fd
function function_ba7df6eeacb835f6(var_be9fa813c1afa2c8, potentialtarget) {
    function_38edcf00cfd7f099();
    config = level.sentrysettings[self.sentrytype];
    firetime = weaponfiretime(config.weaponinfo);
    var_3746ec1befd86ae8 = config.burstmin;
    var_3e92cd336a99ce02 = config.burstmax;
    var_5f622c39d6661b23 = config.pausemin;
    var_42ae243cd994c3bd = config.pausemax;
    lockstrength = config.lockstrength;
    currenttime = 0;
    var_1b951c4e47ba5c35 = 1;
    while (istrue(self.turreton) && !istrue(self.stopfiring) && currenttime < var_be9fa813c1afa2c8 && var_1b951c4e47ba5c35) {
        numshots = randomintrange(var_3746ec1befd86ae8, var_3e92cd336a99ce02 + 1);
        for (i = 0; i < numshots && !self.overheated; i++) {
            if (!istrue(self.turreton) || istrue(self.stopfiring)) {
                break;
            }
            target = self getturrettarget(1);
            if (!isdefined(target)) {
                break;
            }
            self shootturret("tag_flash", lockstrength);
            wait(firetime);
            currenttime = currenttime + firetime;
        }
        if (!istrue(self.turreton) || istrue(self.stopfiring)) {
            break;
        }
        var_43559afed713d177 = randomfloatrange(var_5f622c39d6661b23, var_42ae243cd994c3bd);
        wait(var_43559afed713d177);
        currenttime = currenttime + var_43559afed713d177;
        if (issharedfuncdefined("player", "isReallyAlive")) {
            var_1b951c4e47ba5c35 = [[ getsharedfunc("player", "isReallyAlive") ]](potentialtarget);
        }
    }
    function_e711849fbc474180();
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8d
// Size: 0xa
function function_afe3c3af7cb5e39e() {
    function_e711849fbc474180();
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x70
function function_38edcf00cfd7f099() {
    config = level.sentrysettings[self.sentrytype];
    thread function_1279fb3b42ff8e1();
    while (istrue(self.turreton) && self.momentum < config.spinuptime) {
        self.momentum = self.momentum + 0.1;
        wait(0.1);
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b15
// Size: 0xd
function function_e711849fbc474180() {
    self.momentum = 0;
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b29
// Size: 0x40
function function_352e4c58083275a4() {
    self endon("kill_turret");
    level endon("game_ended");
    while (1) {
        wait(3);
        if (self isfiringturret()) {
            waitframe();
            continue;
        }
        playsoundatpos(self.origin, "sentry_gun_beep");
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b70
// Size: 0xd5
function function_704307eb2f1581ac(var_73d512f6ffef310d) {
    self endon("death");
    self endon("kill_turret");
    config = level.sentrysettings[self.sentrytype];
    self setmode(config.sentrymodeoff);
    self.turreton = 0;
    while (1) {
        player = var_73d512f6ffef310d waittill("trigger");
        if (!istrue(self.turreton)) {
            self.turreton = 1;
            self setmode(config.sentrymodeon);
            while (isalive(player) && player istouching(var_73d512f6ffef310d)) {
                waitframe();
            }
            self.turreton = 0;
            self setmode(config.sentrymodeoff);
            self notify("stop_shooting");
        }
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4c
// Size: 0x80
function function_76189206d67bd21c(data) {
    if (isdefined(data.attacker)) {
        if (issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ getsharedfunc("player", "doScoreEvent") ]]("disabled_sentry_gun");
        }
        if (issharedfuncdefined("sentry_gun", "empStarted")) {
            self [[ getsharedfunc("sentry_gun", "empStarted") ]]();
        }
    }
    function_e3217606f8218ae();
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd3
// Size: 0x3f
function function_1ef2976b1357c651(isdeath) {
    if (isdeath) {
        return;
    }
    if (issharedfuncdefined("sentry_gun", "empStarted")) {
        self [[ getsharedfunc("sentry_gun", "empCleared") ]]();
    }
    function_e3217606f8218ae();
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d19
// Size: 0x80
function function_e3217606f8218ae() {
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        self turretfiredisable();
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
        self laseroff();
    } else if (!istrue(self.killed)) {
        self turretfireenable();
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
        self laseron();
    }
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da0
// Size: 0x169
function function_fc46b0f912ca62f() {
    /#
        level endon("isReallyAlive");
        setdvarifuninitialized(@"hash_46a2f7c9bc7efd38", 0);
        while (1) {
            if (getdvarint(@"hash_46a2f7c9bc7efd38", 0) == 1) {
                foreach (loc in level.aiSentryTurrets.var_fd5ea9cb37c309d3) {
                    color = (1, 0, 0);
                    if (istrue(loc.var_1b096843a2175f92)) {
                        color = (0, 1, 0);
                        leftarc = level.sentrysettings["violent"].leftarc;
                        rightarc = level.sentrysettings["violent"].rightarc;
                        startpoint = loc.origin + (0, 0, 60);
                        namespace_91707ccc3e1bf8ff::function_ab68b8f1b9191d70(startpoint, 0 - rightarc, leftarc, loc.angles, 100, 1, 5, color);
                    }
                    /#
                        sphere(loc.origin, 64, color);
                    #/
                }
            }
            waitframe();
        }
    #/
}

// Namespace ai_sentry_turret/namespace_4338aec4322f6fdd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f10
// Size: 0x58
function debug_text(text, time) {
    /#
        stoptime = gettime() + time;
        while (gettime() < stoptime) {
            /#
                printtoscreen2d(750, 100, text, (0, 0, 1), 2.5);
            #/
            waitframe();
        }
    #/
}
