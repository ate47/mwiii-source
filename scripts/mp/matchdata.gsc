#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace matchdata;

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4de
// Size: 0x251
function init() {
    if (getdvarint(@"online_matchdata_enabled") != 0 && !isdefined(game["gamestarted"])) {
        setmatchdatadef("ddl/mp/matchdata.ddl");
        setmatchdata("commonMatchData", "map", level.script);
        if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
            tmp = getgametype() + " hc";
            setmatchdata("commonMatchData", "gametype", tmp);
        } else {
            setmatchdata("commonMatchData", "gametype", getgametype());
        }
        setmatchdata("commonMatchData", "build_version", getbuildversion());
        setmatchdata("commonMatchData", "build_number", getbuildnumber());
        setmatchdata("commonMatchData", "is_private_match", privatematch());
        setmatchdata("firstOvertimeRoundIndex", -1);
        if (ismlgmatch()) {
            setmatchdata("codESportsRules", 1);
        }
    }
    if (getdvarint(@"online_matchdata_enabled") != 0) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            level.maxlogclients = 200;
        } else {
            level.maxlogclients = 30;
        }
    } else {
        level.maxlogclients = 0;
    }
    level.maxlives = 475;
    level.maxnamelength = 26;
    level.maxgameevents = 250;
    level.maxkillstreaks = 64;
    level.maxkillstreaksavailable = 64;
    level.maxnumchallengesperplayer = 10;
    level.maxnumawardsperplayer = 10;
    level.maxsupersavailable = 50;
    level.maxsupersactivated = 50;
    level.maxsupersexpired = 50;
    level.matchdataattachmentstatsenabled = 0;
    level.matchdata_onroundend = &onroundend;
    level.matchdata_logkillstreakevent = &logkillstreakevent;
    level.matchdata_logattackerkillevent = &logattackerkillevent;
    level.matchdata_logvictimkillevent = &logvictimkillevent;
    level.matchdata_logmultikill = &logmultikill;
    level.matchdata_logplayerdata = &logplayerdata;
    level.matchdata_recordrecentlyplayeddata = &recordrecentlyplayeddata;
    level.matchdata_logattachmentstat = &logattachmentstat;
    level.matchdata_buildweaponrootlist = &buildweaponrootlist;
    level.matchdata_logchallenge = &logchallenge;
    level.matchdata_logaward = &logaward;
    level thread endofgamesummarylogger();
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x737
// Size: 0x6f
function onroundend() {
    level.endtimeutcseconds = getsystemtime();
    setmatchdata("commonMatchData", "utc_end_time_s", level.endtimeutcseconds);
    setmatchdata("commonMatchData", "player_count_end", level.players.size);
    setmatchdata("globalPlayerXpModifier", int(scripts\mp\rank::getglobalrankxpmultiplier()));
    setmatchdata("globalWeaponXpModifier", int(scripts\mp\weaponrank::getglobalweaponrankxpmultiplier()));
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae
// Size: 0x2e
function getmatchstarttimeutc() {
    if (getdvarint(@"online_matchdata_enabled") == 0) {
        return level.starttimeutcseconds;
    }
    return getmatchdata("commonMatchData", "utc_start_time_s");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e5
// Size: 0x2e
function getmatchendtimeutc() {
    if (getdvarint(@"online_matchdata_enabled") == 0) {
        return level.endtimeutcseconds;
    }
    return getmatchdata("commonMatchData", "utc_end_time_s");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81c
// Size: 0x42
function gettimefrommatchstart(basetime) {
    timefrom = basetime;
    if (isdefined(level.starttimefrommatchstart)) {
        timefrom -= level.starttimefrommatchstart;
        if (timefrom < 0) {
            timefrom = 0;
        }
    } else {
        timefrom = 0;
    }
    return timefrom;
}

// Namespace matchdata / scripts\mp\matchdata
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x867
// Size: 0x21
function logkillstreakevent(event, position) {
    println("<dev string:x1c>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x890
// Size: 0x21
function logattackerkillevent(lifeid, eventref) {
    println("<dev string:x6c>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8b9
// Size: 0x21
function logvictimkillevent(lifeid, eventref) {
    println("<dev string:xda>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8e2
// Size: 0x21
function logmultikill(lifeid, multikillcount) {
    println("<dev string:x146>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90b
// Size: 0x5f
function monitorweaponfire() {
    self endon("death_or_disconnect");
    while (true) {
        self waittill("begin_firing");
        thread monitorweaponfiretime();
        weaponobj = self.lastdroppableweaponobj;
        weaponobj = mapweapon(weaponobj);
        sweapon = getcompleteweaponname(weaponobj);
        thread scripts\mp\gamelogic::threadedsetweaponstatbyname(sweapon, 1, "trigger_pulls");
    }
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x972
// Size: 0x45
function monitorweaponfiretime() {
    self endon("disconnect");
    self.lastweaponfiretimestart = gettime();
    self notify("monitorWeaponFireTime");
    self endon("monitorWeaponFireTime");
    waittill_either("end_firing", "death");
    self.lastweaponfiretimeend = gettime();
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf
// Size: 0x11a
function ctgs_recordmatchstats() {
    if (!onlinestatsenabled()) {
        return;
    }
    if (!rankingenabled()) {
        return;
    }
    if (!self hasplayerdata()) {
        return;
    }
    gamemode = getgametype();
    kills = getpersstat("kills");
    deaths = getpersstat("deaths");
    headshots = getpersstat("headshots");
    assists = getpersstat("assists");
    suicides = getpersstat("suicides");
    score = getpersstat("score");
    rankxp = getrankxp();
    rank = getrankforxp(rankxp);
    timejoined = self.pers["telemetry"].utc_connect_time_s;
    timeplayed = getsystemtime() - timejoined;
    self ctgsreportusermatchstats(gamemode, kills, deaths, headshots, assists, suicides, score, rank, timeplayed);
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae1
// Size: 0x368
function logplayerdata(disconnectreason) {
    if (!isvalidclient(self)) {
        return;
    }
    ctgs_recordmatchstats();
    self sendclientnetworktelemetry();
    self sendcollectedclientanticheatdata();
    shots = 0;
    hits = 0;
    foreach (datastruct in self.pers["matchdataWeaponStats"]) {
        var_75e61e9afcfd1e96 = 0;
        var_e1e89bd150d2b6e5 = 0;
        vardeaths = 0;
        varheadshots = 0;
        varhits = 0;
        varkills = 0;
        var_c4530fef629dd385 = 0;
        varshots = 0;
        vartimeused = 0;
        vardamage = 0;
        varfriendlydamage = 0;
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (isenumvaluevalid("common", "LoadoutWeapon", datastruct.weapon)) {
                var_75e61e9afcfd1e96 = self getplayerdata(level.loadoutsgroup, "squadMembers", "weapon_xp", datastruct.weapon);
            }
        }
        foreach (statname, value in datastruct.stats) {
            if (statname == "deaths") {
                vardeaths += value;
            }
            if (statname == "headshots") {
                varheadshots += value;
            }
            if (statname == "hits") {
                varhits += value;
                hits += value;
            }
            if (statname == "ads_kills") {
                var_c4530fef629dd385 += value;
            }
            if (statname == "kills") {
                varkills += value;
            }
            if (statname == "shots") {
                varshots += value;
                shots += value;
            }
            if (statname == "xp_earned") {
                var_e1e89bd150d2b6e5 += value;
            }
            if (statname == "damage") {
                vardamage += value;
            }
            if (statname == "friendly_fire_damage") {
                varfriendlydamage += value;
            }
        }
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            weapongroup = weapon::getweapongroup(datastruct.weapon);
            self dlog_recordplayerevent("dlog_event_mp_player_weapon_stats", ["weapon", datastruct.weapon, "variant_id", datastruct.variantid, "loadout_index", datastruct.loadoutindex, "starting_weapon_xp", var_75e61e9afcfd1e96, "xp_earned", var_e1e89bd150d2b6e5, "deaths", vardeaths, "headshots", varheadshots, "hits", varhits, "kills", varkills, "ads_kills", var_c4530fef629dd385, "shots", varshots, "timeUsed", vartimeused, "damage", vardamage, "friendly_fire_damage", varfriendlydamage, "weapon_group", weapongroup]);
        }
    }
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe51
// Size: 0x1e0
function endofgamesummarylogger() {
    winner = level waittill("game_ended");
    if (istrue(level.var_10a1699461d4ad08)) {
        return;
    }
    foreach (player in level.players) {
        wait 0.05;
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.challengescompleted)) {
            player setplayerdata("common", "round", "challengeNumCompleted", player.challengescompleted.size);
        } else {
            player setplayerdata("common", "round", "challengeNumCompleted", 0);
        }
        for (i = 0; i < 20; i++) {
            if (isdefined(player.challengescompleted) && isdefined(player.challengescompleted[i]) && player.challengescompleted[i] != "ch_prestige" && !issubstr(player.challengescompleted[i], "_daily") && !issubstr(player.challengescompleted[i], "_weekly")) {
                player setplayerdata("common", "round", "challengesCompleted", i, player.challengescompleted[i]);
                continue;
            }
            player setplayerdata("common", "round", "challengesCompleted", i, "ch_none");
        }
        current_map = tolower(getdvar(@"hash_687fb8f9b7a23245"));
        player setplayerdata("common", "round", "gameMode", getbasegametype());
        player setplayerdata("common", "round", "map", current_map);
    }
}

// Namespace matchdata / scripts\mp\matchdata
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1039
// Size: 0xdc
function recordrecentlyplayeddata() {
    if (matchmakinggame()) {
        currentmap = tolower(getdvar(@"hash_687fb8f9b7a23245"));
        foreach (player in level.players) {
            for (i = 4; i > 0; i--) {
                map = player getplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", i - 1);
                player setplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", i, map);
            }
            player setplayerdata(level.var_5d69837cf4db0407, "mapsPlayed", 0, currentmap);
        }
    }
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111d
// Size: 0x3d
function isvalidclient(client) {
    if (istrue(game["isLaunchChunk"])) {
        return false;
    }
    if (!isdefined(client)) {
        return false;
    } else if (isagent(client)) {
        return false;
    } else if (!isplayer(client)) {
        return false;
    }
    return true;
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1163
// Size: 0x30
function canlogclient(client) {
    if (isvalidclient(client)) {
        return (client.clientid < level.maxlogclients);
    }
    return 0;
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119b
// Size: 0x16
function canloglife(lifeid) {
    return lifeid < level.maxlives;
}

// Namespace matchdata / scripts\mp\matchdata
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11ba
// Size: 0x3e
function logattachmentstat(attachname, statname, incvalue, weapon) {
    if (!level.matchdataattachmentstatsenabled) {
        return;
    }
    println("<dev string:x16c>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1200
// Size: 0x21
function logchallenge(challengename, tier) {
    println("<dev string:x197>");
}

// Namespace matchdata / scripts\mp\matchdata
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1229
// Size: 0x85
function logaward(awardname) {
    if (!isvalidclient(self)) {
        return;
    }
    if (isbot(self) || istestclient(self) || isai(self)) {
        return;
    }
    time_ms = gettimefrommatchstart(gettime());
    if (function_d03495fe6418377b(awardname)) {
        awardname = function_f28fd66285fa2c9(awardname);
    }
    self dlog_recordplayerevent("dlog_event_player_award", ["time_ms_from_match_start", time_ms, "award", awardname]);
}

