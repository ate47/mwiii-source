#using scripts\mp\flags.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_23a295a7d3a949db;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1070be3357c9454c;
#using scripts\mp\gametypes\wm_ending.gsc;
#using scripts\mp\potg.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_6981400abfcd765c;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_548072087c9fd504;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_629a97c763e17711;
#using script_697b7ae06ba9b28c;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6ad351ebd5a33280;
#using script_4cdabcd91a92977;
#using scripts\mp\class.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\load.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;
#using script_436add9de781cdfb;
#using script_15de7dc4d21f1da3;
#using scripts\cp_mp\ent_manager.gsc;
#using script_509d466932bca53e;
#using scripts\cp_mp\utility\team_utility.gsc;
#using script_76cc264b397db9cb;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_6853191397ec0259;
#using scripts\mp\playerhealth.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\killcam.gsc;
#using scripts\mp\final_killcam.gsc;
#using script_cbb0697de4c5728;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\playercards.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\hud.gsc;
#using scripts\mp\serversettings.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\outline.gsc;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\deathicons.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\brmatchdata.gsc;
#using scripts\mp\brclientmatchdata.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\clientmatchdata.gsc;
#using scripts\mp\awards.gsc;
#using scripts\mp\passives.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_4bac13d511590220;
#using scripts\cp_mp\killstreaks\init.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\archetypes\archcommon.gsc;
#using scripts\mp\online_event.gsc;
#using scripts\mp\whizby.gsc;
#using script_4192352a88553d67;
#using scripts\mp\analyticslog.gsc;
#using script_45f403e1732217d3;
#using script_180407b61054c278;
#using script_404f1aef8aea990;
#using script_7c40fa80892a721;
#using script_600b944a95c3a7bf;
#using scripts\mp\loot.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\mp\bounty.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\gestures_mp.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\arbitrary_up.gsc;
#using script_6a522b6159eb03da;
#using scripts\mp\turret.gsc;
#using script_2b264b25c7da0b12;
#using scripts\mp\laststand.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\matchstats.gsc;
#using scripts\mp\playerstats.gsc;
#using scripts\mp\focus.gsc;
#using scripts\cp_mp\auto_ascender.gsc;
#using scripts\cp_mp\auto_ascender_solo.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\door.gsc;
#using scripts\mp\flashpoint.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\common\elevators.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\hud_popup.gsc;
#using scripts\mp\accolades.gsc;
#using scripts\mp\ammorestock.gsc;
#using scripts\mp\meatshield.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\bots\bots_loadout.gsc;
#using scripts\mp\gamestaterestore.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\common\dof.gsc;
#using script_4a6760982b403bad;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\control.gsc;
#using script_15eddb0fac236a22;
#using script_189b67b2735b981d;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\ui.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\scoreboard.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\print.gsc;

