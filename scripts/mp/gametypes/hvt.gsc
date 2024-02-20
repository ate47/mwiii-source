// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_2b264b25c7da0b12;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace hvt;

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x667
// Size: 0x21b
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    setdvar(@"hash_a4d532f42d919827", 1);
    setdvar(@"hash_fde1113ce9981d91", 3);
    setdvar(@"hash_f477e59410bec785", 1);
    setdvar(@"hash_fa6cdf74e2592068", "t10_pi_p13_usugar9_mp");
    level.armoronweaponswitchlongpress = 1;
    level.var_e70ce1a0418791bd = array_add_safe(level.var_e70ce1a0418791bd, "t10_combataxe_mp");
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 10);
        registerscorelimitdvar(getgametype(), 150);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        setdvar(@"hash_e723cc761de7b161", 1);
    }
    updategametypedvars();
    initdialog();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.modelaststandallowed = &modelaststandallowed;
    level.modeonlaststandfunc = &function_8e02eb5056d9e4d2;
    level.modeonexitlaststandfunc = &function_930d45cca276d8e2;
    level.var_4941fc1ee570d4cb = &function_a5b896d29f677e6b;
    level.disablebuddyspawn = 1;
    level.var_2d3ee92902ba30fa = &namespace_1d863a7bbc05fc52::laststandthink;
    level.var_43cd475109571dae = [];
    level.var_43cd475109571dae["allies"] = 0;
    level.var_43cd475109571dae["axis"] = 0;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x889
