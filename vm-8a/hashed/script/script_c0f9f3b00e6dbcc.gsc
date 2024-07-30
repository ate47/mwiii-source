#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace proximity_alarm;

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9
// Size: 0x109
function function_477d655fc0ede218(grenade) {
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.tableinfo = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    if (!isdefined(grenade.tableinfo.bundle)) {
        assertmsg("Proximity Alarm needs a bundle.");
    }
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        grenade [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](grenade);
    }
    stuckdata = grenade function_c915e5763dc078cf();
    wait grenade.tableinfo.bundle.var_306cb5279846a31f;
    grenade function_641996b5e113c5c6(grenade, &function_1d903c2c067f77bf);
    grenade thread scripts\mp\equipment_interact::remoteinteractsetup(&function_4df209a3b80ffd1d, 0, 1);
    grenade thread scripts\mp\damage::monitordamage(1, "hitequip", &function_bdba171b0fab5fbe, undefined);
    grenade thread function_f7d04947b81081a7();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea
// Size: 0x2f2
function function_f7d04947b81081a7() {
    self endon("death");
    bundle = self.tableinfo.bundle;
    alarmradiussq = squared(default_to(bundle.var_e6d5ad219f8c614b, 50));
    alarmheight = default_to(bundle.var_1eb1d0dab9d4b3da, 100);
    var_f7f98e87323ea94f = default_to(bundle.var_4ddb34e9ecdc660, 10);
    upvector = anglestoup(self.angles);
    forwardvector = anglestoforward(self.angles);
    rightvector = anglestoright(self.angles);
    var_107d0658d6068808 = 0;
    numtargets = 0;
    minendtime = 0;
    while (!var_107d0658d6068808 || numtargets > 0 || gettime() < minendtime) {
        ents = level.players;
        numtargets = 0;
        foreach (ent in ents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent == self) {
                continue;
            }
            if (isagent(ent) || isplayer(ent)) {
                if (self.team == ent.team) {
                    continue;
                }
                vectortotarget = ent scripts\mp\utility\player::getstancetop() - self.origin;
                updot = vectordot(upvector, vectortotarget);
                if (0 <= updot && updot <= alarmheight) {
                    forwarddot = abs(vectordot(forwardvector, vectortotarget));
                    rightdot = abs(vectordot(rightvector, vectortotarget));
                    if (squared(forwarddot) + squared(rightdot) <= alarmradiussq && function_478a334e547f1d81(ent)) {
                        if (!var_107d0658d6068808) {
                            minendtime = gettime() + default_to(bundle.var_c64ce5d235aa94e0, 2) * 1000;
                        }
                        var_107d0658d6068808 = 1;
                        numtargets++;
                        if (!istrue(ent.var_ef86566cf4a91181)) {
                            self.owner thread function_5207653d43bf2fbf(ent, var_f7f98e87323ea94f);
                        }
                        pinglocationenemyteams(self.origin, ent.team);
                        self setscriptablepartstate("visibility", "show", 0);
                        self setscriptablepartstate("alarmSound", "sound", 0);
                        self setscriptablepartstate("alarmLights", "lights", 0);
                        wait 0.4;
                    }
                }
            }
        }
        wait 0.1;
    }
    thread function_2f7f72bc936b05d1();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e4
// Size: 0x40
function function_2f7f72bc936b05d1() {
    self setscriptablepartstate("alarmSound", "neutral", 0);
    self setscriptablepartstate("beacon", "neutral", 0);
    self setscriptablepartstate("fx_hide", "hide", 0);
    thread function_f7d04947b81081a7();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c
// Size: 0x69
function function_1d903c2c067f77bf(data) {
    if (istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, data.attacker))) {
        data.attacker notify("destroyed_equipment");
        data.attacker scripts\mp\killstreaks\killstreaks::givescoreforequipment(self);
    }
    self notify("enemy_destroyed_equipment", data.attacker);
    thread function_4df209a3b80ffd1d();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69d
// Size: 0x63
function function_4df209a3b80ffd1d() {
    self setscriptablepartstate("destroy", "active", 0);
    self notify("death");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        self [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](self);
    }
    function_83cebe0ae5318a7f(self);
    self delete();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x708
// Size: 0x43
function function_bdba171b0fab5fbe(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    function_c1b308dde4295460(data.attacker, data.objweapon);
    thread function_4df209a3b80ffd1d();
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x753
// Size: 0x7c
function function_5207653d43bf2fbf(player, duration) {
    player endon("disconnect");
    player.var_ef86566cf4a91181 = 1;
    player notify("proximity_alarm_triggered");
    result = player scripts\engine\utility::waittill_notify_or_timeout_return("death", duration);
    player.var_ef86566cf4a91181 = 0;
    if (result == "death" && scripts\cp_mp\utility\player_utility::playersareenemies(player, self)) {
        thread scripts\mp\utility\points::doScoreEvent(#"hash_7fe7bc6a888a48ba");
    }
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d7
// Size: 0x3f
function function_c1b308dde4295460(attacker, objweapon) {
    if (isdefined(attacker) && istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, attacker))) {
        attacker thread scripts\mp\utility\points::doScoreEvent(#"hash_b3b5a302d30dfd18");
    }
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81e
// Size: 0x41
function function_c915e5763dc078cf() {
    self endon("death");
    level endon("game_ended");
    self.owner endon("disconnect");
    stuckdata = spawnstruct();
    childthread function_2c84a3de26d79c8e(stuckdata);
    self waittill("missile_impact");
    return stuckdata;
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x868
// Size: 0x3f
function function_2c84a3de26d79c8e(stuckdata) {
    self endon("missile_impact");
    stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto)) {
        stuckdata.stuckto = stuckto;
    }
    self notify("missile_impact");
}

// Namespace proximity_alarm / namespace_b93a97d16ff2ddc6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8af
// Size: 0x14e
function function_478a334e547f1d81(target) {
    if (!isdefined(target)) {
        return false;
    }
    if (istrue(self.isjammed)) {
        return false;
    }
    tracecontents = scripts\engine\trace::create_contents(0, 1, 0, 1, 1, 1, 0, 1);
    defaultorigin = target.origin;
    tracepoints = [defaultorigin];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (scripts\mp\utility\player::isreallyalive(target)) {
            headpos = target scripts\mp\utility\player::getstancetop();
        }
        centerpos = (0, 0, 0);
        if (scripts\mp\utility\player::isreallyalive(target)) {
            centerpos = target scripts\mp\utility\player::getstancecenter();
        }
        tracepoints = [headpos, centerpos, defaultorigin];
    } else if (isagent(target)) {
        tracepoints = [defaultorigin + (0, 0, 1)];
    }
    ignorelist = [self, target];
    for (i = 0; i < tracepoints.size; i++) {
        if (!scripts\engine\trace::ray_trace_passed(self.origin, tracepoints[i], ignorelist, tracecontents)) {
            return false;
        }
        return true;
    }
    return false;
}
