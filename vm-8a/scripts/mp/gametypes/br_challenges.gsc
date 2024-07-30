#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using script_64acb6ce534155b7;
#using scripts\common\vehicle_code.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace br_challenges;

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x72
function init() {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    registerchallenge("br_mastery_fiveContracts", &fivecontracts);
    registerchallenge("br_mastery_pointBlank_airstrike", &pointblank_airstrike);
    registerchallenge("br_mastery_pointBlank_tomahawk", &pointblank_tomahawk);
    registerchallenge("br_mastery_c4VehicleMultKill", &c4vehiclemultkill);
    registerchallenge("br_mastery_ghostRideWhip", &ghostridewhip);
    registerchallenge("br_mastery_roundKillExecute", &roundkillexecute);
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307
// Size: 0x5a
function registerchallenge(challengeref, challengefunc) {
    if (!isdefined(level.br_challenges)) {
        level.br_challenges = [];
    }
    assertex(!isdefined(level.br_challenges[challengeref]), "br challenge '" + challengeref + "' already defined!");
    level.br_challenges[challengeref] = challengefunc;
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x369
// Size: 0x4f
function challengeevaluator(challengeref, paramstruct) {
    assert(isdefined(challengeref));
    if (!isdefined(level.br_challenges)) {
        return;
    }
    challengefunc = level.br_challenges[challengeref];
    if (isdefined(challengefunc)) {
        self thread [[ challengefunc ]](challengeref, paramstruct);
    }
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x38
function awardmasterychallenge(challengeref) {
    if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
        iprintlnbold("Mastery Challenge: " + challengeref + " completed!");
    }
    scripts\cp_mp\challenges::oncollectitem(challengeref);
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0xe4
function fivecontracts(challengeref, paramstruct) {
    if (!isdefined(self.team)) {
        return;
    }
    if (get_int_or_0(self.brmissionscompleted) < 5) {
        return;
    }
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    foreach (player in level.teamdata[self.team]["players"]) {
        if (!isreallyalive(player)) {
            return;
        }
        if (var_a11643fdeedee81b && player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
            return;
        }
    }
    awardmasterychallenge(challengeref);
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec
// Size: 0x12d
function pointblank_airstrike(challengeref, paramstruct) {
    plane = paramstruct.plane;
    targetsite = paramstruct.targetsite;
    if (!isdefined(plane) || !isdefined(plane.airstrikeid) || !isdefined(plane.streakinfo) || !isdefined(targetsite)) {
        return;
    }
    streakinfo = plane.streakinfo;
    if (distancesquared(self.origin, targetsite) > squared(432)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("pointBlank_airstrike_killtracker");
    self endon("pointBlank_airstrike_killtracker");
    waittill_any_timeout_1(10, "airstrike_finished_" + plane.airstrikeid);
    if (!isreallyalive(self)) {
        return;
    }
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
            iprintlnbold("<dev string:x1c>" + challengeref + "<dev string:x30>" + streakinfo.kills);
        }
    #/
    if (streakinfo.kills >= 3) {
        awardmasterychallenge("br_mastery_pointBlankStreakKill");
    }
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x621
// Size: 0xe7
function pointblank_tomahawk(challengeref, paramstruct) {
    instreak = paramstruct.streakinfo;
    targetsite = paramstruct.targetsite;
    if (!isdefined(instreak)) {
        return;
    }
    if (!isdefined(targetsite)) {
        return;
    }
    if (distancesquared(self.origin, targetsite) > squared(432)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("pointBlank_tomahawk_killtracker");
    self endon("pointBlank_tomahawk_killtracker");
    scripts\engine\utility::waittill_any_timeout_2(20, "cluster_strike_finished");
    if (!isreallyalive(self)) {
        return;
    }
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0)) {
            iprintlnbold("<dev string:x1c>" + challengeref + "<dev string:x30>" + instreak.kills);
        }
    #/
    if (instreak.kills >= 3) {
        awardmasterychallenge("br_mastery_pointBlankStreakKill");
    }
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x711
// Size: 0x172
function c4vehiclemultkill(challengeref, paramstruct) {
    meansofdeath = paramstruct.meansofdeath;
    inflictor = paramstruct.inflictor;
    if (!isdefined(meansofdeath) || meansofdeath != "MOD_EXPLOSIVE") {
        return;
    }
    if (!isvalidinflictorc4vehicle(inflictor)) {
        return;
    }
    self endon("disconnect");
    level endon("game_ended");
    self notify("updateC4VehicleMultKill");
    self endon("updateC4VehicleMultKill");
    if (!isdefined(self.recentc4vehiclekillcount)) {
        self.recentc4vehiclekillcount = 0;
    }
    self.recentc4vehiclekillcount++;
    wait 4;
    /#
        if (getdvarint(@"hash_ad789c41a11e3f59", 0) && isdefined(self.recentc4vehiclekillcount)) {
            iprintlnbold("<dev string:x1c>" + challengeref + "<dev string:x30>" + self.recentc4vehiclekillcount);
        }
    #/
    if (isdefined(self.recentc4vehiclekillcount) && self.recentc4vehiclekillcount >= 3) {
        awardmasterychallenge(challengeref);
        cooperator = c4vehiclecooperator(inflictor);
        issameteam = isdefined(cooperator) && isdefined(cooperator.team) && isdefined(self.team) && cooperator.team == self.team;
        if (issameteam) {
            cooperator awardmasterychallenge(challengeref);
        }
    }
    self.recentc4vehiclekillcount = undefined;
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88b
// Size: 0x105
function isvalidinflictorc4vehicle(inflictor) {
    if (!isdefined(inflictor)) {
        return false;
    }
    if (isdefined(inflictor.vehiclename) && !inflictor vehicle_is_stopped()) {
        children = inflictor getlinkedchildren();
        foreach (child in children) {
            if (isdefined(child.weapon_name) && child.weapon_name == "c4_mp") {
                return true;
            }
        }
    } else if (isdefined(inflictor.weapon_name) && inflictor.weapon_name == "c4_mp") {
        parent = inflictor getlinkedparent();
        if (isdefined(parent) && isdefined(parent.vehiclename) && !parent vehicle_is_stopped()) {
            return true;
        }
    }
    return false;
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x58
function c4vehiclecooperator(inflictor) {
    if (isdefined(inflictor) && isdefined(inflictor.weapon_name) && inflictor.weapon_name == "c4_mp") {
        parent = inflictor getlinkedparent();
        if (isdefined(parent)) {
            return parent.owner;
        }
    }
    return undefined;
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0x1f
function roundkillexecute(challengeref, paramstruct) {
    awardmasterychallenge("br_mastery_roundKillExecute");
}

// Namespace br_challenges / scripts\mp\gametypes\br_challenges
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x108
function ghostridewhip(challengeref, paramstruct) {
    self endon("disconnect");
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    exitdriver = paramstruct.exitdriver;
    maderecentkill = paramstruct.maderecentkill;
    if (istrue(exitdriver)) {
        if (istrue(self.hasexiteddriver) && self.recentghostridekillcount != 0) {
            return;
        }
        self.hasexiteddriver = 1;
    }
    if (!istrue(self.hasexiteddriver)) {
        return;
    }
    self notify("ghostRideWhip");
    self endon("ghostRideWhip");
    if (!isdefined(self.recentghostridekillcount)) {
        self.recentghostridekillcount = 0;
    }
    if (istrue(maderecentkill)) {
        self.recentghostridekillcount++;
    }
    wait 4;
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.recentghostridekillcount) && self.recentghostridekillcount >= 3) {
        awardmasterychallenge(challengeref);
    }
    self.recentghostridekillcount = undefined;
    self.hasexiteddriver = undefined;
}