#namespace gamelogic;

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460c
// Size: 0x23e
function onforfeit(team) {
    if (isdefined(level.forfeitinprogress)) {
        return;
    }
    level endon("abort_forfeit");
    level thread forfeitwaitforabort();
    level.forfeitinprogress = 1;
    level.canprocessot = 0;
    if (!level.teambased && level.players.size > 1) {
        wait 10;
    } else {
        wait 1.05;
    }
    level.forfeit_aborted = 0;
    forfeit_delay = 20;
    matchforfeittimer(forfeit_delay);
    endreason = %;
    if (!isdefined(team)) {
        endreason = game["end_reason"]["players_forfeited"];
        winner = level.players[0];
    } else {
        if (team == "allies") {
            endreason = game["end_reason"]["spetsnaz_forfeited"];
        } else {
            endreason = game["end_reason"]["marines_forfeited"];
        }
        winner = team;
        if (istrue(level.var_ec2fb549b15ad827)) {
            forfeitteam = ter_op(winner == "allies", "axis", "allies");
            game["roundsWon"][winner] = ter_op(isroundbased(), getscorelimit(), 1);
            game["roundsWon"][forfeitteam] = 0;
            game["teamScores"][winner] = getscorelimit();
            game["teamScores"][forfeitteam] = 0;
            setteamscore(winner, 1);
            setteamscore(forfeitteam, 0);
        }
    }
    level.forcedend = 1;
    if (isdefined(winner)) {
        if (isplayer(winner)) {
            logstring("forfeit, win: " + winner getxuid() + "(" + winner.name + ")");
        } else {
            logstring("forfeit, win: " + winner);
            foreach (entry in level.teamnamelist) {
                logstring(entry + ":" + game["teamScores"][entry]);
            }
        }
    }
    thread endgame(winner, endreason);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4852
// Size: 0xb9
function forfeitwaitforabort() {
    level endon("game_ended");
    if (getdvarfloat(@"hash_739bbd49f9779978") == 1) {
        level.disableforfeit = 1;
        level notify("abort_forfeit");
    } else {
        level waittill("abort_forfeit");
    }
    level.forfeit_aborted = 1;
    level.canprocessot = 1;
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
        p setclientomnvar("ui_match_in_progress", 1);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4913
// Size: 0x118
function matchforfeittimer_internal(counttime) {
    waittillframeend();
    level endon("match_forfeit_timer_beginning");
    while (counttime > 0 && !level.gameended && !level.forfeit_aborted && !level.ingraceperiod) {
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", counttime);
            p setclientomnvar("ui_match_in_progress", 0);
        }
        counttime--;
        scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(1);
    }
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
        p setclientomnvar("ui_match_in_progress", 1);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a33
// Size: 0x3c
function matchforfeittimer(duration) {
    level notify("match_forfeit_timer_beginning");
    counttime = int(duration);
    setomnvar("ui_match_start_text", "opponent_forfeiting_in");
    matchforfeittimer_internal(counttime);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a77
// Size: 0x3bd
function default_ondeadevent(team) {
    logstring("team eliminated: " + team);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        foreach (player in getteamdata(team, "players")) {
            result = undefined;
            if (istrue(player scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat")) || istrue(player scripts\mp\utility\stats::getpersstat("participation"))) {
                result = "eliminated";
            }
            player scripts\cp_mp\utility\game_utility::stopkeyearning(result);
        }
        playerendmatch();
        function_53f71c9dbfe19ce9(team);
    }
    if (team == "all") {
        logstring("tie");
        foreach (entry in level.teamnamelist) {
            logstring(entry + ": " + game["teamScores"][entry]);
        }
        if (level.teambased) {
            thread endgame("tie", game["end_reason"]["tie"]);
        } else {
            thread endgame(undefined, game["end_reason"]["tie"]);
        }
        return;
    }
    enemyteams = getenemyteams(team);
    livescount = [];
    foreach (entry in enemyteams) {
        livescount[entry] = 0;
    }
    if (!istrue(level.disablespawning)) {
        foreach (entry in enemyteams) {
            foreach (player in getteamdata(entry, "players")) {
                if (!istrue(player.hasspawned)) {
                    continue;
                }
                livescount[entry] = livescount[entry] + player scripts\mp\utility\stats::getpersstat("lives");
            }
        }
    }
    remainingteams = [];
    foreach (entry in enemyteams) {
        alivecount = getteamdata(entry, "aliveCount");
        assert(alivecount >= 0);
        UIBotCount = 0;
        if (isdefined(level.var_7b37b2193f163b9b)) {
            UIBotCount = getteamdata(entry, "UIBotCount");
            assert(UIBotCount >= 0);
        }
        if (alivecount > 0 || UIBotCount > 0 || livescount[entry]) {
            remainingteams[remainingteams.size] = entry;
        }
    }
    var_947925f5fc6939a3 = 1;
    if (isdefined(level.var_947925f5fc6939a3)) {
        var_947925f5fc6939a3 = [[ level.var_947925f5fc6939a3 ]]();
    }
    if (remainingteams.size == 1 && !scripts\mp\gametypes\br::function_a587b0b0998c6d13() && var_947925f5fc6939a3) {
        thread endgame(remainingteams[0], game["end_reason"]["enemies_eliminated"], game["end_reason"]["br_eliminated"]);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3c
// Size: 0x8a
function default_ononeleftevent(team) {
    if (level.teambased) {
        assert(array_contains(level.teamnamelist, team));
        lastplayer = getlastlivingplayer(team);
        if (isdefined(lastplayer)) {
            lastplayer thread givelastonteamwarning();
        }
    } else {
        lastplayer = getlastlivingplayer();
        logstring("last one alive, win: " + lastplayer.name);
        thread endgame(lastplayer, game["end_reason"]["enemies_eliminated"]);
    }
    return true;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ecf
// Size: 0x372
function roundend_checkscorelimit(team, allowtie) {
    checkteamscorelimitsoon(team);
    scorelimittext = "score_limit_reached";
    if (isdefined(level.var_4817bac75a8b9eff)) {
        scorelimittext = level.var_4817bac75a8b9eff;
    }
    if (istrue(allowtie)) {
        level notify("roundEnd_CheckScoreLimit");
        level endon("roundEnd_CheckScoreLimit");
        waitframe();
    }
    wingamebytype = getwingamebytype();
    if (inovertime() || intimetobeat()) {
        if (istimetobeatrulegametype()) {
            if (settimetobeat(team)) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                thread endgame(team, game["end_reason"][scorelimittext]);
            }
        } else if (isscoretobeatrulegametype()) {
        } else {
            thread endgame(team, game["end_reason"][scorelimittext]);
        }
        return;
    }
    if (level.roundscorelimit > 0) {
        var_fd63d90025d110ed = [];
        if (getgametype() == "ballmode") {
            var_fd63d90025d110ed[0] = team;
        } else {
            foreach (entry in level.teamnamelist) {
                if (game["teamScores"][entry] >= level.roundscorelimit) {
                    var_fd63d90025d110ed[var_fd63d90025d110ed.size] = entry;
                }
            }
        }
        if (var_fd63d90025d110ed.size > 0) {
            if (var_fd63d90025d110ed.size > 1) {
                highestscore = 0;
                highestteam = undefined;
                var_ca17acb9ea3fa61d = 0;
                foreach (entry in var_fd63d90025d110ed) {
                    teamscore = game["teamScores"][entry];
                    if (!isdefined(highestteam)) {
                        highestscore = teamscore;
                        highestteam = entry;
                        var_ca17acb9ea3fa61d = 0;
                        continue;
                    }
                    if (teamscore > highestscore) {
                        highestscore = teamscore;
                        highestteam = entry;
                        var_ca17acb9ea3fa61d = 0;
                        continue;
                    }
                    if (teamscore == highestscore) {
                        var_ca17acb9ea3fa61d = 1;
                    }
                }
                if (var_ca17acb9ea3fa61d) {
                    if (isdefined(level.onscorelimit)) {
                        [[ level.onscorelimit ]]("tie");
                    }
                    thread endgame("tie", game["end_reason"][scorelimittext]);
                } else {
                    if (isdefined(level.onscorelimit)) {
                        [[ level.onscorelimit ]](highestteam);
                    }
                    thread endgame(highestteam, game["end_reason"][scorelimittext]);
                }
                return;
            }
            if (isdefined(level.onscorelimit)) {
                [[ level.onscorelimit ]](var_fd63d90025d110ed[0]);
            }
            thread endgame(var_fd63d90025d110ed[0], game["end_reason"][scorelimittext]);
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5249
// Size: 0x160
function default_ontimelimit() {
    winner = "tie";
    if (level.teambased) {
        if (inovertime() || intimetobeat()) {
            if (isscoretobeatrulegametype()) {
                score = game["overtimeProgress"] + game["overtimeProgressFrac"];
                winner = setscoretobeat(game["attackers"], score * 60);
            } else if (istimetobeatvalid()) {
                winner = game["timeToBeatTeam"];
            }
        } else {
            winner = scripts\mp\gamescore::gethighestscoringteam();
        }
        logstring("time limit, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = scripts\mp\gamescore::gethighestscoringplayer();
        if (scripts\mp\gamescore::ishighestscoringplayertied()) {
            winner = "tie";
        }
        if (isdefined(winner) && isplayer(winner)) {
            logstring("time limit, win: " + winner.name);
        } else {
            logstring("time limit, tie");
        }
    }
    thread endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b1
// Size: 0x28
function default_onhalftime() {
    winner = undefined;
    thread endgame("halftime", game["end_reason"]["time_limit_reached"]);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e1
// Size: 0x240
function forceend(reason) {
    if (level.hostforcedend || level.forcedend) {
        return;
    }
    scripts\mp\gamescore::updateplacement();
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            scripts\mp\gamescore::updatetotalteamscore(entry);
        }
    }
    winner = undefined;
    if (level.teambased) {
        winner = scripts\mp\gamescore::gethighestscoringteam();
        logstring("host ended game, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = scripts\mp\gamescore::gethighestscoringplayer();
        if (isdefined(winner)) {
            logstring("host ended game, win: " + winner.name);
        } else {
            logstring("host ended game, tie");
        }
    }
    level.forcedend = 1;
    level.hostforcedend = 1;
    if (level.splitscreen) {
        endstring = game["end_reason"]["ended_game"];
    } else {
        endstring = game["end_reason"]["host_ended_game"];
    }
    if (isdefined(reason) && reason == 2) {
        if (level.teambased) {
            if (winner == "allies") {
                endreason = game["end_reason"]["spetsnaz_forfeited"];
            } else {
                endreason = game["end_reason"]["marines_forfeited"];
            }
        } else {
            endreason = game["end_reason"]["players_forfeited"];
        }
    } else if (istrue(level.var_ec2fb549b15ad827) && istrue(level.leagueplaymatchcancelled)) {
        winner = "tie";
        endstring = game["end_reason"]["lp_match_cancelled"];
    }
    level notify("force_end");
    thread endgame(winner, endstring);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5629
// Size: 0x1f3
function onscorelimit(allowtie) {
    scoretext = game["end_reason"]["score_limit_reached"];
    winner = "tie";
    if (level.teambased) {
        winner = scripts\mp\gamescore::calculatewinningteam();
        if (winner == "none") {
            winner = "tie";
        }
        logstring("scorelimit, win: " + winner);
        foreach (entry in level.teamnamelist) {
            logstring(entry + ":" + game["teamScores"][entry]);
        }
    } else {
        winner = scripts\mp\gamescore::gethighestscoringplayer();
        if (istrue(allowtie) && scripts\mp\gamescore::ishighestscoringplayertied()) {
            winner = "tie";
        }
        if (isdefined(winner) && isplayer(winner)) {
            logstring("scorelimit, win: " + winner.name);
        } else {
            logstring("scorelimit, tie");
        }
        nukecost = winner scripts\mp\killstreaks\killstreaks::calcstreakcost("nuke");
        if (getscorelimit() == nukecost && winner.pers["cur_kill_streak"] == nukecost) {
            level.modescorewinner = winner;
            dvarhash = function_3514ae5d09f47ed2("timeLimit");
            level.starttime = gettime();
            level.discardtime = 0;
            level.timerpausetime = 0;
            level.watchdvars[dvarhash].value = 30;
            level.overridewatchdvars[dvarhash] = 30;
            level.dontendonscore = 1;
            return;
        }
    }
    if (isdefined(level.onscorelimit)) {
        [[ level.onscorelimit ]](winner);
    }
    thread endgame(winner, scoretext);
    return 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5825
// Size: 0x9e8
function updategameevents() {
    totalplayers = 0;
    level.teamswithplayers = [];
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        totalplayers += teamcount;
        if (teamcount) {
            level.teamswithplayers[level.teamswithplayers.size] = team;
        }
    }
    if (matchmakinggame() && !gameflag("prematch_done")) {
        return;
    }
    if (matchmakinggame() && !level.ingraceperiod && (!isdefined(level.disableforfeit) || !level.disableforfeit)) {
        if (level.teambased) {
            if (level.teamswithplayers.size == 1 && game["state"] == "playing") {
                thread onforfeit(level.teamswithplayers[0]);
                return;
            }
            if (level.teamswithplayers.size > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        } else {
            playercount = 0;
            foreach (entry in level.teamnamelist) {
                playercount += getteamdata(entry, "teamCount");
            }
            if (playercount == 1 && level.maxplayercount > 1) {
                thread onforfeit();
                return;
            }
            if (playercount > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        }
    }
    if (level.teamswithplayers.size == 1 && (istrue(level.br_debugsolotest) || !scripts\cp_mp\utility\game_utility::isbrstylegametype())) {
        return;
    }
    if (!getgametypenumlives() && (!isdefined(level.disablespawning) || !level.disablespawning)) {
        return;
    }
    if (!gamehasstarted()) {
        return;
    }
    if (level.ingraceperiod && !isdefined(level.overrideingraceperiod)) {
        return;
    }
    if (level.teambased) {
        livescount = [];
        foreach (entry in level.teamnamelist) {
            livescount[entry] = 0;
        }
        foreach (player in level.players) {
            if (!istrue(player.hasspawned) || player.team == "spectator" || player.team == "codcaster" || player.team == "free") {
                continue;
            }
            livescount[player.team] = livescount[player.team] + player scripts\mp\utility\stats::getpersstat("lives");
        }
        if (istrue(level.disablespawning)) {
            foreach (entry in level.teamnamelist) {
                livescount[entry] = 0;
            }
        }
        var_4351d3695cbe4fd7 = 0;
        foreach (entry in level.teamnamelist) {
            if (getteamdata(entry, "aliveCount")) {
                var_4351d3695cbe4fd7 = 1;
                break;
            }
        }
        haslivescount = 0;
        foreach (count in livescount) {
            if (count) {
                haslivescount = 1;
                break;
            }
        }
        if (!var_4351d3695cbe4fd7 && !haslivescount) {
            if (istrue(level.postgameexfil) && level.gameended) {
                level notify("exfil_continue_game_end");
            }
            if (istrue(level.nukeinfo.incoming)) {
                return;
            }
            if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                logstring("IWH-315293: GIBBERFISH: onDeadEvent - all");
            }
            return [[ level.ondeadevent ]]("all");
        }
        foreach (entry in level.teamnamelist) {
            if (!getteamdata(entry, "aliveCount") && !livescount[entry]) {
                if (istrue(level.postgameexfil) && level.gameended) {
                    level notify("exfil_continue_game_end");
                }
                if (!istrue(level.skipondeadevent)) {
                    if (istrue(level.nukeinfo.incoming)) {
                        return;
                    }
                    if (level.multiteambased) {
                        if (!getteamdata(entry, "deathEvent") && getteamdata(entry, "hasSpawned")) {
                            if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                                logstring("IWH-315293: GIBBERFISH: onDeadEvent - entry MultiteamBased");
                            }
                            setteamdata(entry, "deathEvent", 1);
                            [[ level.ondeadevent ]](entry);
                        }
                        continue;
                    }
                    if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
                        logstring("IWH-315293: GIBBERFISH: onDeadEvent - entry Team based");
                    }
                    return [[ level.ondeadevent ]](entry);
                }
            }
        }
        foreach (entry in level.teamnamelist) {
            var_a27052041bc3242b = getteamdata(entry, "aliveCount");
            if (var_a27052041bc3242b == 1 || var_a27052041bc3242b == 2 || getbasegametype() == "control") {
                teammatelives = 0;
                return_val = undefined;
                players = getteamdata(entry, "players");
                aliveplayers = [];
                foreach (player in players) {
                    if (!isalive(player)) {
                        teammatelives += player scripts\mp\utility\stats::getpersstat("lives");
                        continue;
                    }
                    aliveplayers[aliveplayers.size] = player;
                }
                if (var_a27052041bc3242b != 1) {
                    setteamdata(entry, "oneLeft", 0);
                }
                var_129ccb16298ea627 = 0;
                if (getbasegametype() == "control") {
                    livescount = getteamdata(entry, "livesCount");
                    alivecount = getteamdata(entry, "aliveCount");
                    total_lives = livescount + alivecount;
                    if (total_lives == 1 && level.numteamlives != 0) {
                        var_129ccb16298ea627 = 1;
                    }
                } else if (teammatelives == 0) {
                    var_129ccb16298ea627 = 1;
                }
                if (var_129ccb16298ea627) {
                    if (var_a27052041bc3242b == 1 && !getteamdata(entry, "oneLeft") && gettime() > getteamdata(entry, "oneLeftTime") + 5000) {
                        setteamdata(entry, "oneLeftTime", gettime());
                        setteamdata(entry, "oneLeft", 1);
                        if (players.size > 1) {
                            [[ level.ononeleftevent ]](entry);
                        }
                    }
                }
                continue;
            }
            setteamdata(entry, "oneLeft", 0);
        }
        return;
    }
    livescount = 0;
    foreach (player in level.players) {
        if (player.team == "spectator" || player.team == "codcaster") {
            continue;
        }
        livescount += player scripts\mp\utility\stats::getpersstat("lives");
    }
    alivecounttotal = 0;
    foreach (entry in level.teamnamelist) {
        alivecounttotal += getteamdata(entry, "aliveCount");
    }
    if (!alivecounttotal && !livescount) {
        if (istrue(level.nukeinfo.incoming)) {
            return;
        }
        return [[ level.ondeadevent ]]("all");
    }
    liveplayers = getpotentiallivingplayers();
    if (liveplayers.size == 1) {
        return [[ level.ononeleftevent ]]("all");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6215
// Size: 0x71
function timelimitclock_intermission(waittime) {
    setgameendtime(gettime() + int(waittime * 1000));
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    if (waittime >= 10) {
        wait waittime - 10;
    }
    for (;;) {
        clockobject playsound("ui_mp_timer_countdown");
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x628e
// Size: 0x32b
function waitforplayers(maxtime, var_c8c8535645d45985, var_4670fd6135253c34) {
    starttime = gettime();
    if (istrue(game["isLaunchChunk"])) {
        mintime = 0;
    } else if (maxtime > 5) {
        mintime = gettime() + getdvarint(@"hash_4e2f47a7b2856857") * 1000;
    } else {
        mintime = 0;
    }
    if (var_4670fd6135253c34) {
        var_26cd2fe9d9c7396a = max(1, level.connectingplayers);
    } else {
        var_26cd2fe9d9c7396a = max(1, level.connectingplayers / 2);
    }
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "ob") {
        var_26cd2fe9d9c7396a = level.connectingplayers;
    }
    scripts\mp\flags::gameflagwait("infil_setup_complete");
    var_7d3c76f0163532bd = 0;
    var_dc74b0012af15741 = 0;
    while (true) {
        if (istrue(game["roundsPlayed"]) && !scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
            break;
        }
        var_d2a0f17e8e173e01 = level.maxplayercount;
        var_b7652eea48ae3d62 = getstreamedinplayercount();
        if (!var_7d3c76f0163532bd) {
            if (var_b7652eea48ae3d62 > 0) {
                starttime = gettime();
                var_7d3c76f0163532bd = 1;
            } else {
                waitframe();
                continue;
            }
        }
        curtime = gettime();
        var_54ab13ac8f1a59cd = var_d2a0f17e8e173e01 >= var_26cd2fe9d9c7396a;
        var_fd915e8bd20b6d09 = 0;
        if (isdefined(level.var_fd915e8bd20b6d09)) {
            var_fd915e8bd20b6d09 = [[ level.var_fd915e8bd20b6d09 ]]();
        } else {
            var_fd915e8bd20b6d09 = var_b7652eea48ae3d62 >= var_26cd2fe9d9c7396a;
        }
        if (var_fd915e8bd20b6d09) {
            foreach (entry in level.teamnamelist) {
                if (!checkrequiredteamcount(entry)) {
                    var_54ab13ac8f1a59cd = 0;
                    break;
                }
            }
        }
        foreach (entry in level.teamnamelist) {
            if (!checkrequiredteamstreamcount(entry)) {
                if (getgametype() == "arena" && !var_dc74b0012af15741) {
                    setomnvar("ui_match_start_text", "waiting_for_teams");
                }
                var_fd915e8bd20b6d09 = 0;
                break;
            }
        }
        endtime = starttime + level.prematchperiod * 1000 - 200;
        if (scripts\mp\flags::gameflag("infil_will_run") || istrue(var_c8c8535645d45985)) {
            if (var_fd915e8bd20b6d09 && curtime > mintime || curtime > endtime) {
                break;
            }
        } else if (var_fd915e8bd20b6d09 && var_54ab13ac8f1a59cd && curtime > mintime || curtime > endtime) {
            break;
        }
        waitframe();
    }
    /#
        totaltime = gettime() - starttime;
        println("<dev string:x1c>" + totaltime + "<dev string:x35>");
    #/
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c1
// Size: 0x513
function function_d084af239c9a23c(duration, var_c8c8535645d45985) {
    if (istrue(game["roundsPlayed"])) {
        return;
    }
    starttime = gettime();
    endtime = starttime + duration * 1000;
    mintime = gettime() + getdvarint(@"hash_4e2f47a7b2856857") * 1000;
    var_26cd2fe9d9c7396a = level.requiredplayercount["allies"] + level.requiredplayercount["axis"];
    var_7d3c76f0163532bd = 0;
    cancelmatch = 0;
    loadoutsforced = 0;
    lastprinttime = 0;
    if (getdvarint(@"hash_e7fd1773dcd3056b", 0) && var_c8c8535645d45985) {
        var_26cd2fe9d9c7396a -= getdvarint(@"hash_e7fd1773dcd3056b", 0);
    }
    while (true) {
        curtime = gettime();
        var_d2a0f17e8e173e01 = level.maxplayercount;
        var_b7652eea48ae3d62 = getstreamedinplayercount();
        if (!var_7d3c76f0163532bd) {
            if (var_b7652eea48ae3d62 > 0) {
                starttime = gettime();
                var_7d3c76f0163532bd = 1;
                if (getdvarint(@"hash_5886df61b04d3129", 0)) {
                    break;
                }
            } else {
                /#
                    if (curtime - lastprinttime > 3000) {
                        println("<dev string:x4c>" + var_b7652eea48ae3d62 + "<dev string:x67>");
                        lastprinttime = curtime;
                    }
                #/
                waitframe();
                continue;
            }
        }
        var_54ab13ac8f1a59cd = var_d2a0f17e8e173e01 >= var_26cd2fe9d9c7396a;
        var_93e3fe0e5693889b = var_b7652eea48ae3d62 >= var_26cd2fe9d9c7396a;
        /#
            if (curtime - lastprinttime > 3000) {
                alliescount = 0;
                axiscount = 0;
                undefinedcount = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.team)) {
                        undefinedcount++;
                        continue;
                    }
                    if (player.team == "<dev string:x83>") {
                        alliescount++;
                        continue;
                    }
                    if (player.team == "<dev string:x8a>") {
                        axiscount++;
                    }
                }
                println("<dev string:x4c>" + alliescount + "<dev string:x8f>");
                println("<dev string:x4c>" + axiscount + "<dev string:xa7>");
                println("<dev string:x4c>" + undefinedcount + "<dev string:xbd>");
            }
        #/
        if (var_93e3fe0e5693889b) {
            foreach (entry in level.teamnamelist) {
                if (!checkrequiredteamcount(entry)) {
                    var_54ab13ac8f1a59cd = 0;
                    break;
                }
            }
        }
        if (istrue(var_c8c8535645d45985) && var_93e3fe0e5693889b && curtime > mintime) {
            break;
        } else if (var_54ab13ac8f1a59cd && curtime > mintime) {
            break;
        }
        if (!var_c8c8535645d45985 && getdvarint(@"hash_5886df61b04d3129", 0) == 0 && !istrue(level.var_60f7d8bd0181980f) && getactiveclientcount(1) < var_26cd2fe9d9c7396a) {
            level.var_60f7d8bd0181980f = 1;
            setomnvarforallclients("ui_leagueplay_allow_quit", 1);
            thread function_46eb417b582d5179(endtime - curtime);
        }
        if (curtime > endtime) {
            cancelmatch = 1;
            println("<dev string:xd8>" + level.var_c8001f5313a05589 + "<dev string:x101>");
            break;
        }
        if (!var_c8c8535645d45985 && !loadoutsforced && curtime + level.prematchperiodend * 1000 > endtime) {
            foreach (player in level.players) {
                if (istrue(player.waitingtoselectclass)) {
                    var_ed6036c19a695cd2 = player getplayerdata(level.loadoutsgroup, "customizationFavorites", "favoriteLoadoutIndex");
                    loadout_index = ter_op(isdefined(var_ed6036c19a695cd2), var_ed6036c19a695cd2, 0);
                    player notify("loadout_class_selected", loadout_index);
                    player setclientomnvar("ui_options_menu", 0);
                }
            }
            loadoutsforced = 1;
        }
        /#
            if (curtime - lastprinttime > 3000) {
                println("<dev string:x4c>" + var_b7652eea48ae3d62 + "<dev string:x67>");
                println("<dev string:x4c>" + var_d2a0f17e8e173e01 + "<dev string:x128>");
                lastprinttime = curtime;
            }
        #/
        waitframe();
    }
    /#
        totaltime = gettime() - starttime;
        println("<dev string:x13e>" + totaltime + "<dev string:x35>");
    #/
    if (getdvarint(@"hash_c03a546c561f9ef", 0) || var_c8c8535645d45985) {
        return;
    }
    if (cancelmatch) {
        namespace_82872106c3e3314d::cancel_match();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6adc
// Size: 0x6f
function getstreamedinplayercount() {
    count = 0;
    foreach (player in level.players) {
        if (istrue(player scripts\mp\utility\stats::getpersstat("streamSyncComplete"))) {
            count++;
        }
    }
    return count;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b54
// Size: 0x23
function checkrequiredteamcount(team) {
    return getteamdata(team, "hasSpawned") >= level.requiredplayercount[team];
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b80
// Size: 0xa5
function checkrequiredteamstreamcount(team) {
    count = 0;
    foreach (player in level.players) {
        if (isdefined(player.team) && player.team == team && istrue(player scripts\mp\utility\stats::getpersstat("streamSyncComplete"))) {
            count++;
        }
    }
    return count >= level.requiredplayercount[team];
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c2e
// Size: 0x61e
function prematchperiod() {
    level endon("game_ended");
    level.connectingplayers = getdvarint(@"hash_6317f96738d7a501");
    if (getdvarint(@"hash_f77b78837563fb9a", 0) == 1 && !istrue(level.skipprematch)) {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            assertmsg("IWH-315293: BELUGA: " + "Gametype:" + getgametype() + " inLiveLobby, we shouldn't be");
        }
        game["inLiveLobby"] = 1;
        if (getdvarint(@"hash_466714dad346a907", 0) == 1) {
            level thread watchdevoverridematchstart();
        }
        level thread watchforlowpopmatchstart(1);
        level thread watchforminplayersmatchstart();
        level waittill("start_prematch");
        if (level.var_77907d733abe8b63) {
            level thread namespace_2c7976a64ea24d6a::function_562f080949959cfc();
            level thread namespace_2c7976a64ea24d6a::function_d794d8a20e142efa();
        }
        setdvar(@"hash_f77b78837563fb9a", 0);
        game["inLiveLobby"] = 0;
        game["liveLobbyCompleted"] = 1;
        matchdelay = 30;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            matchdelay = getmatchrulesdata("brData", "preMatchStartTimer");
        }
        /#
            if (getdvarfloat(@"hash_7a1447160ba151fe", 0) > 0) {
                matchdelay = getdvarfloat(@"hash_7a1447160ba151fe", 0);
            }
            if (getdvarfloat(@"hash_1c528462a5c6a55d", 0) > 0) {
                spawnselectdelay = getdvarfloat(@"hash_1c528462a5c6a55d", 0);
            }
        #/
        level.allowprematchdamage = 0;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (!istrue(level.var_78db23c4f4816114)) {
                level.allowprematchdamage = 1;
            }
            level thread scripts\mp\gametypes\br_public::br_delaynojip();
        }
        level livelobbymatchstarttimer("match_starting_in", matchdelay);
        level notify("start_prematch");
        level.prematchperiod = 0;
        game["blockJIP"] = 1;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            level thread namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
        }
        if (!privatematch()) {
            if (getdvarint(@"hash_22eddf44003baf9", 0) != 0 && function_7eda3128313bb227()) {
                println("<dev string:x162>");
                setdvar(@"hash_925f7dceb8e6205e", 1);
                namespace_bf9ffd2b22c7d819::function_c5728699e6b79552(1);
            } else {
                println("<dev string:x19b>");
                setdvar(@"hash_925f7dceb8e6205e", 0);
            }
        } else if (getdvarint(@"hash_22eddf44003baf9", 0) != 0 && getdvarint(@"hash_8af519063ce59ce9", 0) != 0) {
            println("<dev string:x1d5>");
            setdvar(@"hash_15dc0d6798e4bdd8", 1);
            setdvar(@"hash_925f7dceb8e6205e", 1);
            namespace_bf9ffd2b22c7d819::function_c5728699e6b79552(1);
        }
    } else if (!istrue(level.skipprematch)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
            minplayers = getdvarint(@"hash_faf1db5754891b2d");
            if (minplayers != 0) {
                level thread watchforlowpopmatchstart();
                level thread brwatchforminplayersmatchstart();
                level waittill("start_prematch");
                if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                    level thread namespace_8885c19c053dcb46::function_c24d9aca5f9eba35();
                }
                if (level.var_77907d733abe8b63) {
                    level thread namespace_2c7976a64ea24d6a::function_562f080949959cfc();
                    level thread namespace_2c7976a64ea24d6a::function_d794d8a20e142efa();
                }
                /#
                    var_98c4343376bcedb9 = 0;
                    while (istrue(level.var_9bb484946bcc49b2)) {
                        var_98c4343376bcedb9 = 1;
                        waitframe();
                    }
                    foreach (player in level.players) {
                        if (!isdefined(player)) {
                            continue;
                        }
                        if (isbot(player) || istestclient(player)) {
                            while (isdefined(player) && !player.hasspawned) {
                                waitframe();
                            }
                        }
                    }
                    if (var_98c4343376bcedb9) {
                        wait 1;
                    }
                #/
            }
            matchdelay = 15;
            /#
                if (getdvarfloat(@"hash_7a1447160ba151fe", 0) > 0) {
                    matchdelay = getdvarfloat(@"hash_7a1447160ba151fe", 0);
                }
            #/
            level.allowprematchdamage = 0;
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "dmz") {
                level.allowprematchdamage = 1;
            }
            level livelobbymatchstarttimer("match_starting_in", matchdelay);
        }
    }
    /#
        if (level.mapname == "<dev string:x242>" && !isprophuntgametype() && getdvarint(@"hash_ff65c25889692db8", 0) != 1) {
            level thread givebmodevloadouts();
        }
    #/
    if (istrue(level.skipprematch)) {
        while (!level.players.size) {
            waitframe();
        }
        if (matchmakinggame() && scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
            var_1580cb21313fb11c = 2000;
            untiltime = gettime() + var_1580cb21313fb11c;
            var_458c943d98a7ed1a = function_fe94aaedd1047d50();
            assert(var_458c943d98a7ed1a > 0);
            while (gettime() < untiltime && function_e48deb3d75ab2e92() < var_458c943d98a7ed1a) {
                waitframe();
            }
        }
    }
    if (istrue(game["matchStartRequiresInput"])) {
        level waittill("pressToStartMatch");
    }
    if (istrue(game["blockJIP"])) {
        setnojipscore(1, 1);
        setnojiptime(1, 1);
        level.nojip = 1;
    }
    if (istrue(level.leagueplaymatchcancelled)) {
        return;
    }
    level notify("prematch_started");
    if (istrue(level.var_66113aa6fc12be57)) {
        level.parachuterestoreweaponscb = &scripts\mp\gametypes\br::nakeddrop;
    }
    if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
        logstring("IWH-315293: CEPHALOPOD: prematch_started notified");
    }
    updatetournamentroundtime(gettimeremaining(), 2);
    level.prematchstarted = 1;
    if (level.prematchperiodend > 0) {
        matchstarttimerwaitforplayers();
    } else {
        matchstarttimerskip();
    }
    scripts\mp\hostmigration::waittillhostmigrationdone();
    updatetournamentroundtime(gettimeremaining(), 0);
    if (game["state"] != "playing") {
        return;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7254
// Size: 0x1c
function inprematch() {
    return !istrue(level.skipprematch) && !scripts\mp\flags::gameflag("prematch_done");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7279
// Size: 0x76
function givebmodevloadouts() {
    wait 3;
    if (isdefined(level.parachuterestoreweaponscb)) {
        foreach (player in level.players) {
            if (isreallyalive(player)) {
                player [[ level.parachuterestoreweaponscb ]]();
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f7
// Size: 0x12f
function graceperiod() {
    level endon("game_ended");
    if (!isdefined(game["clientActive"])) {
        while (getactiveclientcount() == 0) {
            waitframe();
        }
        game["clientActive"] = 1;
    }
    while (level.ingraceperiod > 0) {
        wait 1;
        level.ingraceperiod--;
    }
    level notify("grace_period_ending");
    waitframe();
    scripts\mp\flags::gameflagset("graceperiod_done");
    level.ingraceperiod = 0;
    if (game["state"] != "playing") {
        if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
            logstring("IWH-315293: FROGFISH: game[ state ] != playing");
        }
        return;
    }
    if (getgametypenumlives()) {
        players = level.players;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player.hasspawned && player.sessionteam != "spectator" && !isalive(player)) {
                player.statusicon = "hud_status_dead";
            }
        }
    }
    level thread [[ level.updategameevents ]]();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742e
// Size: 0xf2
function sethasdonecombat(player, newhasdonecombat) {
    if (!isdefined(player.hasDoneAnyCombat)) {
        player.hasDoneAnyCombat = player scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat");
    }
    if (newhasdonecombat && !istrue(player.hasdonecombat)) {
        scripts\mp\class::disableclassswapallowed();
    }
    player.hasdonecombat = newhasdonecombat;
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !scripts\mp\flags::gameflag("prematch_done")) {
        return;
    }
    if (newhasdonecombat && !istrue(player.hasDoneAnyCombat)) {
        player.pers["hasDoneAnyCombat"] = 1;
        player.hasDoneAnyCombat = 1;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            player scripts\mp\utility\stats::incpersstat("gamesPlayed", 1);
        }
        if (isdefined(player scripts\mp\utility\stats::getpersstat("hasMatchLoss")) && player scripts\mp\utility\stats::getpersstat("hasMatchLoss")) {
            return;
        }
        scripts\mp\gamelogic::updatelossstats(player);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7528
// Size: 0x18d
function updatewinstats(winner) {
    println("<dev string:x252>" + winner getentitynumber());
    if (!winner onlinestatsenabled()) {
        println("<dev string:x26e>");
        return;
    }
    if (!istrue(winner scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat"))) {
        println("<dev string:x29a>");
        return;
    }
    if (istrue(winner scripts\mp\utility\stats::getpersstat("recordedLoss"))) {
        winner addtoplayerstat(-1, "matchStats", "losses");
    }
    /#
        println("<dev string:x2ca>" + winner getplayerstat("<dev string:x2db>", "<dev string:x2e6>"));
        println("<dev string:x2eb>" + winner getplayerstat("<dev string:x2db>", "<dev string:x2e6>"));
        println("<dev string:x303>");
    #/
    winner addtoplayerstat(1, "matchStats", "wins");
    println("<dev string:x2eb>" + winner getplayerstat("<dev string:x2db>", "<dev string:x2e6>"));
    winner addtoplayerstat(1, "matchStats", "currentWinStreak");
    winner addtoplayerstat(1, "modeRecords", getbasegametype());
    cur_win_streak = winner getplayerstat("matchStats", "currentWinStreak");
    if (cur_win_streak > winner getplayerstat("bestStats", "longestWinStreak")) {
        winner setplayerstat(cur_win_streak, "bestStats", "longestWinStreak");
    }
    winner scripts\mp\persistence::statsetchild("round", "win", 1);
    winner scripts\mp\persistence::statsetchild("round", "loss", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76bd
// Size: 0x98
function updatelossstats(loser) {
    if (!loser onlinestatsenabled()) {
        return;
    }
    if (!istrue(loser scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat"))) {
        return;
    }
    loser.pers["hasMatchLoss"] = 1;
    if (!istrue(self.joinedinprogress)) {
        loser addtoplayerstat(1, "matchStats", "losses");
        loser.pers["recordedLoss"] = 1;
    }
    loser addtoplayerstat(1, "matchStats", "gamesPlayed");
    loser scripts\mp\persistence::statsetchild("round", "loss", 1);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x775d
// Size: 0x85
function updatetiestats(loser) {
    if (!loser onlinestatsenabled()) {
        return;
    }
    if (!istrue(loser scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat"))) {
        return;
    }
    if (istrue(loser scripts\mp\utility\stats::getpersstat("recordedLoss"))) {
        loser addtoplayerstat(-1, "matchStats", "losses");
        loser setplayerstat(0, "matchStats", "currentWinStreak");
    }
    loser addtoplayerstat(1, "matchStats", "ties");
    loser scripts\mp\persistence::statsetchild("round", "loss", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77ea
// Size: 0x37b
function updatewinlossstats(winner) {
    println("<dev string:x327>");
    if (privatematch()) {
        println("<dev string:x341>");
        return;
    }
    if (!waslastround()) {
        println("<dev string:x36f>");
        return;
    }
    level.processedwinloss = 1;
    players = level.players;
    updateplayercombatstatus();
    if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
        println("<dev string:x39a>");
        foreach (player in level.players) {
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                player setplayerstat(0, "matchStats", "currentWinStreak");
                continue;
            }
            updatetiestats(player);
        }
        return;
    }
    if (isplayer(winner)) {
        println("<dev string:x3cb>");
        if (level.hostforcedend && winner ishost()) {
            winner setplayerstat(0, "matchStats", "currentWinStreak");
            return;
        }
        if (isdefined(level.lastplayerwins) || players.size <= 3) {
            updatewinstats(level.placement["all"][0]);
        } else {
            for (pidx = 0; pidx < min(level.placement["all"].size, 3); pidx++) {
                updatewinstats(level.placement["all"][pidx]);
            }
        }
        return;
    }
    if (isstring(winner)) {
        println("<dev string:x3f0>" + winner + "<dev string:x417>");
        foreach (player in level.players) {
            println("<dev string:x419>" + player getentitynumber() + "<dev string:x437>" + player.name + "<dev string:x43a>");
            if (isdefined(player.connectedpostgame)) {
                println("<dev string:x43c>");
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                println("<dev string:x475>");
                player setplayerstat(0, "matchStats", "currentWinStreak");
                continue;
            }
            if (winner == "tie") {
                println("<dev string:x4cb>");
                updatetiestats(player);
                continue;
            }
            if (player.pers["team"] == winner) {
                println("<dev string:x4fa>");
                updatewinstats(player);
                continue;
            }
            println("<dev string:x536>");
            if (istrue(player.pers["recordedLoss"])) {
                println("<dev string:x56b>");
                player setplayerstat(0, "matchStats", "currentWinStreak");
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6d
// Size: 0xc2
function updateplayercombatstatus() {
    if (!scripts\cp_mp\utility\game_utility::isinfectedgametype()) {
        return;
    }
    foreach (player in level.players) {
        if (player.sessionstate == "spectator" && !player.spectatekillcam) {
            continue;
        }
        if (istrue(player.pers["hasDoneAnyCombat"])) {
            continue;
        }
        if (player.team == "axis") {
            continue;
        }
        player sethasdonecombat(player, 1);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c37
// Size: 0x6a
function freezeplayerforroundend(delay) {
    self endon("disconnect");
    scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
    scripts\mp\utility\lower_message::clearlowermessages();
    if (!isdefined(delay)) {
        delay = level.framedurationseconds;
    }
    wait delay;
    val::group_set("gameEndFreeze", 0);
    if (self isonground() || self isonladder()) {
        self allowmovement(0);
        return;
    }
    thread gameendfreezemovement();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca9
// Size: 0x59
function gameendfreezemovement() {
    self endon("disconnect");
    timecheck = 0;
    while (timecheck < 1) {
        if (!self isonground()) {
            timecheck += level.framedurationseconds;
        } else {
            self allowmovement(0);
            break;
        }
        wait level.framedurationseconds;
    }
    self allowmovement(0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0a
// Size: 0x49d
function updatematchbonusscores(winner) {
    if (!game["timePassed"]) {
        return;
    }
    if (!matchmakinggame()) {
        return;
    }
    if (!gettimelimit() || level.forcedend) {
        gamelength = gettimepassed() / 1000;
        gamelength = min(gamelength, 1200);
    } else {
        gamelength = int(floor(scripts\mp\utility\game::getroundlength() / 1000));
    }
    if (level.teambased) {
        if (isdefined(winner) && isgameplayteam(winner) && winner != "tie") {
            setwinningteam(winner);
        }
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "kingslayer" && getsubgametype() != "rumble_mgl") {
            return;
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (!player rankingenabled()) {
                continue;
            }
            if (player.timeplayed["total"] < 1 || player scripts\mp\utility\stats::getpersstat("participation") < 1) {
                continue;
            }
            if (level.hostforcedend && player ishost()) {
                continue;
            }
            if (!istrue(player scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat"))) {
                continue;
            }
            playerteam = player scripts\mp\utility\stats::getpersstat("team");
            if (winner == "tie") {
                playerscore = player calculatematchbonus("tie", gamelength);
                player givematchbonus("tie", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(playerteam) && playerteam == winner) {
                playerscore = player calculatematchbonus("win", gamelength);
                player givematchbonus("win", playerscore);
                player.matchbonus = playerscore;
            } else if (isdefined(playerteam) && isgameplayteam(playerteam) && playerteam != winner) {
                playerscore = player calculatematchbonus("loss", gamelength);
                player givematchbonus("loss", playerscore);
                player.matchbonus = playerscore;
            }
            player calculateweaponmatchbonus(gamelength);
        }
    } else {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "kingslayer" && getsubgametype() != "rumble_mgl") {
            return;
        }
        winnerresult = "win";
        loserresult = "loss";
        if (!isdefined(winner)) {
            winnerresult = "tie";
            loserresult = "tie";
        }
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.connectedpostgame)) {
                continue;
            }
            if (player.timeplayed["total"] < 1 || player scripts\mp\utility\stats::getpersstat("participation") < 1) {
                continue;
            }
            if (!istrue(player scripts\mp\utility\stats::getpersstat("hasDoneAnyCombat"))) {
                continue;
            }
            iswinner = 0;
            for (pidx = 0; pidx < min(level.placement["all"].size, 3); pidx++) {
                if (level.placement["all"][pidx] != player) {
                    continue;
                }
                iswinner = 1;
            }
            if (iswinner) {
                playerscore = player calculatematchbonus(winnerresult, gamelength);
                player givematchbonus("win", playerscore);
                player.matchbonus = playerscore;
            } else {
                playerscore = player calculatematchbonus(loserresult, gamelength);
                player givematchbonus("loss", playerscore);
                player.matchbonus = playerscore;
            }
            player calculateweaponmatchbonus(gamelength);
        }
    }
    level notify("give_match_bonus");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81af
// Size: 0xb9
function calculatematchbonus(matchresult, gamelength) {
    matchbonusbaseline = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_matchbonus_baseline"), 250);
    var_f5c150745db5bf66 = gamelength / 60;
    var_30fb07c2ca202ff = scripts\mp\rank::function_6d17f84162f0d8f0(matchresult);
    participationpercent = self.timeplayed["total"] / gamelength;
    modescalar = scripts\mp\rank::getgametypexpmultiplier();
    matchbonus = int(matchbonusbaseline * var_30fb07c2ca202ff * var_f5c150745db5bf66 * participationpercent * modescalar);
    matchbonus = int(min(matchbonus, 16384));
    return matchbonus;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8271
// Size: 0xb0
function givematchbonus(scoretype, score) {
    if (getdvarint(@"hash_1f9e52c91272c80d", 1) == 0) {
        return;
    }
    thread scripts\mp\rank::giverankxp(function_1823ff50bb28148d(scoretype), score, undefined, 1, 1, 1);
    if (scoretype == "win") {
        thread scripts\mp\utility\points::doScoreEvent(#"hash_fe606101a22e3e79", undefined, undefined, undefined, undefined, undefined, 1, undefined, undefined, undefined, undefined, 1);
        return;
    }
    assertex(scoretype == "tie" || scoretype == "loss", "Unexpected scoreType for giveMatchBonus(), \"" + scoretype + "\"");
    thread scripts\mp\utility\points::doScoreEvent(#"match_complete", undefined, undefined, undefined, undefined, undefined, 1, undefined, undefined, undefined, undefined, 1);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8329
// Size: 0x2f7
function calculateweaponmatchbonus(gamelength) {
    if (getdvarint(@"hash_f80c5403193b015f", 1) == 0) {
        return;
    }
    if (istrue(scripts\mp\utility\stats::getpersstat("ignoreWeaponMatchBonus")) || !isdefined(scripts\mp\utility\stats::getpersstat("killsPerWeapon"))) {
        return;
    }
    var_11865501de9083d = scripts\mp\weaponrank::getgametypekillsperhouravg() / 60;
    var_f5c150745db5bf66 = gamelength / 60;
    var_162a122a3e3cce1a = int(var_11865501de9083d * var_f5c150745db5bf66);
    killincrement = int(50);
    participationpercent = self.timeplayed["total"] / gamelength;
    var_9bf173c2aa7eb966 = killincrement * participationpercent;
    var_4b7cf89acaabdcac = int(var_162a122a3e3cce1a * var_9bf173c2aa7eb966);
    var_4b7cf89acaabdcac -= int(scripts\mp\utility\stats::getpersstat("weaponMatchBonusKills") * var_9bf173c2aa7eb966);
    if (var_4b7cf89acaabdcac <= 0) {
        return;
    }
    totaldiff = 0;
    foreach (data in scripts\mp\utility\stats::getpersstat("killsPerWeapon")) {
        totaldiff += var_162a122a3e3cce1a - data.killcount;
    }
    if (totaldiff <= 0) {
        return;
    }
    foreach (weaponkey, data in scripts\mp\utility\stats::getpersstat("killsPerWeapon")) {
        ratio = (var_162a122a3e3cce1a - data.killcount) / totaldiff;
        xpgain = int(var_4b7cf89acaabdcac * ratio);
        scripts\mp\rank::incrankxp(0, data, xpgain, function_1823ff50bb28148d("WeaponMatchBonus"));
        foreach (var_10ca4bf7aa9c3ed2, datastruct in scripts\mp\utility\stats::getpersstat("weaponStats")) {
            if (issubstr(var_10ca4bf7aa9c3ed2, weaponkey)) {
                if (isdefined(datastruct.stats["kills"]) && data.killcount > 0) {
                    specificratio = ratio * datastruct.stats["kills"] / data.killcount;
                    xpgain = int(var_4b7cf89acaabdcac * specificratio);
                    if (isdefined(datastruct.stats["xp_earned"])) {
                        datastruct.stats["xp_earned"] = datastruct.stats["xp_earned"] + xpgain;
                        continue;
                    }
                    datastruct.stats["xp_earned"] = xpgain;
                }
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8628
// Size: 0x8c
function setxenonranks(winner) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player.score) || !isdefined(player.pers["team"])) {
        }
    }
    for (i = 0; i < players.size; i++) {
        player = players[i];
        _setplayerteamrank(player);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86bc
// Size: 0x451
function _setplayerteamrank(player, teamplacement) {
    if (!isdefined(player)) {
        return;
    }
    if (istrue(player.pers["xenonRankSet"])) {
        return;
    }
    if (!isdefined(player.kills) || !isdefined(player.deaths)) {
        println("<dev string:x590>");
        return;
    }
    if (getgametype() == "arena") {
        if (1 > player.timeplayed["total"]) {
            return;
        }
        if (!isdefined(player.arenadamage)) {
            return;
        }
        damage = player.arenadamage;
        println("<dev string:x5b7>" + damage);
        setplayerteamrank(player, player.clientid, damage);
        player.pers["xenonRankSet"] = 1;
        return;
    }
    if (isteamplacementsbmmmode()) {
        if (!isdefined(teamplacement)) {
            teamplacement = default_to(player.teamplacement, 0);
        }
        playerscore = 1000 - teamplacement;
        setplayerteamrank(player, player.clientid, playerscore);
        player.pers["xenonRankSet"] = 1;
        return;
    }
    if (istrue(level.var_b9c6856f5ab5f70f)) {
        operatorkills = default_to(player.kills, 0);
        agentkills = default_to(player.agentkills, 0);
        downs = default_to(player.pers["downs"], 0);
        deaths = default_to(player.deaths, 0);
        suicides = default_to(player getpersstat("suicides"), 0);
        var_8d738248e5c26cf9 = default_to(player scripts\mp\teams::function_19300abfbb10928b() / 60, 1);
        if (var_8d738248e5c26cf9 == 0) {
            var_8d738248e5c26cf9 = 1;
        }
        operatorkd = (operatorkills - downs + deaths - suicides) / var_8d738248e5c26cf9;
        agentkd = (agentkills - downs + deaths - suicides) / var_8d738248e5c26cf9;
        operatorweight = getdvarfloat(@"hash_9cdadf8cf57f485e", 0.75);
        agentweight = getdvarfloat(@"hash_f4a4d4df91cf9f67", 0.25);
        rank = operatorkd * operatorweight + agentkd * agentweight;
        println("<dev string:x5bf>" + rank);
        println("<dev string:x5c7>" + operatorweight + "<dev string:x610>" + operatorkills + "<dev string:x623>" + downs + "<dev string:x626>" + deaths + "<dev string:x628>" + suicides + "<dev string:x62a>" + var_8d738248e5c26cf9 + "<dev string:x62e>");
        println("<dev string:x630>" + agentweight + "<dev string:x676>" + agentkills + "<dev string:x623>" + downs + "<dev string:x626>" + deaths + "<dev string:x628>" + suicides + "<dev string:x62a>" + var_8d738248e5c26cf9 + "<dev string:x62e>");
        setplayerteamrank(player, player.clientid, rank);
        player.pers["xenonRankSet"] = 1;
        return;
    }
    if (120 > player.timeplayed["total"]) {
        return;
    }
    suicides = 0;
    if (getdvarint(@"hash_8613ee8086b0e0f6") == 1) {
        suicides = player getpersstat("suicides");
    }
    kd = (player.kills - player.deaths - suicides) / player.timeplayed["total"] / 60;
    println("<dev string:x685>" + player.kills + "<dev string:x6c3>" + player.deaths + "<dev string:x6c9>" + suicides + "<dev string:x6cd>" + player.timeplayed["<dev string:x6d3>"] / 60 + "<dev string:x6d9>" + kd);
    setplayerteamrank(player, player.clientid, kd);
    player.pers["xenonRankSet"] = 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b15
// Size: 0x411
function checktimelimit(prevtimepassed) {
    if (isdefined(level.timelimitoverride) && level.timelimitoverride) {
        return;
    }
    if (game["state"] != "playing") {
        setgameendtime(0);
        return;
    }
    runjiprules();
    if (gettimelimit() <= 0) {
        if (isdefined(level.starttime)) {
            setgameendtime(level.starttime);
            return;
        }
        setgameendtime(0);
        return;
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        setgameendtime(0);
        return;
    }
    if (!isdefined(level.starttime)) {
        return;
    }
    if (istrue(level.timerstopped)) {
        return;
    }
    timeleft = gettimeremaining();
    setgameendtime(gettime() + int(timeleft));
    var_83af6c8b7cee31c8 = istrue(level.ontimelimitgraceperiod);
    if (timeleft > 0 && !isdefined(level.forceotlogictorun)) {
        if (var_83af6c8b7cee31c8) {
            if (scripts\mp\flags::levelflag("over_time_entered")) {
                scripts\mp\flags::levelflagclear("over_time_entered");
            }
            if (istrue(level.setallclientomnvarot)) {
                setomnvarforallclients("ui_overtime_timer_show", 0);
            } else {
                setomnvar("ui_overtime_timer_show", 0);
            }
        }
        if (!isdefined(level.var_5821aa8d232fffa1) && isdefined(level.initialtimelimit) && level.initialtimelimit > 180 && int(timeleft / 1000) < int(level.initialtimelimit / 2)) {
            level.var_5821aa8d232fffa1 = 1;
            level thread function_f08a48e620ec4480();
        }
        return;
    } else if (getgametype() == "wm" && timeleft <= 0 && !scripts\mp\flags::levelflag("over_time_entered")) {
        hud_util::showsplashtoall("wm_last_chance");
        scripts\mp\flags::levelflagset("over_time_entered");
    }
    if (var_83af6c8b7cee31c8) {
        scripts\mp\flags::gameflagset("overtime_started");
        if (!isdefined(level.overtimetotal)) {
            level.overtimetotal = 0;
        } else {
            level.overtimetotal += level.frameduration;
        }
        if (isdefined(level.ontimelimitot)) {
            [[ level.ontimelimitot ]]();
            level.ontimelimitot = undefined;
        }
        if (istrue(level.canprocessot)) {
            level.currenttimelimitdelay += level.framedurationseconds;
        } else {
            level.currenttimelimitdelay = 0;
        }
        progress = clamp(1 - level.currenttimelimitdelay / level.ontimelimitgraceperiod, 0, 1);
        if (level.currenttimelimitdelay < level.ontimelimitgraceperiod) {
            if (istrue(level.setallclientomnvarot)) {
                if (!isdefined(level.forcehideottimer)) {
                    setomnvarforallclients("ui_overtime_timer_show", 1);
                }
                setomnvarforallclients("ui_overtime_timer", progress);
            } else {
                setomnvar("ui_overtime_timer_show", 1);
                setomnvar("ui_overtime_timer", progress);
            }
            if (getsubgametype() == "champion") {
                setomnvar("ui_overtime_time", gettime() + (level.ontimelimitgraceperiod - level.currenttimelimitdelay) * 1000);
            } else {
                setomnvar("ui_overtime_time", gettime() + level.ontimelimitgraceperiod * 1000);
            }
        } else {
            if (istrue(level.setallclientomnvarot)) {
                setomnvarforallclients("ui_overtime_timer_show", 0);
                setomnvarforallclients("ui_overtime_timer", progress);
            } else {
                setomnvar("ui_overtime_timer_show", 0);
                setomnvar("ui_overtime_timer", progress);
            }
            if (getsubgametype() == "champion") {
                setomnvar("ui_overtime_time", gettime());
            } else {
                setomnvar("ui_overtime_time", gettime() + level.ontimelimitgraceperiod * 1000);
            }
        }
        if (level.currenttimelimitdelay < level.ontimelimitgraceperiod) {
            return;
        }
    }
    [[ level.ontimelimit ]]();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2e
// Size: 0xb5
function function_f08a48e620ec4480() {
    if (level.teambased) {
        if (inovertime() || intimetobeat()) {
            if (isscoretobeatrulegametype()) {
                score = game["overtimeProgress"] + game["overtimeProgressFrac"];
                winner = setscoretobeat(game["attackers"], score * 60);
            } else if (istimetobeatvalid()) {
                winner = game["timeToBeatTeam"];
            }
        } else {
            winner = scripts\mp\gamescore::gethighestscoringteam();
        }
        if (winner != "tie") {
            level thread function_af05f2d3b126a9d0(winner);
        }
        return;
    }
    winningplayer = scripts\mp\gamescore::gethighestscoringplayer();
    level thread function_af05f2d3b126a9d0(winningplayer);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8feb
// Size: 0xce
function function_af05f2d3b126a9d0(winner) {
    if (!isdefined(winner)) {
        return;
    }
    if (!isplayer(winner)) {
        scripts\mp\utility\dialog::leaderdialog("halfway_friendly_time", winner, "status");
        scripts\mp\utility\dialog::leaderdialog("halfway_enemy_time", getotherteam(winner)[0], "status");
        return;
    }
    if (isdefined(winner)) {
        winner thread scripts\mp\utility\dialog::leaderdialogonplayer("halfway_friendly_time");
    }
    losingplayers = scripts\mp\gamescore::getlosingplayers();
    foreach (player in losingplayers) {
        if (is_equal(player, winner)) {
            continue;
        }
        player thread scripts\mp\utility\dialog::leaderdialogonplayer("halfway_enemy_time");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90c1
// Size: 0x1e
function enableovertimegameplay() {
    level.ontimelimitgraceperiod = 5;
    level.currenttimelimitdelay = 0;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e7
// Size: 0x197
function runjiprules() {
    if (!level.matchmakingmatch) {
        return;
    }
    if (!isdefined(level.nojip)) {
        level.nojip = 0;
    }
    if (!level.nojip) {
        if (isroundbased() && !level.nojip) {
            switch (getgametype()) {
            case #"hash_4b8799075d3a89b8":
            case #"hash_f4a9126c03d3385b": 
                var_310caaf87186cd6 = checkdomjiprules();
                break;
            case #"hash_53825b446469ac4c":
            case #"hash_5ff8e011d5b9d1c8":
            case #"hash_aac44b0b52bacb8e":
            case #"hash_e2e043391c7c9074":
            case #"hash_eb5e5f470e0c1dc2":
            case #"hash_fa37b7f6bd6f6cbf":
            case #"hash_fa50b0f6bd82e972":
            case #"hash_fa50baf6bd82f930": 
                var_310caaf87186cd6 = function_8e22bfd7b2fc9dda();
                break;
            case #"hash_1a5d186c17c00d3c": 
                var_310caaf87186cd6 = checkctfjiprules();
                break;
            case #"hash_51347b2eb89b24c4": 
                var_310caaf87186cd6 = checkballjiprules();
                break;
            case #"hash_fa0ed2f6bd4f4395": 
                var_310caaf87186cd6 = checkddjiprules();
                break;
            default: 
                var_310caaf87186cd6 = checkdefaultjiprules();
                break;
            }
            if (var_310caaf87186cd6) {
                setnojipscore(1, 1);
                setnojiptime(1, 1);
                level.nojip = 1;
            }
            return;
        }
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            setnojiptime(1, 1);
            level.nojip = 1;
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9286
// Size: 0x78
function checkdomjiprules() {
    if (!isfirstround()) {
        foreach (entry in level.teamnamelist) {
            if (getteamscoreint(entry) > 150) {
                return true;
            }
        }
        if (gettimepassedpercentage() > 75) {
            return true;
        }
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9307
// Size: 0x124
function function_8e22bfd7b2fc9dda() {
    var_bdb5de4f9346b298 = 3;
    switch (getgametype()) {
    case #"hash_aac44b0b52bacb8e":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930": 
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_53825b446469ac4c": 
        var_bdb5de4f9346b298 = 2;
        break;
    case #"hash_eb5e5f470e0c1dc2": 
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_5ff8e011d5b9d1c8": 
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_fa37b7f6bd6f6cbf": 
        var_bdb5de4f9346b298 = 3;
        break;
    case #"hash_e2e043391c7c9074": 
        var_bdb5de4f9346b298 = 2;
        break;
    default: 
        var_bdb5de4f9346b298 = 3;
        break;
    }
    if (isanymlgmatch()) {
        var_bdb5de4f9346b298 = 5;
    }
    foreach (entry in level.teamnamelist) {
        if (getroundswon(entry) >= var_bdb5de4f9346b298) {
            return true;
        }
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9434
// Size: 0xd9
function checkctfjiprules() {
    if (!isfirstround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return true;
        }
    }
    lowestscore = undefined;
    highestscore = undefined;
    foreach (entry in level.teamnamelist) {
        teamscore = getteamscoreint(entry);
        if (!isdefined(lowestscore) || teamscore < lowestscore) {
            lowestscore = teamscore;
        }
        if (!isdefined(highestscore) || teamscore > highestscore) {
            highestscore = teamscore;
        }
    }
    delta = abs(highestscore - lowestscore);
    if (delta > 10) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9516
// Size: 0xd9
function checkballjiprules() {
    if (!isfirstround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return true;
        }
    }
    lowestscore = undefined;
    highestscore = undefined;
    foreach (entry in level.teamnamelist) {
        teamscore = getteamscoreint(entry);
        if (!isdefined(lowestscore) || teamscore < lowestscore) {
            lowestscore = teamscore;
        }
        if (!isdefined(highestscore) || teamscore > highestscore) {
            highestscore = teamscore;
        }
    }
    delta = abs(highestscore - lowestscore);
    if (delta > 15) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f8
// Size: 0x71
function checkddjiprules() {
    var_743180d464fc06d1 = 0;
    foreach (entry in level.teamnamelist) {
        var_743180d464fc06d1 += getroundswon(entry);
    }
    if (var_743180d464fc06d1 >= 2) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9672
// Size: 0x22
function checkdefaultjiprules() {
    if (nextroundisfinalround()) {
        if (gettimepassedpercentage() > level.timepercentagecutoff) {
            return true;
        }
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x969d
// Size: 0x19
function getteamscoreint(team) {
    return int(game["teamScores"][team]);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96bf
// Size: 0x39
function gettimeremaining() {
    var_cc683b074a559f27 = 0;
    if (isdefined(level.var_cc683b074a559f27)) {
        var_cc683b074a559f27 = level.var_cc683b074a559f27;
    }
    return gettimelimit() * 1000 - gettimepassed() - var_cc683b074a559f27;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9701
// Size: 0x21
function gettimeremainingpercentage() {
    timelimit = gettimelimit() * 1000;
    return (timelimit - gettimepassed()) / timelimit;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972b
// Size: 0x21d
function checkteamscorelimitsoon(team) {
    assert(isdefined(team));
    if (level.roundscorelimit <= 0 || isobjectivebased()) {
        return;
    }
    if (isdefined(level.scorelimitoverride) && level.scorelimitoverride) {
        return;
    }
    if (getgametype() == "jugg") {
        return;
    }
    if (!level.teambased) {
        return;
    }
    shouldnotify = 0;
    if (shouldcheckcustomclosetoscorelimit()) {
        shouldnotify = closetoscorelimit(team);
    } else if (getgametype() == "arm" || getgametype() == "conflict") {
        closetoscore = closetoscorelimit(team);
        var_77c63f5cd9656bdb = gettimeremaining() < gettimelimit() * 0.075;
        shouldnotify = closetoscore || var_77c63f5cd9656bdb;
    } else if (gettimepassed() > 45000) {
        shouldnotify = estimatedtimetillscorelimit(team) < 0.5;
    }
    if (!isdefined(level.playedmatchendingsoon)) {
        level.playedmatchendingsoon = 0;
    }
    if (!level.playedmatchendingsoon && shouldnotify) {
        level.playedmatchendingsoon = 1;
        level notify("match_ending_soon", "score");
    }
    if (!level.playedmatchendingsoon && canplayhalfwayvo()) {
        if (getteamscore(team) >= int(level.scorelimit * level.currentround - level.scorelimit / 2)) {
            scripts\mp\utility\dialog::leaderdialog("halfway_friendly_score", team, "status");
            thread scripts\mp\music_and_dialog::midpoint_music(team);
            enemyteams = getenemyteams(team);
            foreach (entry in enemyteams) {
                scripts\mp\utility\dialog::leaderdialog("halfway_enemy_score", entry, "status");
            }
            level.didhalfscorevoboost = 1;
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9950
// Size: 0x5d
function shouldcheckcustomclosetoscorelimit() {
    switch (getgametype()) {
    case #"hash_ca6516c10db2c95":
    case #"hash_3a17de6e294210d2":
    case #"hash_7f9c384a34cc392f":
    case #"hash_ea061d29bbd1f237":
    case #"hash_f4a9126c03d3385b": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99b5
// Size: 0x90
function checkplayerscorelimitsoon() {
    if (level.roundscorelimit <= 0 || isobjectivebased()) {
        return;
    }
    if (level.teambased) {
        return;
    }
    if (gettimepassed() < 60000) {
        return;
    }
    scripts\mp\gamescore::checkffascorejip();
    if (getgametype() == "gun") {
        if (self.score == 14) {
            level notify("match_ending_soon", "score");
        }
        return;
    }
    timeleft = estimatedtimetillscorelimit();
    if (timeleft < 2) {
        level notify("match_ending_soon", "score");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a4d
// Size: 0x15a
function checkscorelimit(allowtie) {
    if (cantiebysimultaneouskill()) {
        allowtie = 1;
    }
    if (istrue(allowtie)) {
        if (isplayer(self) && !level.teambased && self.score >= level.roundscorelimit) {
            level.scorelimitreached = 1;
        }
        level notify("checkScoreLimit");
        level endon("checkScoreLimit");
        waitframe();
    }
    if (isobjectivebased()) {
        return 0;
    }
    if (isdefined(level.scorelimitoverride) && level.scorelimitoverride) {
        return 0;
    }
    if (game["state"] != "playing") {
        return 0;
    }
    if (level.roundscorelimit <= 0) {
        return 0;
    }
    if (level.teambased) {
        limitreached = 0;
        for (i = 0; i < level.teamnamelist.size; i++) {
            if (game["teamScores"][level.teamnamelist[i]] >= level.roundscorelimit) {
                limitreached = 1;
            }
        }
        if (!limitreached) {
            return 0;
        }
    } else {
        if (!isplayer(self)) {
            return 0;
        }
        if (self.score < level.roundscorelimit && !istrue(level.scorelimitreached)) {
            return 0;
        }
    }
    if (!istrue(level.dontendonscore)) {
        return onscorelimit(allowtie);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9baf
// Size: 0x42
function updategametypedvars() {
    level endon("game_ended");
    while (game["state"] == "playing") {
        if (isdefined(level.starttime)) {
            if (gettimeremaining() < 3000) {
                wait 0.1;
                continue;
            }
        }
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bf9
// Size: 0x1b1
function matchstarttimerwaitforplayers() {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("infilSequence")) {
        if (!istrue(level.var_72e1667d06ab98db)) {
            setomnvar("ui_in_infil", 3);
        }
    }
    if (istrue(level.var_ec2fb549b15ad827)) {
        function_d084af239c9a23c(level.var_c8001f5313a05589, 1);
        level thread prematchcountdownnotify();
    } else {
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            thread matchstarttimer("match_starting_in", level.prematchperiod + level.prematchperiodend);
        }
        level thread prematchcountdownnotify();
        waitforplayers(level.prematchperiod, 0, istrue(level.var_d0074a54d755766b));
    }
    if (level.prematchperiodend > 0 && !isdefined(level.hostmigrationtimer)) {
        adjusted_time = level.prematchperiodend;
        level notify("match_start_real_countdown", adjusted_time);
        if (istrue(level.var_ec2fb549b15ad827)) {
            var_3b0d320c2be79893 = level.prematchperiod * 2 + adjusted_time;
            level.leaguePlayLoadingComplete = 1;
            level notify("leaguePlayLoadingComplete");
            setomnvar("ui_mp_extended_load_screen", 0);
            setomnvar("ui_match_start_text", "waiting_for_players");
            function_d084af239c9a23c(var_3b0d320c2be79893, 0);
            level.var_60f7d8bd0181980f = 0;
        }
        if (!gameflag("infil_will_run") && game["roundsPlayed"] == 0 && !scripts\cp_mp\utility\game_utility::isarenamap() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
            level thread showmapchyron();
        }
        thread matchstarttimer("match_starting_in", adjusted_time);
        thread prematchcountdownnotify(adjusted_time);
        level waittill("matchStartTimer_done");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9db2
// Size: 0x3c
function showmapchyron() {
    if (istrue(level.var_4df4777277c281ff)) {
        return;
    }
    setomnvar("ui_in_infil", 1);
    level waittill_notify_or_timeout("matchStartTimer_done", 8);
    setomnvar("ui_in_infil", -1);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df6
// Size: 0x56
function prematchcountdownnotify(timeoverride) {
    level notify("prematchCountdownNotify");
    level endon("prematchCountdownNotify");
    if (isdefined(timeoverride)) {
        wait max(timeoverride - 5, 0);
    } else {
        wait max(level.prematchperiod + level.prematchperiodend - 5, 0);
    }
    scripts\mp\flags::gameflagset("prematch_countdown");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e54
// Size: 0x63
function startmodeobjidnotify(time) {
    self notify("startOBJID");
    self endon("startOBJID");
    if (getbasegametype() == "sd") {
        notifytime = 6;
    } else {
        notifytime = 5;
    }
    if (time > notifytime) {
        time -= notifytime;
        max(time, 0);
        wait time;
    } else {
        wait 0.5;
    }
    level notify("start_mode_setup");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ebf
// Size: 0x148
function matchstarttimer(type, duration) {
    self notify("matchStartTimer");
    self endon("matchStartTimer");
    level notify("match_start_timer_beginning");
    counttime = int(duration);
    level thread startmodeobjidnotify(counttime);
    if (counttime >= 2) {
        setomnvar("ui_match_start_text", type);
        matchstarttimerperplayer_internal(counttime);
    }
    visionsetnaked("", 0);
    level notify("matchStartTimer_done");
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() || istrue(level.testrandomrealismclients)) {
        foreach (player in level.players) {
            if (istrue(level.testrandomrealismclients)) {
                if (!isdefined(player.isrealismenabled)) {
                    if (cointoss()) {
                        player setclientomnvar("ui_realism_hud", 0);
                        player setclientomnvar("ui_realism_hud", 1);
                        player.isrealismenabled = 1;
                    }
                }
                continue;
            }
            player setclientomnvar("ui_realism_hud", 0);
            player setclientomnvar("ui_realism_hud", 1);
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa00f
// Size: 0x129
function matchstarttimerperplayer_internal(counttime) {
    waittillframeend();
    level endon("match_start_timer_beginning");
    level endon("match_cancel_timer_beginning");
    mincounttime = int(counttime);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "dmz" && getsubgametype() != "exgm") {
        thread scripts\mp\gametypes\br_public::applyprematchplotarmor(mincounttime);
    }
    foreach (entry in level.teamnamelist) {
        childthread teamstarttimer(entry, mincounttime);
    }
    extrateams = ["spectator", "codcaster"];
    foreach (entry in extrateams) {
        childthread teamstarttimer(entry, mincounttime);
    }
    childthread clearvisionsettimer(mincounttime);
    wait mincounttime;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa140
// Size: 0x2ba
function teamstarttimer(team, counttime) {
    level endon("match_start_timer_beginning");
    level endon("match_cancel_timer_beginning");
    level.matchcountdowntime = ter_op(isdefined(level.var_c8761d87ed1399df), level.var_c8761d87ed1399df, counttime);
    if (!level.gameended) {
        var_fdd4cb56c3b978a3 = scripts\cp_mp\utility\game_utility::isbrstylegametype();
        if (var_fdd4cb56c3b978a3) {
            thread scripts\mp\gametypes\br_public::prematchmusic(team);
            thread scripts\mp\gametypes\br_public::prematchdialog(team);
        }
        var_92d0054b383f50d5 = !var_fdd4cb56c3b978a3 && level.teambased && team != "spectator" && team != "codcaster" && getdvarint(@"hash_be73a4d94209c1e6") == 0;
        if (var_92d0054b383f50d5) {
            var_c6b6dab35a7bf3b3 = 5;
        }
        while (counttime > 0 && !level.gameended) {
            teamarray = getteamdata(team, "players");
            if (var_92d0054b383f50d5) {
                var_75acdb03f713b07d = counttime <= 8 && counttime >= var_c6b6dab35a7bf3b3;
            }
            foreach (player in teamarray) {
                if (counttime <= 80 && !istrue(player.var_f4bb3d8522246fdc)) {
                    if (var_92d0054b383f50d5) {
                        player setclientomnvar("ui_show_subfaction_splash", var_75acdb03f713b07d);
                    }
                    player setclientomnvar("ui_match_start_countdown", counttime);
                    player setclientomnvar("ui_match_in_progress", 0);
                }
            }
            counttime--;
            level.matchcountdowntime = counttime;
            if (counttime <= 4 && !isdefined(level.playedstartingmusic)) {
                level notify("prematch_music");
            }
            wait 1;
            newcounttime = namespace_f5675568ccc8acc6::function_6fc852802774b304(1, counttime * 1000);
            if (newcounttime > 0 && counttime <= 10) {
                if (!gameflag("prematch_done")) {
                    newcounttime = 10;
                }
                counttime = newcounttime;
            }
        }
        namespace_f5675568ccc8acc6::esportsresumetimer();
        level.matchcountdowntime = undefined;
        teamarray = getteamdata(team, "players");
        foreach (player in teamarray) {
            scripts\mp\playerlogic::clearprematchlook(player);
            player _freezecontrols(0, 1);
            player setclientomnvar("ui_match_start_countdown", -1);
            player setclientomnvar("ui_match_in_progress", 1);
        }
        scripts\mp\flags::gameflagset("prematch_values_reset");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa402
// Size: 0xe0
function function_46eb417b582d5179(timems, stringoverride) {
    level notify("match_cancel_timer_beginning");
    level endon("match_cancel_timer_beginning");
    timerstring = "match_cancelling_in";
    if (isdefined(stringoverride)) {
        timerstring = stringoverride;
    }
    setomnvar("ui_match_start_text", timerstring);
    counttime = int(timems / 1000);
    waittillframeend();
    while (counttime > 0 && level.var_60f7d8bd0181980f) {
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", counttime);
            p setclientomnvar("ui_match_in_progress", 0);
        }
        counttime--;
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4ea
// Size: 0x36
function clearvisionsettimer(counttime) {
    while (counttime > 0 && !level.gameended) {
        counttime--;
        wait 1;
    }
    visionsetnaked("", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa528
// Size: 0x16
function matchstarttimerskip() {
    visionsetnaked("", 0);
    level notify("match_start_timer_skip");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa546
// Size: 0x13c
function onroundswitch(overtime) {
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (overtime) {
        level.halftimetype = "overtime";
        if (islastwinbytwo()) {
            aheadteam = getbetterteam();
            if (aheadteam != game["defenders"]) {
                game["switchedsides"] = !game["switchedsides"];
                level.switchedsides = 1;
            } else {
                level.switchedsides = undefined;
            }
        } else {
            game["switchedsides"] = !game["switchedsides"];
            level.switchedsides = 1;
        }
        return;
    }
    if (istrue(level.skipdefendersadvantage)) {
        game["switchedsides"] = !game["switchedsides"];
        level.switchedsides = 1;
        return;
    }
    if (shouldgivedefendersadvantage()) {
        aheadteam = getbetterteam();
        if (aheadteam != game["defenders"]) {
            game["switchedsides"] = !game["switchedsides"];
            level.switchedsides = 1;
        } else {
            level.switchedsides = undefined;
        }
        return;
    }
    level.halftimetype = "halftime";
    game["switchedsides"] = !game["switchedsides"];
    level.switchedsides = 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa68a
// Size: 0x3e
function shouldgivedefendersadvantage() {
    return game["roundsWon"]["allies"] == getwatcheddvar("winlimit") - 1 && game["roundsWon"]["axis"] == getwatcheddvar("winlimit") - 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6d1
// Size: 0x7f
function checkroundswitch(overtime) {
    if (!level.teambased) {
        return false;
    }
    if (!isdefined(level.roundswitch) || !level.roundswitch) {
        return false;
    }
    assert(game["roundsPlayed"] > 0);
    if (function_ac027009283233c6()) {
        if (function_e3058efbdb62a578()) {
            return true;
        }
    } else if (game["roundsPlayed"] % level.roundswitch == 0 || overtime) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa759
// Size: 0x58
function function_ac027009283233c6() {
    switch (level.gametype) {
    case #"hash_5ff8e011d5b9d1c8": 
        if (level.roundswitch == 2 && getdvarint(@"hash_b2d6a287c0521607", 2) == 2) {
            return 1;
        }
        return 0;
    default: 
        return 0;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7b9
// Size: 0x49
function function_e3058efbdb62a578() {
    switch (level.gametype) {
    case #"hash_5ff8e011d5b9d1c8": 
        if (game["roundsPlayed"] % level.roundswitch == 1) {
            return 1;
        }
        return 0;
    default: 
        return 0;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80a
// Size: 0xcb
function timeuntilroundend() {
    if (level.gameended) {
        timepassed = (gettime() - level.gameendtime) / 1000;
        timeremaining = level.postroundtime - timepassed;
        if (timeremaining < 0) {
            return 0;
        }
        return timeremaining;
    }
    if (gettimelimit() <= 0) {
        return undefined;
    }
    if (!isdefined(level.starttime)) {
        return undefined;
    }
    tl = gettimelimit();
    timepassed = (gettime() - level.starttime) / 1000;
    timeremaining = level.discardtime / 1000 + gettimelimit() - timepassed;
    if (isdefined(level.timepaused)) {
        timeremaining += level.timepaused;
    }
    return timeremaining + level.postroundtime;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8de
// Size: 0x11c
function freegameplayhudelems() {
    if (isdefined(self.perkicon)) {
        if (isdefined(self.perkicon[0])) {
            self.perkicon[0] destroyelem();
            self.perkname[0] destroyelem();
        }
        if (isdefined(self.perkicon[1])) {
            self.perkicon[1] destroyelem();
            self.perkname[1] destroyelem();
        }
        if (isdefined(self.perkicon[2])) {
            self.perkicon[2] destroyelem();
            self.perkname[2] destroyelem();
        }
    }
    self notify("perks_hidden");
    if (!level.doeomcombat) {
        self.lowermessage destroyelem();
        self.lowertimer destroyelem();
    }
    if (isdefined(self.proxbar)) {
        self.proxbar destroyelem();
    }
    if (isdefined(self.proxbartext)) {
        self.proxbartext destroyelem();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa02
// Size: 0x44
function gethostplayer() {
    players = getentarray("player", "classname");
    for (index = 0; index < players.size; index++) {
        if (players[index] ishost()) {
            return players[index];
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa4e
// Size: 0x71
function function_8464fd951b451534(ignoreplayer) {
    foreach (player in level.players) {
        if (!isbot(player)) {
            if (isdefined(ignoreplayer) && ignoreplayer != player) {
                return true;
            }
        }
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaac8
// Size: 0x3b
function hostidledout() {
    hostplayer = gethostplayer();
    if (isdefined(hostplayer) && !hostplayer.hasspawned && !isdefined(hostplayer.selectedclass)) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab0c
// Size: 0xc4
function roundendwait(defaultdelay) {
    if (!level.doeomcombat) {
        wait level.postgamehitmarkerwaittime + 0.1;
        setomnvarforallclients("post_game_state", 2);
    }
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait defaultdelay;
    wait var_8d539c1577794d34;
    setomnvarforallclients("post_game_state", 1);
    level notify("round_end_finished");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd8
// Size: 0x12
function roundenddof(time) {
    setdof_spectator();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf2
// Size: 0x8f
function setwaypointiconinfo(name, bgtype, teamrelative, string, icon, pulses, iconid) {
    level.waypointcolors[name] = teamrelative;
    level.waypointbgtype[name] = bgtype;
    level.waypointstring[name] = string;
    level.waypointshader[name] = icon;
    level.waypointpulses[name] = pulses;
    level.var_ed9acfb4a79fb6be[name] = iconid;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac89
// Size: 0x1b38
function initwaypointbackgrounds() {
    var_a443300a7cc92ef0 = 0;
    switch (getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_4cb5825e78aaa8c":
    case #"hash_ca6516c10db2c95":
    case #"hash_1b1eecd3863a50cf":
    case #"hash_3ae8dcf2840c03a0":
    case #"hash_53825b446469ac4c":
    case #"hash_63fb0ba698c46db3":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_99a69534b169e838":
    case #"hash_9ccabb62c3d37fb0":
    case #"hash_a1313b745c17c07e":
    case #"hash_d82d642e83fb9772":
    case #"hash_f25c018be2dd3f5f":
    case #"hash_f4a9126c03d3385b":
    case #"hash_fa44d9f6bd7a2fa1": 
        setwaypointiconinfo("icon_waypoint_dom_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("icon_waypoint_dom_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("icon_waypoint_dom_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("icon_waypoint_dom_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_taking_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_taking_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_taking_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_taking_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_taking_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_taking_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_taking_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_taking_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_taking_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_capture_a", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_capture_b", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_capture_c", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_capture_d", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_capture_e", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_capture_f", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_capture_g", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_capture_h", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_capture_i", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_defend_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defend_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defend_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defend_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defend_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defend_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defend_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_defend_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_defend_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_defending_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defending_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defending_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defending_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defending_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defending_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defending_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_defending_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_defending_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_blocking_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_blocking_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_blocking_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_blocking_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_blocking_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_blocked_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_blocked_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_blocked_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_blocked_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_losing_a", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_losing_b", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_losing_c", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_losing_d", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_losing_e", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_losing_f", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_losing_g", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_losing_h", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_losing_i", var_a443300a7cc92ef0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_captureneutral_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_captureneutral_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_captureneutral_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_captureneutral_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_captureneutral_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_contested_a", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_contested_b", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_contested_c", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_contested_d", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_contested_e", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_contested_f", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_contested_g", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_contested_h", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_contested_i", var_a443300a7cc92ef0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_dom_target_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_dom_target_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_dom_target_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_dom_target_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_g", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_h", 0, undefined);
        setwaypointiconinfo("waypoint_dom_target_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_i", 0, undefined);
        setwaypointiconinfo("waypoint_clearing_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_clearing_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_clearing_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_clearing_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_clearing_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_CLEARING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_a", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_a", 1, 3);
        setwaypointiconinfo("waypoint_reinforcing_b", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_b", 1, 5);
        setwaypointiconinfo("waypoint_reinforcing_c", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_c", 1, 7);
        setwaypointiconinfo("waypoint_reinforcing_d", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_d", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_e", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_e", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_f", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_f", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_g", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_g", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_h", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_h", 1, undefined);
        setwaypointiconinfo("waypoint_reinforcing_i", var_a443300a7cc92ef0, "friendly", "MP_INGAME_ONLY/OBJ_REINFORCING_CAPS", "icon_waypoint_dom_i", 1, undefined);
        setwaypointiconinfo("waypoint_locked_a", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 3);
        setwaypointiconinfo("waypoint_locked_b", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 5);
        setwaypointiconinfo("waypoint_locked_c", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 7);
        setwaypointiconinfo("waypoint_locked_d", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_e", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_f", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_g", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_h", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("waypoint_locked_i", var_a443300a7cc92ef0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, undefined);
        setwaypointiconinfo("icon_waypoint_dom_captured", var_a443300a7cc92ef0, "codcaster", "", "esports_codcaster_minimap_checkmark", 0, 11);
        break;
    case #"hash_514cd9d568e312b0":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_dd217fc2f74cbcdd":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa50b0f6bd82e972": 
        setwaypointiconinfo("waypoint_bomb", 2, "friendly", "MP_INGAME_ONLY/OBJ_BOMB_CAPS", "icon_waypoint_bomb", 1, 15);
        setwaypointiconinfo("icon_waypoint_escort_bomb", 2, "neutral", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_bomb", 0, 10);
        setwaypointiconinfo("codcaster_enemy_escort_bomb", 1, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_bomb", 0, 10);
        setwaypointiconinfo("waypoint_target_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_target_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_bomb_defusing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_bomb_defusing_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_bomb_planting_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_bomb_planting_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb", 0, 4);
        setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_bomb", 0, 6);
        setwaypointiconinfo("waypoint_bomb_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_bomb_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, 3);
        setwaypointiconinfo("waypoint_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, 5);
        setwaypointiconinfo("waypoint_defend_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, 7);
        setwaypointiconinfo("waypoint_defend_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, 8);
        setwaypointiconinfo("waypoint_defend_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, 9);
        setwaypointiconinfo("waypoint_defuse_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_defuse_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0, 6);
        setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0, 4);
        setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0, 6);
        break;
    case #"hash_9a6f07d0214a87db": 
        setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defend_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defend_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defend_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defend_f", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_target_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_target_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_target_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_target_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_target_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_target_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_planting_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_PLANTING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_DEFUSE_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_d", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_e", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defusing_f", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFUSING_CAPS", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_a", 0, "enemy", "", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_b", 0, "enemy", "", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_c", 0, "enemy", "", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_d", 0, "enemy", "", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_e", 0, "enemy", "", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_bomb_defend_nt_f", 0, "enemy", "", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_a", 0, "friendly", "", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_b", 0, "friendly", "", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_c", 0, "friendly", "", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_d", 0, "friendly", "", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_e", 0, "friendly", "", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_defuse_nt_f", 0, "friendly", "", "icon_waypoint_dom_f", 0, undefined);
        setwaypointiconinfo("waypoint_locked_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_a", 0, undefined);
        setwaypointiconinfo("waypoint_locked_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_b", 0, undefined);
        setwaypointiconinfo("waypoint_locked_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_c", 0, undefined);
        setwaypointiconinfo("waypoint_locked_d", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_d", 0, undefined);
        setwaypointiconinfo("waypoint_locked_e", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_e", 0, undefined);
        setwaypointiconinfo("waypoint_locked_f", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_dom_f", 0, undefined);
        break;
    case #"hash_214e6c6c1b43ae4a":
    case #"hash_aada280b52cbdd96":
    case #"hash_c7f4420f385eeb3d":
    case #"hash_fa34c5f6bd6d4432": 
        setwaypointiconinfo("hq_destroy", 0, "enemy", "MP_INGAME_ONLY/OBJ_DESTROY_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_defend", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_defending", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_neutral", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_contested", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_losing", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_hq", 0, 1);
        setwaypointiconinfo("hq_target", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_locked", 0, 2);
        setwaypointiconinfo("hq_taking", 0, "friendly", "MP_INGAME_ONLY/OBJ_DESTROYING_CAPS", "icon_waypoint_hq", 0, 1);
    case #"hash_c065cef60f38490a": 
        setwaypointiconinfo("carepackage_incoming", 1, "neutral", "MP_INGAME_ONLY/INCOMING_OBJ_CAPS", "hud_icon_killstreak_carepackage", 0, undefined);
        setwaypointiconinfo("carepackage", 1, "neutral", "", "hud_icon_killstreak_carepackage", 0, undefined);
        break;
    default: 
        break;
    }
    if (getgametype() == "conf_v") {
        setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_vial", 0, 15);
        setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_vial", 0, 15);
    } else {
        setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0, 15);
        setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0, 15);
    }
    setwaypointiconinfo("icon_waypoint_locked", 0, "neutral", "MP_INGAME_ONLY/OBJ_LOCKED_CAPS", "icon_waypoint_locked", 0, undefined);
    setwaypointiconinfo("waypoint_capture_kill", 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0, undefined);
    setwaypointiconinfo("waypoint_escort", 2, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_escort", 0, undefined);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7c9
// Size: 0x3ac
function function_1765528a2562ebf8(clientnumvalue) {
    println("<dev string:x6dd>");
    if (isdefined(clientnumvalue)) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            playerclientnum = player getentitynumber();
            selectedplayer = player;
            if (playerclientnum == clientnumvalue) {
                println("<dev string:x71b>" + clientnumvalue + "<dev string:x74e>" + playerclientnum + "<dev string:x76b>" + player.name);
                playerarray = getteamdata(player.team, "players");
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    selectedplayer = player getothersplitscreenplayer();
                }
                if (isdefined(selectedplayer.var_a111e3eabe27d512)) {
                    selectedplayer.var_a111e3eabe27d512 = !selectedplayer.var_a111e3eabe27d512;
                } else {
                    selectedplayer.var_a111e3eabe27d512 = 1;
                }
                hostxuid = getteamdata(player.team, "playagainHostXuid");
                playerxuid = selectedplayer getxuid();
                if (selectedplayer.var_a111e3eabe27d512) {
                    if (hostxuid == "0") {
                        println("<dev string:x782>" + clientnumvalue + "<dev string:x76b>" + player.name + "<dev string:x7ae>" + playerxuid);
                        setteamdata(player.team, "playagainHostXuid", playerxuid);
                    }
                } else if (hostxuid == playerxuid) {
                    println("<dev string:x782>" + clientnumvalue + "<dev string:x76b>" + player.name + "<dev string:x7dc>");
                    var_f7795a328ac962d5 = "0";
                    foreach (teammate in playerarray) {
                        if (isdefined(teammate) && !isbot(teammate) && teammate issplitscreenplayerprimary()) {
                            var_f7795a328ac962d5 = teammate getxuid();
                            break;
                        }
                    }
                    setteamdata(player.team, "playagainHostXuid", var_f7795a328ac962d5);
                }
                if (istrue(matchmakinggame())) {
                    if (isdefined(player) && player isfireteamleader()) {
                        var_8015767bddc80d67 = player getfireteammembers();
                        foreach (member in var_8015767bddc80d67) {
                            if (!isdefined(member)) {
                                continue;
                            }
                            memberclientnum = member getentitynumber();
                            if (memberclientnum != playerclientnum) {
                                if (isdefined(member.var_a111e3eabe27d512)) {
                                    member.var_a111e3eabe27d512 = !member.var_a111e3eabe27d512;
                                } else {
                                    member.var_a111e3eabe27d512 = 1;
                                }
                                foreach (teammate in playerarray) {
                                    if (isdefined(teammate)) {
                                    }
                                }
                            }
                        }
                    }
                }
                break;
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7e
// Size: 0x221
function function_c3365e6cf89ada44() {
    println("<dev string:x820>");
    hostidx = 0;
    if (!privatematch() && !scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        var_2fd13845453e50e8 = [];
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.var_a111e3eabe27d512) && player.var_a111e3eabe27d512) {
                playerteam = player.team;
                playerteamchecked = 0;
                var_da0aca95052ad7d2 = var_2fd13845453e50e8.size;
                for (index = 0; index < var_da0aca95052ad7d2; index++) {
                    if (var_2fd13845453e50e8[index] == playerteam) {
                        playerteamchecked = 1;
                    }
                }
                if (!playerteamchecked) {
                    var_2fd13845453e50e8[var_da0aca95052ad7d2] = playerteam;
                    teamarray = getteamdata(playerteam, "players");
                    var_6d13f1bf72d13931 = [];
                    playagainHostXuid = getteamdata(playerteam, "playagainHostXuid");
                    foreach (player in teamarray) {
                        if (!isdefined(player)) {
                            continue;
                        }
                        println("<dev string:x848>" + player.name + "<dev string:x86d>" + player.team);
                        if (isdefined(player.var_a111e3eabe27d512) && player.var_a111e3eabe27d512) {
                            println("<dev string:x882>" + player.name + "<dev string:x86d>" + player.team + "<dev string:x8ba>" + playagainHostXuid);
                            var_6d13f1bf72d13931[var_6d13f1bf72d13931.size] = player;
                        }
                    }
                    playagain(var_6d13f1bf72d13931, playagainHostXuid);
                    waitframe();
                }
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcda7
// Size: 0x1a8
function function_b782e1ea0877f735() {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    playerposition = 0;
    while (true) {
        endgamesplash = getdvarint(@"hash_4f6750c34be606ee");
        if (isdefined(level.players[0])) {
            playerposition = level.players[0] getclientomnvar("ui_br_player_position");
        }
        switch (endgamesplash) {
        case 1: 
            if (playerposition != 1) {
                level.players[0] setclientomnvar("ui_br_player_position", 1);
                wait 8;
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        case 2: 
            if (playerposition != 4) {
                level.players[0] setclientomnvar("ui_br_player_position", 4);
                wait 8;
                level.players[0] setclientomnvar("ui_br_player_position", 5);
            }
            break;
        case 3: 
            if (playerposition != 22) {
                level.players[0] setclientomnvar("ui_br_player_position", 22);
                wait 8;
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        case 4: 
            if (playerposition != 15) {
                level.players[0] setclientomnvar("ui_br_player_position", 15);
                wait 8;
                level.players[0] setclientomnvar("ui_br_player_position", 150);
            }
            break;
        default: 
            break;
        }
        waitframe();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf57
// Size: 0x216a
function callback_startgametype() {
    scripts\mp\load::main();
    if (!isdefined(game["roundsPlayed"])) {
        if (analyticsstreamerislogfilestreamingenabled()) {
            analyticsstreamerlogfilestartstream();
        }
        game["matchHasMoreThan1Player"] = 0;
        game["numPlayersConsideredPlaying"] = 0;
    }
    scripts\mp\flags::gameflaginit("prematch_done", 0);
    scripts\mp\flags::gameflaginit("prematch_fade_done", 0);
    scripts\mp\flags::gameflaginit("prematch_countdown", 0);
    scripts\mp\flags::gameflaginit("graceperiod_done", 0);
    scripts\mp\flags::gameflaginit("prematch_values_reset", 0);
    scripts\mp\flags::gameflaginit("infil_setup_complete", 0);
    scripts\mp\flags::gameflaginit("infil_will_run", 0);
    scripts\mp\flags::gameflaginit("infil_started", 0);
    scripts\mp\flags::gameflaginit("infil_animatic_complete", 0);
    scripts\mp\flags::gameflaginit("overtime_started", 0);
    scripts\mp\flags::levelflaginit("round_over", 0);
    scripts\mp\flags::levelflaginit("game_over", 0);
    scripts\mp\flags::levelflaginit("block_notifies", 0);
    scripts\mp\flags::levelflaginit("post_game_level_event_active", 0);
    scripts\mp\flags::levelflaginit("final_killcam_preloaded", 0);
    flags::levelflaginit("over_time_entered", 0);
    level.prematchperiod = 0;
    level.prematchperiodend = 0;
    level.postgamenotifies = 0;
    level.intermission = 0;
    level.var_7210bb7b0bfbcfdb = getdvarfloat(@"hash_cba7d6083c9553b8");
    setdvar(@"hash_8ed4dff39f3251f5", getdvarint(@"hash_f16ba8db72f34fc3") == 1);
    setdvar(@"hash_ed150ed3d105dab0", istrue(level.noweaponfalloff));
    if (getdvarint(@"hash_a4d532f42d919827", 0) == 1) {
        if (!isdefined(level.armoronweaponswitchlongpress)) {
            level.armoronweaponswitchlongpress = 1;
        }
    }
    setdvar(@"hash_ce882ca282c2f85e", istrue(level.armoronweaponswitchlongpress));
    if (matchmakinggame()) {
        setdvar(@"hash_ccf9753c4ee466cc", 1);
    } else {
        setdvar(@"hash_ccf9753c4ee466cc", 0);
    }
    level thread initwaypointbackgrounds();
    if (!isdefined(game["gamestarted"])) {
        game["clientid"] = 0;
        game["truncated_killcams"] = 0;
        game["life_count"] = 0;
        if (!isdefined(game["attackers"]) || !isdefined(game["defenders"])) {
            thread error("No attackers or defenders team defined in level .gsc.");
        }
        if (!isdefined(game["attackers"])) {
            game["attackers"] = "allies";
        }
        if (!isdefined(game["defenders"])) {
            game["defenders"] = "axis";
        }
        if (!isdefined(game["state"])) {
            game["state"] = "playing";
        }
        game["strings"]["press_to_spawn"] = %MP/PRESS_TO_SPAWN;
        game["strings"]["spawn_next_round"] = %MP/SPAWN_NEXT_ROUND;
        game["strings"]["spawn_flag_wait"] = %MP/SPAWN_FLAG_WAIT;
        game["strings"]["spawn_point_capture_wait"] = %MP/SPAWN_POINT_CAPTURE_WAIT;
        game["strings"]["spawn_revive_wait"] = %MP/SPAWN_REVIVE_WAIT;
        game["strings"]["spawn_revive_wait_bleedout"] = %MP/SPAWN_REVIVE_WAIT_BLEEDOUT;
        game["strings"]["spawn_revive_remote"] = %MP/SPAWN_REVIVE_REMOTE;
        game["strings"]["spawn_tag_wait"] = %MP/SPAWN_TAG_WAIT;
        game["strings"]["waiting_to_spawn"] = %MP/WAITING_TO_SPAWN;
        game["strings"]["next_team_spawn"] = %MP/NEXT_TEAM_SPAWN;
        game["strings"]["match_starting"] = %MP/MATCH_STARTING;
        game["strings"]["change_class"] = %MP/CHANGE_CLASS_NEXT_SPAWN;
        game["strings"]["revive_class"] = %MP/CHANGE_CLASS_NEXT_ROUND;
        game["strings"]["change_rig"] = %LUA_MENU_MP/CHANGE_RIG_NEXT_SPAWN;
        game["strings"]["must_select_loadout_to_spawn"] = %MP_INGAME_ONLY/SELECT_LOADOUT_TO_SPAWN;
        game["strings"]["select_spawn"] = %MP/SELECT_SPAWN;
        game["strings"]["down_give_up"] = %MP/DOWN_GIVE_UP;
        level scripts\mp\utility\lower_message::function_5a98c45a6252b4a();
        game["colors"]["black"] = (0, 0, 0);
        game["colors"]["white"] = (1, 1, 1);
        game["colors"]["grey"] = (0.5, 0.5, 0.5);
        game["colors"]["cyan"] = (0.35, 0.7, 0.9);
        game["colors"]["orange"] = (0.9, 0.6, 0);
        game["colors"]["blue"] = (0.2, 0.3, 0.7);
        game["colors"]["red"] = (0.75, 0.25, 0.25);
        game["colors"]["green"] = (0.25, 0.75, 0.25);
        game["colors"]["yellow"] = (0.65, 0.65, 0);
        game["colors"]["friendly"] = (0.258824, 0.639216, 0.87451);
        game["colors"]["enemy"] = (0.929412, 0.231373, 0.141176);
        game["colors"]["contest"] = (1, 0.858824, 0);
        game["colors"]["neutral"] = (1, 1, 1);
        [[ level.onprecachegametype ]]();
        setdvarifuninitialized(@"hash_4e2f47a7b2856857", 5);
        if (!level.splitscreen) {
            level.prematchperiod = scripts\mp\tweakables::gettweakablevalue("game", "graceperiod");
            level.prematchperiodend = getdvarint(@"hash_704afe6f6c582ee0", 15);
            /#
                level.prematchperiodend = getdvarint(@"hash_704afe6f6c582ee0", 0);
                level.prematchperiodend = getdvarint(@"hash_26f3f803c983760d", level.prematchperiodend);
            #/
        }
        if (function_1eb7d2791d3c536f()) {
            setnojipscore(1, 1);
            setnojiptime(1, 1);
        } else {
            setnojipscore(0, 1);
            setnojiptime(0, 1);
        }
    } else {
        setdvarifuninitialized(@"hash_4e2f47a7b2856857", 5);
        if (!level.splitscreen) {
            scripts\mp\tweakables::gettweakablevalue("game", "graceperiod");
            level.prematchperiodend = getdvarint(@"hash_da33635b62d4e5b3", 5);
        }
    }
    if (!isdefined(game["allies"])) {
        game["allies"] = "SAS";
    }
    if (!isdefined(game["axis"])) {
        game["axis"] = "RUSF";
    }
    if (!isdefined(game["team_three"])) {
        game["team_three"] = "USMC";
    }
    if (!isdefined(game["team_four"])) {
        game["team_four"] = "ZVIR";
    }
    if (!isdefined(game["team_five"])) {
        game["team_five"] = "ICORPS";
    }
    if (!isdefined(game["team_six"])) {
        game["team_six"] = "GRP9";
    }
    if (!isdefined(game["status"])) {
        game["status"] = "normal";
    }
    setdvar(@"hash_caa6faec79f2c4c2", inovertime());
    if (!isdefined(game["timePassed"])) {
        game["timePassed"] = 0;
    }
    if (!isdefined(game["roundsPlayed"])) {
        game["roundsPlayed"] = 0;
    }
    if (!isdefined(game["overtimeRoundsPlayed"])) {
        game["overtimeRoundsPlayed"] = 0;
    }
    if (!isdefined(game["matchPoint"])) {
        game["matchPoint"] = 0;
    }
    if (!isdefined(game["finalRound"])) {
        game["finalRound"] = 0;
    }
    if (!isdefined(game["previousWinningTeam"])) {
        game["previousWinningTeam"] = "";
    }
    setomnvar("ui_last_round", game["finalRound"]);
    if (!isdefined(game["roundsWon"])) {
        game["roundsWon"] = [];
    }
    if (!isdefined(game["teamScores"])) {
        game["teamScores"] = [];
    }
    if (!isdefined(game["timeToBeat"])) {
        game["timeToBeat"] = 0;
    }
    if (!isdefined(game["timeToBeatOld"])) {
        game["timeToBeatOld"] = 0;
    }
    if (!isdefined(game["timeToBeatTeam"])) {
        game["timeToBeatTeam"] = "none";
    }
    if (!isdefined(game["timeToBeatScore"])) {
        game["timeToBeatScore"] = 0;
    }
    if (!isdefined(game["timeToBeatScoreOld"])) {
        game["timeToBeatScoreOld"] = 0;
    }
    level.currentclientmatchdataid = 0;
    level.gameended = 0;
    level.forcedend = 0;
    level.hostforcedend = 0;
    setdvarifuninitialized(@"hash_b66208719c6bae6a", 0);
    /#
        setdvar(@"hash_b66208719c6bae6a", 0);
    #/
    setdvarifuninitialized(@"hash_e32ebdbb97a1ec4e", 0);
    level.disablepersonalnuke = isanymlgmatch();
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        logstring("game modifier: tier 1 mode");
    } else if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        logstring("game modifier: hardcore mode");
    }
    level.thirdpersonmode = getdvarint(@"hash_66c38b5b61297ac1");
    level.diehardmode = getdvarint(@"hash_4a2b3d01a81655a6");
    level.casualscorestreaks = getdvarint(@"hash_a69e3d30bf0c5ff6");
    level.wrapkillstreaks = getdvarint(@"hash_614165a37ac2db61");
    if (!isdefined(level.crankedbombtimer)) {
        level.crankedbombtimer = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer"), 0);
    }
    level.supportcranked = ter_op(getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_crankedBombTimer")) > 0, 1, 0);
    if (!level.teambased) {
        level.diehardmode = 0;
    }
    if (level.diehardmode) {
        logstring("game mode: diehard");
    }
    level.matchrules_damagemultiplier = 0;
    level.matchrules_vampirism = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_vampirism"), @"hash_b5e336c86438398c");
    if (level.matchrules_vampirism) {
        level.modifyplayerdamage = &scripts\mp\damage::gamemodemodifyplayerdamage;
    }
    level.finalkillcamtype = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_killcamType"), @"hash_769d7362e31fdf55");
    if (level.finalkillcamtype == 2) {
        level.skipfinalkillcam = 1;
    }
    if (level.finalkillcamtype == 1 && getdvarint(@"hash_6625c2cb0de90a41", 0) == 0) {
        level.finalkillcamtype = 0;
    }
    level.allowkillstreaks = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowKillstreaks"), @"hash_eaf0d9c00f9805b6");
    level.roundretainstreaks = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreaks"), @"hash_29a0f7140921aa26");
    level.roundretainstreakprog = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundRetainStreakProg"), @"hash_3aff5631b3f222a9");
    level.deathretainstreaks = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_deathRetainStreaks"), @"hash_30e6d371dab88960");
    level.allowperks = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowPerks"), @"hash_e37a87a327aa48ac");
    level.allowsupers = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allowSupers"), @"hash_c3a18965db644b6b");
    level.superfastchargerate = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_superFastChargeRate"), @"hash_7d44bfc04e9b62b9");
    level.superpointsmod = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_superPointsMod"), @"hash_913a338c84e2f2f6");
    level.spawnprotectiontimer = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_spawnProtectionTimer"), @"hash_fbc77dbb0cf44cc7");
    level.lethaldelay = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), @"hash_c85a7135dce00903");
    level.equipmentmatchstartshieldms = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_equipmentMSProtect"), @"hash_9072002890a9a121") * 1000;
    level.magcount = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_magcount"), @"hash_fbde2817a4a94998");
    if (!isdefined(level.practiceround)) {
        level.practiceround = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_practiceRound"), @"hash_3672666b944c115");
    }
    level.postgameexfil = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_postGameExfil"), @"hash_d2de59939486bd5a");
    level.exfilactivetimer = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_exfilActiveTimer"), @"hash_645019bc959ffaf9");
    level.exfilextracttimer = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_exfilExtractTimer"), @"hash_96dd663f32dba868");
    level.useammorestocklocs = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_useAmmoRestockLocs"), @"hash_d7c8c17cb33a48f7");
    level.agentskillstreakcount = getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_agent_kills_killstreak_count"), @"hash_46eaad837c804540");
    level.spectate3rdallowed = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_allow3rdspectate"), @"hash_433ce15d514ef091");
    setdvar(@"hash_4871f220778a4649", level.spectate3rdallowed);
    level.var_7ebad80a50484a39 = getdvarint(@"hash_8d427bce0148af0e", 0) || getgametype() == "conf_v";
    scripts\mp\teamrevive::init();
    if (issubgametype()) {
        checkforsubgametypeoverrides();
    }
    level.minimaponbydefault = (getdvarint(@"hash_2a4effcaf5954d38") != 0 || getdvarint(@"hash_bc802deb1ff2a842") != 0) && !istrue(game["isLaunchChunk"]) && !scripts\cp_mp\utility\game_utility::function_21322da268e71c19();
    currentgametype = getgametype();
    level.radarhideshots = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", currentgametype, "_radarHidePings"), @"hash_36d4f05a3801af7b");
    setomnvar("ui_compass_hide_weapon_pings_minimap", level.radarhideshots);
    level.navbarhideshots = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", currentgametype, "_navBarHidePings"), @"hash_9498c88902801ed5");
    setomnvar("ui_compass_hide_weapon_pings_navbar", level.navbarhideshots);
    level.navbarhideenemies = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", currentgametype, "_navBarHideEnemy"), @"hash_cc12cd6acff9b720");
    setomnvar("ui_compass_hide_enemy_navbar", level.navbarhideenemies);
    level.disablesupersprint = getdvarint(@"hash_dfc97948abf22f64");
    level.disablemount = getdvarint(@"hash_215eb9aef94dd47e");
    level.disablebattlechatter = getdvarint(@"hash_b8a0aa5681c2aa39");
    level.disableannouncer = getdvarint(@"hash_94af58bec500b3b9");
    level.scoremod = [];
    level.scoremod["kill"] = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"));
    level.scoremod["death"] = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerDeath"));
    level.scoremod["headshot"] = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsHeadshotBonus"));
    level.scoremod["kskill"] = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKSKill"));
    if (level.practiceround && !isdefined(game["practiceRound"])) {
        game["practiceRound"] = 1;
        level.roundretainstreaks = 0;
        level.roundretainstreakprog = 0;
        level.ignorescoring = 1;
        game["dialog"]["offense_obj"] = "gamestate_practice";
        game["dialog"]["defense_obj"] = "gamestate_practice";
    }
    if (!isdefined(game["gameLength"])) {
        game["gameLength"] = 0;
    }
    if (getdvarint(@"hash_ac31997b109b6bc5", 0) == 1) {
        game["attackers"] = "axis";
        game["defenders"] = "allies";
    }
    setomnvar("ui_match_timer_hidden", 1);
    isarenamap = scripts\cp_mp\utility\game_utility::isarenamap();
    if (isarenamap) {
        level.allowkillstreaks = 0;
        level.allowsupers = 0;
        setomnvar("ui_disable_killstreaks", 1);
        setomnvar("ui_disable_fieldupgrades", 1);
    } else {
        setomnvar("ui_disable_killstreaks", 0);
        setomnvar("ui_disable_fieldupgrades", 0);
    }
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    scripts\cp_mp\utility\game_utility::getlocaleid();
    /#
        println("<dev string:x8c7>");
        println("<dev string:x8d4>");
        println("<dev string:x8fa>" + level.script);
        println("<dev string:x911>" + getgametype());
        println("<dev string:x928>" + scripts\cp_mp\utility\game_utility::function_21322da268e71c19());
        println("<dev string:x93f>" + scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924());
        println("<dev string:x956>" + level.diehardmode);
        println("<dev string:x968>" + getdvarint(@"hash_66c38b5b61297ac1"));
        println("<dev string:x97a>" + getdvarint(@"hash_c00e244ea59d530e"));
        println("<dev string:x991>" + game["<dev string:x9a3>"]);
        println("<dev string:x9b0>" + getgametype() + "<dev string:x9b7>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:x9c4>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:x9d0>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:x9dd>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:x9e9>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:x9f4>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:x9fe>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:xa0a>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:xa15>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:xa20>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:xa2a>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:xa35>")));
        println("<dev string:x9b0>" + getgametype() + "<dev string:xa3f>" + getdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "<dev string:xa4d>")));
        println("<dev string:x8d4>");
    #/
    level.usestartspawns = 1;
    level thread scripts\mp\infilexfil\infilexfil::infil_init();
    scripts\mp\utility\spawn_event_aggregator::init();
    scripts\mp\utility\lui_game_event_aggregator::init();
    namespace_bc0abb78a303bb78::init();
    scripts\mp\utility\player_frame_update_aggregator::init();
    namespace_d9d9691c846bdad7::init();
    namespace_a2c409363d7f24e7::init();
    scripts\cp_mp\ent_manager::init();
    scripts\mp\playerlogic::init();
    scripts\cp_mp\utility\game_utility::initchallengeandeventglobals();
    gametype = getgametype();
    level.var_6706aad138cbc31d = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishDamageLimit"), @"hash_3b51bf9adf9c599");
    level.var_843399bee19793fe = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffKickDamageLimit"), @"hash_bd496f8d66908cb0");
    level.maxallowedteamkills = getoverridedvarintexceptmatchrulesvalues(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_ffPunishLimit"), @"hash_46055360c134e4f6");
    thread namespace_1bb1b009684a30dc::init();
    thread scripts\mp\teams::init();
    scripts\cp_mp\utility\team_utility::function_a92ed2f4c44e5ffa();
    namespace_9bb409deb69fb31d::init();
    scripts\cp_mp\utility\player_utility::initdismembermentlist();
    scripts\cp_mp\utility\game_utility::values_init();
    thread namespace_1ce798d596a27341::init();
    thread scripts\cp_mp\utility\game_utility::game_utility_init();
    thread scripts\mp\playerhealth::init();
    thread scripts\cp_mp\challenges::init();
    level.var_c36a65204e26168e = 1;
    level.var_1fa9e6ecce90d2c2 = 0;
    if (issharedfuncdefined("display_transition", "using_new_transitions")) {
        level.var_1fa9e6ecce90d2c2 = [[ getsharedfunc("display_transition", "using_new_transitions") ]]();
    }
    thread scripts\mp\killcam::init();
    thread scripts\mp\final_killcam::initfinalkillcam();
    namespace_46e942396566f2da::function_3b59b4d385a202e6();
    scripts\mp\utility\dialog::initstatusdialog();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        thread scripts\mp\battlechatter_mp::init();
    } else if (!runleanthreadmode()) {
        thread scripts\mp\battlechatter_mp::init();
    } else {
        level.battlechatterenabled = 0;
    }
    thread scripts\mp\music_and_dialog::init();
    thread scripts\mp\class::init();
    if (!scripts\mp\utility\game::runleanthreadmode()) {
        thread scripts\mp\persistence::init();
    }
    thread scripts\mp\rank::init();
    thread scripts\mp\playercards::init();
    thread scripts\mp\menus::init();
    thread scripts\mp\hud::init();
    thread scripts\mp\serversettings::init();
    thread scripts\mp\weapons::init();
    thread scripts\mp\outline::init();
    thread scripts\mp\shellshock::init();
    thread scripts\mp\deathicons::init();
    thread namespace_e072c8407b2a861c::damagefeedback_init();
    thread scripts\mp\lightarmor::init();
    thread scripts\mp\gameobjects::init();
    thread scripts\mp\spectating::init();
    thread scripts\mp\spawnlogic::init();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        thread scripts\mp\brmatchdata::init();
        thread scripts\mp\brclientmatchdata::init();
    } else {
        thread scripts\mp\matchdata::init();
        thread scripts\mp\clientmatchdata::init();
    }
    thread scripts\mp\awards::init();
    thread scripts\mp\utility\points::initpoints();
    thread scripts\mp\playerlogic::initsegmentstats();
    if (!runleanthreadmode()) {
        scripts\mp\utility\player_frame_update_aggregator::registerplayerframeupdatecallback(&scripts\cp_mp\utility\player_utility::updateinputtypewatcher);
    }
    scripts\mp\utility\player_frame_update_aggregator::registerplayerframeupdatecallback(&scripts\mp\weapons::grenadehealthatdeathframeupdatecallback);
    namespace_bf9ffd2b22c7d819::main();
    thread namespace_8885c19c053dcb46::init();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::init();
    }
    if (level.var_77907d733abe8b63) {
        namespace_2c7976a64ea24d6a::init();
    }
    thread scripts\mp\passives::init();
    thread scripts\mp\perks\perks::init();
    feature_init::function_a114d6863af2f149();
    if (!istrue(game["isLaunchChunk"])) {
        thread scripts\cp_mp\vehicles\vehicle::vehicle_init();
        thread namespace_9246f10206f50768::function_7dcad89b9c0264a6();
        thread scripts\cp_mp\killstreaks\init::init();
        thread scripts\mp\perks\perks::initspecialistkillstreaks();
    }
    if (!istrue(level.disablescoreevents)) {
        thread scripts\mp\events::events_init();
    }
    thread scripts\mp\archetypes\archcommon::init();
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        scripts\mp\online_event::init();
    }
    if (!runleanthreadmode()) {
        thread scripts\mp\whizby::init();
    }
    thread namespace_627d023f48c9561::init();
    thread scripts\mp\analyticslog::init();
    thread namespace_e77194a0203f683::init();
    thread namespace_30dbbb8647994e6e::init();
    thread namespace_d564b97030b0868::init();
    level namespace_f8d3520d3483c1::init();
    if (!istrue(game["isLaunchChunk"])) {
        if (istrue(level.droparmorondeath)) {
            thread namespace_38b993c4618e76cd::init();
        }
        thread scripts\mp\loot::init();
        thread scripts\mp\supers::init();
        thread scripts\mp\supers::watchsuperdelay();
    }
    thread scripts\mp\callouts::init();
    thread scripts\mp\bounty::init();
    thread allow_weapon_mp_init();
    thread ismp_init();
    level.players thread function_b782e1ea0877f735();
    thread scripts\cp_mp\gestures::init();
    thread scripts\mp\gestures_mp::init_mp();
    thread scripts\cp_mp\execution::execution_init();
    thread scripts\mp\sentientpoolmanager::init();
    thread scripts\mp\objidpoolmanager::init();
    thread scripts\mp\arbitrary_up::initarbitraryuptriggers();
    thread namespace_f77f8b2f20f85e34::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread scripts\mp\turret::init();
    }
    thread namespace_1d863a7bbc05fc52::init();
    thread scripts\mp\laststand::init();
    thread scripts\mp\equipment::init();
    thread scripts\mp\matchstats::init();
    thread scripts\mp\playerstats::init();
    if (getdvarint(@"hash_81a618a6e6973ed3", 0) == 1) {
        thread namespace_144a3b0d146004de::init();
    }
    thread scripts\mp\focus::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread scripts\cp_mp\auto_ascender::init();
        thread scripts\cp_mp\auto_ascender_solo::init();
        thread scripts\mp\outofbounds::initoob();
        thread scripts\cp_mp\targetmarkergroups::init();
    }
    thread scripts\mp\potg::init();
    thread scripts\mp\utility\trigger::triggerutilityinit();
    thread scripts\cp_mp\entityheadicons::init();
    if (!istrue(game["isLaunchChunk"])) {
        thread scripts\mp\spawnselection::init();
        thread scripts\mp\spawncamera::init();
        thread scripts\mp\juggernaut::init();
        thread scripts\mp\door::door_dynamic_setup();
        thread scripts\mp\flashpoint::init();
        thread scripts\cp_mp\emp_debuff::emp_debuff_init();
        thread scripts\common\elevators::initelevators();
    }
    thread scripts\mp\hud_message::init();
    thread scripts\mp\hud_popup::init();
    level.allowreviveweapons = getdvarint(@"hash_df1ae5a11f519ab5", 0);
    val::group_register("reviveShoot", ["weapon_switch", "offhand_weapons", "gesture", "killstreaks", "supers", "ads", "reload", "autoreload"]);
    val::group_register("gameEndFreeze", ["usability", "ads", "fire", "weapon_switch", "offhand_weapons", "offhand_primary_weapons", "offhand_secondary_weapons", "killstreaks", "supers", "allow_jump", "sprint", "stance_change", "melee"]);
    thread scripts\mp\accolades::init();
    thread scripts\mp\ammorestock::init();
    thread scripts\mp\meatshield::init();
    if (getdvarint(@"hash_8a1945c94d5092c2") == 1) {
        scripts\mp\gametypes\br_pickups::br_pickups_init();
        scripts\mp\gametypes\br_plunder::init();
    }
    level namespace_446fc987a980892f::init();
    level scripts\mp\bots\bots_loadout::init();
    level thread scripts\mp\utility\trigger::function_d7f524cd920e0c79();
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            if (!isdefined(game["roundsWon"][team])) {
                game["roundsWon"][team] = 0;
            }
            if (!isdefined(game["teamScores"][team])) {
                game["teamScores"][team] = 0;
            }
        }
    }
    if (game["status"] != "overtime" && game["status"] != "halftime") {
        if (!(game["roundsPlayed"] > 0 && ismoddedroundgame()) && resetscoreonroundstart()) {
            game["teamScores"]["allies"] = 0;
            game["teamScores"]["axis"] = 0;
        }
    }
    setomnvar("ui_in_overtime_round", game["status"] == "overtime");
    game["gamestarted"] = 1;
    level.currentround = game["roundsPlayed"] + 1;
    level.maxplayercount = 0;
    level.activeplayers = [];
    foreach (entry in level.teamnamelist) {
        level.wavedelay[entry] = 0;
        level.lastwave[entry] = 0;
        level.waveplayerspawnindex[entry] = 0;
        level.aliveplayers[entry] = [];
        if (!istrue(level.requiredplayercountoveride)) {
            level.requiredplayercount[entry] = 0;
        }
    }
    setomnvar("ui_scorelimit", 0);
    setdvar(@"hash_9995278b4b4099ae", 1);
    if (!istrue(game["isLaunchChunk"])) {
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
    }
    if (getgametypenumlives()) {
        setdvar(@"hash_c6ca3fbc35dd960", 0);
    } else {
        setdvar(@"hash_c6ca3fbc35dd960", 1);
    }
    updatewavespawndelay();
    level.graceperiod = 15;
    level.ingraceperiod = level.graceperiod;
    if (!isdefined(level.roundenddelay)) {
        level.roundenddelay = 6;
    }
    level.playovertime = 0;
    level.finalroundenddelay = 3;
    level.halftimeroundenddelay = 3;
    level.postgamehitmarkerwaittime = 0.25;
    level.scorelimit = getwatcheddvar("scorelimit");
    level.roundlimit = getwatcheddvar("roundlimit");
    level.winlimit = getwatcheddvar("winlimit");
    if (istrue(game["isLaunchChunk"])) {
        setomnvar("ui_current_round", level.currentround);
    } else if (level.roundlimit != 1) {
        setomnvar("ui_current_round", level.currentround);
    }
    if (level.scorelimit == 1) {
        level.roundscorelimit = 1;
        level.totalscorelimit = level.winlimit;
    } else {
        level.roundscorelimit = level.scorelimit * (game["roundsPlayed"] + 1);
        level.totalscorelimit = level.scorelimit * level.roundlimit;
    }
    if (getdvarint(@"hash_7dfc9d99d9c1ff2f", 0) == 1) {
        scripts\mp\gamestaterestore::restoreteamscores();
    }
    if (resetscoreonroundstart()) {
        level.roundscorelimit = level.scorelimit;
        level.totalscorelimit = level.scorelimit;
        game["teamScores"][game["attackers"]] = 0;
        setteamscore(game["attackers"], 0);
        game["teamScores"][game["defenders"]] = 0;
        setteamscore(game["defenders"], 0);
    }
    if (isovertimesupportedgametype() && inovertime()) {
        scripts\mp\gamescore::updateovertimescore();
    }
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            scripts\mp\gamescore::updateteamscore(entry);
        }
    }
    thread updateuiscorelimit();
    level notify("update_scorelimit");
    if (isdefined(level.matchrecording_init)) {
        level thread [[ level.matchrecording_init ]]();
    }
    if (getdvarint(@"hash_8dd1d0af528859be", 0) == 0 || function_1e098780c33853f2() && getgametype() != "war_snipers" && getgametype() != "dom_snipers") {
        setomnvar("ui_only_default_loadouts", 1);
    }
    scripts\mp\gametypes\common::commononstartgametype();
    [[ level.onstartgametype ]]();
    level scripts\engine\utility::flag_set("onStartGameTypeFinished");
    if (isdefined(level.var_952bd6e10104d8a)) {
        if (getdvarint(@"hash_7a6c6ee4d8db3bbd", 0) == 0) {
            [[ level.var_952bd6e10104d8a ]]();
        }
    }
    function_75092ad1ff9da748();
    level thread scripts\mp\gametypes\common::onplayerconnectcommon();
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&scripts\mp\gametypes\common::onplayerdisconnectcommon);
    level.scorepercentagecutoff = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_score_percentage_cut_off"), 70);
    level.timepercentagecutoff = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_time_percentage_cut_off"), 70);
    /#
        setdvarifuninitialized(@"hash_ff657c87711b0cd6", 1);
        if (getdvarint(@"hash_ff657c87711b0cd6", 1)) {
            level.scorepercentagecutoff = 100;
            level.timepercentagecutoff = 100;
        }
    #/
    /#
        thread [[ level.devinit ]]();
    #/
    level thread scripts\common\dof::function_9030ff462f3daa1a();
    if (getdvar(@"hash_8588ca386dbff67") == "dedicated LAN server" || getdvar(@"hash_8588ca386dbff67") == "dedicated internet server") {
        thread verifydedicatedconfiguration();
    }
    namespace_f5675568ccc8acc6::function_6fc852802774b304(0, 0);
    thread startgame();
    level thread updatewatcheddvars();
    if (!istrue(level.istacops)) {
        level thread timelimitthread();
    }
    level thread updateleaderboardstatscontinuous();
    level thread removepatchablecollision_delayed();
    level scripts\engine\utility::flag_set("StartGameTypeCallbackFinished");
    if (isfirstround()) {
        level thread callbackserverstart();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0c9
// Size: 0x2a
function callbackserverstart() {
    if (getdvarint(@"hash_830d682c147b23bb", 0) > 0) {
        level waittill("telemetry_init");
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_start");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0fb
// Size: 0x1f8
function updatewavespawndelay(newwavedelay, var_ab1e2d0bc30658b0) {
    if (isdefined(newwavedelay)) {
        setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"), newwavedelay);
    }
    if (isdefined(var_ab1e2d0bc30658b0)) {
        setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"), var_ab1e2d0bc30658b0);
    }
    wavedelay = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay"));
    var_4a995b19cb008113 = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_waverespawndelay_alt"));
    var_26eec74e639ec81d = isdefined(level.respawndelaytype) && level.respawndelaytype == 1;
    if (wavedelay || var_26eec74e639ec81d) {
        if (!var_26eec74e639ec81d) {
            foreach (entry in level.teamnamelist) {
                level.wavedelay[entry] = wavedelay;
                level.lastwave[entry] = 0;
            }
        } else {
            if (!istrue(game["switchedsides"])) {
                level.wavedelay[game["attackers"]] = level.attackersrespawndelay;
                level.wavedelay[game["defenders"]] = level.defendersrespawndelay;
            } else {
                level.wavedelay[game["attackers"]] = level.defendersrespawndelay;
                level.wavedelay[game["defenders"]] = level.attackersrespawndelay;
            }
            level.lastwave[game["attackers"]] = 0;
            level.lastwave[game["defenders"]] = 0;
        }
        level thread scripts\mp\gamelogic::wavespawntimer();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2fb
// Size: 0x69
function verifydedicatedconfiguration() {
    for (;;) {
        if (level.rankedmatch) {
            exitlevel(0);
        }
        if (!getdvarint(@"hash_485ef1ed1d39d3a3")) {
            exitlevel(0);
        }
        if (getdvar(@"hash_8588ca386dbff67") != "dedicated LAN server" && getdvar(@"hash_8588ca386dbff67") != "dedicated internet server") {
            exitlevel(0);
        }
        wait 5;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf36c
// Size: 0x6e
function timelimitthread() {
    level endon("game_ended");
    prevtimepassed = gettimepassed();
    while (game["state"] == "playing") {
        waittillframeend();
        thread checktimelimit(prevtimepassed);
        prevtimepassed = gettimepassed();
        if (isdefined(level.starttime)) {
            if (gettimeremaining() < 3000 || istrue(level.forceotlogictorun)) {
                waitframe();
                continue;
            }
        }
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e2
// Size: 0x270
function updateuiscorelimit() {
    for (;;) {
        level waittill_either("update_scorelimit", "update_winlimit");
        if (inovertime() || intimetobeat()) {
            if (istimetobeatrulegametype()) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                setomnvar("ui_scorelimit", ter_op(istimetobeatvalid(), game["timeToBeatScore"], 1));
            } else if (isscoretobeatrulegametype()) {
                foreach (player in level.players) {
                    player setclientomnvar("ui_friendly_time_to_beat", ter_op(player.team == game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                    player setclientomnvar("ui_enemy_time_to_beat", ter_op(player.team != game["timeToBeatTeam"], game["timeToBeat"], game["timeToBeatOld"]));
                }
                setomnvar("ui_scorelimit", ter_op(istimetobeatvalid(), game["timeToBeatScore"], 1));
            } else if (iswinbytworulegametype()) {
                defenderscore = game["roundsWon"][game["defenders"]];
                attackerscore = game["roundsWon"][game["attackers"]];
                targetscore = 0;
                if (defenderscore == attackerscore) {
                    targetscore = defenderscore + 2;
                } else if (defenderscore > attackerscore) {
                    targetscore = defenderscore + 1;
                } else {
                    targetscore = attackerscore + 1;
                }
                setomnvar("ui_scorelimit", targetscore);
            } else {
                usenormalscorelimit();
            }
            continue;
        }
        usenormalscorelimit();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf65a
// Size: 0x73
function usenormalscorelimit() {
    if ((!isroundbased() || !isobjectivebased() || ismoddedroundgame()) && getgametype() != "rescue" && getgametype() != "ballmode") {
        setomnvar("ui_scorelimit", level.totalscorelimit);
        thread checkscorelimit();
        return;
    }
    setomnvar("ui_scorelimit", level.winlimit);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6d5
// Size: 0xbd
function playtickingsound() {
    self endon("death");
    self endon("stop_ticking");
    level endon("game_ended");
    time = level.bombtimer;
    if (isdefined(level.defusetime)) {
        var_e5c7562119f14dc3 = level.defusetime + 1;
    } else {
        var_e5c7562119f14dc3 = 6;
    }
    while (true) {
        if (time > 15) {
            self playsound("ui_mp_suitcasebomb_timer");
            time -= 1;
            wait 1;
        } else if (time > var_e5c7562119f14dc3) {
            self playsound("ui_mp_suitcasebomb_timer_urgent");
            time -= 1;
            wait 1;
        } else {
            self playsound("ui_mp_timer_countdown_half_sec");
            time -= 0.5;
            wait 0.5;
        }
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79a
// Size: 0xa
function stoptickingsound() {
    self notify("stop_ticking");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7ac
// Size: 0x54
function getclocksoundaliasfortimeleft(timeleft) {
    if (timeleft > 20) {
        return "ui_mp_timer_countdown";
    }
    if (timeleft > 10) {
        return "ui_mp_timer_countdown_10";
    }
    if (timeleft > 5) {
        return "ui_mp_timer_countdown_half_sec";
    }
    if (timeleft > 1.5) {
        return "ui_mp_timer_countdown_quarter_sec";
    }
    return "ui_mp_timer_countdown_1";
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf808
// Size: 0x2b1
function timelimitclock() {
    level endon("cancel_announcer_dialog");
    waitframe();
    if (gettimelimit() == 0) {
        return;
    }
    if (istrue(level.var_92b187a00d3dd091)) {
        return;
    }
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    var_98f7893e84443025 = 0;
    playedthirty = 0;
    var_dd0b8fe8f045aa9f = 0;
    if (scripts\cp_mp\utility\game_utility::function_a3a69db84e39e0b8()) {
        var_98f7893e84443025 = 1;
    }
    var_70e5d40612c9c78a = ter_op(isanymlgmatch(), 5, 2);
    while (game["state"] == "playing") {
        if (!level.timerstopped && gettimelimit() && !istrue(level.bombsplanted) && !istrue(level.var_423b7147b1256abd) && !istrue(level.var_d50739af5c160f54)) {
            timeleft = gettimeremaining() / 1000;
            timeleftint = int(timeleft + 0.5);
            var_a8088865fd3efd6d = 0;
            if (var_70e5d40612c9c78a == 2 && timeleftint % 2 == 1) {
                var_a8088865fd3efd6d = 1;
            }
            if (!var_98f7893e84443025 && (var_a8088865fd3efd6d == 1 && timeleftint == 61 || var_a8088865fd3efd6d == 0 && timeleftint == 60)) {
                level scripts\mp\music_and_dialog::matchendingsoonleaderdialog("timesup_sixty");
                level notify("match_ending_soon", "time");
                var_98f7893e84443025 = 1;
            } else if (!playedthirty && (var_a8088865fd3efd6d == 1 && timeleftint == 31 || var_a8088865fd3efd6d == 0 && timeleftint == 30)) {
                level scripts\mp\music_and_dialog::matchendingsoonleaderdialog("timesup_thirty");
                level notify("match_ending_soon", "time");
                playedthirty = 1;
            } else if (!var_dd0b8fe8f045aa9f) {
                if (var_a8088865fd3efd6d == 1 && timeleftint == 11 || var_a8088865fd3efd6d == 0 && timeleftint == 10) {
                    level scripts\mp\music_and_dialog::matchendingsoonleaderdialog("timesup_ten");
                    var_dd0b8fe8f045aa9f = 1;
                } else if (var_a8088865fd3efd6d == 1 && timeleftint <= 2 || var_a8088865fd3efd6d == 0 && timeleftint <= 1) {
                    level scripts\mp\music_and_dialog::matchendingsoonleaderdialog("timesup");
                    var_dd0b8fe8f045aa9f = 1;
                }
            }
            if (timeleftint <= 10 || timeleftint <= 30 && timeleftint % var_70e5d40612c9c78a == var_a8088865fd3efd6d) {
                level notify("match_ending_very_soon");
                if (timeleftint == 0) {
                    break;
                }
                if (!isdefined(level.overridetimelimitclock) || level.overridetimelimitclock >= timeleftint) {
                    clocksoundalias = getclocksoundaliasfortimeleft(timeleft);
                    clockobject playsound(clocksoundalias);
                }
            }
            if (timeleft - floor(timeleft) >= 0.05) {
                wait timeleft - floor(timeleft);
                continue;
            }
        }
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfac1
// Size: 0x45
function shouldmodelognotify() {
    switch (getgametype()) {
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_fa50b0f6bd82e972": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb0e
// Size: 0x1d7
function gametimer() {
    level endon("game_ended");
    if (isdefined(game["startTimeFromMatchStart"])) {
        level.starttimefrommatchstart = game["startTimeFromMatchStart"];
    }
    if (function_3b6961b424a382f() && getdvarint(@"hash_49bbeacaa2e89deb", 0) != 0) {
        level.discardtime = 0;
    }
    level waittill("prematch_over");
    level.starttime = gettime();
    level.discardtime = 0;
    level.overtimetotal = 0;
    if (!isdefined(game["startTimeFromMatchStart"])) {
        game["startTimeFromMatchStart"] = gettime();
        level.starttimefrommatchstart = gettime();
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_start");
    }
    if (isdefined(game["roundMillisecondsAlreadyPassed"])) {
        level.starttime -= game["roundMillisecondsAlreadyPassed"];
        game["roundMillisecondsAlreadyPassed"] = undefined;
    }
    if (game["roundsPlayed"] < 24) {
        setmatchdata("utcRoundStartTimeSeconds", game["roundsPlayed"], getsystemtime());
        if (scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
            setomnvar("ui_round_start_time", getsystemtime());
        }
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_start");
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_start")) {
        foreach (player in level.players) {
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_start", player);
        }
    }
    prevtime = gettime();
    while (game["state"] == "playing") {
        if (!level.timerstopped) {
            game["timePassed"] = game["timePassed"] + gettime() - prevtime;
        }
        prevtime = gettime();
        wait 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfced
// Size: 0x116
function updatetimerpausedness(var_5a6706a7ded54bda) {
    shouldbestopped = level.timerstoppedforgamemode || isdefined(level.hostmigrationtimer);
    if (!level.timerstopped && shouldbestopped) {
        level.timerstopped = 1;
        level.timerpausetime = gettime();
        timeleft = gettimeremaining();
        if (isdefined(var_5a6706a7ded54bda)) {
            setgameendtime(int(var_5a6706a7ded54bda));
        } else {
            setgameendtime(gettime() + int(timeleft));
        }
        setomnvar("ui_match_timer_stopped", 1);
        return;
    }
    if (level.timerstopped && !shouldbestopped) {
        level.timerstopped = 0;
        level.discardtime += gettime() - level.timerpausetime;
        timeleft = gettimeremaining();
        if (isdefined(var_5a6706a7ded54bda)) {
            setgameendtime(int(var_5a6706a7ded54bda));
        } else {
            setgameendtime(gettime() + int(timeleft));
        }
        setomnvar("ui_match_timer_stopped", 0);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe0b
// Size: 0x2a
function pausetimer(gameovertime) {
    if (!level.timerstoppedforgamemode) {
        level.timerstoppedforgamemode = 1;
        updatetimerpausedness(gameovertime);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe3d
// Size: 0x29
function resumetimer(gameovertime) {
    if (level.timerstoppedforgamemode) {
        level.timerstoppedforgamemode = 0;
        updatetimerpausedness(gameovertime);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe6e
// Size: 0x1aa
function startgame() {
    setslowmotion(1, 1, 0);
    thread gametimer();
    level.timerstopped = 0;
    level.timerstoppedforgamemode = 0;
    setomnvar("ui_prematch_period", 1);
    prematchperiod();
    sysprint("Ready for Compass");
    thread scripts\mp\analyticslog::logevent_sendplayerindexdata();
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_prematch_over");
    scripts\mp\flags::gameflagset("prematch_done");
    level notify("prematch_over");
    setomnvar("ui_prematch_period", 0);
    level.var_5fbdcf40b68612a5 = gettime();
    foreach (player in level.players) {
        player scripts\mp\damage::resetattackerlist();
    }
    if (shouldmodelognotify() && game["roundsPlayed"] == 0) {
        logstring("IWH-315293: ELECTRICEEL: Prematch done");
    }
    updatetimerpausedness();
    timelimit = gettimelimit();
    if (timelimit > 0 && !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        level thread waitthenshowtimer();
    } else {
        setomnvar("ui_match_timer_hidden", 1);
    }
    cleanpatchablecollision();
    thread timelimitclock();
    thread graceperiod();
    thread scripts\cp_mp\challenges::roundbegin();
    if (getdvarint(@"hash_818c699a5caaee4f", 0) > 30) {
        setdvar(@"hash_a85ba82ffd9faefe", 1);
    }
    thread scripts\mp\analyticslog::recordbreadcrumbdata();
    if (getdvarint(@"hash_2745598e35a47913") == 1) {
        thread namespace_f5675568ccc8acc6::function_b6fd5f72a2973c10();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10020
// Size: 0x21
function waitthenshowtimer() {
    setomnvar("ui_match_timer_hidden", 1);
    wait 0.25;
    setomnvar("ui_match_timer_hidden", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10049
// Size: 0x2b6
function cleanpatchablecollision() {
    patch = [];
    patch[0] = getent("clip32x32x8", "targetname");
    patch[1] = getent("clip32x32x128", "targetname");
    patch[2] = getent("clip64x64x256", "targetname");
    patch[3] = getent("clip32x32x32", "targetname");
    patch[4] = getent("clip64x64x128", "targetname");
    patch[5] = getent("clip64x64x64", "targetname");
    patch[6] = getent("clip64x64x8", "targetname");
    patch[7] = getent("clip128x128x256", "targetname");
    patch[8] = getent("clip128x128x128", "targetname");
    patch[9] = getent("clip128x128x8", "targetname");
    patch[10] = getent("clip256x256x256", "targetname");
    patch[11] = getent("clip256x256x128", "targetname");
    patch[12] = getent("clip256x256x8", "targetname");
    patch[13] = getent("clip512x512x8", "targetname");
    patch[14] = getent("clip32x32x256", "targetname");
    patch[15] = getent("player32x32x8", "targetname");
    patch[16] = getent("player32x32x32", "targetname");
    patch[17] = getent("player32x32x128", "targetname");
    patch[18] = getent("player32x32x256", "targetname");
    patch[19] = getent("player64x64x256", "targetname");
    patch[20] = getent("player64x64x128", "targetname");
    patch[21] = getent("player64x64x64", "targetname");
    patch[22] = getent("player64x64x8", "targetname");
    patch[23] = getent("player128x128x256", "targetname");
    patch[24] = getent("player128x128x128", "targetname");
    patch[25] = getent("player128x128x8", "targetname");
    patch[26] = getent("player256x256x256", "targetname");
    patch[27] = getent("player256x256x128", "targetname");
    patch[28] = getent("player256x256x8", "targetname");
    patch[29] = getent("player512x512x8", "targetname");
    foreach (p in patch) {
        if (isdefined(p)) {
            p delete();
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10307
// Size: 0xcd
function wavespawntimer() {
    level endon("game_ended");
    level notify("waveSpawnTimer");
    level endon("waveSpawnTimer");
    while (game["state"] == "playing") {
        time = gettime();
        foreach (entry in level.teamnamelist) {
            if (time - level.lastwave[entry] > level.wavedelay[entry] * 1000) {
                level notify("wave_respawn_" + entry);
                level.lastwave[entry] = time;
                level.waveplayerspawnindex[entry] = 0;
            }
        }
        waitframe();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103dc
// Size: 0x46
function wavetimerwatcher() {
    level endon("waveSpawnTimer");
    while (true) {
        waittill_any_2("wave_respawn_allies", "wave_respawn_axis");
        setomnvar("ui_hardpoint_timer", gettime() + 1000 * level.wavedelay["allies"]);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1042a
// Size: 0x240
function getbetterteam() {
    kills = [];
    deaths = [];
    foreach (entry in level.teamnamelist) {
        kills[entry] = 0;
        deaths[entry] = 0;
    }
    foreach (player in level.players) {
        team = player scripts\mp\utility\stats::getpersstat("team");
        if (isdefined(team) && isgameplayteam(team)) {
            kills[team] = kills[team] + player.kills;
            deaths[team] = deaths[team] + player.deaths;
        }
    }
    highestkillcount = undefined;
    var_26dab44600e577c2 = undefined;
    var_eef1f945d8b0c9fd = 0;
    lowestdeathcount = undefined;
    var_8637b9eeda41c9a = undefined;
    var_b788609f6e686a95 = 0;
    foreach (entry in level.teamnamelist) {
        killcount = kills[entry];
        if (!isdefined(highestkillcount) || killcount > highestkillcount) {
            highestkillcount = killcount;
            var_26dab44600e577c2 = entry;
            var_eef1f945d8b0c9fd = 0;
        } else if (highestkillcount == killcount) {
            var_eef1f945d8b0c9fd = 1;
        }
        deathcount = deaths[entry];
        if (!isdefined(lowestdeathcount) || deathcount < lowestdeathcount) {
            lowestdeathcount = deathcount;
            var_8637b9eeda41c9a = entry;
            var_b788609f6e686a95 = 0;
            continue;
        }
        if (lowestdeathcount == deathcount) {
            var_b788609f6e686a95 = 1;
        }
    }
    if (!var_eef1f945d8b0c9fd) {
        return var_26dab44600e577c2;
    }
    if (!var_b788609f6e686a95) {
        return var_8637b9eeda41c9a;
    }
    randomidx = randomint(level.teamnamelist.size);
    return level.teamnamelist[randomidx];
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10673
// Size: 0x48
function rankedmatchupdates(winner) {
    if (matchmakinggame()) {
        setxenonranks();
        if (hostidledout()) {
            level.hostforcedend = 1;
            logstring("host idled out");
            endlobby();
        }
    }
    updatewinlossstats(winner);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106c3
// Size: 0x192
function displayroundend(winner, endreasontext, endreasontextloss) {
    thread scripts\mp\music_and_dialog::round_end_music(winner, endreasontext, endreasontextloss);
    if (istrue(level.var_ee656bfaf5da1c13)) {
        thread function_90b7bf366e1e6be9(winner);
    }
    if (!level.doeomcombat && ismoddedroundgame() && game["finalRound"] == 0) {
        winner = "roundend";
    }
    level.roundendextramessage = 0;
    if (!waslastround() && getgametype() == "arena" && !istrue(game["practiceRound"])) {
        if (checkroundswitch(level.playovertime)) {
            level.roundendextramessage = game["round_end_exmsg"]["switching_sides"];
        }
    }
    if (waslastround() && iswinbytworulegametype() && function_2f1b2a4a64257bea()) {
        winner = "tie";
        endreasontext = game["end_reason"]["win_by_two_tie"];
        endreasontextloss = game["end_reason"]["win_by_two_tie"];
    }
    foreach (player in level.players) {
        if (isalive(player)) {
            player thread scripts\mp\weapons::savealtstates();
        }
        if (level.teambased) {
            player thread scripts\mp\hud_message::teamoutcomenotify(winner, 1, endreasontext, endreasontextloss, level.roundendextramessage);
            continue;
        }
        player thread scripts\mp\hud_message::outcomenotify(winner, endreasontext, endreasontextloss);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1085d
// Size: 0xdf
function displaygameend(winner, endreasontext, endreasontextloss) {
    setomnvar("ui_match_over", 1);
    if (waslastround() && iswinbytworulegametype() && function_2f1b2a4a64257bea()) {
        winner = "tie";
        endreasontext = game["end_reason"]["win_by_two_tie"];
        endreasontextloss = game["end_reason"]["win_by_two_tie"];
    }
    foreach (player in level.players) {
        if (level.teambased) {
            player thread scripts\mp\hud_message::teamoutcomenotify(winner, 0, endreasontext, endreasontextloss);
            continue;
        }
        player thread scripts\mp\hud_message::outcomenotify(winner, endreasontext, endreasontextloss);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10944
// Size: 0x88
function function_90b7bf366e1e6be9(winner) {
    if (winner == game["attackers"] && isdefined(level.var_fcb88e09334f2385)) {
        namespace_e688cd9db0404268::function_f1aed36ab4598ea(level.var_fcb88e09334f2385);
        wait 45;
        namespace_e688cd9db0404268::function_f4e0ff5cb899686d(level.var_fcb88e09334f2385);
        return;
    }
    if (winner == game["defenders"] && isdefined(level.var_587955703c59a8a5)) {
        namespace_e688cd9db0404268::function_f1aed36ab4598ea(level.var_587955703c59a8a5);
        wait 45;
        namespace_e688cd9db0404268::function_f4e0ff5cb899686d(level.var_587955703c59a8a5);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d4
// Size: 0x2d7
function displayroundswitch() {
    level notify("spawning_intermission");
    var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
    foreach (player in level.players) {
        player thread scripts\mp\playerlogic::spawnintermission(var_d8cb902ebfc7b2a2);
    }
    switchtype = level.halftimetype;
    if (switchtype == "halftime") {
        if (level.roundlimit) {
            if (game["roundsPlayed"] * 2 == level.roundlimit) {
                switchtype = "halftime";
            } else {
                switchtype = "intermission";
            }
        } else {
            switchtype = "intermission";
        }
    }
    level notify("round_switch", switchtype);
    endreason = 0;
    if (game["finalRound"] == 1) {
        switchtype = "final_round";
    } else if (game["matchPoint"] == 1) {
        switchtype = "match_point";
        if (iswinbytworulegametype() && game["roundsWon"]["allies"] == game["roundsWon"]["axis"]) {
            switchtype = "win_by_two";
        }
    }
    if (isdefined(level.switchedsides)) {
        endreason = game["end_reason"]["switching_sides"];
        level.roundendextramessage = 0;
        if (switchtype != "final_round" && switchtype != "match_point") {
            switchtype = "switching_sides";
        }
    }
    foreach (player in level.players) {
        player thread scripts\mp\hud_message::teamoutcomenotify(switchtype, 1, endreason, endreason, level.roundendextramessage);
    }
    if (switchtype == "final_round" && getbasegametype() == "control") {
        roundendwait(level.roundenddelay);
        wait level.postgamehitmarkerwaittime;
        var_eca75127d562ae19 = scripts\mp\gametypes\control::function_287623bbb15154be();
        reason = var_eca75127d562ae19[1];
        defendingteam = var_eca75127d562ae19[0];
        axisdefending = ter_op(defendingteam == "axis", 1, 0);
        setomnvar("ui_control_axis_defending", axisdefending);
        foreach (player in level.players) {
            player thread scripts\mp\hud_message::teamoutcomenotify("switching_sides", 1, reason, reason, 0);
        }
    }
    roundendwait(level.halftimeroundenddelay);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cb3
// Size: 0x191
function freezeallplayers(delay, var_8c7ca5de1b4ed9a8, var_7e99ec33d27a716e, slowmotion) {
    if (!isdefined(delay)) {
        delay = 0;
    }
    if (!isdefined(slowmotion)) {
        slowmotion = 0;
    }
    if (delay > 0 && slowmotion) {
        thread slowmotionendofgame(delay);
    }
    thread sendgameendedfrozennotify(delay);
    foreach (player in level.players) {
        player enableplayerbreathsystem(0);
        player thread freezeplayerforroundend(delay);
        player thread roundenddof(4);
        player freegameplayhudelems();
        player setclientdvars(@"hash_cc2997fd2acb23e0", 1, @"hash_9cb529b37532dcc4", 0);
        if (isdefined(var_8c7ca5de1b4ed9a8) && isdefined(var_7e99ec33d27a716e)) {
            if (var_8c7ca5de1b4ed9a8 == @"hash_682a9bc40f96ca4a" && player issplitscreenplayer()) {
                player setclientdvars(var_8c7ca5de1b4ed9a8, 0.75);
            }
            player setclientdvars(var_8c7ca5de1b4ed9a8, var_7e99ec33d27a716e);
        }
    }
    if (isdefined(level.agentarray)) {
        foreach (agent in level.agentarray) {
            agent _freezecontrols(1, undefined, "freezeAllPlayers");
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4c
// Size: 0x29
function endofroundvisionset(delay) {
    if (isdefined(delay) && delay > 0) {
        wait delay;
    }
    visionsetfadetoblack("bw", 0.75);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e7d
// Size: 0x40
function slowmotionendofgame(delay) {
    setslowmotion(1, 0.4, delay);
    setendofroundsoundtimescalefactor();
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(delay);
    setslowmotion(1, 1, 0);
    resetsoundtimescalefactor();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec5
// Size: 0x2f
function setendofroundsoundtimescalefactor() {
    if (!isdefined(level.endround_timescalefactor)) {
        soundsettimescalefactorfromtable("end_of_round");
        level.endround_timescalefactor = 1;
        level.reset_timescalefactor = undefined;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10efc
// Size: 0x42
function resetsoundtimescalefactor() {
    if (!isdefined(level.reset_timescalefactor)) {
        soundsettimescalefactorfromtable("reset");
        level.endround_timescalefactor = undefined;
        level.nukeinfo.timescalefactor = undefined;
        level.reset_timescalefactor = 1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f46
// Size: 0x15
function sendgameendedfrozennotify(delay) {
    wait delay;
    level notify("game_ended_frozen");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f63
// Size: 0x96
function restart() {
    foreach (player in level.players) {
        player thread setuipostgamefade(1);
    }
    wait 0.5;
    if (isdefined(level.onmaprestart)) {
        [[ level.onmaprestart ]]();
    }
    level notify("restarting");
    game["state"] = "playing";
    map_restart(1);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11001
// Size: 0xba
function function_52dde37b8fcf63ff() {
    if (!function_6b9f8406e6153597()) {
        return;
    }
    summary = spawnstruct();
    summary.matchlength = gettimepassed();
    function_7a37f9bab9677061(summary);
    foreach (player in level.players) {
        if (!isplayer(player) || isbot(player)) {
            continue;
        }
        playerstats = scripts\mp\playerlogic::function_358a3ae71b7d1935(player);
        if (!isdefined(playerstats)) {
            continue;
        }
        player function_fe84f716b4611373(playerstats);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110c3
// Size: 0xa9
function endgame(winner, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b) {
    if (isdefined(level.var_dbf03354f99ebab2)) {
        shouldskip = [[ level.var_dbf03354f99ebab2 ]]();
        if (istrue(shouldskip)) {
            return;
        }
    }
    level notify("start_game_ended");
    level.endgamewinner = winner;
    if (isdefined(level.modescorewinner)) {
        winner = level.modescorewinner;
    }
    if (isdefined(level.endgame)) {
        [[ level.endgame ]](winner, endreasontext, nukedetonated);
        return;
    }
    endgame_regularmp(winner, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11174
// Size: 0x62c
function endgame_regularmp(winner, endreasontext, endreasontextloss, nukedetonated, var_8e4a26ed257a393b, var_2f96189808d67a6b) {
    if (!isdefined(nukedetonated)) {
        nukedetonated = 0;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && level.gameended) {
        return;
    }
    if (game["roundsPlayed"] < 24) {
        setmatchdata("utcRoundEndTimeSeconds", game["roundsPlayed"], getsystemtime());
    }
    if (scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
        setomnvar("ui_round_end_time", getsystemtime());
    }
    utility::trycall(level.matchdata_onroundend);
    level.var_cc2c79de99db62c = 1;
    skipscoring = 0;
    if (level.hostforcedend || level.forcedend) {
        skipscoring = 1;
    }
    if (inovertime()) {
        if (game["overtimeRoundsPlayed"] == 0) {
            setmatchdata("firstOvertimeRoundIndex", game["roundsPlayed"]);
        }
        if (!skipscoring) {
            game["overtimeRoundsPlayed"]++;
        }
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            if (!skipscoring) {
                if (isdefined(var_8e4a26ed257a393b)) {
                    game["roundsWon"][winner] = game["roundsWon"][winner] + var_8e4a26ed257a393b;
                } else {
                    game["roundsWon"][winner]++;
                }
            }
            if (!isdefined(level.finalkillcam_winner)) {
                level.finalkillcam_winner = winner;
            }
        } else {
            if (!skipscoring && isdefined(winner) && winner == "tie" && shouldmodescoreonties()) {
                foreach (entry in level.teamnamelist) {
                    if (isdefined(var_2f96189808d67a6b) && isarray(var_2f96189808d67a6b) && isdefined(var_2f96189808d67a6b[entry])) {
                        game["roundsWon"][entry] = game["roundsWon"][entry] + var_2f96189808d67a6b[entry];
                        continue;
                    }
                    game["roundsWon"][entry]++;
                }
            }
            if (!isdefined(level.finalkillcam_winner)) {
                level.finalkillcam_winner = "none";
            }
        }
        if (!istrue(game["practiceRound"])) {
            foreach (entry in level.teamnamelist) {
                scripts\mp\gamescore::updateteamscore(entry);
            }
            if (isroundbased() && game["roundsPlayed"] < 24 && getbasegametype() != "koth") {
                setmatchdata("alliesRoundScore", game["roundsPlayed"], getteamscore("allies"));
                setmatchdata("axisRoundScore", game["roundsPlayed"], getteamscore("axis"));
            }
        }
    } else {
        if (isdefined(winner) && isplayer(winner) && !skipscoring) {
            game["roundsWon"][winner.guid]++;
        }
        if (!isdefined(level.finalkillcam_winner)) {
            if (!isdefined(winner) || isstring(winner) && (winner == "tie" || winner == "none")) {
                level.finalkillcam_winner = "none";
            } else {
                level.finalkillcam_winner = winner.guid;
            }
        }
    }
    scripts\mp\gamescore::updateplacement();
    if (!skipscoring) {
        game["roundsPlayed"]++;
    }
    level.playovertime = shouldplayovertime();
    if (nextroundisfinalround()) {
        game["finalRound"] = 1;
    } else if (nextroundismatchpoint()) {
        game["matchPoint"] = 1;
    }
    if (isdefined(winner) && waslastround()) {
        winner = checkmodeoverridetie(winner);
    }
    level.ctfnukeended = istrue(nukedetonated) && getgametype() == "ctf";
    if (isdefined(winner) && level.ctfnukeended) {
        otherteam = ter_op(winner == "allies", "axis", "allies");
        game["roundsWon"][winner] = 1;
        game["roundsWon"][otherteam] = 0;
        game["teamScores"][winner] = 1;
        game["teamScores"][otherteam] = 0;
        setteamscore(winner, 1);
        setteamscore(otherteam, 0);
    }
    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
            function_4c6436a7855aacd();
        }
    }
    updatematchbonusscores(winner);
    if (wasonlyround() || waslastround()) {
        foreach (player in level.players) {
            player namespace_6b49ddb858f34366::function_adcb155953291ec7(undefined, 1);
            player scripts\cp_mp\utility\game_utility::stopkeyearning(winner);
        }
    }
    if (level.var_1fa9e6ecce90d2c2) {
        processgameend = endgame_endround(winner, endreasontext, endreasontextloss, nukedetonated);
    } else {
        processgameend = function_968a297e2b343c7c(winner, endreasontext, endreasontextloss, nukedetonated);
    }
    foreach (player in level.players) {
        if (!isbot(player) && isdefined(player.team) && player.team != "spectator" && player.team != "codcaster") {
            logendofround(player);
        }
    }
    if (processgameend && waslastround()) {
        function_8abcf76787cc51aa();
        if (level.var_1fa9e6ecce90d2c2) {
            endgame_endgame(winner, endreasontext, endreasontextloss, nukedetonated);
            return;
        }
        function_7d6052ee2ccb8d2(winner, endreasontext, endreasontextloss, nukedetonated);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117a8
// Size: 0xa
function shouldmodescoreonties() {
    return istrue(game["canScoreOnTie"]);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117bb
// Size: 0xbd
function checkmodeoverridetie(winner) {
    cybertie = shouldmodescoreonties() && winner == "tie";
    ctftie = getgametype() == "ctf" && winner == "tie" && !level.winrule;
    if (cybertie || ctftie) {
        scripts\mp\gamescore::updatetotalteamscore("axis");
        scripts\mp\gamescore::updatetotalteamscore("allies");
        alliesscore = getteamscore("allies");
        axisscore = getteamscore("axis");
        if (alliesscore != axisscore) {
            winner = ter_op(alliesscore > axisscore, "allies", "axis");
        }
    }
    return winner;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11881
// Size: 0xd4
function endgame_showkillcam() {
    if (istrue(level.nukeinfo.detonated)) {
        return;
    }
    if (istrue(level.brdisablefinalkillcam)) {
        return;
    }
    if (istrue(level.var_ee656bfaf5da1c13)) {
        return;
    }
    if (getdvarint(@"hash_166b51bf7450fc22", 0) == 1) {
        return;
    }
    if (istrue(level.skipfinalkillcam)) {
        return;
    }
    scripts\mp\flags::levelflagwait("final_killcam_preloaded");
    if (level.finalkillcamenabled) {
        doingkillcam = 0;
        if (isdefined(level.finalkillcam_winner)) {
            doingkillcam = 1;
        }
        if (doingkillcam) {
            doingkillcam = level scripts\mp\final_killcam::dofinalkillcam();
        }
        if (isdefined(doingkillcam) && !doingkillcam) {
            postroundfadenokillcam();
        }
        return;
    }
    if (level.potgenabled) {
        function_a310b626ca04b8c2();
        return;
    }
    assertmsg("endGame_ShowKillCam() -- Neither Final-Kill killcam nor POTG enabled. Probably a mistake.");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1195d
// Size: 0x5b
function function_a310b626ca04b8c2() {
    var_cc46931e59a508d3 = scripts\mp\potg::getcurpotgscene();
    if (isdefined(var_cc46931e59a508d3.primaryentity)) {
        level scripts\mp\final_killcam::dopotgkillcam();
        return;
    }
    level.finalkillcamenabled = 1;
    doingkillcam = level scripts\mp\final_killcam::dofinalkillcam();
    if (isdefined(doingkillcam) && !doingkillcam) {
        postroundfadenokillcam();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119c0
// Size: 0xc7
function postroundfadenokillcam() {
    foreach (player in level.players) {
        if (isbot(player)) {
            continue;
        }
        if (level.gametype == "ballmode") {
            if (waslastround()) {
                player setclientomnvar("post_game_state", 2);
            }
        } else if (level.gametype == "arena") {
            player setclientomnvar("post_game_state", 1);
        } else {
            player setclientomnvar("post_game_state", 2);
        }
        player thread predictandclearintermissionstreaming();
    }
    wait 0.5;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8f
// Size: 0x4a
function predictandclearintermissionstreaming() {
    self endon("disconnect");
    intermissionloc = scripts\mp\playerlogic::getspectatepoint();
    self function_bc667001f9dd3808(intermissionloc.origin);
    while (self.sessionstate != "intermission") {
        waitframe();
    }
    waitframe();
    self clearpredictedstreampos();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ae1
// Size: 0x39
function setgameendflagsandnotifies(winner) {
    game["state"] = "postgame";
    level notify("game_ended", winner);
    scripts\mp\flags::levelflagset("game_over");
    scripts\mp\flags::levelflagset("block_notifies");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b22
// Size: 0x3b
function endgame_luidecisionreceived(value) {
    if (isdefined(value)) {
        if (value == 1 || value == 2) {
            level._waitforlui = 0;
            level._luidecision = value;
            level notify("madeLUIDecision");
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b65
// Size: 0xcb9
function function_968a297e2b343c7c(winner, endreasontext, endreasontextloss, nukedetonated) {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    if (!isdefined(winner)) {
        if (isroundbased()) {
            logstring("IWH-315293: HALIBUT: winner undefined, related to CL 7682409 where wasLastRound() would not be set in round based mode");
            level.forcedend = 1;
        }
        return true;
    }
    namespace_27c74152ccb91331::function_27fe46449778a3e3(winner);
    if (getdvarint(@"hash_c6492f4edd9202d3")) {
        if (getgametype() == "ballmode" || waslastround() && getgametype() != "arena") {
            level.doeomcombat = 1;
        }
    }
    updateleaderboardstats();
    waitframe();
    scripts\mp\gamescore::updateplacement();
    level.recordfinalkillcam = 0;
    level.ignorescoring = 1;
    thread scripts\mp\potg::onroundended(winner);
    thread scripts\mp\final_killcam::preloadfinalkillcam();
    level notify("cancel_announcer_dialog");
    if (isteamreviveenabled()) {
        thread scripts\mp\teamrevive::cleanuprevivetriggericons();
    }
    if (waslastround()) {
        if (matchmakinggame()) {
            if (getdvarint(@"hash_d9b8563acb5ea299", 0) != 0) {
                if (getdvarint(@"hash_8465b31049c6168d", 0) == 1) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 2) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 3) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(1);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 4) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(1);
                }
            }
        }
        if (getgametype() == "arena") {
            if (isgameplayteam(winner)) {
                topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
            } else {
                topplayers = level.placement["all"];
            }
            topplayercount = int(min(3, topplayers.size));
            foreach (player in level.players) {
                topplayerstatus = 0;
                for (i = 0; i < topplayercount; i++) {
                    if (player == topplayers[i]) {
                        topplayerstatus = 1;
                    }
                }
                if (topplayerstatus) {
                    if (player == topplayers[0]) {
                        player scripts\cp_mp\pet_watch::addwatch2v2topscore();
                    }
                }
            }
        }
        level notify("start_game_win_audio", winner);
        if (istrue(level.postgameexfil) && !level.forcedend) {
            if (winner != "tie") {
                level waittill("exfil_continue_game_end");
            }
        }
    } else {
        level notify("round_end_music", winner);
    }
    if (level.doeomcombat) {
        if (istrue(level.docmdoutro)) {
            thread waitforhitmarkerspostgame();
            setgameendflagsandnotifies(winner);
            level waittill("cmd_continue_game_end");
            setomnvarforallclients("post_game_state", 2);
            foreach (player in level.players) {
                if (level.teambased) {
                    player thread scripts\mp\hud_message::teamoutcomenotify(winner, 0, endreasontext, endreasontextloss);
                    continue;
                }
                player thread scripts\mp\hud_message::outcomenotify(winner, endreasontext, endreasontextloss);
            }
            freezeallplayers(3, @"hash_682a9bc40f96ca4a", 1, 1);
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(3);
        } else if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            game["state"] = "postgame";
            level notify("game_ended", winner);
            scripts\mp\flags::levelflagset("game_over");
            scripts\mp\flags::levelflagset("block_notifies");
            waitframe();
        } else if (getgametype() == "ballmode") {
            level notify("game_ended", winner);
            if (waslastround() || level.playovertime) {
                if (level.playovertime) {
                    winner = "overtime";
                }
                thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            }
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        } else {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            freezeallplayers(2.5, @"hash_682a9bc40f96ca4a", 1, 1);
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        }
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if (wasonlyround() || waslastround()) {
                player scripts\mp\killstreaks\killstreaks::clearkillstreaks();
                player scripts\mp\bounty::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
    } else {
        thread waitforhitmarkerspostgame();
        setgameendflagsandnotifies(winner);
        waitframe();
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if ((wasonlyround() || waslastround()) && !istrue(game["isLaunchChunk"])) {
                player scripts\mp\killstreaks\killstreaks::clearkillstreaks();
                player scripts\mp\bounty::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
        freezeallplayers(1, @"hash_682a9bc40f96ca4a", 1, 0);
    }
    setgameendtime(0);
    game["gameLength"] = game["gameLength"] + scripts\mp\utility\game::getroundlength();
    thread scripts\mp\analyticslog::logevent_sendplayerindexdata();
    if (scripts\mp\analyticslog::analyticsspawnlogenabled()) {
        scripts\mp\analyticslog::analyticsstorespawndata();
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.end_reason = endreasontext;
    var_7e2c53b0bcf117d9.winner = winner;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_end", var_7e2c53b0bcf117d9);
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_end")) {
        foreach (player in level.players) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = player;
            var_7e2c53b0bcf117d9.winner = winner;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_end", var_7e2c53b0bcf117d9);
        }
    }
    clearmatchhasmorethan1playervariablesonroundend();
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    rankedmatchupdates(winner);
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    foreach (player in level.players) {
        player scripts\mp\class::loadout_clearperks();
        player.deathsdoor = 0;
    }
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["roundsPlayed"] = 0;
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
        }
        winner = "tie";
        endreasontext = game["end_reason"]["practice_round_over"];
    }
    var_c58f71396bb03715 = 1;
    if (getgametype() == "ballmode") {
        var_c58f71396bb03715 = waslastround() || level.playovertime;
    }
    if (var_c58f71396bb03715) {
        displayroundend(winner, endreasontext, endreasontextloss);
        level thread endofroundvisionset(level.roundenddelay - 1);
    }
    if (!waslastround()) {
        level notify("round_win", winner);
        roundendwait(level.roundenddelay);
    } else {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.winner = winner;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_end", var_7e2c53b0bcf117d9);
        roundendwait(level.roundenddelay);
    }
    level notify("game_cleanup");
    endgame_showkillcam();
    if (istrue(level.var_ee656bfaf5da1c13)) {
        function_cc892bd20a432474(winner);
    }
    setslowmotion(1, 1, 0);
    resetsoundtimescalefactor();
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["practiceRound"] = 0;
        if (level.allowsupers && !runleanthreadmode()) {
            foreach (player in level.players) {
                player scripts\mp\supers::clearsuper();
                player scripts\mp\perks\perkpackage::perkpackage_reset();
            }
        }
        scripts\mp\flags::levelflagclear("block_notifies");
        restart();
        return false;
    } else {
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                scripts\mp\gamescore::updatetotalteamscore(entry);
            }
        }
        if (!wasonlyround()) {
            if (!waslastround()) {
                if (level.playovertime) {
                    winner = "overtime";
                    game["status"] = "overtime";
                }
                scripts\mp\flags::levelflagclear("block_notifies");
                shouldswitchsides = checkroundswitch(level.playovertime);
                if (shouldswitchsides) {
                    onroundswitch(level.playovertime);
                }
                if (shouldswitchsides || game["finalRound"] == 1 || game["matchPoint"] == 1) {
                    shouldDisplayRoundSwitch = 1;
                    if (getgametype() == "arena") {
                        if (shouldplaywinbytwo()) {
                        } else if (game["matchPoint"] == 1 && !istrue(game["displayedMatchPoint"])) {
                            game["displayedMatchPoint"] = 1;
                        } else if (game["finalRound"] != 1) {
                            shouldDisplayRoundSwitch = 0;
                        }
                    } else if (getgametype() == "ballmode") {
                        shouldDisplayRoundSwitch = 0;
                    }
                    if (shouldDisplayRoundSwitch) {
                        displayroundswitch();
                    }
                }
                foreach (player in level.players) {
                    player.pers["stats"] = player.stats;
                    if (scripts\mp\utility\player::isreallyalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.life_index)) {
                        deathdata = spawnstruct();
                        deathdata.victim = player;
                        deathdata.attacker = undefined;
                        deathdata.meansofdeath = "MOD_ROUND_ENDED";
                        deathdata.weaponfullstring = "none";
                        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", deathdata);
                    }
                }
                restart();
                return false;
            }
            if (!level.forcedend) {
                endreasontext = updateroundendreasontext(winner);
            }
        }
    }
    return true;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12827
// Size: 0xcf1
function endgame_endround(winner, endreasontext, endreasontextloss, nukedetonated) {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    if (!isdefined(winner)) {
        if (isroundbased()) {
            logstring("IWH-315293: HALIBUT: winner undefined, related to CL 7682409 where wasLastRound() would not be set in round based mode");
            level.forcedend = 1;
        }
        return true;
    }
    if (getdvarint(@"hash_c6492f4edd9202d3")) {
        if (getgametype() == "ballmode" || waslastround() && getgametype() != "arena") {
            level.doeomcombat = 1;
        }
    }
    updateleaderboardstats();
    waitframe();
    scripts\mp\gamescore::updateplacement();
    level.recordfinalkillcam = 0;
    level.ignorescoring = 1;
    thread scripts\mp\potg::onroundended(winner);
    thread scripts\mp\final_killcam::preloadfinalkillcam();
    level notify("cancel_announcer_dialog");
    if (isteamreviveenabled()) {
        thread scripts\mp\teamrevive::cleanuprevivetriggericons();
    }
    if (waslastround()) {
        if (matchmakinggame()) {
            if (getdvarint(@"hash_d9b8563acb5ea299", 0) != 0) {
                if (getdvarint(@"hash_8465b31049c6168d", 0) == 1) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 2) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(0);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 3) {
                    requestgamelobbyremainintact();
                    function_c924fac2b85ae1bf(1);
                } else if (getdvarint(@"hash_8465b31049c6168d", 0) == 4) {
                    function_3b58dc117cebc002();
                    function_c924fac2b85ae1bf(1);
                }
            }
        }
        if (getgametype() == "arena") {
            if (isgameplayteam(winner)) {
                topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
            } else {
                topplayers = level.placement["all"];
            }
            topplayercount = int(min(3, topplayers.size));
            foreach (player in level.players) {
                topplayerstatus = 0;
                for (i = 0; i < topplayercount; i++) {
                    if (player == topplayers[i]) {
                        topplayerstatus = 1;
                    }
                }
                if (topplayerstatus) {
                    if (player == topplayers[0]) {
                        player scripts\cp_mp\pet_watch::addwatch2v2topscore();
                    }
                }
            }
        }
        level notify("start_game_win_audio", winner);
        if (istrue(level.postgameexfil) && !level.forcedend) {
            if (winner != "tie") {
                level waittill("exfil_continue_game_end");
            }
        }
    } else {
        level notify("round_end_music", winner);
    }
    if (level.doeomcombat) {
        if (istrue(level.docmdoutro)) {
            thread waitforhitmarkerspostgame();
            setgameendflagsandnotifies(winner);
            level waittill("cmd_continue_game_end");
            setomnvarforallclients("post_game_state", 2);
            foreach (player in level.players) {
                if (level.teambased) {
                    player thread scripts\mp\hud_message::teamoutcomenotify(winner, 0, endreasontext, endreasontextloss);
                    continue;
                }
                player thread scripts\mp\hud_message::outcomenotify(winner, endreasontext, endreasontextloss);
            }
            freezeallplayers(3, @"hash_682a9bc40f96ca4a", 1, 1);
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(3);
        } else if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            game["state"] = "postgame";
            level notify("game_ended", winner);
            scripts\mp\flags::levelflagset("game_over");
            scripts\mp\flags::levelflagset("block_notifies");
            waitframe();
        } else if (getgametype() == "ballmode") {
            level notify("game_ended", winner);
            if (waslastround() || level.playovertime) {
                if (level.playovertime) {
                    winner = "overtime";
                }
                thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            }
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        } else {
            thread eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss);
            freezeallplayers(2.5, @"hash_682a9bc40f96ca4a", 1, 1);
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause(2.5);
            setgameendflagsandnotifies(winner);
            waitframe();
        }
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if (wasonlyround() || waslastround()) {
                player scripts\mp\killstreaks\killstreaks::clearkillstreaks();
                player scripts\mp\bounty::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
    } else {
        thread waitforhitmarkerspostgame();
        setgameendflagsandnotifies(winner);
        waitframe();
        foreach (player in level.players) {
            player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
            if ((wasonlyround() || waslastround()) && !istrue(game["isLaunchChunk"])) {
                player scripts\mp\killstreaks\killstreaks::clearkillstreaks();
                player scripts\mp\bounty::playerresetbountystreak();
            }
            player setclientomnvar("ui_match_in_progress", 0);
        }
        freezeallplayers(1, @"hash_682a9bc40f96ca4a", 1, 0);
    }
    setgameendtime(0);
    game["gameLength"] = game["gameLength"] + scripts\mp\utility\game::getroundlength();
    thread scripts\mp\analyticslog::logevent_sendplayerindexdata();
    if (scripts\mp\analyticslog::analyticsspawnlogenabled()) {
        scripts\mp\analyticslog::analyticsstorespawndata();
    }
    if (waslastround()) {
        level scripts\common\callbacks::callback("game_ended");
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.end_reason = endreasontext;
    var_7e2c53b0bcf117d9.winner = winner;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_round_end", var_7e2c53b0bcf117d9);
    if (namespace_de6e6777b0937bd7::function_9ce94b15ee6758ee("callback_player_round_end")) {
        foreach (player in level.players) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.player = player;
            var_7e2c53b0bcf117d9.winner = winner;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_round_end", var_7e2c53b0bcf117d9);
        }
    }
    clearmatchhasmorethan1playervariablesonroundend();
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    rankedmatchupdates(winner);
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    foreach (player in level.players) {
        player scripts\mp\class::loadout_clearperks();
        player.deathsdoor = 0;
    }
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["roundsPlayed"] = 0;
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
        }
        winner = "tie";
        endreasontext = game["end_reason"]["practice_round_over"];
    }
    if (issharedfuncdefined("display_transition", "display_round_end")) {
        outcome = spawnstruct();
        outcome.winner = winner;
        outcome.end_reason = endreasontext;
        [[ getsharedfunc("display_transition", "display_round_end") ]](outcome);
    }
    var_c58f71396bb03715 = 1;
    if (getgametype() == "ballmode") {
        var_c58f71396bb03715 = waslastround() || level.playovertime;
    }
    if (var_c58f71396bb03715) {
        displayroundend(winner, endreasontext, endreasontextloss);
        level thread endofroundvisionset(level.roundenddelay - 1);
    }
    if (!waslastround()) {
        level notify("round_win", winner);
        roundendwait(level.roundenddelay);
    } else {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.winner = winner;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_match_end", var_7e2c53b0bcf117d9);
        roundendwait(level.roundenddelay);
    }
    level notify("game_cleanup");
    if (istrue(game["practiceRound"]) && !istrue(level.forcedend)) {
        game["practiceRound"] = 0;
        if (level.allowsupers && !runleanthreadmode()) {
            foreach (player in level.players) {
                player scripts\mp\supers::clearsuper();
                player scripts\mp\perks\perkpackage::perkpackage_reset();
            }
        }
        scripts\mp\flags::levelflagclear("block_notifies");
        restart();
        return false;
    } else {
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                scripts\mp\gamescore::updatetotalteamscore(entry);
            }
        }
        if (!wasonlyround()) {
            if (!waslastround()) {
                if (level.playovertime) {
                    winner = "overtime";
                    game["status"] = "overtime";
                }
                scripts\mp\flags::levelflagclear("block_notifies");
                shouldswitchsides = checkroundswitch(level.playovertime);
                if (shouldswitchsides) {
                    onroundswitch(level.playovertime);
                }
                if (scripts\cp_mp\utility\game_utility::function_2d79a7a3b91c4c3e()) {
                    game["shouldDisplayRoundSwitch"] = shouldswitchsides;
                }
                if (shouldswitchsides || game["finalRound"] == 1 || game["matchPoint"] == 1) {
                    shouldDisplayRoundSwitch = 1;
                    if (getgametype() == "arena") {
                        if (game["matchPoint"] == 1 && !istrue(game["displayedMatchPoint"])) {
                            game["displayedMatchPoint"] = 1;
                        } else if (game["finalRound"] != 1) {
                            shouldDisplayRoundSwitch = 0;
                        }
                    } else if (getgametype() == "ballmode") {
                        shouldDisplayRoundSwitch = 0;
                    }
                    if (shouldDisplayRoundSwitch) {
                        displayroundswitch();
                    }
                }
                foreach (player in level.players) {
                    player.pers["stats"] = player.stats;
                    if (scripts\mp\utility\player::isreallyalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.life_index)) {
                        deathdata = spawnstruct();
                        deathdata.victim = player;
                        deathdata.attacker = undefined;
                        deathdata.meansofdeath = "MOD_ROUND_ENDED";
                        deathdata.weaponfullstring = "none";
                        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", deathdata);
                    }
                }
                restart();
                return false;
            }
            if (!level.forcedend) {
                endreasontext = updateroundendreasontext(winner);
            }
        }
    }
    return true;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13521
// Size: 0x11b
function tacopsroundendwait(defaultdelay) {
    notifiesdone = 0;
    while (!notifiesdone) {
        players = level.players;
        notifiesdone = 1;
        foreach (player in players) {
            if (!player scripts\mp\hud_message::isdoingsplash()) {
                continue;
            }
            notifiesdone = 0;
        }
        wait 0.5;
    }
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait defaultdelay + var_8d539c1577794d34;
    setomnvarforallclients("post_game_state", 1);
    level notify("round_end_finished");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13644
// Size: 0x2a
function compare_player_score(left, right) {
    return left.score >= right.score;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13677
// Size: 0xd27
function function_7d6052ee2ccb8d2(winner, endreasontext, endreasontextloss, nukedetonated) {
    canceljoins();
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    if (scripts\mp\gametypes\br_public::isBrPracticeMode() && !level.forcedend) {
        level._waitforlui = 1;
        level scripts\common\ui::lui_registercallback("exit_squad_eliminated", &endgame_luidecisionreceived);
    }
    if (!istrue(level.processedwinloss) && (istrue(level.forfeitinprogress) || level.forcedend)) {
        updatewinlossstats(winner);
    }
    scripts\cp_mp\challenges::roundend(winner);
    checkforpersonalbests();
    updatespmstats();
    scripts\mp\persistence::writebestscores();
    level notify("stop_leaderboard_stats");
    updateleaderboardstats();
    level scripts\mp\accolades::evaluateallaccolades();
    if (isdefined(level.winners_circle)) {
        level.var_286c2c7b34d03b04 = [[ level.winners_circle.init ]](winner);
    } else {
        level.var_286c2c7b34d03b04 = 0;
    }
    if (!level.var_286c2c7b34d03b04) {
        level notify("spawning_intermission");
        var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
        foreach (player in level.players) {
            player thread setuipostgamefade(0);
            if (!isdefined(level.modespawnendofgame) || !player [[ level.modespawnendofgame ]]()) {
                player thread scripts\mp\playerlogic::spawnintermission(var_d8cb902ebfc7b2a2);
            }
        }
    }
    if (istrue(nukedetonated) && isdefined(level.nukeinfo.visionset) && !istrue(level.nukeinfo.cancelled)) {
        _visionsetnaked(level.nukeinfo.visionset, 0);
        visionsetfadetoblack("", 0.75);
    } else {
        _visionsetnaked("", 0);
        visionsetfadetoblack("", 0.75);
    }
    displaygameend(winner, endreasontext, endreasontextloss);
    scripts\mp\flags::levelflagclear("block_notifies");
    namespace_bf9ffd2b22c7d819::function_4064a2271de12b97();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::match_end(winner);
    }
    level.intermission = 1;
    if (!level.var_286c2c7b34d03b04) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            scripts\mp\gametypes\br_circle::hidedangercircle();
            setomnvarforallclients("ui_br_transition_type", 0);
            if (function_7c386b2db63d6fb6()) {
                setomnvarforallclients("post_game_state", 14);
            }
            if (!scripts\mp\gametypes\br_public::isBrPracticeMode()) {
                wait_time = getdvarint(@"hash_54481201f477f78f", 120);
                if (getdvarint(@"hash_8772eff48f8bc5f2") == 1) {
                    wait 25;
                } else if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
                    wait wait_time;
                } else if (getdvarfloat(@"hash_e94e38873c94b670", 0) > 0) {
                    waitframe();
                } else {
                    wait 25;
                }
            } else {
                if (istrue(level._waitforlui)) {
                    level waittill("madeLUIDecision");
                }
                level.postroundtime = 0;
            }
        }
        if (level.gametype != "arena" && function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            roundendwait(level.postroundtime);
        }
        if (level.gametype == "arena" && function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() || getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || isprophuntgametype() || getsubgametype() == "rumble_mgl") {
        processlobbydata();
    }
    if (level.var_286c2c7b34d03b04) {
        setomnvarforallclients("post_game_state", 6);
        wait 0.1;
        [[ level.winners_circle.start ]](winner);
        level waittill("taunts_timed_out");
        [[ level.winners_circle.end ]]();
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            setmatchdata("victor", winner);
            topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
        } else {
            setmatchdata("victor", "none");
            topplayers = level.placement["all"];
        }
        setmatchdata("alliesScore", getteamscore("allies"));
        setmatchdata("axisScore", getteamscore("axis"));
    } else {
        setmatchdata("victor", "none");
        topplayers = level.placement["all"];
    }
    if (getdvarint(@"hash_7d55907df966fbb0")) {
        setomnvarforallclients("post_game_state", 6);
    }
    playerendmatch();
    foreach (player in level.players) {
        if (!isdefined(endreasontext)) {
            /#
                iprintlnbold("<dev string:xa5a>");
            #/
            endreasontext = game["end_reason"]["objective_completed"];
        }
        player setplayerdata("common", "round", "endReasonTextIndex", endreasontext);
        if (isalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.life_index)) {
            deathdata = spawnstruct();
            deathdata.victim = player;
            deathdata.attacker = undefined;
            deathdata.meansofdeath = "MOD_GAME_ENDED";
            deathdata.weaponfullstring = "none";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", deathdata);
        }
        topplayercount = int(min(3, topplayers.size));
        topplayerstatus = 0;
        for (i = 0; i < topplayercount; i++) {
            if (player == topplayers[i]) {
                topplayerstatus = 1;
            }
        }
        if (topplayerstatus) {
            player scripts\cp_mp\pet_watch::addwatchchargewintop3();
        }
        if (level.teambased) {
            if (isgameplayteam(winner)) {
                if (isdefined(player.team)) {
                    if (player.team == winner) {
                        player scripts\cp_mp\pet_watch::addwatchchargewin();
                        player.pers["match_outcome"] = "win";
                    } else {
                        player.pers["match_outcome"] = "loss";
                    }
                }
            } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
                player.pers["match_outcome"] = "tie";
            }
        } else if (isplayer(winner)) {
            if (isdefined(level.lastplayerwins)) {
                if (player == level.placement["all"][0]) {
                    player scripts\cp_mp\pet_watch::addwatchchargewin();
                    player.pers["match_outcome"] = "win";
                } else {
                    player.pers["match_outcome"] = "loss";
                }
            } else if (topplayerstatus) {
                player scripts\cp_mp\pet_watch::addwatchchargewin();
                player.pers["match_outcome"] = "win";
            } else {
                player.pers["match_outcome"] = "loss";
            }
        } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
            player.pers["match_outcome"] = "tie";
        }
        if (player onlinestatsenabled()) {
            player setplayerdata(level.var_5d69837cf4db0407, "playerStats", "comparisonSeason", getdvarint(@"hash_71ef9b867531fea1"));
            elapsedtime = int(getsecondspassed());
            foreach (scope in ["lifetimeStats", "seasonalStats"]) {
                oldval = 0;
                if (player hasplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent")) {
                    oldval = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent");
                }
                player setplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent", oldval + elapsedtime);
            }
        }
        player utility::trycall(level.matchdata_logplayerdata);
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_exit_level");
    utility::trycall(level.matchdata_recordrecentlyplayeddata);
    onmatchend();
    sendendofmatchdata();
    function_85f0e7abca18ad51();
    foreach (player in level.players) {
        player.pers["stats"] = player.stats;
    }
    function_52dde37b8fcf63ff();
    if (istrue(game["isLaunchChunk"])) {
        wait 1;
    } else if (!nukedetonated && !level.postgamenotifies) {
        if (!level.var_286c2c7b34d03b04) {
            if (!wasonlyround()) {
                wait 6;
            } else if (getdvarfloat(@"hash_e94e38873c94b670", 0) > 0) {
                wait 1;
            } else if (!istrue(scripts\cp_mp\utility\game_utility::isbrstylegametype()) && level.matchmakingmatch && !level.var_ec2fb549b15ad827 && !level.var_77907d733abe8b63 && !istrue(scripts\cp_mp\utility\game_utility::function_22cd3d64fdb05892())) {
                wait min(10, 5 + level.postgamenotifies);
            } else {
                wait min(5, 4 + level.postgamenotifies);
            }
        }
    } else {
        wait min(10, 4 + level.postgamenotifies);
    }
    function_a30e6bfa5c581e40();
    settournamentwinner(winner);
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        setomnvarforallclients("post_game_state", 15);
        var_53804dbeed3da40 = getdvarint(@"hash_b6ae6a9d61d4326a", 0);
        wait var_53804dbeed3da40;
    }
    wait 1;
    function_a30e6bfa5c581e40();
    setomnvarforallclients("post_game_state", 1);
    scripts\mp\flags::levelflagwaitopen("post_game_level_event_active");
    if (istrue(game["isLaunchChunk"])) {
        scripts\mp\flags::levelflagclear("block_notifies");
        game["launchChunkWinner"] = 1;
        game["timePassed"] = 0;
        game["roundsPlayed"] = 0;
        game["overtimeRoundsPlayed"] = 0;
        game["matchPoint"] = 0;
        game["finalRound"] = 0;
        game["gamestarted"] = undefined;
        game["previousWinningTeam"] = "";
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
            setteamscore(team, int(0));
        }
        if (game["launchChunkRuleSet"] == 3) {
            if (isdefined(level.droplaunchchunkbots)) {
                level [[ level.droplaunchchunkbots ]]();
            }
            wait 1;
        }
        if (!level.hostforcedend && !level.forcedend) {
            restart();
            return 0;
        }
    }
    level notify("exitLevel_called");
    if (scripts\mp\gametypes\br_public::isBrPracticeMode() && isdefined(level._luidecision) && level._luidecision == 2) {
        scripts\mp\bots\bots::drop_bots(1, level.player.team);
        scripts\mp\gamelogic::restart();
        return;
    }
    exitlevel(0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a6
// Size: 0xa3
function spawnintermission_default(isendgame) {
    level notify("spawning_intermission");
    var_d8cb902ebfc7b2a2 = getintermissionspawnpointoverride();
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (!isdefined(level.modespawnendofgame) || !player [[ level.modespawnendofgame ]]()) {
            player thread scripts\mp\playerlogic::spawnintermission(var_d8cb902ebfc7b2a2);
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14451
// Size: 0xb09
function endgame_endgame(winner, endreasontext, endreasontextloss, nukedetonated) {
    canceljoins();
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    if (scripts\mp\gametypes\br_public::isBrPracticeMode() && !level.forcedend) {
        level._waitforlui = 1;
        level scripts\common\ui::lui_registercallback("exit_squad_eliminated", &endgame_luidecisionreceived);
    }
    if (!istrue(level.processedwinloss) && (istrue(level.forfeitinprogress) || level.forcedend)) {
        updatewinlossstats(winner);
    }
    scripts\cp_mp\challenges::roundend(winner);
    checkforpersonalbests();
    updatespmstats();
    scripts\mp\persistence::writebestscores();
    level notify("stop_leaderboard_stats");
    updateleaderboardstats();
    level scripts\mp\accolades::evaluateallaccolades();
    if (issharedfuncdefined("display_transition", "display_match_end")) {
        outcome = spawnstruct();
        outcome.winner = winner;
        outcome.end_reason = endreasontext;
        outcome.var_84d0ba6d7bfaca5f = endreasontextloss;
        [[ getsharedfunc("display_transition", "display_match_end") ]](outcome);
    }
    if (!istrue(level.var_286c2c7b34d03b04)) {
        [[ level.spawnintermission ]](1);
    }
    if (istrue(nukedetonated) && isdefined(level.nukeinfo.visionset) && !istrue(level.nukeinfo.cancelled)) {
        _visionsetnaked(level.nukeinfo.visionset, 0);
        visionsetfadetoblack("", 0.75);
    } else {
        _visionsetnaked("", 0);
        visionsetfadetoblack("", 0.75);
    }
    displaygameend(winner, endreasontext, endreasontextloss);
    scripts\mp\flags::levelflagclear("block_notifies");
    namespace_bf9ffd2b22c7d819::function_4064a2271de12b97();
    if (level.var_ec2fb549b15ad827) {
        namespace_82872106c3e3314d::match_end(winner);
    }
    level.intermission = 1;
    if (!istrue(level.var_286c2c7b34d03b04)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            scripts\mp\gametypes\br_circle::hidedangercircle();
            setomnvarforallclients("ui_br_transition_type", 0);
            if (function_7c386b2db63d6fb6()) {
                setomnvarforallclients("post_game_state", 14);
            }
            if (!scripts\mp\gametypes\br_public::isBrPracticeMode()) {
                if (getdvarint(@"hash_8772eff48f8bc5f2") == 1) {
                    wait 25;
                } else {
                    wait 25;
                }
            } else {
                if (istrue(level._waitforlui)) {
                    level waittill("madeLUIDecision");
                }
                level.postroundtime = 0;
            }
        }
        if (function_9243d6bcfd2f6b49()) {
            setomnvarforallclients("post_game_state", 5);
        }
        if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            roundendwait(level.postroundtime);
        }
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() || getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || isprophuntgametype() || getsubgametype() == "rumble_mgl") {
        processlobbydata();
    }
    if (level.teambased) {
        if (isgameplayteam(winner)) {
            setmatchdata("victor", winner);
            topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
        } else {
            setmatchdata("victor", "none");
            topplayers = level.placement["all"];
        }
        setmatchdata("alliesScore", getteamscore("allies"));
        setmatchdata("axisScore", getteamscore("axis"));
    } else {
        setmatchdata("victor", "none");
        topplayers = level.placement["all"];
    }
    playerendmatch();
    foreach (player in level.players) {
        player setplayerdata("common", "round", "endReasonTextIndex", endreasontext);
        if (isalive(player) && isdefined(player.pers["telemetry"]) && isdefined(player.pers["telemetry"].life) && isdefined(player.pers["telemetry"].life.life_index)) {
            deathdata = spawnstruct();
            deathdata.victim = player;
            deathdata.attacker = undefined;
            deathdata.meansofdeath = "MOD_GAME_ENDED";
            deathdata.weaponfullstring = "none";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_player_death", deathdata);
        }
        topplayercount = int(min(3, topplayers.size));
        topplayerstatus = 0;
        for (i = 0; i < topplayercount; i++) {
            if (player == topplayers[i]) {
                topplayerstatus = 1;
            }
        }
        if (topplayerstatus) {
            player scripts\cp_mp\pet_watch::addwatchchargewintop3();
        }
        if (level.teambased) {
            if (isgameplayteam(winner)) {
                if (isdefined(player.team)) {
                    if (player.team == winner) {
                        player scripts\cp_mp\pet_watch::addwatchchargewin();
                        player.pers["match_outcome"] = "win";
                    } else {
                        player.pers["match_outcome"] = "loss";
                    }
                }
            } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
                player.pers["match_outcome"] = "tie";
            }
        } else if (isplayer(winner)) {
            if (isdefined(level.lastplayerwins)) {
                if (player == level.placement["all"][0]) {
                    player scripts\cp_mp\pet_watch::addwatchchargewin();
                    player.pers["match_outcome"] = "win";
                } else {
                    player.pers["match_outcome"] = "loss";
                }
            } else if (topplayerstatus) {
                player scripts\cp_mp\pet_watch::addwatchchargewin();
                player.pers["match_outcome"] = "win";
            } else {
                player.pers["match_outcome"] = "loss";
            }
        } else if (!isdefined(winner) || isdefined(winner) && isstring(winner) && winner == "tie") {
            player.pers["match_outcome"] = "tie";
        }
        if (player onlinestatsenabled()) {
            player setplayerdata(level.var_5d69837cf4db0407, "playerStats", "comparisonSeason", getdvarint(@"hash_71ef9b867531fea1"));
            elapsedtime = int(getsecondspassed());
            foreach (scope in ["lifetimeStats", "seasonalStats"]) {
                oldval = 0;
                if (player hasplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent")) {
                    oldval = player getplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent");
                }
                player setplayerdata(level.var_5d69837cf4db0407, "playerStats", scope, function_f6bad1d33ad22078(), "timeSpent", oldval + elapsedtime);
            }
        }
        player utility::trycall(level.matchdata_logplayerdata);
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_server_exit_level");
    utility::trycall(level.matchdata_recordrecentlyplayeddata);
    onmatchend();
    sendendofmatchdata();
    function_a30e6bfa5c581e40();
    function_85f0e7abca18ad51();
    foreach (player in level.players) {
        player.pers["stats"] = player.stats;
    }
    function_52dde37b8fcf63ff();
    if (istrue(game["isLaunchChunk"])) {
        wait 1;
    } else if (!nukedetonated && !level.postgamenotifies) {
        if (!istrue(level.var_286c2c7b34d03b04)) {
            if (!wasonlyround()) {
                wait 6;
            } else {
                wait min(5, 4 + level.postgamenotifies);
            }
        }
    } else {
        wait min(10, 4 + level.postgamenotifies);
    }
    settournamentwinner(winner);
    setomnvarforallclients("post_game_state", 1);
    scripts\mp\flags::levelflagwaitopen("post_game_level_event_active");
    if (istrue(game["isLaunchChunk"])) {
        scripts\mp\flags::levelflagclear("block_notifies");
        game["launchChunkWinner"] = 1;
        game["timePassed"] = 0;
        game["roundsPlayed"] = 0;
        game["overtimeRoundsPlayed"] = 0;
        game["matchPoint"] = 0;
        game["finalRound"] = 0;
        game["gamestarted"] = undefined;
        game["previousWinningTeam"] = "";
        foreach (team in level.teamnamelist) {
            game["roundsWon"][team] = 0;
            game["teamScores"][team] = 0;
            setteamscore(team, int(0));
        }
        if (game["launchChunkRuleSet"] == 3) {
            if (isdefined(level.droplaunchchunkbots)) {
                level [[ level.droplaunchchunkbots ]]();
            }
            wait 1;
        }
        if (!level.hostforcedend && !level.forcedend) {
            restart();
            return 0;
        }
    }
    level notify("exitLevel_called");
    if (scripts\mp\gametypes\br_public::isBrPracticeMode() && isdefined(level._luidecision) && level._luidecision == 2) {
        scripts\mp\bots\bots::drop_bots(1, level.player.team);
        scripts\mp\gamelogic::restart();
        return;
    }
    exitlevel(0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f62
// Size: 0x13
function function_7c386b2db63d6fb6() {
    return !function_52a79582296d478f() || !function_e2dbe7460083c35();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7e
// Size: 0x22
function function_9243d6bcfd2f6b49() {
    return !istrue(level.var_c94add55a8ad5938) && (!function_52a79582296d478f() || !function_e2dbe7460083c35());
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fa9
// Size: 0x8
function function_52a79582296d478f() {
    return namespace_b97271dc63a81cc0::function_94b952789d039abb();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fba
// Size: 0x1b
function function_e2dbe7460083c35() {
    return getdvar(@"hash_12e53040d5281856", "") == "scripted";
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fde
// Size: 0xb0
function sendendofmatchdata() {
    if (!isdefined(level.endofmatchdatasent)) {
        if (getdvarint(@"hash_4ba1427c86b79dc5") != 0) {
            setmatchdata("host", level.hostname);
            if (matchmakinggame()) {
                setmatchdata("playlistVersion", getplaylistversion());
                setmatchdata("playlistID", getplaylistid());
                setmatchdata("playlist_name", getplaylistname());
                setmatchdata("isDedicated", isdedicatedserver());
                setmatchdata("party_maxplayers", getdvarint(@"hash_818c699a5caaee4f", 0));
            }
            function_9d1e19c311cbe199();
            sendmatchdata();
        }
    }
    level.endofmatchdatasent = 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15096
// Size: 0xa4
function settournamentwinner(winner) {
    if (!isdefined(winner)) {
        return;
    }
    if (!level.teambased) {
        dotournamentendgame(winner);
        return;
    } else if (winner != "allies" && winner != "axis") {
        numallies = getteamdata("allies", "players");
        var_95a21b6abca6b0ca = getteamdata("axis", "players");
        if (numallies.size == 0) {
            winner = "axis";
        } else if (var_95a21b6abca6b0ca.size == 0) {
            winner = "allies";
        } else {
            winner = getbetterteam();
        }
    }
    dotournamentendgame(winner);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15142
// Size: 0x21
function waitforhitmarkerspostgame() {
    wait level.postgamehitmarkerwaittime;
    level notify("post_game_ui_start");
    setomnvarforallclients("post_game_state", 1);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1516b
// Size: 0xc9
function eomcombatwaitforhitmarkersanddelaystartpostgameui(winner, endreasontext, endreasontextloss) {
    wait level.postgamehitmarkerwaittime;
    level notify("post_game_ui_start");
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "ob") {
        setomnvarforallclients("post_game_state", 2);
    }
    foreach (player in level.players) {
        if (level.teambased) {
            player thread scripts\mp\hud_message::teamoutcomenotify(winner, 0, endreasontext, endreasontextloss);
            continue;
        }
        player thread scripts\mp\hud_message::outcomenotify(winner, endreasontext, endreasontextloss);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1523c
// Size: 0x170
function getintermissionspawnpointoverride() {
    spawnpoint = undefined;
    switch (level.mapname) {
    case #"hash_a62df42a13dad323": 
        spawnpoint = spawnstruct();
        spawnpoint.origin = (1478, -3039, 981);
        spawnpoint.angles = (388.74, 144.97, 0);
        break;
    case #"hash_81c63d549bea3339": 
        spawnpoint = spawnstruct();
        spawnpoint.origin = (1835, 1347, 749);
        spawnpoint.angles = (361, 224, 0);
        break;
    case #"hash_8eb456b9e1d842c7": 
        spawnpoint = spawnstruct();
        spawnpoint.origin = (-871, -1578, 458);
        spawnpoint.angles = (6, 65, 0);
        break;
    }
    if (getgametype() == "brtdm" || getgametype() == "brtdm_mgl") {
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.brtdm_config.spectatepoint.origin;
        spawnpoint.angles = level.brtdm_config.spectatepoint.angles;
    }
    return spawnpoint;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153b5
// Size: 0x20c
function eomcamerapullout(delay) {
    if (isdefined(delay) && delay > 0) {
        wait delay;
    }
    foreach (player in level.players) {
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        player val::set("eomCameraPullOut", "ads", 0);
        startpos = player geteye() + (0, 0, 1) * 100 + anglestoforward(player.angles) * -100;
        cameraent = spawn("script_model", startpos);
        cameraent setmodel("tag_origin");
        cameraent.angles = player.angles;
        player.spawncameraent = cameraent;
        targetpos = player geteye();
        targetangles = player.angles;
        var_4158f3e6af3fc2e7 = startpos + (0, 0, 5000);
        var_4158f3e6af3fc2e7 += anglestoforward(targetangles) * -100;
        player cameralinkto(player.spawncameraent, "tag_origin", 1, 1);
        player.spawncameraent moveto(var_4158f3e6af3fc2e7, 5, 4, 0.1);
        fwd = vectornormalize(targetpos - cameraent.origin);
        goalangles = vectortoanglessafe(fwd, (0, 0, 1));
        player.spawncameraent.angles = goalangles;
        player thread lookatplayerupdate(targetangles);
        wait 2;
        player visionsetnakedforplayer("respawn_camera", 2);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155c9
// Size: 0x8c
function lookatplayerupdate(var_fe0c08ddc602e96) {
    self endon("disconnect");
    self endon("lookAtPlayerUpdate_stop");
    while (true) {
        targetpos = self geteye();
        fwd = vectornormalize(targetpos - self.spawncameraent.origin);
        goalangles = vectortoanglessafe(fwd, (0, 0, 1));
        self.spawncameraent rotateto(goalangles, 0.75);
        waitframe();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1565d
// Size: 0x8f
function updateroundendreasontext(winner) {
    if (!level.teambased) {
        return 1;
    }
    if (ismoddedroundgame()) {
        if (hitscorelimit()) {
            return game["end_reason"]["score_limit_reached"];
        }
        if (hittimelimit()) {
            return game["end_reason"]["time_limit_reached"];
        }
    } else if (hitroundlimit()) {
        return game["end_reason"]["round_limit_reached"];
    }
    if (hitwinlimit()) {
        return game["end_reason"]["score_limit_reached"];
    }
    return game["end_reason"]["objective_completed"];
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156f5
// Size: 0x8f
function estimatedtimetillscorelimit(team) {
    assert(isplayer(self) || isdefined(team));
    if (!ismoddedroundgame()) {
        scoreperminute = getscoreperminute(team);
        scoreremaining = getscoreremaining(team);
        var_e415364de8d3892d = 999999;
        if (scoreperminute) {
            var_e415364de8d3892d = scoreremaining / scoreperminute;
        }
        return var_e415364de8d3892d;
    }
    scoreperminute = getscoreperminute(team);
    scoreremaining = getscoreperminute(team);
    var_e415364de8d3892d = 999999;
    if (scoreperminute) {
        var_e415364de8d3892d = scoreremaining / scoreperminute;
    }
    return var_e415364de8d3892d;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1578c
// Size: 0xf6
function closetoscorelimit(team) {
    assert(isplayer(self) || isdefined(team));
    checkroundlimit = 10;
    var_616beac13fedff48 = 20;
    scorelimit = level.roundscorelimit;
    switch (getgametype()) {
    case #"hash_3a17de6e294210d2":
    case #"hash_f4a9126c03d3385b": 
        var_616beac13fedff48 = 20;
        break;
    case #"hash_ea061d29bbd1f237": 
        var_616beac13fedff48 = 10;
    case #"hash_ca6516c10db2c95":
    case #"hash_7f9c384a34cc392f": 
        var_616beac13fedff48 = scorelimit * 0.1;
        break;
    default: 
        break;
    }
    teamscore = getteamscore(team);
    var_6d82488e12c4b8b0 = scorelimit - teamscore;
    if (var_6d82488e12c4b8b0 <= ter_op(istrue(game["finalRound"]), var_616beac13fedff48, checkroundlimit)) {
        return true;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1588b
// Size: 0x68
function getscoreperminute(team) {
    assert(isplayer(self) || isdefined(team));
    minutespassed = gettimepassed() / 60000 + 0.0001;
    if (isplayer(self)) {
        scoreperminute = self.score / minutespassed;
    } else {
        scoreperminute = getteamscore(team) / minutespassed;
    }
    return scoreperminute;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158fc
// Size: 0x61
function getscoreremaining(team) {
    assert(isplayer(self) || isdefined(team));
    scorelimit = level.roundscorelimit;
    if (isplayer(self)) {
        scoreremaining = scorelimit - self.score;
    } else {
        scoreremaining = scorelimit - getteamscore(team);
    }
    return scoreremaining;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15966
// Size: 0xa1
function getscoreperminuteroundbased(team) {
    scorelimit = level.roundscorelimit;
    if (!game["switchedsides"]) {
        scorelimit /= 2;
        minutespassed = gettimepassed() / 60000 + 0.0001;
        scoreperminute = getteamscore(team) / minutespassed;
    } else {
        scorelimit = int(scorelimit / 2);
        minutespassed = gettimepassed() / 60000 + 0.0001;
        teamscore = getteamscore(team);
        if (teamscore >= scorelimit) {
            scoreperminute = (teamscore - scorelimit) / minutespassed;
        } else {
            return 0;
        }
    }
    return scoreperminute;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a10
// Size: 0xc2
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    foreach (teamname in level.teamnamelist) {
        if (self.pers["team"] != teamname) {
            thread teamplayercardsplash("callout_lastenemyalive", self, teamname);
        }
    }
    level notify("last_alive", self);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ada
// Size: 0xc1
function processlobbydata() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        processlobbydataforclient(player);
    }
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        if (matchmakinggame() && !privatematch()) {
            setclientmatchdata("isPublicMatch", 1);
        } else {
            setclientmatchdata("isPublicMatch", 0);
        }
    }
    scripts\mp\scoreboard::processlobbyscoreboards();
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        sendclientmatchdata();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ba3
// Size: 0x3f
function assignclientmatchdataid(player) {
    if (isdefined(player) && !isdefined(player.clientmatchdataid)) {
        player.clientmatchdataid = level.currentclientmatchdataid;
        level.currentclientmatchdataid++;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15bea
// Size: 0x1ed
function processlobbydataforclient(player) {
    if (istrue(player.processlobbydataforclient)) {
        return;
    }
    player.processlobbydataforclient = 1;
    assignclientmatchdataid(player);
    playername = player.name;
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        setclientmatchdata("players", player.clientmatchdataid, "clanTag", player getclantag());
        setclientmatchdata("players", player.clientmatchdataid, "xuidHigh", player getxuidhigh());
        setclientmatchdata("players", player.clientmatchdataid, "xuidLow", player getxuidlow());
        setclientmatchdata("players", player.clientmatchdataid, "isBot", isbot(player));
        setclientmatchdata("players", player.clientmatchdataid, "uniqueClientId", player.clientid);
        setclientmatchdata("players", player.clientmatchdataid, "username", playername);
        if (player isps4player()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "ps4");
        } else if (player isxb3player()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "xb3");
        } else if (player ispcplayer()) {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "bnet");
        } else {
            setclientmatchdata("players", player.clientmatchdataid, "platform", "none");
        }
    }
    player setplayerdata("common", "round", "clientMatchIndex", player.clientmatchdataid);
    player scripts\mp\scoreboard::setplayerscoreboardinfo();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ddf
// Size: 0x8a
function trackleaderboarddeathstats(attacker, victim, sweapon, smeansofdeath) {
    if (isdefined(victim.var_f08da114ffd85042) && victim.var_f08da114ffd85042 == victim.lifeid) {
        return;
    }
    victim thread threadedsetweaponstatbyname(sweapon, 1, "deaths", attacker);
    victim thread threadedsetweaponstatbyname(sweapon, distancesquared(attacker.origin, victim.origin), "cumulative_death_distance_sq");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e71
// Size: 0x12e
function trackattackerleaderboarddeathstats(attacker, victim, sweapon, smeansofdeath) {
    if (isdefined(attacker) && isplayer(attacker)) {
        if (isdefined(smeansofdeath) && smeansofdeath.size > 0) {
            if (isdefined(sweapon) && sweapon.size > 0) {
                if (isdefined(victim)) {
                    if (isdefined(attacker)) {
                        if (smeansofdeath != "MOD_FALLING") {
                            if (istrue(attacker.modifiers["ads"])) {
                                attacker thread threadedsetweaponstatbyname(sweapon, 1, "ads_kills", victim);
                            }
                            attacker thread threadedsetweaponstatbyname(sweapon, 1, "kills");
                            attacker thread threadedsetweaponstatbyname(sweapon, distancesquared(attacker.origin, victim.origin), "cumulative_kill_distance_sq");
                        }
                        if (smeansofdeath == "MOD_HEAD_SHOT") {
                            attacker thread threadedsetweaponstatbyname(sweapon, 1, "headShots", victim);
                        }
                    } else {
                        assertex(isdefined(victim), "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use undefined attacker");
                    }
                } else {
                    assertex(isdefined(victim), "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use undefined victim");
                }
            } else {
                assertex(smeansofdeath.size > 0, "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use an undefined or empty sWeapon string");
            }
            return;
        }
        assertex(smeansofdeath.size > 0, "Gamelogic - trackAttackerLeaderboardDeathState - attempting to use an undefined or empty sMeansOfDeath string");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fa7
// Size: 0x85e
function setweaponstat(weapon, incvalue, statname, otherent) {
    if (!incvalue) {
        return;
    }
    if (getdvarint(@"hash_1b5abaf35dfdb4e4", 1) == 1 && istrue(game["inLiveLobby"])) {
        return;
    }
    objweapon = undefined;
    if (isweapon(weapon)) {
        objweapon = weapon;
    } else {
        objweapon = makeweaponfromstring(weapon);
    }
    objweapon = function_1e3102980c3a4cc1(objweapon);
    if (!isdefined(objweapon)) {
        return;
    }
    weaponname = objweapon.basename;
    weapongroup = getweapongroup(objweapon);
    variantid = getweaponvariantindex(objweapon);
    equipmenttype = getequipmenttype(weapon);
    if (isdefined(equipmenttype) && equipmenttype == "lethal") {
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = statname;
        var_7e2c53b0bcf117d9.incvalue = incvalue;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        return;
    }
    if (weapongroup == "super") {
        shouldtracksuperweaponstats = scripts\mp\supers::shouldtracksuperweaponstats(objweapon);
        if (isdefined(shouldtracksuperweaponstats) && !shouldtracksuperweaponstats) {
            return;
        }
    }
    if (weapongroup == "killstreak" || weapongroup == "other" && weaponname != "trophy_mp" || weapongroup == "other" && weaponname != "player_trophy_system_mp" || weapongroup == "other" && weaponname != "super_trophy_mp") {
        return;
    }
    if (isenvironmentweapon(objweapon)) {
        return;
    }
    if (weapongroup == "weapon_grenade" || weapongroup == "weapon_explosive" || weaponname == "trophy_mp" || weaponname == "forcepush_mp") {
        weaponname = strip_suffix(weaponname, "_mp");
        scripts\mp\persistence::incrementweaponstat(weaponname, statname, incvalue);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = weaponname;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = statname;
        var_7e2c53b0bcf117d9.incvalue = incvalue;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        return;
    }
    if (!isdefined(self.trackingweapon)) {
        self.trackingweapon = objweapon;
    }
    if (objweapon != self.trackingweapon) {
        scripts\mp\persistence::updateweaponbufferedstats();
        self.trackingweapon = objweapon;
    }
    switch (statname) {
    case #"hash_1f658b3efcf092d2": 
        if (!isdefined(self.trackingweaponshots)) {
            self.trackingweaponshots = 0;
        }
        self.trackingweaponshots += incvalue;
        break;
    case #"hash_7b99e54a94aa5fb": 
        if (!isdefined(self.trackingweaponhits)) {
            self.trackingweaponhits = 0;
        }
        self.trackingweaponhits += incvalue;
        break;
    case #"hash_dae69d0191cb02b2": 
        if (!isdefined(self.var_a00eddcf879bdbc3)) {
            self.var_a00eddcf879bdbc3 = 0;
        }
        self.var_a00eddcf879bdbc3 += incvalue;
        break;
    case #"hash_f75b5b7a407db7e3": 
        if (!isdefined(self.var_ca6e0d389c0ca0a7)) {
            self.var_ca6e0d389c0ca0a7 = 0;
        }
        self.var_ca6e0d389c0ca0a7 += incvalue;
        break;
    case #"hash_297da132d2f8bf70": 
        if (!isdefined(self.trackingweaponheadshots)) {
            self.trackingweaponheadshots = 0;
        }
        self.trackingweaponheadshots += incvalue;
        if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_5fac5778fe3fdc1c)) {
                self.var_5fac5778fe3fdc1c = 0;
            }
            self.var_5fac5778fe3fdc1c += incvalue;
        }
        break;
    case #"hash_abcbd371534e7e1b": 
        if (!isdefined(self.var_9a2fd6f8771f2e58)) {
            self.var_9a2fd6f8771f2e58 = 0;
        }
        self.var_9a2fd6f8771f2e58 += incvalue;
        break;
    case #"hash_14c0eea23e1cfd58": 
        if (!isdefined(self.var_5fac5778fe3fdc1c)) {
            self.var_5fac5778fe3fdc1c = 0;
        }
        self.var_5fac5778fe3fdc1c += incvalue;
        break;
    case #"hash_f459561578093b3e": 
        if (!isdefined(self.trackingweaponkills)) {
            self.trackingweaponkills = 0;
        }
        self.trackingweaponkills += incvalue;
        break;
    case #"hash_406d7407b0a31c77": 
        if (!isdefined(self.var_e16d751a51153a7b)) {
            self.var_e16d751a51153a7b = 0;
        }
        self.var_e16d751a51153a7b += incvalue;
        if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_1fe884779e5f4dbe)) {
                self.var_1fe884779e5f4dbe = 0;
            }
            self.var_1fe884779e5f4dbe += incvalue;
        }
        break;
    case #"hash_9c5319f6e55cbcfc": 
        if (!isdefined(self.var_2bf7b072e416002a)) {
            self.var_2bf7b072e416002a = 0;
        }
        self.var_2bf7b072e416002a += incvalue;
        break;
    case #"hash_72d0fd0488636e3f": 
        if (!isdefined(self.var_1fe884779e5f4dbe)) {
            self.var_1fe884779e5f4dbe = 0;
        }
        self.var_1fe884779e5f4dbe += incvalue;
        break;
    case #"hash_88d1683fbcbbc7fa": 
        if (function_2b8d709c5b78bbef(otherent)) {
            if (!isdefined(self.var_f00517aa8f668932)) {
                self.var_f00517aa8f668932 = 0;
            }
            self.var_f00517aa8f668932 += incvalue;
        } else if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_14cec2ba65099256)) {
                self.var_14cec2ba65099256 = 0;
            }
            self.var_14cec2ba65099256 += incvalue;
        }
        break;
    case #"hash_1cc8a923a608c2a0": 
        if (!isdefined(self.var_883957b1c1ef6745)) {
            self.var_883957b1c1ef6745 = 0;
        }
        self.var_883957b1c1ef6745 += incvalue;
        if (function_2b8d709c5b78bbef(otherent)) {
            if (!isdefined(self.var_7b522bf6f7aeca98)) {
                self.var_7b522bf6f7aeca98 = 0;
            }
            self.var_7b522bf6f7aeca98 += incvalue;
        } else if (function_2e31277709b9f493(otherent)) {
            if (!isdefined(self.var_bf617879def40524)) {
                self.var_bf617879def40524 = 0;
            }
            self.var_bf617879def40524 += incvalue;
        }
        break;
    }
    if (statname == "deaths") {
        /#
            if (getdvarint(@"hash_f42eefd3e1b79376")) {
                println("<dev string:xa96>");
            }
        #/
        var_efd23879ffb610bd = undefined;
        var_49e6ef3edadd524e = getweaponrootname(objweapon);
        if (!iscacprimaryweapon(var_49e6ef3edadd524e) && !iscacsecondaryweapon(var_49e6ef3edadd524e)) {
            return;
        }
        attachments = getweaponattachments(objweapon);
        scripts\mp\persistence::incrementweaponstat(var_49e6ef3edadd524e, statname, incvalue);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.weaponname = var_49e6ef3edadd524e;
        var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
        var_7e2c53b0bcf117d9.statname = "deaths";
        var_7e2c53b0bcf117d9.incvalue = incvalue;
        var_7e2c53b0bcf117d9.variantid = variantid;
        var_7e2c53b0bcf117d9.weaponobj = objweapon;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        foreach (attachment in attachments) {
            scripts\mp\persistence::incrementattachmentstat(attachment, statname, incvalue, objweapon);
            utility::trycall(level.matchdata_logattachmentstat, attachment, statname, incvalue, objweapon);
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1680d
// Size: 0xc9
function setinflictorstat(einflictor, eattacker, sweapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    if (!isdefined(einflictor)) {
        eattacker setweaponstat(sweapon, 1, "hits");
        return;
    }
    if (!isdefined(einflictor.playeraffectedarray)) {
        einflictor.playeraffectedarray = [];
    }
    foundnewplayer = 1;
    for (i = 0; i < einflictor.playeraffectedarray.size; i++) {
        if (einflictor.playeraffectedarray[i] == self) {
            foundnewplayer = 0;
            break;
        }
    }
    if (foundnewplayer) {
        einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
        eattacker setweaponstat(sweapon, 1, "hits");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168de
// Size: 0x36
function threadedsetweaponstatbyname(name, incvalue, statname, otherent) {
    self endon("disconnect");
    waittillframeend();
    setweaponstat(name, incvalue, statname, otherent);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1691c
// Size: 0x2e
function function_a3f0b7aba215ef11(otherent) {
    if (!isdefined(otherent)) {
        return 0;
    }
    if (isagent(otherent)) {
        return 2;
    } else if (isplayer(otherent)) {
        return 1;
    }
    return 0;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16953
// Size: 0x27
function function_2b8d709c5b78bbef(ent) {
    type = function_a3f0b7aba215ef11(ent);
    return isdefined(type) && type == 2;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16983
// Size: 0x27
function function_2e31277709b9f493(ent) {
    type = function_a3f0b7aba215ef11(ent);
    return isdefined(type) && type == 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169b3
// Size: 0x28f
function updatespmstats() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player onlinestatsenabled()) {
            spm = getmatchspm(player);
            actualscore = ter_op(level.teambased, player.score, player scripts\mp\utility\stats::getpersstat("gamemodeScore"));
            globalSPM = player getplayerdata(level.var_5d69837cf4db0407, "globalSPM");
            gamesplayed = player getplayerstat("matchStats", "gamesPlayed");
            globalSPM *= gamesplayed - 1;
            var_cff58b2c41422f10 = spm;
            if (gamesplayed > 0) {
                var_cff58b2c41422f10 = (globalSPM + spm) / gamesplayed;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "globalSPM", int(var_cff58b2c41422f10));
            gametypeindex = getgametypeindex(getgametype());
            maxgamemodescorehistory = 5;
            maxgamemodes = 32;
            if (gametypeindex >= 0 && gametypeindex < maxgamemodes) {
                for (i = 0; i < 4; i++) {
                    prev = player getplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", i + 1);
                    player setplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", i, prev);
                }
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeHistory", 4, getbasegametype());
                scoreindex = player getplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", gametypeindex, "index");
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", gametypeindex, "scores", scoreindex, int(spm));
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", gametypeindex, "actualScores", scoreindex, int(actualscore));
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", gametypeindex, "gameMode", getbasegametype());
                scoreindex = (scoreindex + 1) % maxgamemodescorehistory;
                player setplayerdata(level.var_5d69837cf4db0407, "gameModeScoreHistory", gametypeindex, "index", scoreindex);
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c4a
// Size: 0x2a1
function checkforpersonalbests() {
    var_46cb15851fd25568 = undefined;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player onlinestatsenabled()) {
            roundkills = player getplayerdata("common", "round", "kills");
            rounddeaths = player getplayerdata("common", "round", "deaths");
            roundxp = player scripts\mp\utility\stats::getpersstat("summary")["xp"];
            bestkills = player getplayerstat("bestStats", "killsInAMatch");
            mostDeaths = player getplayerstat("bestStats", "deathsInAMatch");
            mostxp = player getplayerstat("bestStats", "xpInAMatch");
            bestSPM = player getplayerdata(level.var_5d69837cf4db0407, "bestSPM", "score");
            bestKD = player getplayerdata(level.var_5d69837cf4db0407, "bestKD", "score");
            if (roundkills > bestkills) {
                player setplayerstat(roundkills, "bestStats", "killsInAMatch");
            }
            if (roundxp > mostxp) {
                player setplayerstat(roundxp, "bestStats", "xpInAMatch");
            }
            if (rounddeaths > mostDeaths) {
                player setplayerstat(rounddeaths, "bestStats", "deathsInAMatch");
            }
            kd = roundkills;
            if (rounddeaths > 1) {
                kd /= rounddeaths;
            }
            kd = int(kd * 1000);
            if (kd > bestKD) {
                player setplayerdata(level.var_5d69837cf4db0407, "bestKD", "score", kd);
                player setplayerdata(level.var_5d69837cf4db0407, "bestKD", "time", getsystemtime());
            }
            spm = getmatchspm(player);
            if (spm > bestSPM) {
                player setplayerdata(level.var_5d69837cf4db0407, "bestSPM", "score", int(spm));
                player setplayerdata(level.var_5d69837cf4db0407, "bestSPM", "time", getsystemtime());
            }
            if (!isdefined(var_46cb15851fd25568)) {
                var_46cb15851fd25568 = function_9f76a26987e2aa4e();
            }
            player checkforbestweapon(var_46cb15851fd25568);
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef3
// Size: 0x15
function allowleaderboardstatsupdates() {
    return level.onlinestatsenabled && isleaderboardsupportedmode();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f11
// Size: 0x9d
function updateleaderboardstatscontinuous() {
    level endon("game_ended");
    level endon("stop_leaderboard_stats");
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    for (playerindex = 0; true; playerindex++) {
        while (!isdefined(level.players) || level.players.size == 0) {
            waitframe();
        }
        if (playerindex >= level.players.size) {
            playerindex = 0;
        }
        player = level.players[playerindex];
        if (!isdefined(player) || isai(player)) {
            waitframe();
            continue;
        }
        player updateplayerleaderboardstatsinternal();
        wait 0.1;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fb6
// Size: 0x74
function updateleaderboardstats() {
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    foreach (player in level.players) {
        if (!isdefined(player) || isai(player)) {
            continue;
        }
        player updateplayerleaderboardstatsinternal();
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17032
// Size: 0x24
function updateplayerleaderboardstats() {
    if (!allowleaderboardstatsupdates()) {
        return;
    }
    if (!isdefined(self) || isai(self)) {
        return;
    }
    updateplayerleaderboardstatsinternal();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1705e
// Size: 0x1e2
function isleaderboardsupportedmode() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return true;
    }
    if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        modestring = "hc_";
    } else {
        modestring = "";
    }
    modestring += getgametype();
    switch (modestring) {
    case #"hash_ca6516c10db2c95":
    case #"hash_1a5d186c17c00d3c":
    case #"hash_1aac086c17fe5ccb":
    case #"hash_1b1eecd3863a50cf":
    case #"hash_2946b34dbd2b86c6":
    case #"hash_53825b446469ac4c":
    case #"hash_5ff8e011d5b9d1c8":
    case #"hash_61ac7a98039e2d86":
    case #"hash_6efb0f59a62300fb":
    case #"hash_7485fa6c474ec865":
    case #"hash_7f9c384a34cc392f":
    case #"hash_8c758b84936e8d42":
    case #"hash_9424bbb71eb7d064":
    case #"hash_a93dacd349d98a99":
    case #"hash_aac44b0b52bacb8e":
    case #"hash_aada280b52cbdd96":
    case #"hash_ab00240b52e9ec5e":
    case #"hash_b9458959b10637f8":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ea061d29bbd1f237":
    case #"hash_eb5e5f470e0c1dc2":
    case #"hash_ec24570718a340f5":
    case #"hash_ec72fd25bbbac99e":
    case #"hash_f4a9126c03d3385b":
    case #"hash_f55ec3d372444a79":
    case #"hash_fa0ed2f6bd4f4395":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fa2ae2f6bd652314":
    case #"hash_fa34c5f6bd6d4432":
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
    case #"hash_fa7b69e7b63430d3":
    case #"hash_fb5b5e6c07253005": 
        return true;
    default: 
        return false;
    }
    return false;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17249
// Size: 0x50
function function_8f54deec605690d1(type) {
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        return true;
    }
    return isdefined(type) && (type == "dmz" || type == "exgm" || type == "plunder" || type == "risk" || type == "kingslayer");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172a2
// Size: 0x8e5
function updateplayerleaderboardstatsinternal() {
    modestring = undefined;
    if (scripts\cp_mp\utility\game_utility::function_21322da268e71c19()) {
        modestring = "hc_";
    } else {
        modestring = "";
    }
    modestring += getgametype();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        brsubgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
        switch (brsubgametype) {
        case #"hash_a3f25a001a121f":
        case #"hash_59b8e9d05b31ff9":
        case #"hash_16dd223e5a8b22c8":
        case #"hash_343d3f3f77c83350":
        case #"hash_5e0a8ff36bce5106":
        case #"hash_8299694594ab149d":
        case #"hash_bfabc434c59611fa":
        case #"":
        case #"hash_cfb0c3041d1bdc10":
        case #"hash_dddecc2751311914":
        case #"hash_f4afff6c03d92aa0":
        case #"hash_fa21c4f6bd5e3815": 
            break;
        case #"hash_3c1c1566d7b3b870": 
            break;
        default: 
            return;
        }
    }
    modescore = ter_op(level.teambased, self.score, self.leaderboarddata["gamemodeScore"]);
    incrementleaderboardstat("score", modestring, modescore);
    timeplayed = scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0);
    incrementleaderboardstat("timePlayed", modestring, timeplayed);
    incrementleaderboardstat("kills", modestring, self.leaderboarddata["kills"]);
    incrementleaderboardstat("deaths", modestring, self.leaderboarddata["deaths"]);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        incrementleaderboardstat("downs", modestring, self.leaderboarddata["downs"]);
        incrementleaderboardstat("contracts", modestring, self.leaderboarddata["contracts"]);
        incrementleaderboardstat("wins", modestring, self.leaderboarddata["wins"]);
        incrementleaderboardstat("topFive", modestring, self.leaderboarddata["topFive"]);
        incrementleaderboardstat("topTen", modestring, self.leaderboarddata["topTen"]);
        incrementleaderboardstat("topTwentyFive", modestring, self.leaderboarddata["topTwentyFive"]);
        incrementleaderboardstat("gamesPlayed", modestring, self.leaderboarddata["gamesPlayed"]);
        incrementleaderboardstat("revives", modestring, self.leaderboarddata["rescues"]);
        incrementleaderboardstat("cash", modestring, self.leaderboarddata["cash"]);
        incrementleaderboardstat("eliteStarted", modestring, self.leaderboarddata["eliteStarted"]);
        incrementleaderboardstat("eliteCompleted", modestring, self.leaderboarddata["eliteCompleted"]);
        incrementleaderboardstat("eliteBlocked", modestring, self.leaderboarddata["eliteBlocked"]);
        incrementleaderboardstat("secondaryVictories", modestring, self.leaderboarddata["secondaryVictories"]);
        incrementleaderboardstat("weaponCaseExfils", modestring, self.leaderboarddata["weaponCaseExfils"]);
        incrementleaderboardstat("weaponCaseWins", modestring, self.leaderboarddata["weaponCaseWins"]);
        return;
    }
    switch (getgametype()) {
    case #"hash_7485fa6c474ec865": 
        incrementleaderboardstat("assists", modestring, self.leaderboarddata["assists"]);
        break;
    case #"hash_5ff8e011d5b9d1c8": 
        incrementleaderboardstat("damage", modestring, self.leaderboarddata["damage"]);
        incrementleaderboardstat("assists", modestring, self.leaderboarddata["assists"]);
        break;
    case #"hash_973d1db8b6644466": 
        incrementleaderboardstat("assists", modestring, self.leaderboarddata["assists"]);
        incrementleaderboardstat("hvtKills", modestring, self.leaderboarddata["hvtKills"]);
    case #"hash_ca6516c10db2c95":
    case #"hash_7f9c384a34cc392f": 
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_eb5e5f470e0c1dc2": 
        incrementleaderboardstat("revives", modestring, self.leaderboarddata["rescues"]);
        incrementleaderboardstat("plants", modestring, self.leaderboarddata["plants"]);
        break;
    case #"hash_fa0ed9f6bd4f4e9a": 
        updateleaderboardstatmaximum("streak", modestring, self.leaderboarddata["killChains"]);
        break;
    case #"hash_f4a9126c03d3385b": 
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_fa50b0f6bd82e972": 
        incrementleaderboardstat("plants", modestring, self.leaderboarddata["plants"]);
        incrementleaderboardstat("defuses", modestring, self.leaderboarddata["defuses"]);
        break;
    case #"hash_ea061d29bbd1f237": 
        incrementleaderboardstat("confirms", modestring, self.leaderboarddata["confirmed"]);
        incrementleaderboardstat("denies", modestring, self.leaderboarddata["denied"]);
        break;
    case #"hash_fa34c5f6bd6d4432": 
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_ec72fd25bbbac99e": 
        incrementleaderboardstat("objTime", modestring, self.leaderboarddata["objTime"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_1a5d186c17c00d3c": 
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("returns", modestring, self.leaderboarddata["returns"]);
        break;
    case #"hash_fa50baf6bd82f930": 
        incrementleaderboardstat("plants", modestring, self.leaderboarddata["plants"]);
        incrementleaderboardstat("rescues", modestring, self.leaderboarddata["rescues"]);
        break;
    case #"hash_53825b446469ac4c": 
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("revives", modestring, self.leaderboarddata["rescues"]);
        break;
    case #"hash_ec24570718a340f5": 
        incrementleaderboardstat("banks", modestring, self.leaderboarddata["confirmed"]);
        incrementleaderboardstat("denies", modestring, self.leaderboarddata["denied"]);
        break;
    case #"hash_b9458959b10637f8": 
        incrementleaderboardstat("time", modestring, getpersstat("extrascore0"));
        incrementleaderboardstat("infected", modestring, self.leaderboarddata["killsAsInfected"]);
        break;
    case #"hash_fb5b5e6c07253005": 
        incrementleaderboardstat("stabs", modestring, self.leaderboarddata["stabs"]);
        incrementleaderboardstat("setBacks", modestring, self.leaderboarddata["setbacks"]);
        break;
    case #"hash_dd5b900f435d3f36": 
        incrementleaderboardstat("objTime", modestring, self.leaderboarddata["objTime"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_1aac086c17fe5ccb": 
        incrementleaderboardstat("assists", modestring, self.leaderboarddata["assists"]);
        incrementleaderboardstat("captures", modestring, self.leaderboarddata["captures"]);
        incrementleaderboardstat("defends", modestring, self.leaderboarddata["defends"]);
        break;
    case #"hash_8c758b84936e8d42": 
        incrementleaderboardstat("banks", modestring, self.leaderboarddata["confirmed"]);
        incrementleaderboardstat("denies", modestring, self.leaderboarddata["denied"]);
        break;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b8f
// Size: 0xb2
function incrementleaderboardstat(stat, modestring, matchvalue) {
    if (!isdefined(self.leaderboardstartvalues)) {
        self.leaderboardstartvalues = [];
    }
    if (!isdefined(self.leaderboardstartvalues[stat])) {
        self.leaderboardstartvalues[stat] = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", modestring, stat);
    }
    var_d1044cf8ef47f871 = int(max(self.leaderboardstartvalues[stat] + matchvalue, self.leaderboardstartvalues[stat]));
    self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", modestring, stat, var_d1044cf8ef47f871);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c49
// Size: 0x64
function updateleaderboardstatmaximum(stat, modestring, var_a775792b5f1aa47c) {
    var_afdfad231e44e710 = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", modestring, stat);
    if (var_a775792b5f1aa47c > var_afdfad231e44e710) {
        self setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", modestring, stat, var_a775792b5f1aa47c);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cb5
// Size: 0x7a
function getmatchspm(player) {
    spm = ter_op(level.teambased, player.score, player scripts\mp\utility\stats::getpersstat("gamemodeScore"));
    seconds = player scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0);
    if (isdefined(seconds) && seconds > 0) {
        minutes = seconds / 60;
        spm /= minutes;
    }
    return spm;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d38
// Size: 0x4b
function isvalidbestweapon(rootname) {
    group = getweapongroup(rootname);
    return isdefined(rootname) && rootname != "" && !iskillstreakweapon(rootname) && group != "killstreak" && group != "other";
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d8c
// Size: 0x9e
function function_9f76a26987e2aa4e() {
    rootweaponlist = utility::trycall(level.matchdata_buildweaponrootlist);
    assert(isdefined(rootweaponlist));
    result = [];
    for (i = 0; i < rootweaponlist.size; i++) {
        weaponname = rootweaponlist[i];
        weaponname = getweaponrootname(weaponname);
        if (isvalidbestweapon(weaponname)) {
            if (!isenumvaluevalid(level.var_5d69837cf4db0407, "WeaponStats", weaponname)) {
                assertmsg("Weapon not added to WeaponStats enum in playerdata: " + weaponname);
                continue;
            }
            result[result.size] = weaponname;
        }
    }
    return result;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e33
// Size: 0x1e1
function checkforbestweapon(var_46cb15851fd25568) {
    bestweaponname = "";
    bestweaponkills = -1;
    for (i = 0; i < var_46cb15851fd25568.size; i++) {
        weaponname = var_46cb15851fd25568[i];
        weaponkills = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", weaponname, "kills");
        if (weaponkills > bestweaponkills) {
            bestweaponname = weaponname;
            bestweaponkills = weaponkills;
        }
    }
    weaponshots = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", bestweaponname, "shots");
    weaponheadshots = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", bestweaponname, "headShots");
    weaponhits = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", bestweaponname, "hits");
    weapondeaths = self getplayerdata(level.var_5d69837cf4db0407, "playerStats", "weaponStats", bestweaponname, "deaths");
    weaponxp = 0;
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "kills", bestweaponkills);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "shots", weaponshots);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "headShots", weaponheadshots);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "hits", weaponhits);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeapon", "deaths", weapondeaths);
    self setplayerdata(level.var_5d69837cf4db0407, "bestWeaponXP", weaponxp);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1801c
// Size: 0x6f
function allow_weapon_mp(bool) {
    self notify("allow_weapon_mp()");
    if (bool) {
        if (isdefined(self.allowweaponcache) && !self hasweapon(self.allowweaponcache) && !scripts\mp\utility\killstreak::isjuggernaut()) {
            scripts\mp\utility\inventory::switchtolastweapon();
        }
        self.allowweaponcache = undefined;
        return;
    }
    self.allowweaponcache = self.lastnormalweaponobj;
    thread watchinvalidweaponswitchduringdisableweapon();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18093
// Size: 0x10
function allow_weapon_mp_init() {
    level.allow_weapon_mp = &allow_weapon_mp;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180ab
// Size: 0x3c
function watchinvalidweaponswitchduringdisableweapon() {
    self endon("death");
    self endon("disconnect");
    self endon("allow_weapon_mp()");
    while (true) {
        invalidweapon = self waittill("weapon_switch_invalid");
        self.allowweaponcache = invalidweapon;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180ef
// Size: 0xd
function ismp_init() {
    level.ismp = 1;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18104
// Size: 0x20d
function watchforlowpopmatchstart(var_eb2b338ec4671678) {
    if (!istrue(level.lowpopcheck)) {
        return;
    }
    if (!isdefined(var_eb2b338ec4671678)) {
        var_eb2b338ec4671678 = 0;
    }
    level endon("start_prematch");
    var_80593585eb825ba2 = getdvarint(@"hash_5e1370f70979f8b", 1);
    var_b81adef81193b335 = -1;
    starttime = gettime();
    while (true) {
        var_490292acb7f40a1e = getdvarint(@"hash_40d1fe46f9d6f48e", 50);
        var_5f5b788d766145c0 = getdvarfloat(@"hash_6ef3783f07957a9b", 300) * 1000;
        playercount = ter_op(var_eb2b338ec4671678, getactiveclientcount(var_80593585eb825ba2), level.players.size);
        if (var_b81adef81193b335 >= 0) {
            var_a28594c1b7cc010c = var_b81adef81193b335 + var_5f5b788d766145c0;
            if (playercount >= var_490292acb7f40a1e && gettime() >= var_a28594c1b7cc010c && !istrue(level.devoverridematchstart)) {
                break;
            }
        } else if (playercount >= var_490292acb7f40a1e) {
            var_b81adef81193b335 = gettime();
        }
        waitframe();
    }
    var_5ddc7308babf9834 = getdvarint(@"hash_40aef046f9b08e0c", 100);
    playercount = ter_op(var_eb2b338ec4671678, getactiveclientcount(var_80593585eb825ba2), level.players.size);
    if (playercount <= var_5ddc7308babf9834) {
        level.lowpopstart = 1;
        waittime = gettime() - starttime;
        var_2aacacc9b90e191d = getdvarfloat(@"hash_6ef3783f07957a9b", 300);
        dlog_recordevent("dlog_event_low_pop_start", ["start_players", playercount, "wait_time_ms", waittime, "active_client_count", var_eb2b338ec4671678, "lowpop_min", var_490292acb7f40a1e, "lowpop_max", var_5ddc7308babf9834, "lowpop_time", var_2aacacc9b90e191d]);
        if (isdefined(level.onlowpopstart)) {
            [[ level.onlowpopstart ]]();
        }
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18319
// Size: 0x56
function function_8396da2a86270f7d(maxplayers) {
    minplayers = getdvarint(@"hash_cb2d56d085e5a9b9");
    if (minplayers > maxplayers) {
        println("<dev string:xaa3>" + minplayers + "<dev string:xad2>" + maxplayers);
        setdvar(@"hash_cb2d56d085e5a9b9", maxplayers);
        minplayers = maxplayers;
    }
    return minplayers;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18378
// Size: 0x1b8
function watchforminplayersmatchstart() {
    level endon("start_prematch");
    var_80593585eb825ba2 = getdvarint(@"hash_5e1370f70979f8b", 1);
    lobbystarttime = gettime();
    lobbycurrtime = lobbystarttime;
    maxplayers = getdvarint(@"hash_818c699a5caaee4f");
    minplayers = function_8396da2a86270f7d(maxplayers);
    var_7cc9d575418d740e = getdvarint(@"hash_961774a7c9cf5b66", 0);
    if (var_7cc9d575418d740e > maxplayers) {
        println("<dev string:xad7>" + var_7cc9d575418d740e + "<dev string:xb10>" + maxplayers + "<dev string:x62e>");
        var_7cc9d575418d740e = maxplayers;
    }
    if (minplayers != 0) {
        while (true) {
            if (istrue(level.devoverridematchstart)) {
                break;
            }
            if (getdvarint(@"hash_51aa9c88bb0c1224", 1) == 1 && level.var_77907d733abe8b63) {
                level waittill("leagueplay_br_backfill_closed");
                break;
            }
            var_ac0f8be89fa21057 = (lobbycurrtime - lobbystarttime) / 1000;
            var_a37e3649cfb19f73 = getdvarint(@"hash_f79cd84983250eda", 300);
            if (var_a37e3649cfb19f73 > 0 && var_ac0f8be89fa21057 >= var_a37e3649cfb19f73) {
                if (var_7cc9d575418d740e == 0 || var_7cc9d575418d740e <= getactiveclientcount(var_80593585eb825ba2)) {
                    break;
                }
            }
            if (var_ac0f8be89fa21057 <= getdvarint(@"hash_738a4f27bfac1d24", 15)) {
                if (getactiveclientcount(0) >= function_8396da2a86270f7d(maxplayers)) {
                    break;
                }
            } else if (getactiveclientcount(var_80593585eb825ba2) >= function_8396da2a86270f7d(maxplayers)) {
                break;
            }
            if (isdefined(level.var_cb87db3f189cf3f1)) {
                [[ level.var_cb87db3f189cf3f1 ]](var_a37e3649cfb19f73, var_ac0f8be89fa21057);
            }
            waitframe();
            lobbycurrtime = gettime();
        }
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18538
// Size: 0x40
function brwatchforminplayersmatchstart() {
    level endon("start_prematch");
    while (level.players.size < getdvarint(@"hash_faf1db5754891b2d") || istrue(level.devoverridematchstart)) {
        waitframe();
    }
    waitframe();
    level notify("start_prematch");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18580
// Size: 0x18b
function watchdevoverridematchstart() {
    level.startbuttons = [];
    starttriggers = getentarray("start_lobby_trigger", "targetname");
    level thread waitforoverridematchstartdvar();
    level thread waitforoverridematchstartnotify();
    if (starttriggers.size == 0) {
        level thread waitforinitialplayerloadspawnflag();
        return;
    }
    foreach (trigger in starttriggers) {
        if (isdefined(trigger.target)) {
            visuals[0] = getent(trigger.target, "targetname");
        } else {
            visuals[0] = spawn("script_model", trigger.origin);
            visuals[0].angles = trigger.angles;
        }
        startbutton = scripts\mp\gameobjects::createuseobject("neutral", trigger, visuals, (0, 0, 64), undefined, 1);
        startbutton scripts\mp\gameobjects::allowuse("any");
        startbutton.id = "use";
        startbutton.trigger setuseprioritymax();
        startbutton scripts\mp\gameobjects::setusetime(3);
        startbutton scripts\mp\gameobjects::setusehinttext(%MP_INGAME_ONLY/HOLD_TO_START_GAME);
        startbutton.onuse = &startbutton_onuse;
        level.startbuttons[level.startbuttons.size] = startbutton;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18713
// Size: 0x365
function waitforinitialplayerloadspawnflag() {
    level endon("game_ended");
    level endon("start_prematch");
    player = level waittill("connected");
    player waittill("giveLoadout");
    waitframe();
    visuals[0] = spawn("script_model", player.origin);
    trigger = visuals[0];
    visuals[0] setmodel("tag_origin");
    useteam = "any";
    usetime = 3;
    org = (31983, -35229, -458);
    trigger.team = "neutral";
    level.startbuttons[0] = scripts\mp\gameobjects::createholduseobject(useteam, trigger, visuals, (0, 0, 0));
    level.startbuttons[0].curorigin = org;
    level.startbuttons[0].trigger.origin = org;
    level.startbuttons[0].visuals[0].origin = org;
    level.startbuttons[0].trigger makeusable();
    level.startbuttons[0].ownerteam = trigger.team;
    level.startbuttons[0].trigger.owner = level.players[0];
    level.startbuttons[0].interactteam = "any";
    level.startbuttons[0].curprogress = 0;
    level.startbuttons[0].userate = 1;
    level.startbuttons[0].id = "use";
    level.startbuttons[0].exclusiveuse = 0;
    level.startbuttons[0].exclusiveclaim = 1;
    level.startbuttons[0].skiptouching = 1;
    level.startbuttons[0].skipminimapids = 1;
    level.startbuttons[0].trigger setcursorhint("HINT_NOICON");
    level.startbuttons[0].trigger setusehideprogressbar(1);
    level.startbuttons[0].trigger sethintstring(%MP_INGAME_ONLY/HOLD_TO_START_GAME);
    level.startbuttons[0].trigger setuseprioritymax();
    level.startbuttons[0].onuse = &startbutton_onuse;
    level.startbuttons[0].flagmodel = spawn("script_model", org);
    level.startbuttons[0].flagmodel setmodel("prop_flag_neutral");
    level.startbuttons[0].usabilitytrigger = spawn("trigger_radius", org, 0, 32, 128);
    level.startbuttons[0] scripts\mp\gameobjects::setusetime(usetime);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a80
// Size: 0x4d
function waitforoverridematchstartdvar() {
    level endon("game_ended");
    level endon("dev_force_start_completed");
    /#
        setdevdvarifuninitialized(@"hash_a2aaa37f176aa49", 0);
    #/
    while (true) {
        if (getdvarint(@"hash_a2aaa37f176aa49", 0)) {
            dev_forcelivelobbystart();
            break;
        }
        wait 0.5;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad5
// Size: 0x1f
function waitforoverridematchstartnotify() {
    level endon("game_ended");
    level endon("dev_force_start_completed");
    level waittill("forcematchstart");
    dev_forcelivelobbystart();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18afc
// Size: 0x1f
function startbutton_onuse(player) {
    player setclientomnvar("ui_securing", 0);
    dev_forcelivelobbystart();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b23
// Size: 0x12d
function dev_forcelivelobbystart() {
    level thread scripts\mp\utility\sound::playsoundonplayers("mp_dom_flag_captured");
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\print::teamhudtutorialmessage("MP_INGAME_ONLY/GAME_FORCE_STARTED", team, 10);
    }
    setdvar(@"hash_faf1db5754891b2d", 1);
    setdvar(@"hash_cb2d56d085e5a9b9", 1);
    level notify("start_prematch");
    foreach (button in level.startbuttons) {
        button scripts\mp\gameobjects::allowuse("none");
        button.trigger = undefined;
        button.visibleteam = "none";
        button.flagmodel delete();
        button notify("deleted");
    }
    level notify("dev_force_start_completed");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c58
// Size: 0xf6
function livelobbyrestart() {
    level.gameendtime = gettime();
    level.gameended = 1;
    level.ingraceperiod = 0;
    level.doeomcombat = 0;
    game["blockJIP"] = 1;
    waitframe();
    setgameendflagsandnotifies(undefined);
    waitframe();
    setgameendtime(0);
    thread scripts\mp\analyticslog::logevent_sendplayerindexdata();
    if (scripts\mp\analyticslog::analyticsspawnlogenabled()) {
        scripts\mp\analyticslog::analyticsstorespawndata();
    }
    if (isdefined(level.matchrecording_dump)) {
        [[ level.matchrecording_dump ]]();
    }
    setdvar(@"hash_c6ca3fbc35dd960", 1);
    setdvar(@"hash_9995278b4b4099ae", 0);
    setdvar(@"hash_8ed4dff39f3251f5", 0);
    /#
        sendscriptusageanalysisdata(1, 1);
    #/
    livelobbyroundendwait(1);
    level notify("game_cleanup");
    setslowmotion(1, 0.4, 3);
    resetsoundtimescalefactor();
    scripts\mp\flags::levelflagclear("block_notifies");
    restart();
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d56
// Size: 0x8e
function livelobbyroundendwait(defaultdelay) {
    var_8d539c1577794d34 = 0;
    foreach (player in level.players) {
        player thread setuipostgamefade(0);
        if (player iscodcaster()) {
            var_8d539c1577794d34 = level.var_7210bb7b0bfbcfdb;
        }
    }
    wait defaultdelay + var_8d539c1577794d34;
    level notify("round_end_finished");
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18dec
// Size: 0x7b
function livelobbymatchstarttimer(type, duration) {
    self notify("matchStartTimer");
    self endon("matchStartTimer");
    level endon("match_cancel_timer_beginning");
    level notify("match_start_timer_beginning");
    if (istrue(level.var_60f7d8bd0181980f)) {
        return;
    }
    counttime = int(duration);
    if (counttime >= 2) {
        setomnvar("ui_match_start_text", type);
        matchstarttimerperplayer_internal(counttime);
    }
    visionsetnaked("", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e6f
// Size: 0x14
function clearmatchhasmorethan1playervariablesonroundend() {
    game["numPlayersConsideredPlaying"] = 0;
    game["matchHasMoreThan1Player"] = 0;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e8b
// Size: 0x95
function updatematchhasmorethan1playeromnvaronplayersfirstspawn() {
    var_2d9482a14615cc39 = game["matchHasMoreThan1Player"];
    game["numPlayersConsideredPlaying"]++;
    if (!game["matchHasMoreThan1Player"]) {
        if (game["numPlayersConsideredPlaying"] > 1) {
            game["matchHasMoreThan1Player"] = 1;
        }
    }
    if (game["matchHasMoreThan1Player"]) {
        if (!var_2d9482a14615cc39) {
            for (i = 0; i < level.players.size; i++) {
                level.players[i] setclientomnvar("match_has_more_than_1_player", 1);
            }
            return;
        }
        self setclientomnvar("match_has_more_than_1_player", 1);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f28
// Size: 0x82
function updatematchhasmorethan1playeromnvaronplayerdisconnect() {
    var_2d9482a14615cc39 = game["matchHasMoreThan1Player"];
    game["numPlayersConsideredPlaying"]--;
    if (game["matchHasMoreThan1Player"]) {
        if (game["numPlayersConsideredPlaying"] <= 1) {
            game["matchHasMoreThan1Player"] = 0;
        }
    }
    if (!game["matchHasMoreThan1Player"]) {
        if (var_2d9482a14615cc39) {
            for (i = 0; i < level.players.size; i++) {
                level.players[i] setclientomnvar("match_has_more_than_1_player", 0);
            }
        }
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fb2
// Size: 0x12b
function removepatchablecollision_delayed() {
    wait 10;
    var_5c2c9d034ebe9dcd = [];
    var_5c2c9d034ebe9dcd[1] = "tactical_ladder_col";
    var_5c2c9d034ebe9dcd[2] = "clip8x8x256";
    var_5c2c9d034ebe9dcd[3] = "player8x8x256";
    var_5c2c9d034ebe9dcd[4] = "ladderMetal264";
    var_5c2c9d034ebe9dcd[5] = "ladderWood192";
    var_5c2c9d034ebe9dcd[6] = "ladderMetal192";
    var_5c2c9d034ebe9dcd[7] = "mount128";
    var_5c2c9d034ebe9dcd[8] = "mount64";
    var_5c2c9d034ebe9dcd[9] = "mount32";
    var_5c2c9d034ebe9dcd[10] = "mount256";
    var_5c2c9d034ebe9dcd[11] = "ladderWood264";
    var_5c2c9d034ebe9dcd[12] = "nosight256x256x8";
    var_5c2c9d034ebe9dcd[13] = "nosight128x128x8";
    var_5c2c9d034ebe9dcd[14] = "mountCorner128";
    var_5c2c9d034ebe9dcd[15] = "mantle256";
    var_5c2c9d034ebe9dcd[16] = "mantle128";
    var_5c2c9d034ebe9dcd[17] = "mantle64";
    var_5c2c9d034ebe9dcd[18] = "mantle32";
    var_5c2c9d034ebe9dcd[19] = "stairsHalfFlight128";
    var_5c2c9d034ebe9dcd[20] = "stairsFullFlight128";
    foreach (name in var_5c2c9d034ebe9dcd) {
        scripts\cp_mp\utility\game_utility::removematchingents_bykey(name, "targetname");
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190e5
// Size: 0x4
function getbrendsplashpostgamestate() {
    return 8;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190f2
// Size: 0x32
function checkforsubgametypeoverrides() {
    level.allowsupers = getdvarint(hashcat(@"hash_d98c82b5a26dc973", getsubgametype(), "_allowSupers"), level.allowsupers);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1912c
// Size: 0x142
function logendofround(player) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!istrue(level.teambased) || istrue(level.multiteambased)) {
        return;
    }
    time_from_match_start = scripts\mp\matchdata::gettimefrommatchstart(gettime());
    playerteam = player.team;
    enemyteam = level.teamnamelist[0];
    if (playerteam == enemyteam) {
        enemyteam = level.teamnamelist[1];
    }
    playerteamscore = getteamscore(playerteam);
    enemyteamscore = getteamscore(enemyteam);
    rounddamage = 0;
    if (isdefined(player.damagethisround)) {
        rounddamage = player.damagethisround;
    }
    player dlog_recordplayerevent("dlog_event_end_of_round", ["time_from_match_start", time_from_match_start, "player_team_name", playerteam, "enemy_team_name", enemyteam, "player_team_score", playerteamscore, "enemy_team_score", enemyteamscore, "damage_this_round", rounddamage]);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19276
// Size: 0x75
function function_fe94aaedd1047d50() {
    humancount = 0;
    partymembers = getpartyinfo();
    foreach (memberinfo in partymembers) {
        if (!memberinfo.isai) {
            humancount++;
        }
    }
    return humancount;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192f4
// Size: 0x68
function function_e48deb3d75ab2e92() {
    humancount = 0;
    foreach (player in level.players) {
        if (!isai(player)) {
            humancount++;
        }
    }
    return humancount;
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19365
// Size: 0x65
function function_75092ad1ff9da748() {
    if (!isdefined(game["attackers"])) {
        setomnvar("ui_attacking_team", 0);
    }
    if (game["attackers"] == "axis") {
        setomnvar("ui_attacking_team", 1);
        return;
    }
    if (game["attackers"] == "allies") {
        setomnvar("ui_attacking_team", 2);
        return;
    }
    setomnvar("ui_attacking_team", 0);
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193d2
// Size: 0x578
function function_4c6436a7855aacd() {
    foreach (player in level.players) {
        player.featured_operator_skin_equipped = 0;
        if (issharedfuncdefined("seasonalevents", "hasFieldRepOperatorSkinEquipped")) {
            if (player function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped")) {
                player.featured_operator_skin_equipped = 1;
            }
        }
        player.featured_operator_skin_bonus_active = 0;
        player.field_rep_xp_combat = 0;
        player.field_rep_xp_recon = 0;
        player.field_rep_xp_strategy = 0;
        player.field_rep_xp_support = 0;
        player.field_rep_xp_logistics = 0;
        player.field_rep_xp_featured_operator_skin_bonus = 0;
        player.player_match_time = 0;
        mode = undefined;
        sub_mode = undefined;
    }
    if (level function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
        if (function_ec3aea190c440d29(@"hash_a8f4c9a06bff4b76")) {
            var_2b4d2ddc4cefed8b = getdvarint(@"hash_a8f4c9a06bff4b76");
        } else {
            var_2b4d2ddc4cefed8b = 1000;
        }
        if (function_ec3aea190c440d29(@"hash_4906b1516f388c3b")) {
            var_3e0d9ec3b338973 = getdvarint(@"hash_4906b1516f388c3b");
        } else {
            var_3e0d9ec3b338973 = 240;
        }
        if (issharedfuncdefined("game_utility", "getTimeSinceGameStart")) {
            timesincestart = int(level function_f3bb4f4911a1beb2("game_utility", "getTimeSinceGameStart") / 1000) - 15;
        }
        if (timesincestart < var_3e0d9ec3b338973) {
            var_3e0d9ec3b338973 = timesincestart;
        }
        foreach (player in level.players) {
            timeplayed = player scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0);
            if (player function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped") && timeplayed >= var_3e0d9ec3b338973) {
                if (issharedfuncdefined("rank", "giveRankXP") && !istrue(player.var_a89b9be6ddf3798b)) {
                    player [[ getsharedfunc("rank", "giveRankXP") ]](#"hash_494bf50723a4f1e6", var_2b4d2ddc4cefed8b, undefined, 1, 1, 1);
                    player.var_a89b9be6ddf3798b = 1;
                }
                totalplayercount = 0;
                foreach (entry in level.teamnamelist) {
                    totalplayercount += getteamdata(entry, "teamCount");
                    if (totalplayercount >= 2) {
                        player.pers["aarData"]["use_featured_operator_skin_xp"] = var_2b4d2ddc4cefed8b;
                        player.featured_operator_skin_bonus_active = 1;
                        player.field_rep_xp_featured_operator_skin_bonus = var_2b4d2ddc4cefed8b;
                        break;
                    }
                }
            }
        }
    }
    mode = getgametype();
    sub_mode = getsubgametype();
    foreach (player in level.players) {
        var_d51a5d00a613b0e8 = player scripts\mp\utility\stats::getpersstat("aarData");
        if (isdefined(var_d51a5d00a613b0e8["combat_xp"])) {
            player.field_rep_xp_combat = var_d51a5d00a613b0e8["combat_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["recon_xp"])) {
            player.field_rep_xp_recon = var_d51a5d00a613b0e8["recon_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["strategy_xp"])) {
            player.field_rep_xp_strategy = var_d51a5d00a613b0e8["strategy_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["support_xp"])) {
            player.field_rep_xp_support = var_d51a5d00a613b0e8["support_xp"];
        }
        if (isdefined(var_d51a5d00a613b0e8["logistics_xp"])) {
            player.field_rep_xp_logistics = var_d51a5d00a613b0e8["logistics_xp"];
        }
        player.player_match_time = player scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0);
        player dlog_recordplayerevent("dlog_event_player_field_rep_eom_report", ["featured_operator_skin_equipped", player.featured_operator_skin_equipped, "featured_operator_skin_bonus_active", player.featured_operator_skin_bonus_active, "field_rep_xp_combat", player.field_rep_xp_combat, "field_rep_xp_recon", player.field_rep_xp_recon, "field_rep_xp_strategy", player.field_rep_xp_strategy, "field_rep_xp_support", player.field_rep_xp_support, "field_rep_xp_logistics", player.field_rep_xp_logistics, "field_rep_xp_featured_operator_skin_bonus", player.field_rep_xp_featured_operator_skin_bonus, "player_match_time", player.player_match_time, "mode", mode, "sub_mode", sub_mode]);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19952
// Size: 0x16d
function function_3f2ab7272697e5b8(inplayer) {
    var_2b4d2ddc4cefed8b = getdvarint(@"hash_a8f4c9a06bff4b76", 1000);
    var_3e0d9ec3b338973 = getdvarint(@"hash_4906b1516f388c3b", 240);
    if (!isdefined(inplayer) || isbot(inplayer) || istestclient(inplayer)) {
        return;
    }
    if (!game["timePassed"]) {
        return;
    }
    if (!(matchmakinggame() || getdvarint(@"hash_37acf332efd205cc"))) {
        return;
    }
    if (isdefined(self.brbonusxpallowed) && self.brbonusxpallowed == 0) {
        return;
    }
    if (isdefined(level.startofxptime)) {
        timeplayed = (gettime() - level.startofxptime) / 1000;
    } else {
        timeplayed = inplayer scripts\mp\persistence::statgetchildbuffered("round", "timePlayed", 0);
    }
    if (inplayer function_f3bb4f4911a1beb2("seasonalevents", "hasFieldRepOperatorSkinEquipped") && timeplayed >= var_3e0d9ec3b338973) {
        if (issharedfuncdefined("rank", "giveRankXP") && !istrue(inplayer.var_a89b9be6ddf3798b)) {
            inplayer [[ getsharedfunc("rank", "giveRankXP") ]](#"hash_494bf50723a4f1e6", var_2b4d2ddc4cefed8b, undefined, 1, 1, 1);
            inplayer.var_a89b9be6ddf3798b = 1;
        }
        inplayer.pers["aarData"]["use_featured_operator_skin_xp"] = var_2b4d2ddc4cefed8b;
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ac7
// Size: 0x73
function function_8abcf76787cc51aa(player) {
    gametype = getgametype();
    if (isdefined(gametype) && (gametype == "koth_horde" || gametype == "br" || gametype == "ob")) {
        if (isdefined(player) && isplayer(player)) {
            player function_3fec3b7eff58e283(gametype);
            return;
        }
        utility::array_thread(level.players, &function_3fec3b7eff58e283, gametype);
    }
}

// Namespace gamelogic / scripts\mp\gamelogic
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b42
// Size: 0x1c2
function function_3fec3b7eff58e283(gametype) {
    player = self;
    if (isdefined(player scripts\mp\utility\stats::getpersstat("telemetry")) && istrue(player scripts\mp\utility\stats::getpersstat("telemetry").var_5340761ae0b3ecee)) {
        return;
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = undefined;
    var_7e2c53b0bcf117d9.playlistid = -1;
    var_7e2c53b0bcf117d9.mode = "undefined";
    var_7e2c53b0bcf117d9.sub_mode = "undefined";
    var_7e2c53b0bcf117d9.bones_zombies = 0;
    var_7e2c53b0bcf117d9.skulls_armored_zombies = 0;
    var_7e2c53b0bcf117d9.skulls_hellhounds = 0;
    var_7e2c53b0bcf117d9.skulls_mimics = 0;
    var_7e2c53b0bcf117d9.player = player;
    var_7e2c53b0bcf117d9.playlistid = getplaylistid();
    var_7e2c53b0bcf117d9.mode = gametype;
    var_7e2c53b0bcf117d9.sub_mode = getsubgametype();
    if (isdefined(player.bone_count)) {
        var_7e2c53b0bcf117d9.bones_zombies = player.bone_count;
    }
    if (isdefined(player.var_d0b217f00fef3917)) {
        var_7e2c53b0bcf117d9.skulls_armored_zombies = player.var_d0b217f00fef3917;
    }
    if (isdefined(player.var_d848e2025d8597d2)) {
        var_7e2c53b0bcf117d9.skulls_hellhounds = player.var_d848e2025d8597d2;
    }
    if (isdefined(player.var_92e210c188ad9778)) {
        var_7e2c53b0bcf117d9.skulls_mimics = player.var_92e210c188ad9778;
    }
    player.pers["telemetry"].var_5340761ae0b3ecee = 1;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_the_hunt_eom", var_7e2c53b0bcf117d9);
}