// Size: 0xc1
function initdialog() {
    game["dialog"]["gametype"] = "gametype_hvt";
    game["dialog"]["boost"] = "boost_tdm";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    game["dialog"]["hvt_friend_eliminated"] = "iw9_annm_tghv_rutl_ghfa";
    game["dialog"]["hvt_enemy_eliminated"] = "iw9_annm_tghv_rutl_ghea";
    game["dialog"]["hvt_new_friendly"] = "iw9_annm_tghv_rutl_ghfc";
    game["dialog"]["hvt_new_enemy"] = "iw9_annm_tghv_rutl_gheb";
    game["dialog"]["hvt_damaged_friendly"] = "iw9_annm_tghv_rutl_ghfb";
    game["dialog"]["hvt_self"] = "iw9_annm_tghv_rutl_ghfd";
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x951
// Size: 0x40
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    level.var_7f447a56a749ac85 = getmatchrulesdata("hvtData", "hvtSpawnArmorPlates");
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x998
// Size: 0x56
function updategametypedvars() {
    updatecommongametypedvars();
    level.hvtNumHVTPerTeam = dvarintvalue("hvtNumHVTPerTeam", 1, 1, 7);
    level.hvtPointsPerHVTKilled = dvarintvalue("hvtPointsPerHVTKilled", 5, 0, 15);
    level.hvtPointsPerKillAsHVT = dvarintvalue("hvtPointsPerKillAsHVT", 2, 0, 15);
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f5
// Size: 0x118
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    initspawns();
    namespace_662734e7fa8a8b94::inittankspawns();
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb14
// Size: 0x1ee
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(level.localeid)) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd09
// Size: 0x97
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (game["switchedsides"]) {
        spawnteam = getotherteam(spawnteam)[0];
    }
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_" + spawnteam + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            function_d73615f1fc12f3db(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("hvtPointsPerKillAsHVT" + var_965ef52941de8769.index + "players" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("hvtUpdate" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xf2b
// Size: 0x174
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    var_fe5ee0f83d4109eb = namespace_3e725f3cc58bddd3::function_fe5ee0f83d4109eb(einflictor, attacker, smeansofdeath, objweapon);
    var_e07d55b45fc82ae0 = namespace_3e725f3cc58bddd3::function_e07d55b45fc82ae0(einflictor, attacker);
    if (var_fe5ee0f83d4109eb || var_e07d55b45fc82ae0) {
        return;
    }
    if (ishvt()) {
        function_a2ec131d150b20c8(attacker);
    } else if (attacker ishvt()) {
        attacker namespace_48a08c5037514e04::doScoreEvent(#"hash_c848dfdd9f079443");
        attacker thread namespace_44abc05161e2e2cb::showsplash("hvt_kill_splash");
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, level.hvtPointsPerKillAsHVT);
        if (isdefined(self.attackers)) {
            foreach (player in self.attackers) {
                if (player == attacker) {
                    continue;
                }
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_fd3eb0cb2e45667e");
            }
        }
    } else {
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, 1);
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a6
// Size: 0x1b4
function function_a2ec131d150b20c8(attacker) {
    excludelist = [];
    excludelist[0] = self;
    foreach (player in getteamdata(self.team, "players")) {
        player playlocalsound("uin_hvt_ally_killed");
    }
    enemyteam = getotherteam(self.team)[0];
    foreach (player in getteamdata(enemyteam, "players")) {
        player playlocalsound("uin_hvt_enemy_killed");
    }
    if (isdefined(attacker)) {
        attacker namespace_48a08c5037514e04::doScoreEvent(#"hash_4b89b1d2e95e2012");
        attacker thread namespace_44abc05161e2e2cb::showsplash("hvt_killed_splash");
        if (isdefined(self.attackers)) {
            foreach (player in self.attackers) {
                if (player == attacker) {
                    continue;
                }
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_e7321c2c761418a4");
            }
        }
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, level.hvtPointsPerHVTKilled);
    }
    function_f7e228a53add5c40();
    self.var_1c65528773f3bdb3 = 1;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1261
// Size: 0x2a
function ontimelimit() {
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1292
// Size: 0xde
function onplayerspawned() {
    /#
        println("<unknown string>" + self.name + "<unknown string>" + self.origin);
    #/
    foreach (p in getteamdata(self.team, "players")) {
        if (p != self && isdefined(p.objidnumfriend)) {
            objective_addclienttomask(p.objidnumfriend, self);
        }
    }
    if (function_a0f16653bd8c0125(self.team)) {
        if (istrue(self.var_1c65528773f3bdb3)) {
            self.var_1c65528773f3bdb3 = undefined;
        } else {
            becomehvt();
        }
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1377
// Size: 0x1e
function onplayerdisconnect(player) {
    if (player ishvt()) {
        player function_f7e228a53add5c40();
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x139c
// Size: 0x64
function modelaststandallowed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (ishvt() || function_311066dfee085643(self)) {
        return 1;
    }
    return 0;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1408
// Size: 0xdf
function function_8e02eb5056d9e4d2() {
    if (ishvt()) {
        foreach (player in getteamdata(self.team, "players")) {
            player playlocalsound("uin_hvt_ally_downed");
        }
        enemyteam = getotherteam(self.team)[0];
        foreach (player in getteamdata(enemyteam, "players")) {
            player playlocalsound("uin_hvt_enemy_downed");
        }
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x33
function function_930d45cca276d8e2(revived) {
    if (ishvt()) {
        if (istrue(revived)) {
            self.var_63b104851a574f2a namespace_48a08c5037514e04::doScoreEvent(#"hash_a8cd2254f8c02a4b");
        }
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1528
// Size: 0xc
function function_a5b896d29f677e6b() {
    return level.var_7f447a56a749ac85;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153c
// Size: 0xd
function ishvt() {
    return istrue(self.ishvt);
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1551
// Size: 0x76
function function_aa6ad03630bbc953(team) {
    hvtcount = 0;
    foreach (player in getteamdata(team, "players")) {
        if (player ishvt()) {
            hvtcount++;
        }
    }
    return hvtcount;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15cf
// Size: 0x2d
function function_a0f16653bd8c0125(team) {
    if (level.var_43cd475109571dae[team]) {
        return 0;
    }
    return function_aa6ad03630bbc953(team) < level.hvtNumHVTPerTeam;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1604
// Size: 0x63
function function_4be33b77f63f508f() {
    setomnvar("ui_" + self.team + "_hvt_count", function_aa6ad03630bbc953(self.team));
    enemyteam = getotherteam(self.team)[0];
    setomnvar("ui_" + enemyteam + "_hvt_count", function_aa6ad03630bbc953(enemyteam));
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166e
// Size: 0x1e1
function becomehvt() {
    self.ishvt = 1;
    self.game_extrainfo = self.game_extrainfo | 1 << 16;
    function_136329cdd2983505();
    self setclientomnvar("ui_hvt_status", 1);
    enemyteam = getotherteam(self.team)[0];
    namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_friendly_hvt", 0);
    self.friendlyoutlineid = outlineenableforteam(self, self.team, "outlinefill_friendly_hvt", "level_script");
    self.var_eeefde0f13484fb6 = outlineenableforteam(self, enemyteam, "outlinefill_enemy_hvt", "level_script");
    namespace_f8d3520d3483c1::initarmor();
    namespace_f8d3520d3483c1::givestartingarmor(250, level.var_7f447a56a749ac85);
    thread function_12d9fdaf83ab5ffb();
    if (issharedfuncdefined("player", "showMiniMap")) {
        self [[ getsharedfunc("player", "showMiniMap") ]]();
    }
    namespace_44abc05161e2e2cb::showsplash("hvt_player_selected");
    thread function_1d5e82320be9da1d();
    excludelist = [];
    excludelist[0] = self;
    foreach (player in getteamdata(self.team, "players")) {
        player playlocalsound("uin_hvt_ally_spawned");
    }
    foreach (player in getteamdata(enemyteam, "players")) {
        player playlocalsound("uin_hvt_enemy_spawned");
    }
    thread namespace_944ddf7b8df1b0e3::leaderdialogonplayer("hvt_self", "hvtUpdate");
    function_4be33b77f63f508f();
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1856
// Size: 0xa9
function function_f7e228a53add5c40() {
    self.ishvt = undefined;
    self.game_extrainfo = self.game_extrainfo & ~(1 << 16);
    function_fb537e337319c2fe();
    self setclientomnvar("ui_hvt_status", 0);
    outlinedisable(self.friendlyoutlineid, self);
    namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
    self.skipuavupdate = undefined;
    if (!istrue(level.minimaponbydefault)) {
        if (issharedfuncdefined("player", "hideMiniMap")) {
            self [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
    level thread function_f3b9baf1a4c79509(self.team);
    function_4be33b77f63f508f();
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1906
// Size: 0x4a
function function_f3b9baf1a4c79509(str_team) {
    level.var_43cd475109571dae[str_team] = 1;
    delay = 5;
    /#
        delay = getdvarint(@"hash_d6f1ae7da2a80d3", delay);
    #/
    wait(delay);
    level.var_43cd475109571dae[str_team] = 0;
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1957
// Size: 0xb7
function function_12d9fdaf83ab5ffb() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (ishvt()) {
        level waittill("uav_update");
        if (namespace_f1fe279354a7da2::function_5ec24d236512fd7a(self.team) > getuavstrengthmin()) {
            self.skipuavupdate = 1;
            self.radarstrength = getuavstrengthlevelneutral() + 1;
            self.isradarblocked = 0;
            self.hasradar = 1;
            self.radarshowenemydirection = 1;
            self.radarmode = "constant_radar";
        } else {
            self.skipuavupdate = 0;
            var_51759585c898d7f = namespace_f1fe279354a7da2::function_ddcbf96c5ef69597(self.team);
            namespace_f1fe279354a7da2::function_13b8682b55619852(self, var_51759585c898d7f);
        }
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a15
// Size: 0x7c
function function_1d5e82320be9da1d() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    gameflagwait("prematch_done");
    var_393b16e2805d9e10 = 5;
    self.var_38ab0933f7a5e698 = 0;
    while (isdefined(self.ishvt)) {
        if (self.var_38ab0933f7a5e698 >= var_393b16e2805d9e10) {
            self.var_38ab0933f7a5e698 = 0;
            namespace_48a08c5037514e04::doScoreEvent(#"hash_d132f951cbf73638");
        } else {
            self.var_38ab0933f7a5e698++;
        }
        wait(1);
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a98
// Size: 0x1c9
function function_136329cdd2983505() {
    self.curorigin = self.origin;
    self.offset3d = (0, 0, 14);
    self.objidnumfriend = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objid = self.objidnumfriend;
    objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_HVT_CAPS");
    objective_setzoffset(objid, 30);
    objective_icon(objid, "hud_icon_frontline_shield_hvt");
    objective_setplayintro(objid, 0);
    objective_removeallfrommask(objid);
    foreach (p in getteamdata(self.team, "players")) {
        if (p != self) {
            objective_addclienttomask(objid, p);
        }
    }
    objective_showtoplayersinmask(objid);
    objective_setbackground(objid, 0);
    objective_position(objid, self geteye() + self.offset3d);
    objective_state(objid, "current");
    objective_setownerteam(objid, self.team);
    self.objidnumenemy = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    objid = self.objidnumenemy;
    objective_setlabel(objid, "MP_INGAME_ONLY/OBJ_HVT_CAPS");
    objective_setzoffset(objid, 15);
    objective_icon(objid, "hud_icon_death_spawn");
    objective_setplayintro(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_teammask_single(objid, getotherteam(self.team)[0]);
    objective_setownerteam(objid, self.team);
    objective_setbackground(objid, 0);
    objective_position(objid, self geteye() + self.offset3d);
    objective_state(objid, "current");
    thread function_3bd91003ede3001e();
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c68
// Size: 0xde
function function_3bd91003ede3001e() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("endUpdateHVTObjPos");
    self endon("endUpdateHVTObjPos");
    if (!isdefined(level.objpingdelay)) {
        level.objpingdelay = 1.5;
    }
    var_4b368ceb98a6c0b4 = gettime();
    while (isdefined(self.objidnumfriend)) {
        objpos = self geteye() + self.offset3d;
        namespace_5a22b6f3a56f7e9b::update_objective_position(self.objidnumfriend, objpos);
        objective_ping(self.objidnumfriend);
        currtime = gettime();
        if (currtime - var_4b368ceb98a6c0b4 >= level.objpingdelay * 1000) {
            namespace_5a22b6f3a56f7e9b::update_objective_position(self.objidnumenemy, objpos);
            objective_ping(self.objidnumenemy);
            var_4b368ceb98a6c0b4 = currtime;
        }
        waitframe();
    }
}

// Namespace hvt/namespace_33fcda83fa46d258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4d
// Size: 0x44
function function_fb537e337319c2fe() {
    if (isdefined(self.objidnumfriend)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objidnumfriend);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objidnumenemy);
        self.objidnumfriend = undefined;
        self.objidnumenemy = undefined;
    }
}
