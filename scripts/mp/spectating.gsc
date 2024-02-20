// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_548072087c9fd504;
#using scripts\mp\tweakables.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;

#namespace spectating;

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269
// Size: 0x96
function init() {
    foreach (entry in level.teamnamelist) {
        level.spectateoverride[entry] = spawnstruct();
    }
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&freecamcallback);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onjoinedteam);
    if (getdvarint(@"hash_242c4deac00b8e5b", 0) != 0) {
        level thread getlevelmlgcams();
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x306
// Size: 0x63
function createmlgcamobject(icon, var_14e3b97a4e7f7ba) {
    precacheshader(icon);
    camera = spawn("script_model", (0, 0, 0));
    camera setmodel("tag_origin");
    camera.angles = (0, 0, 0);
    return camera;
}

// Namespace spectating/namespace_5aeecefc462876
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x110
function setlevelmlgcam(index, var_78f81d819c266965) {
    tableindex = index;
    if (tableindex >= 4) {
        tableindex = tableindex - 4;
    }
    mapname = tolower(getdvar(@"hash_687fb8f9b7a23245"));
    var_d9733d3b5b9c44ce = tablelookup(var_78f81d819c266965, 0, mapname, tableindex * 2 + 1);
    if (var_d9733d3b5b9c44ce != "") {
        var_dd0f1974b9c2c56a = index + 1;
        if (index >= 5) {
            var_dd0f1974b9c2c56a = var_dd0f1974b9c2c56a - 4;
        }
        level.cameramapobjs[index] = createmlgcamobject("compass_icon_codcaster_cam", 1);
        level.numbermapobjs[index] = createmlgcamobject("compass_icon_codcaster_num" + var_dd0f1974b9c2c56a, 0);
        var_ffb7ba3abbf69f8c = tablelookup(var_78f81d819c266965, 0, mapname, tableindex * 2 + 2);
        level.camerapos[index] = getcameravecorang(var_d9733d3b5b9c44ce);
        level.cameraang[index] = getcameravecorang(var_ffb7ba3abbf69f8c);
        level.camerahighestindex = index;
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488
// Size: 0x9c
function getlevelmlgcams() {
    while (!isdefined(level.objectiveidpool)) {
        waitframe();
    }
    var_78f81d819c266965 = "mp/CameraPositions";
    var_3b2139bfd025890b = var_78f81d819c266965 + "_" + getgametype() + ".csv";
    var_78f81d819c266965 = var_78f81d819c266965 + ".csv";
    level.cameramapobjs = [];
    level.numbermapobjs = [];
    for (index = 0; index < 4; index++) {
        setlevelmlgcam(index, var_78f81d819c266965);
    }
    for (index = 4; index < 8; index++) {
        setlevelmlgcam(index, var_3b2139bfd025890b);
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b
// Size: 0x71
function getcameravecorang(var_9c0fe13528240836) {
    var_26fa16ced67d6ad0 = strtok(var_9c0fe13528240836, " ");
    var_d2f65e1abe223ead = (0, 0, 0);
    if (isdefined(var_26fa16ced67d6ad0[0]) && isdefined(var_26fa16ced67d6ad0[1]) && isdefined(var_26fa16ced67d6ad0[2])) {
        var_d2f65e1abe223ead = (int(var_26fa16ced67d6ad0[0]), int(var_26fa16ced67d6ad0[1]), int(var_26fa16ced67d6ad0[2]));
    }
    return var_d2f65e1abe223ead;
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4
// Size: 0x14
function onjoinedteam(player) {
    player setspectatepermissions();
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bf
// Size: 0x92
function onjoinedspectators(player) {
    if (!isdefined(player)) {
        return;
    }
    player thread onspectatingclient();
    player thread onspectatingmlgcamera();
    player setspectatepermissions();
    player setclientomnvar("ui_callout_area_id", -1);
    if (player iscodcaster() || isdefined(player.pers["codcaster"]) && player.pers["codcaster"]) {
        player function_7398d812fca0292f(1);
        player thread function_de89a33a1571dd0a();
        player thread autoattachtoplayer();
        player thread saveendgamelocals();
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658
// Size: 0x78
function onspectatingclient() {
    self endon("disconnect");
    self endon("joined_team");
    for (;;) {
        self waittill("spectating_cycle");
        player = self getspectatingplayer();
        if (isdefined(player)) {
            if (isdefined(player.calloutarea)) {
                var_49996ebebbbbf375 = level.calloutglobals.areaidmap[player.calloutarea];
                self setclientomnvar("ui_callout_area_id", var_49996ebebbbbf375);
            }
        }
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7
// Size: 0x73
function onspectatingmlgcamera() {
    self endon("disconnect");
    self endon("joined_team");
    for (;;) {
        self waittill("spectating_mlg_camera");
        var_ecfcf631312f12af = self getmlgselectedcamera();
        if (self iscodcaster() || isdefined(self.pers["codcaster"]) && self.pers["codcaster"]) {
            if (isdefined(var_ecfcf631312f12af)) {
                self setclientomnvar("ui_callout_area_id", -1);
                continue;
            }
        }
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x751
// Size: 0x25
function freecamcallback(channel, view) {
    if (channel == "mlg_view_change") {
        namespace_99ac021a7547cae3::resetuidvarsonspectate();
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0x3d
function updatespectatesettings() {
    level endon("game_ended");
    for (index = 0; index < level.players.size; index++) {
        level.players[index] setspectatepermissions();
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c1
// Size: 0x142
function autoattachtoplayer() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("spectating_mlg_camera");
    level waittill_any_4("prematch_started", "prematch_done", "start_mode_setup", "infil_started");
    level.lastspectatedplayer = game["lastSpectatedPlayer"];
    for (;;) {
        var_d4e316f35a455acd = undefined;
        if (!self iscodcaster() || self isspectatingplayer() || self ismlgfreecamenabled() || self ismlgaerialcamenabled()) {
            break;
        }
        if (level.players.size > 1) {
            if (level.currentround > 1 && isdefined(level.lastspectatedplayer)) {
                var_d4e316f35a455acd = level.lastspectatedplayer;
            } else {
                foreach (entry in level.teamnamelist) {
                    aliveplayers = getfriendlyplayers(entry, 1);
                    if (aliveplayers.size > 0) {
                        var_d4e316f35a455acd = getlowestclientnum(aliveplayers, 1);
                    }
                }
            }
            if (isdefined(var_d4e316f35a455acd)) {
                self spectateclientnum(var_d4e316f35a455acd);
                break;
            }
        }
        wait(1);
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90a
// Size: 0x7e
function function_de89a33a1571dd0a() {
    self endon("joined_team");
    self endon("disconnect");
    self.iswatchingcodcasterball = 0;
    self.codcasterballcamfollow = undefined;
    self.spectatingplayerbeforeballcam = undefined;
    for (;;) {
        for (;;) {
            if (self iscodcaster() && self isspectatingplayer()) {
                player = self getspectatingplayer();
                if (isdefined(player)) {
                    level.lastspectatedplayer = player.clientid;
                }
                player namespace_f5675568ccc8acc6::function_20038a4ada38be4d(self);
            }
        }
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f
// Size: 0x1c
function saveendgamelocals() {
    level waittill("game_ended");
    game["lastSpectatedPlayer"] = level.lastspectatedplayer;
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b2
// Size: 0x49f
function setspectatepermissions(gameended) {
    if (level.gameended && gettime() - level.gameendtime >= 2000 && !istrue(level.postgameexfil)) {
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                self allowspectateteam(entry, 0);
            }
        }
        self allowspectateteam("freelook", 0);
        self allowspectateteam("none", 1);
        return;
    }
    spectatetype = namespace_775507ba36294dfb::gettweakablevalue("game", "spectatetype");
    if (getdvarint(@"hash_e32ebdbb97a1ec4e", 0) == 1) {
        spectatetype = 2;
    }
    if (self iscodcaster()) {
        spectatetype = 2;
    }
    if (istrue(self.inspawncamera) || isdefined(self.setspawnpoint) && namespace_99ac021a7547cae3::mayspawn()) {
        spectatetype = 0;
    }
    if (istrue(gameended)) {
        spectatetype = 2;
    }
    if (istrue(level.var_a98a9986264d0efc)) {
        spectatetype = 0;
    }
    team = self.sessionteam;
    switch (spectatetype) {
    case 0:
        setdisabled();
        break;
    case 1:
        self notify("waitForGameStartSpectate");
        if (team != "spectator" && team != "codcaster") {
            if (level.gametype == "sd") {
                if (team == "allies") {
                    self setclientomnvar("ui_team_before_spectating", 1);
                } else if (team == "axis") {
                    self setclientomnvar("ui_team_before_spectating", 2);
                }
            }
            setteamorplayeronly(team);
        } else if (isdefined(self.pers["last_team"])) {
            if (level.gametype == "sd") {
                if (self.pers["last_team"] == "allies") {
                    self setclientomnvar("ui_team_before_spectating", 1);
                } else if (self.pers["last_team"] == "axis") {
                    self setclientomnvar("ui_team_before_spectating", 2);
                }
            }
            team = self.pers["last_team"];
            setteamorplayeronly(team);
        } else if (istrue(level.prematchstarted)) {
            var_f49ee9d2911c5ab5 = randomint(level.teamnamelist.size);
            setteamorplayeronly(level.teamnamelist[var_f49ee9d2911c5ab5]);
        } else {
            setteamorplayeronly("allies");
            thread waitforgamestartspectate();
            return;
        }
        break;
    case 2:
        setfreelook(gameended);
        break;
    case 3:
        if (team == "spectator" || team == "codcaster") {
            setfreelook();
        } else {
            setteamorplayeronly(team);
        }
        break;
    }
    if (isdefined(team) && isgameplayteam(team)) {
        if (istrue(level.spectateoverride[team].allowfreespectate)) {
            self allowspectateteam("freelook", 1);
        }
        if (istrue(level.spectateoverride[team].allowenemyspectate)) {
            var_b0c33d224b825287 = getenemyteams(team);
            foreach (entry in var_b0c33d224b825287) {
                self allowspectateteam(entry, 1);
            }
        }
    }
    var_929fd4bdfabd747b = privatematch() && namespace_36f464722d326bbe::function_beff479639e6508();
    /#
        if (getdvarint(@"hash_f7fccc8ff6925d24", 0) != 0) {
            var_929fd4bdfabd747b = 1;
        }
    #/
    if (var_929fd4bdfabd747b && (self.sessionteam == "spectator" || self.sessionteam == "codcaster")) {
        foreach (entry in level.teamnamelist) {
            if (!isgameplayteam(entry)) {
                continue;
            }
            self allowspectateteam(entry, 1);
        }
        updatesessionstate("spectator");
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe58
// Size: 0x21
function waitforgamestartspectate() {
    self endon("waitForGameStartSpectate");
    self endon("disconnect");
    level waittill("prematch_started");
    thread setspectatepermissions();
}

// Namespace spectating/namespace_5aeecefc462876
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe80
// Size: 0x73
function setdisabled() {
    self allowspectateteam("freelook", 0);
    self allowspectateteam("none", 0);
    foreach (entry in level.teamnamelist) {
        self allowspectateteam(entry, 0);
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefa
// Size: 0xfa
function setteamorplayeronly(team) {
    self allowspectateteam("freelook", 0);
    if (level.teambased) {
        self allowspectateteam("none", 0);
        foreach (entry in level.teamnamelist) {
            if (team == entry) {
                self allowspectateteam(entry, 1);
            } else {
                self allowspectateteam(entry, 0);
            }
        }
    } else {
        self allowspectateteam("none", 1);
        foreach (entry in level.teamnamelist) {
            self allowspectateteam(entry, 1);
        }
    }
}

// Namespace spectating/namespace_5aeecefc462876
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffb
// Size: 0x12e
function setfreelook(gameended) {
    self allowspectateteam("freelook", 1);
    self allowspectateteam("none", 1);
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        foreach (entry in level.teamnamelist) {
            self allowspectateteam(entry, 1);
        }
        if (istrue(gameended)) {
            thread namespace_99ac021a7547cae3::spawnspectator(undefined, undefined, 1);
        }
    } else if (self iscodcaster()) {
        self allowspectateteam("allies", 1);
        self allowspectateteam("axis", 1);
        thread waitforgamestartspectate();
    } else {
        team = self.sessionteam;
        if (self == level.players[0] || team == "spectator" || team == "codcaster") {
            self allowspectateteam("allies", 1);
            self allowspectateteam("axis", 0);
            thread waitforgamestartspectate();
        }
    }
}
