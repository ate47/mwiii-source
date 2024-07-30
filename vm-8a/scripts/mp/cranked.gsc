#using scripts\mp\utility\damage.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace cranked;

// Namespace cranked / scripts\mp\cranked
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0x20
function registercrankedtimerdvar(dvarstring, value) {
    registerwatchdvarint("crankedBombTimer", value);
}

/#

    // Namespace cranked / scripts\mp\cranked
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3d1
    // Size: 0x35
    function setcrankeddvarfordev() {
        if (!isdefined(level.crankedbombtimer)) {
            level.crankedbombtimer = 30;
        }
        setdevdvarifuninitialized(@"hash_681596f27a5e0f7a", level.crankedbombtimer);
    }

#/

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40e
// Size: 0xaa
function makeplayercranked(event) {
    scripts\mp\utility\dialog::leaderdialogonplayer(event);
    setcrankedplayerbombtimer("kill");
    self.cranked = 1;
    self.supportcranked = 1;
    giveperk("specialty_fastreload");
    giveperk("specialty_quickdraw");
    giveperk("specialty_fastoffhand");
    giveperk("specialty_fastsprintrecovery");
    giveperk("specialty_marathon");
    giveperk("specialty_quickswap");
    giveperk("specialty_stalker");
    giveperk("specialty_sprintfire");
    self.movespeedscaler = 1.2;
    scripts\mp\weapons::updatemovespeedscale();
}

