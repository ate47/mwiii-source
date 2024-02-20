// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_3f8889c16399185c;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace scoreboard;

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2
// Size: 0x5f
function processlobbyscoreboards() {
    processmatchscoreboardinfo();
    foreach (player in level.players) {
        processcommonplayerdataforplayer(player);
    }
}

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458
// Size: 0x58c
function processmatchscoreboardinfo() {
    if (level.multiteambased) {
        buildscoreboardtype("multiteam");
        foreach (player in level.players) {
            player setplayerdata("common", "round", "scoreboardType", "multiteam");
        }
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        team3Score = getteamscore("team_three");
        if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
            setclientmatchdata("alliesScore", alliesscore);
            setclientmatchdata("axisScore", axisscore);
            setclientmatchdata("team3Score", team3Score);
            setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
            setclientmatchdata("alliesKills", -1);
            setclientmatchdata("alliesDeaths", -1);
        }
    } else if (level.teambased) {
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        kills = 0;
        deaths = 0;
        foreach (player in level.players) {
            if (isdefined(player namespace_3c5a4254f2b957ea::getpersstat("team")) && player namespace_3c5a4254f2b957ea::getpersstat("team") == "allies") {
                kills = kills + player namespace_3c5a4254f2b957ea::getpersstat("kills");
                deaths = deaths + player namespace_3c5a4254f2b957ea::getpersstat("deaths");
            }
        }
        winner = "tie";
        if (inovertime()) {
            if (istimetobeatrulegametype()) {
                if (game["timeToBeatTeam"] == "none") {
                    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
                        setclientmatchdata("alliesTTB", 0);
                        setclientmatchdata("axisTTB", 0);
                    }
                    winner = "tie";
                } else {
                    if ("allies" == game["timeToBeatTeam"]) {
                        alliesscore++;
                    } else {
                        axisscore++;
                    }
                    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
                        setclientmatchdata("alliesTTB", ter_op("allies" == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                        setclientmatchdata("axisTTB", ter_op("axis" == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    }
                    winner = game["timeToBeatTeam"];
                }
            } else if (isscoretobeatrulegametype()) {
            }
        } else if (alliesscore == axisscore) {
            winner = "tie";
        } else if (alliesscore > axisscore) {
            winner = "allies";
        } else {
            winner = "axis";
        }
        if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
            setclientmatchdata("alliesScore", alliesscore);
            setclientmatchdata("axisScore", axisscore);
            setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
            setclientmatchdata("alliesKills", kills);
            setclientmatchdata("alliesDeaths", deaths);
        }
        if (winner == "tie") {
            buildscoreboardtype("allies");
            buildscoreboardtype("axis");
            foreach (player in level.players) {
                var_e59c38a3a9665cfb = player namespace_3c5a4254f2b957ea::getpersstat("team");
                if (!isdefined(var_e59c38a3a9665cfb)) {
                    continue;
                }
                if (var_e59c38a3a9665cfb == "spectator" || var_e59c38a3a9665cfb == "codcaster") {
                    player setplayerdata("common", "round", "scoreboardType", "allies");
                } else {
                    player setplayerdata("common", "round", "scoreboardType", var_e59c38a3a9665cfb);
                }
            }
        } else {
            buildscoreboardtype(winner);
            foreach (player in level.players) {
                player setplayerdata("common", "round", "scoreboardType", winner);
            }
        }
    } else {
        buildscoreboardtype("neutral");
        foreach (player in level.players) {
            player setplayerdata("common", "round", "scoreboardType", "neutral");
        }
        if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
            setclientmatchdata("alliesScore", -1);
            setclientmatchdata("axisScore", -1);
            setclientmatchdata("scoreProgressLimit", getomnvar("ui_scorelimit"));
            setclientmatchdata("alliesKills", -1);
            setclientmatchdata("alliesDeaths", -1);
        }
    }
}

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9eb
// Size: 0x1d6
function processcommonplayerdataforplayer(player) {
    var_851e1b97814c1a58 = player namespace_3c5a4254f2b957ea::getpersstat("summary");
    if (isdefined(var_851e1b97814c1a58)) {
        player setplayerdata("common", "round", "totalXp", var_851e1b97814c1a58["xp"]);
        player setplayerdata("common", "round", "scoreXp", var_851e1b97814c1a58["score"]);
        player setplayerdata("common", "round", "challengeXp", var_851e1b97814c1a58["challenge"]);
        player setplayerdata("common", "round", "matchXp", var_851e1b97814c1a58["match"]);
        player setplayerdata("common", "round", "miscXp", var_851e1b97814c1a58["misc"]);
        player setplayerdata("common", "round", "medalXp", var_851e1b97814c1a58["medal"]);
        player setplayerdata("common", "common_entitlement_xp", var_851e1b97814c1a58["bonusXP"]);
    }
    var_97b1e872968f2e54 = player namespace_3c5a4254f2b957ea::getpersstat("aarData");
    if (isdefined(var_97b1e872968f2e54)) {
        player setplayerdata("common", "round", "aarData", "combat_xp", var_97b1e872968f2e54["combat_xp"]);
        player setplayerdata("common", "round", "aarData", "support_xp", var_97b1e872968f2e54["support_xp"]);
        player setplayerdata("common", "round", "aarData", "strategy_xp", var_97b1e872968f2e54["strategy_xp"]);
        player setplayerdata("common", "round", "aarData", "logistics_xp", var_97b1e872968f2e54["logistics_xp"]);
        player setplayerdata("common", "round", "aarData", "recon_xp", var_97b1e872968f2e54["recon_xp"]);
        player setplayerdata("common", "round", "aarData", "use_featured_operator_skin_xp", var_97b1e872968f2e54["use_featured_operator_skin_xp"]);
    }
}

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc8
// Size: 0xb54
function setplayerscoreboardinfo() {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    scoreboardPlayerCount = getclientmatchdata("scoreboardPlayerCount");
    if (scoreboardPlayerCount < 200) {
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("score"))) {
            setclientmatchdata("players", self.clientmatchdataid, "score", namespace_3c5a4254f2b957ea::getpersstat("score"));
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "support_xp" + namespace_3c5a4254f2b957ea::getpersstat("extrascore1"));
            #/
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("kills"))) {
            kills = namespace_3c5a4254f2b957ea::getpersstat("kills");
            setclientmatchdata("players", self.clientmatchdataid, "kills", kills);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "extrascore" + kills);
            #/
        }
        if (getgametype() == "dm" || getgametype() == "gun") {
            assists = self.assists;
        } else if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("assists"))) {
            assists = namespace_3c5a4254f2b957ea::getpersstat("assists");
        } else {
            assists = 0;
        }
        setclientmatchdata("players", self.clientmatchdataid, "assists", assists);
        /#
            println("xp" + self.name + "aarData" + self.clientmatchdataid + "zonecontrol" + assists);
        #/
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("deaths"))) {
            deaths = namespace_3c5a4254f2b957ea::getpersstat("deaths");
            setclientmatchdata("players", self.clientmatchdataid, "deaths", deaths);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + deaths);
            #/
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("team"))) {
            team = namespace_3c5a4254f2b957ea::getpersstat("team");
            setclientmatchdata("players", self.clientmatchdataid, "team", team);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + team);
            #/
            if (isdefined(game[team])) {
                faction = game[team];
                setclientmatchdata("players", self.clientmatchdataid, "faction", faction);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + faction);
                #/
            }
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("extrascore0"))) {
            extrascore0 = namespace_3c5a4254f2b957ea::getpersstat("extrascore0");
            setclientmatchdata("players", self.clientmatchdataid, "extrascore0", extrascore0);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + extrascore0);
            #/
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("extrascore1"))) {
            extrascore1 = namespace_3c5a4254f2b957ea::getpersstat("extrascore1");
            setclientmatchdata("players", self.clientmatchdataid, "extrascore1", extrascore1);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + extrascore1);
            #/
        }
        if (isdefined(self.timeplayed["total"])) {
            timeplayed = self.timeplayed["total"];
            setclientmatchdata("players", self.clientmatchdataid, "timeplayed", timeplayed);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + timeplayed);
            #/
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("rank")) && isdefined(namespace_3c5a4254f2b957ea::getpersstat("rankxp"))) {
            rank = getrank();
            setclientmatchdata("players", self.clientmatchdataid, "rank", rank);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + rank);
            #/
        }
        if (isdefined(namespace_3c5a4254f2b957ea::getpersstat("prestige"))) {
            prestige = namespace_62c556437da28f50::getprestigelevel();
            setclientmatchdata("players", self.clientmatchdataid, "prestige", prestige);
            /#
                println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + prestige);
            #/
        }
        if (namespace_36f464722d326bbe::function_beff479639e6508()) {
            var_7746ca3b56c9afd3 = namespace_d20f8ef223912e12::calculateclientmatchdataextrainfopayload(self);
            /#
                assert(var_7746ca3b56c9afd3.size < 5);
            #/
            for (i = 0; i < var_7746ca3b56c9afd3.size; i++) {
                var_1abc650bb92e6e04 = "extrascore" + i;
                setclientmatchdata("players", self.clientmatchdataid, var_1abc650bb92e6e04, var_7746ca3b56c9afd3[i]);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_1abc650bb92e6e04 + "<unknown string>" + var_7746ca3b56c9afd3[i]);
                #/
            }
            if (getsubgametype() == "risk" || getsubgametype() == "plunder") {
                var_c3e10a42a81ade25 = namespace_e8a49b70d0769b66::getteamscoreplacements();
                placement = var_c3e10a42a81ade25[self.team];
                /#
                    assert(isdefined(placement), "Placement somehow undefined for team: " + self.team);
                #/
                if (isdefined(placement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", placement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("plunder", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                lootcachesopened = 0;
                if (isdefined(self.lootcachesopened)) {
                    lootcachesopened = self.lootcachesopened;
                }
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", lootcachesopened);
            } else if (getsubgametype() == "kingslayer") {
                var_c3e10a42a81ade25 = namespace_e8a49b70d0769b66::getteamscoreplacements();
                placement = var_c3e10a42a81ade25[self.team];
                setclientmatchdata("players", self.clientmatchdataid, "placement", placement);
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("kingslayer", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                lootcachesopened = 0;
                if (isdefined(self.lootcachesopened)) {
                    lootcachesopened = self.lootcachesopened;
                }
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", lootcachesopened);
            } else if (getsubgametype() == "resurgence") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("resurgence", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82);
                #/
            } else if (getsubgametype() == "resurgence_mgl") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("resurgence_mgl", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82);
                #/
            } else if (getsubgametype() == "champion") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("champion", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82);
                #/
            } else if (getsubgametype() == "zonecontrol") {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("zonecontrol", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82[0]);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82[0]);
                #/
                setclientmatchdata("players", self.clientmatchdataid, "extrascore5", var_81dab8953b9df82[1]);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82[1]);
                #/
            } else {
                if (isdefined(self.teamplacement)) {
                    setclientmatchdata("players", self.clientmatchdataid, "placement", self.teamplacement);
                }
                var_81dab8953b9df82 = [[ namespace_3c37cb17ade254d::getsharedfunc("br", "packClientMatchData") ]]();
                setclientmatchdata("players", self.clientmatchdataid, "extrascore4", var_81dab8953b9df82);
                /#
                    println("xp" + self.name + "aarData" + self.clientmatchdataid + "<unknown string>" + var_81dab8953b9df82);
                #/
            }
        }
        /#
            println("<unknown string>" + scoreboardPlayerCount);
        #/
        scoreboardPlayerCount++;
        setclientmatchdata("scoreboardPlayerCount", scoreboardPlayerCount);
        /#
            println("<unknown string>" + scoreboardPlayerCount);
        #/
        maxplayercount = getdvarint(@"hash_818c699a5caaee4f", 0);
        setclientmatchdata("maxPlayerCount", maxplayercount);
    } else {
        /#
            println("<unknown string>" + scoreboardPlayerCount + "<unknown string>");
        #/
    }
}

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1723
// Size: 0x62
function computescoreboardslot(team, index) {
    if (team == "none") {
        return (0 + index);
    }
    if (team == "neutral") {
        return (200 + index);
    }
    if (team == "allies") {
        return (400 + index);
    }
    if (team == "axis") {
        return (600 + index);
    }
    if (team == "multiteam") {
        return (800 + index);
    }
    return 0;
}

