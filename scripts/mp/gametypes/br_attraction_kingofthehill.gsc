// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\gametypes\br_attractions.gsc;
#using scripts\mp\utility\points.gsc;

#namespace namespace_1bd8d3ce57fb56ea;

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x3a
function init() {
    level.brattractions["koth"] = spawnstruct();
    level.brattractions["koth"].locations = [];
    registerlocations();
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330
// Size: 0x14e
function registerlocations() {
    switch (level.script) {
    case #"hash_c9458e4403b73c27":
    case #"hash_d7b993f67c508b1d":
    case #"hash_e9af1c05b2cb1afd":
        registerlocation((21616, -16071, 1910), 730, 204, 2000, 2151);
        registerlocation((15884, 18421, 846), 500, 108, 3000, 720);
        registerlocation((-1111, -18991, 932), 800, 188, 2000, 1162);
        registerlocation((8223, -25884, 696), 1185, 188, 2000, 982);
        registerlocation((-16115, -25460, 55), 750, 340, 2000, 266);
        registerlocation((16734, -34808, 842), 457, 108, 2000, 768);
        break;
    case #"hash_4aa5d6e97851bdbd":
        registerlocation((117, -1854, 0), 300, 60, 800, 0);
        registerlocation((-3896, -2143, 335), 500, 334, 2000, 335);
    default:
        break;
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485
// Size: 0x202
function registerlocation(origin, var_29a79d378c70e0b, var_dfe92bb3a3b6a89a, var_ccb00530d7a24ee3, var_a943937478cd458d) {
    var_f98843815888ea41 = 30;
    nextindex = level.brattractions["koth"].locations.size;
    level.brattractions["koth"].locations[nextindex] = spawnstruct();
    location = level.brattractions["koth"].locations[nextindex];
    location.capturetrigger = spawn("trigger_radius", origin, 0, var_29a79d378c70e0b, var_dfe92bb3a3b6a89a);
    location.capturetrigger.radius = var_29a79d378c70e0b;
    location.capturetrigger.players = [];
    namespace_f1565a2788ab1e89::makeenterexittrigger(location.capturetrigger, &playerlocationtriggerenter, &playerlocationtriggerexit);
    trigorigin = origin + (0, 0, -1 * var_a943937478cd458d);
    var_21efa20e3c93c7d5 = var_a943937478cd458d + var_f98843815888ea41;
    location.icontrigger = namespace_8bbc300af6d3c2fb::createattractionicontrigger("koth", 0, trigorigin, var_21efa20e3c93c7d5, "ui_mp_br_mapmenu_icon_poi_sb_koh", var_ccb00530d7a24ee3, &playerattractiontriggerenter, &playerattractiontriggerexit, "br_attraction_koth");
    location.capturetrigger.objectiveiconid = location.icontrigger.closeobjectiveiconid;
    location.icontrigger namespace_8bbc300af6d3c2fb::triggeraddobjectivetext("MP_BR_INGAME/ATTRACT_KOTH_CAPTURE");
    location.icontrigger.location = location;
    location.capturetrigger.location = location;
    location.besttime = 0;
    location.bestplayer = undefined;
    location.besttimestate = 0;
    location.contested = 0;
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x1c
function getkothlocations() {
    return level.brattractions["koth"].locations;
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b2
// Size: 0x14d
function playerlocationtriggerenter(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player endon("disconnect");
    player endon("playerLocationTriggerExit");
    player notify("playerLocationTriggerEnter");
    player endon("playerLocationTriggerEnter");
    waittillplayerlanded(player);
    if (istrue(level.brgametype.useserverhud)) {
        if (!isdefined(player.hudkothtimer)) {
            player.hudkothtimer = namespace_8bbc300af6d3c2fb::createhudtimer(1);
        } else {
            player notify("keepHudKothTimer");
            player.hudkothtimer.alpha = 1;
            player.hudkothtimer.color = (1, 1, 1);
        }
    }
    player.kothtotaltime = 0;
    player.kothlaststarttime = -1;
    if (istrue(level.brgametype.useserverhud)) {
        time = max(self.kothtotaltime / 1000, 0.001);
        player.hudkothtimer settenthstimerstatic(time);
    }
    trigger.players[trigger.players.size] = player;
    trigger locationtriggerupdate();
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x806
// Size: 0xef
function playerlocationtriggerexit(player, trigger) {
    if (!isplayer(player)) {
        return;
    }
    player notify("playerLocationTriggerExit");
    if (!isdefined(player.kothtotaltime)) {
        return;
    }
    player playertimestamp();
    location = trigger.location;
    updatelocationbesttime(location, player.kothtotaltime, player);
    if (isbestplayertime(location, player.kothtotaltime, player)) {
        location.besttimestate = 0;
    }
    player.kothtotaltime = undefined;
    player.kothlaststarttime = undefined;
    trigger.players = array_remove(trigger.players, player);
    trigger locationtriggerupdate();
    updatelocationbesttimehud(location);
    if (istrue(level.brgametype.useserverhud)) {
        player thread playerstoptimerdelete();
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fc
// Size: 0x19
function waittillplayerlanded(player) {
    while (!player isonground()) {
        waitframe();
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91c
// Size: 0x8b
function playerstoptimerdelete() {
    self endon("keepHudKothTimer");
    var_c01f079eb027d3bc = 1.5;
    var_b2d4b76e9bbd89ed = 2;
    timer = self.hudkothtimer;
    timer.color = (1, 1, 0);
    wait(var_c01f079eb027d3bc);
    timer fadeovertime(var_b2d4b76e9bbd89ed);
    timer.alpha = 0;
    wait(var_b2d4b76e9bbd89ed);
    if (isdefined(timer)) {
        timer destroy();
    }
    if (isdefined(self)) {
        self.hudkothtimer = undefined;
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ae
// Size: 0x28
function validplayer(player) {
    return isdefined(player) && isalive(player) && !istrue(player.disconnecting);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x196
function locationtriggerupdate() {
    contested = 0;
    ownerteam = undefined;
    foreach (player in self.players) {
        if (!validplayer(player)) {
            continue;
        }
        if (!isdefined(ownerteam)) {
            ownerteam = player.team;
        } else if (player.team != ownerteam) {
            contested = 1;
            break;
        }
    }
    self.location.contested = contested;
    if (contested) {
        locationtriggersetpaused(1);
        objective_setownerteam(self.objectiveiconid, undefined);
        objective_setprogressteam(self.objectiveiconid, undefined);
        objective_setlabel(self.objectiveiconid, "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS");
    } else {
        locationtriggersetpaused(0);
        if (isdefined(ownerteam)) {
            objective_setownerteam(self.objectiveiconid, ownerteam);
            objective_setprogressteam(self.objectiveiconid, ownerteam);
            objective_setfriendlylabel(self.objectiveiconid, "MP_INGAME_ONLY/OBJ_DEFEND_CAPS");
            objective_setenemylabel(self.objectiveiconid, "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS");
        } else {
            objective_setownerteam(self.objectiveiconid, undefined);
            objective_setprogressteam(self.objectiveiconid, undefined);
            objective_setneutrallabel(self.objectiveiconid, "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS");
        }
    }
    objective_sethot(self.objectiveiconid, contested);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7b
// Size: 0xf5
function locationtriggersetpaused(ispaused) {
    location = self.location;
    location.besttimestate = 0;
    location notify("stopTimeTracking");
    foreach (player in self.players) {
        if (!validplayer(player)) {
            continue;
        }
        if (ispaused) {
            player playertimestamp();
            updatelocationbesttime(location, player.kothtotaltime, player);
        } else {
            player playertimestart(location);
        }
        player playerupdatehudstate(location);
    }
    if (ispaused) {
        location notify("zone_reset");
    } else {
        thread awardcapturepoints(location, self);
    }
    if (location.besttimestate == 0) {
        updatelocationbesttimehud(location);
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc77
// Size: 0x138
function awardcapturepoints(location, trigger) {
    level endon("game_ended");
    level endon("zone_reset");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    seconds = 1;
    while (!level.gameended) {
        waittime = 0;
        while (waittime < seconds && !level.gameended) {
            wait(level.framedurationseconds);
            waittime = waittime + level.framedurationseconds;
            if (istrue(location.contested)) {
                waittime = 0;
            }
        }
        if (level.gameended) {
            break;
        }
        if (!istrue(location.contested) && !level.gameended) {
            foreach (player in trigger.players) {
                if (!isplayer(player)) {
                    continue;
                }
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_32eed765ef0d59f6");
            }
        }
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb6
// Size: 0x86
function playertimestart(location) {
    if (self.kothlaststarttime == -1) {
        self.kothlaststarttime = gettime();
        time = max(self.kothtotaltime / 1000, 0.001);
        if (istrue(level.brgametype.useserverhud)) {
            self.hudkothtimer settenthstimerup(time);
        }
    }
    thread playerstarttimetracking(location);
    thread playerstartbesttimetracking(location);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe43
// Size: 0x4b
function playerstarttimetracking(location) {
    self endon("disconnect");
    self notify("playerStartTimeTracking");
    self endon("playerStartTimeTracking");
    location endon("stopTimeTracking");
    while (1) {
        var_5fd2522e101604a5 = playergettotaltime();
        namespace_8bbc300af6d3c2fb::playersetattractiontime(var_5fd2522e101604a5);
        waitframe();
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe95
// Size: 0x76
function playertimestamp() {
    if (self.kothlaststarttime > 0) {
        self.kothtotaltime = playergettotaltime();
        self.kothlaststarttime = -1;
        time = max(self.kothtotaltime / 1000, 0.001);
        if (istrue(level.brgametype.useserverhud)) {
            self.hudkothtimer settenthstimerstatic(time);
        }
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf12
// Size: 0x57
function playergettotaltime() {
    totaltime = 0;
    if (isdefined(self.kothtotaltime)) {
        totaltime = self.kothtotaltime;
    }
    if (isdefined(self.kothlaststarttime) && self.kothlaststarttime > 0) {
        totaltime = totaltime + gettime() - self.kothlaststarttime;
    }
    return totaltime;
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf71
// Size: 0x10c
function onplayerdisconnect(player) {
    if (isdefined(player) && isdefined(player.hudkothtimer)) {
        player.hudkothtimer destroy();
    }
    foreach (location in level.brattractions["koth"].locations) {
        if (isdefined(player)) {
            location.capturetrigger.players = array_remove(location.capturetrigger.players, player);
        } else {
            location.capturetrigger.players = array_removeundefined(location.capturetrigger.players);
        }
        location.capturetrigger locationtriggerupdate();
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1084
// Size: 0x6b
function playerattractiontriggerenter(player, trigger) {
    player.hudkothbesttime = namespace_8bbc300af6d3c2fb::createhudtimer(3);
    player.hudkothbesttimelabel = namespace_8bbc300af6d3c2fb::createhudstring(2);
    trigger.location.capturetrigger locationtriggerupdate();
    player playerupdatebesttimehud(trigger.location);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f6
// Size: 0x54
function playerattractiontriggerexit(player, trigger) {
    if (isdefined(player.hudkothbesttimelabel)) {
        player.hudkothbesttimelabel destroy();
    }
    if (isdefined(player.hudkothbesttime)) {
        player.hudkothbesttime destroy();
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1151
// Size: 0x4a
function isbestplayertime(location, time, player) {
    return isdefined(location.bestplayer) && location.bestplayer == player && time == location.besttime;
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a3
// Size: 0x4c
function updatelocationbesttime(location, time, player) {
    if (isdefined(time) && time >= location.besttime) {
        location.besttime = time;
        location.bestplayer = player;
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f6
// Size: 0x94
function updatelocationbesttimehud(location) {
    foreach (ent in location.icontrigger.triggerenterents) {
        if (isdefined(ent) && isplayer(ent) && validplayer(ent)) {
            player = ent;
            player playerupdatebesttimehud(location);
        }
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1291
// Size: 0xe2
function playerupdatebesttimehud(location) {
    if (istrue(level.brgametype.useserverhud)) {
        if (isdefined(location.bestplayer)) {
            self.hudkothbesttimelabel.label = "MP_BR_INGAME/ATTRACT_KOTH_BEST_PLAYER";
            self.hudkothbesttimelabel setplayernamestring(location.bestplayer);
        } else {
            self.hudkothbesttimelabel.label = "MP_BR_INGAME/ATTRACT_KOTH_BEST";
        }
        time = max(location.besttime / 1000, 0.001);
        if (location.besttimestate == 0) {
            self.hudkothbesttime settenthstimerstatic(time);
        } else {
            self.hudkothbesttime settenthstimerup(time);
        }
    }
    playerupdatehudstate(location);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0xa6
function playerstartbesttimetracking(location) {
    self endon("disconnect");
    self notify("playerStartBestTimeTracking");
    self endon("playerStartBestTimeTracking");
    location endon("stopTimeTracking");
    time = location.besttime / 1000;
    var_5fd2522e101604a5 = playergettotaltime();
    time = time - var_5fd2522e101604a5 / 1000;
    if (time > 0) {
        wait(time);
    }
    while (location.besttimestate == 1) {
        waitframe();
    }
    location.besttimestate = 1;
    var_5fd2522e101604a5 = playergettotaltime();
    updatelocationbesttime(location, var_5fd2522e101604a5, self);
    updatelocationbesttimehud(location);
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0x131
function playerupdatehudstate(location) {
    state = 0;
    var_5fd2522e101604a5 = playergettotaltime();
    var_f63c334678a03505 = !isdefined(self.kothtotaltime);
    if (var_f63c334678a03505) {
        if (!isdefined(location.besttime) || location.besttime == 0) {
            state = 0;
        } else if (location.besttimestate == 1) {
            state = 3;
        } else if (isdefined(location.bestplayer)) {
            state = 2;
        } else {
            state = 1;
        }
    } else if (istrue(location.contested)) {
        state = 4;
    } else if (!isdefined(location.bestplayer)) {
        state = 5;
    } else if (!isbestplayertime(location, var_5fd2522e101604a5, self)) {
        state = 6;
    } else {
        state = 7;
    }
    namespace_8bbc300af6d3c2fb::playersetattractionstateindex(state);
    namespace_8bbc300af6d3c2fb::playersetattractiontime(var_5fd2522e101604a5);
    namespace_8bbc300af6d3c2fb::playersetattractionbestplayer(location.bestplayer);
    if (state == 7 || state == 3) {
        thread playerstartbesttimeupdate(location);
    } else {
        namespace_8bbc300af6d3c2fb::playersetattractionbesttime(location.besttime);
    }
}

// Namespace namespace_1bd8d3ce57fb56ea/namespace_5198cbcc9f2f3157
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155f
// Size: 0x60
function playerstartbesttimeupdate(location) {
    self endon("disconnect");
    self notify("playerStartBestTimeUpdate");
    self endon("playerStartBestTimeUpdate");
    location endon("stopTimeTracking");
    while (isdefined(location.bestplayer)) {
        var_8ef5a089a5b9cbf3 = location.bestplayer playergettotaltime();
        namespace_8bbc300af6d3c2fb::playersetattractionbesttime(var_8ef5a089a5b9cbf3);
        waitframe();
    }
}