// Namespace cranked / scripts\mp\cranked
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c0
// Size: 0x1c5
function oncranked(victim, attacker, lifeid) {
    if (isdefined(victim)) {
        victim thread cleanupcrankedplayertimer();
    }
    if (isdefined(attacker.cranked)) {
        event = #"hash_9a398b6a291fcd80";
        attacker thread scripts\mp\rank::scoreeventpopup(#"time_added");
        attacker thread oncrankedkill(event);
        if (!istrue(scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924())) {
            attacker playlocalsound("jup_cranked_timer_refill");
        }
    } else if (isreallyalive(attacker) && (function_f698bfd3efa33302() || function_e9f3a160bbefe208(attacker))) {
        attacker makeplayercranked("begin_cranked");
        attacker thread scripts\mp\rank::scoreeventpopup(#"begin_cranked");
        if (!istrue(scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924())) {
            attacker playlocalsound("jup_cranked_timer_start");
        }
    }
    if (isdefined(victim) && isdefined(victim.attackers) && !isdefined(level.assists_disabled)) {
        foreach (player in victim.attackers) {
            if (!isdefined(_validateattacker(player))) {
                continue;
            }
            if (player == attacker) {
                continue;
            }
            if (victim == player) {
                continue;
            }
            if (!isdefined(player.cranked)) {
                continue;
            }
            player thread oncrankedassist("assist_cranked");
            player thread scripts\mp\rank::scoreeventpopup(#"assist_cranked");
            player thread scripts\mp\rank::scoreeventpopup(#"time_added");
            if (!istrue(scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924())) {
                player playlocalsound("jup_cranked_timer_refill_assist");
            }
        }
    }
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d
// Size: 0x1e
function oncrankedhit(victim) {
    if (self == victim) {
        return;
    }
    setcrankedplayerbombtimer("hit");
}

// Namespace cranked / scripts\mp\cranked
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b3
// Size: 0x35
function cleanupcrankedplayertimer() {
    self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", 0);
    self.cranked = undefined;
    self.cranked_end_time = undefined;
    self.supportcranked = undefined;
    thread waitthenstopcrankedbombtimer();
}

// Namespace cranked / scripts\mp\cranked
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f0
// Size: 0xb
function waitthenstopcrankedbombtimer() {
    waitframe();
    self notify("stop_cranked");
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x703
// Size: 0x36
function oncrankedkill(event) {
    level endon("game_ended");
    self endon("disconnect");
    while (!isdefined(self.pers)) {
        waitframe();
    }
    setcrankedplayerbombtimer("kill");
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741
// Size: 0x25
function oncrankedassist(event) {
    level endon("game_ended");
    self endon("disconnect");
    setcrankedplayerbombtimer("assist");
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0x223
function setcrankedplayerbombtimer(type) {
    waittime = level.crankedbombtimer;
    var_cc4a8be0efc3e195 = 0;
    if (getgametype() == "conf" || getgametype() == "grind") {
        var_cc4a8be0efc3e195 = 1;
    }
    if (type == "hit") {
        waittime = int((self.cranked_end_time - gettime()) / 1000 + 1);
        if (waittime > level.crankedbombtimer) {
            waittime = level.crankedbombtimer;
        }
    } else if (type == "assist") {
        if (var_cc4a8be0efc3e195) {
            waittime = int(min((self.cranked_end_time - gettime()) / 1000 + level.crankedbombtimer * 0.25, level.crankedbombtimer));
        } else {
            waittime = int(min((self.cranked_end_time - gettime()) / 1000 + level.crankedbombtimer * 0.5, level.crankedbombtimer));
        }
    } else if (type == "friendly_tag") {
        waittime = int(min((self.cranked_end_time - gettime()) / 1000 + level.crankedbombtimer * 0.25, level.crankedbombtimer));
    } else if (var_cc4a8be0efc3e195) {
        if (isdefined(self.cranked) && self.cranked && isdefined(self.cranked_end_time)) {
            waittime = int(min((self.cranked_end_time - gettime()) / 1000 + level.crankedbombtimer * 0.5, level.crankedbombtimer));
        } else {
            waittime = int(waittime * 0.5);
        }
    } else {
        waittime = level.crankedbombtimer;
    }
    endtime = waittime * 1000 + gettime();
    self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", endtime);
    self.cranked_end_time = endtime;
    thread watchcrankedplayerhostmigration();
    thread watchcrankedbombtimer(waittime);
    thread watchcrankedendgame();
}

// Namespace cranked / scripts\mp\cranked
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0x74
function watchcrankedplayerhostmigration() {
    self notify("watchCrankedHostMigration");
    self endon("watchCrankedHostMigration");
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("stop_cranked");
    level waittill("host_migration_begin");
    timepassed = scripts\mp\hostmigration::waittillhostmigrationdone();
    if (timepassed > 0) {
        self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", self.cranked_end_time + timepassed);
        return;
    }
    self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", self.cranked_end_time);
}

// Namespace cranked / scripts\mp\cranked
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa15
// Size: 0x5a
function watchcrankedendgame() {
    self notify("watchEndGame");
    self endon("watchEndGame");
    self endon("death_or_disconnect");
    self endon("stop_cranked");
    while (true) {
        if (game["state"] == "postgame" || level.gameended) {
            self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", 0);
            break;
        }
        wait 0.1;
    }
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa77
// Size: 0x18b
function watchcrankedbombtimer(waittime) {
    self notify("watchBombTimer");
    self endon("watchBombTimer");
    self endon("disconnect");
    level endon("game_ended");
    self endon("stop_cranked");
    thread crankedprogressuiupdater(waittime);
    countdown_time = 10;
    var_8440421626c8b0cf = waittime - countdown_time - 1;
    if (var_8440421626c8b0cf > 0) {
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(var_8440421626c8b0cf);
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(1);
        self playlocalsound("jup_cranked_timer_warning");
    }
    while (countdown_time > 0) {
        if (countdown_time == 1) {
            self playlocalsound("jup_cranked_timer_tick_last");
        } else if (countdown_time <= 5) {
            self playlocalsound("jup_cranked_timer_tick_half");
        } else if (countdown_time < 10) {
            self playlocalsound("jup_cranked_timer_tick");
        }
        scripts\mp\hostmigration::waitlongdurationwithgameendtimeupdate(1);
        countdown_time--;
    }
    if (isdefined(self) && isreallyalive(self) && getgametype() != "tdef") {
        self playsound("vest_expl_trans");
        explorg = self.origin + (0, 0, 32);
        playfx(level._effect["cranked_explode"], explorg);
        _suicide();
        self radiusdamage(explorg, 256, 200, 100, self, "MOD_EXPLOSIVE", "bomb_site_mp");
        self setclientomnvar("ui_cranked_bomb_timer_end_milliseconds", 0);
        if (scripts\cp_mp\utility\player_utility::_isalive()) {
            self dodamage(self.maxhealth, explorg, self, undefined, "MOD_EXPLOSIVE", "bomb_site_mp");
        }
    }
}

// Namespace cranked / scripts\mp\cranked
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0a
// Size: 0xa6
function crankedprogressuiupdater(waittime) {
    self endon("death_or_disconnect");
    self notify("refreshCrankedUIProgress");
    self endon("refreshCrankedUIProgress");
    currenttimelimitdelay = 0;
    updaterate = 0;
    if (waittime != level.crankedbombtimer) {
        currenttimelimitdelay = level.crankedbombtimer - waittime;
    }
    while (isalive(self)) {
        currenttimelimitdelay += level.framedurationseconds;
        progress = clamp(1 - currenttimelimitdelay / level.crankedbombtimer, 0, 1);
        self setclientomnvar("ui_cranked_bomb_timer", progress);
        waitframe();
    }
}

// Namespace cranked / scripts\mp\cranked
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb8
// Size: 0x48
function function_68a1353068460d1() {
    level endon("game_ended");
    while (!isalive(self)) {
        waitframe();
    }
    if (isdefined(self.cranked) && self.cranked) {
        setcrankedplayerbombtimer("kill");
        return;
    }
    oncranked(undefined, self);
}