// Namespace scoreboard/namespace_633301c58b0b0cec
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178d
// Size: 0x3e6
function buildscoreboardtype(team) {
    if (getdvarint(@"hash_1bc373211683e0b6") == 0) {
        return;
    }
    /#
        assert(team == "allies" || team == "axis" || team == "neutral" || team == "multiteam");
    #/
    /#
        println("<unknown string>" + team + "<unknown string>");
    #/
    if (team == "multiteam" || getsubgametype() == "rumble_mgl") {
        index = 0;
        foreach (teamname in level.teamnamelist) {
            teammembers = undefined;
            if (isdefined(level.placement)) {
                teammembers = level.placement[teamname];
            }
            if (!isdefined(teammembers)) {
                teammembers = namespace_54d20dd0dd79277f::getteamdata(teamname, "players");
            }
            foreach (player in teammembers) {
                namespace_d576b6dc7cef9c62::assignclientmatchdataid(player);
                setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
                /#
                    println("<unknown string>" + team + "<unknown string>" + index + "<unknown string>" + player.clientmatchdataid + "<unknown string>");
                #/
                index++;
            }
        }
    } else if (team == "neutral") {
        index = 0;
        foreach (player in level.placement["all"]) {
            setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
            /#
                println("<unknown string>" + team + "<unknown string>" + index + "<unknown string>" + player.clientmatchdataid + "<unknown string>");
            #/
            index++;
        }
    } else {
        otherteam = getotherteam(team)[0];
        index = 0;
        foreach (player in level.placement[team]) {
            setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
            /#
                println("<unknown string>" + team + "<unknown string>" + index + "<unknown string>" + player.name + "aarData" + player.clientmatchdataid + "<unknown string>");
            #/
            index++;
        }
        foreach (player in level.placement[otherteam]) {
            setclientmatchdata("scoreboards", computescoreboardslot(team, index), player.clientmatchdataid);
            /#
                println("<unknown string>" + team + "<unknown string>" + index + "<unknown string>" + player.name + "aarData" + player.clientmatchdataid + "<unknown string>");
            #/
            index++;
        }
    }
}
