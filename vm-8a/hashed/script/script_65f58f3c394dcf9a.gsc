#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_1174abedbefe9ada;

#namespace dmz_audio;

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x751
// Size: 0x36
function private function_7e508409c4935112(music) {
    musicstate = function_17ee301cf0b5ba85(music);
    if (musicstate == "" && music != "") {
        musicstate = music;
    }
    return musicstate;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790
// Size: 0x2c
function function_9941dad3d3d51468(var_6b9a0dbbf039dece) {
    var_cbfb00f6fdb0afba = undefined;
    if (!isdefined(var_6b9a0dbbf039dece)) {
        return;
    }
    if (var_6b9a0dbbf039dece == 1) {
        var_cbfb00f6fdb0afba = "_classic";
    }
    return var_cbfb00f6fdb0afba;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0xa0
function function_caeaf68ab0e87565(players, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    assertex(isarray(players), "dmz_playMusicForPlayers: players was not an array!");
    assertex(isstring(music), "dmz_playMusicForPlayers: music was not a string!");
    delaytime = default_to(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_cbfb00f6fdb0afba = function_7e508409c4935112(var_6b9a0dbbf039dece);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_fe75a89529dd0fd0, players, musicstate, undefined, undefined, var_cbfb00f6fdb0afba);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86d
// Size: 0x9f
function function_c1fd3441ccfba6f8(teamname, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    assertex(isstring(music), "dmz_playMusicForTeam: music was not a string!");
    assertex(isstring(teamname), "dmz_playMusicForTeam: teamName was not a string!");
    delaytime = default_to(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_cbfb00f6fdb0afba = function_7e508409c4935112(var_6b9a0dbbf039dece);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_46979d2fd81a6d4b, teamname, musicstate, undefined, var_cbfb00f6fdb0afba);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x914
// Size: 0x75
function function_9b8077b5cd6f43b1(teams, music) {
    assertex(isarray(teams), "dmz_playMusicForTeams: teams was not an array!");
    foreach (team in teams) {
        function_c1fd3441ccfba6f8(music, team);
    }
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x991
// Size: 0xb4
function function_202ae29f54b67993(teamname, var_6e077719c0efcb61, radius, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    assertex(isnumber(radius), "dmz_playMusicForTeamPlayersInRadius: radius was not a number!");
    assertex(isstring(music), "dmz_playMusicForTeamPlayersInRadius: music was not a string!");
    assertex(isstring(teamname), "dmz_playMusicForTeamPlayersInRadius: teamName was not a string!");
    delaytime = default_to(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    level delaythread(delaytime, &namespace_e688cd9db0404268::function_fdd0934f1a32f70d, var_6e077719c0efcb61, radius, musicstate, teamname, var_6b9a0dbbf039dece);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4d
// Size: 0x14e
function function_4231b99c9d0e1875(music_target, players, music, delay, var_6b9a0dbbf039dece) {
    assertex(isent(music_target) || isstruct(music_target), "dmz_playTrackedMusicForPlayers: unexpected music target");
    assertex(isarray(music_target.musicplayers), "dmz_playTrackedMusicForPlayers: unexpected musicPlayers");
    assertex(isarray(players), "dmz_playTrackedMusicForPlayers: unexpected players");
    players = array_remove_array(players, music_target.musicplayers);
    if (isarray(players) && players.size > 0) {
        var_cbfb00f6fdb0afba = undefined;
        if (isdefined(var_6b9a0dbbf039dece)) {
            var_cbfb00f6fdb0afba = music + function_9941dad3d3d51468(var_6b9a0dbbf039dece);
        }
        function_caeaf68ab0e87565(players, music, delay, var_cbfb00f6fdb0afba);
        foreach (player in players) {
            if (isplayer(player)) {
                playerentnum = player getentitynumber();
                music_target.musicplayers[playerentnum] = player;
                player.var_ac30570114234210 = 1;
            }
        }
    }
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba3
// Size: 0x10c
function function_30f2d27959ca7507(music_target, players, music, delay) {
    assertex(isent(music_target) || isstruct(music_target), "dmz_stopTrackedMusicForPlayers: unexpected music target");
    assertex(isarray(music_target.musicplayers), "dmz_stopTrackedMusicForPlayers: unexpected musicPlayers");
    assertex(isarray(players), "dmz_stopTrackedMusicForPlayers: unexpected players");
    if (isarray(players) && players.size > 0) {
        function_caeaf68ab0e87565(players, music, delay);
        foreach (player in players) {
            if (isplayer(player)) {
                playerentnum = player getentitynumber();
                music_target.musicplayers[playerentnum] = undefined;
                player.var_ac30570114234210 = undefined;
            }
        }
    }
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb7
// Size: 0x9b
function function_889b71cbcb02d4e1(music_target, var_6e077719c0efcb61, radius, team, music, delay, var_6b9a0dbbf039dece) {
    assertex(isent(music_target) || isstruct(music_target), "dmz_playTrackedMusicForPlayersTeamInRadius: unexpected music target");
    assertex(isarray(music_target.musicplayers), "dmz_playTrackedMusicForPlayersTeamInRadius: unexpected musicPlayers");
    players = function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team);
    function_4231b99c9d0e1875(music_target, players, music, delay, var_6b9a0dbbf039dece);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5a
// Size: 0x127
function function_ae73dbedf54b701f(players, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    assertex(isstring(music), "dmz_tryPlayBossApproachMusicForPlayers: music was not a string!");
    delaytime = default_to(delaytime, 0);
    musicstate = function_7e508409c4935112(music);
    var_330af766290f5bfa = [];
    foreach (player in players) {
        if (isplayer(player)) {
            isplayingmusic = istrue(player.var_ac30570114234210) || istrue(player.var_2441210fe6eea080);
            if (!isplayingmusic) {
                var_330af766290f5bfa = array_add(var_330af766290f5bfa, player);
            }
        }
    }
    var_cbfb00f6fdb0afba = undefined;
    if (isdefined(var_6b9a0dbbf039dece)) {
        var_cbfb00f6fdb0afba = music + function_9941dad3d3d51468(var_6b9a0dbbf039dece);
    }
    function_caeaf68ab0e87565(var_330af766290f5bfa, music, delaytime, var_cbfb00f6fdb0afba);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xe89
// Size: 0x8c
function function_5c07a5046a6dc0f4(team_name, var_6e077719c0efcb61, radius, music, delaytime, var_6b9a0dbbf039dece) {
    if (!isdefined(music)) {
        return;
    }
    if (namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        return;
    }
    assertex(isnumber(radius), "dmz_tryPlayBossApproachMusicForTeamPlayers: radius was not a number!");
    assertex(isstring(team_name), "dmz_tryPlayBossApproachMusicForTeamPlayers: team_name was not a string!");
    players = function_d6fe092bc83da45b(var_6e077719c0efcb61, radius, team_name);
    function_ae73dbedf54b701f(players, music, delaytime, var_6b9a0dbbf039dece);
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1d
// Size: 0x7c
function function_12bb57e8dd07e939(array) {
    newarray = [];
    foreach (member in array) {
        var_b30b086ebfeb7f53 = isreallyalive(member);
        if (!var_b30b086ebfeb7f53) {
            continue;
        }
        newarray[newarray.size] = member;
    }
    return newarray;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa2
// Size: 0x5e
function function_38d3ca2b80804e24(players, origin, radius, team) {
    playersinside = function_d6fe092bc83da45b(origin, radius, team);
    playersoutside = array_difference(players, playersinside);
    playersliving = function_12bb57e8dd07e939(playersoutside);
    return playersliving;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1009
// Size: 0x31
function function_ba92e3ab3234f345(players) {
    playersliving = function_12bb57e8dd07e939(players);
    playersdead = array_difference(players, playersliving);
    return playersdead;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1043
// Size: 0x86
function function_882459b3aa239c4(players, origin, radius, team) {
    playersinside = function_d6fe092bc83da45b(origin, radius, team);
    playersoutside = array_difference(players, playersinside);
    playersliving = function_12bb57e8dd07e939(playersinside);
    playersdead = array_difference(playersinside, playersliving);
    var_c071b5d1b8fa53fd = array_combine(playersoutside, playersdead);
    return var_c071b5d1b8fa53fd;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d2
// Size: 0x187
function function_62ca322dde3ab783(agent, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    var_e52f572dfadb149f = default_to(var_e52f572dfadb149f, 12000);
    var_e23b09de2e27ed9 = default_to(var_e23b09de2e27ed9, 30000);
    if (!isdefined(agent)) {
        return undefined;
    }
    state = undefined;
    if (isnumber(agent.health) && agent.health <= 0) {
        state = "dead";
        return state;
    }
    var_82d990c965650a23 = default_to(agent.lastenemysighttime, 0);
    if (isarray(agent.attackerdata)) {
        foreach (attackerdata in agent.attackerdata) {
            if (isnumber(attackerdata.lasttimedamaged) && attackerdata.lasttimedamaged > var_82d990c965650a23) {
                var_82d990c965650a23 = attackerdata.lasttimedamaged;
            }
        }
    }
    if (var_82d990c965650a23 == 0) {
        state = "idle";
    } else {
        now = gettime();
        var_50a2b6968424656c = now - var_82d990c965650a23;
        if (var_50a2b6968424656c >= var_e23b09de2e27ed9) {
            state = "idle";
        } else if (var_50a2b6968424656c >= var_e52f572dfadb149f) {
            state = "alert";
        } else if (var_50a2b6968424656c < var_e52f572dfadb149f) {
            state = "combat";
        }
    }
    return state;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1262
// Size: 0x134
function function_cadc473b3a7d171c(vehicle, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    var_e52f572dfadb149f = default_to(var_e52f572dfadb149f, 12000);
    var_e23b09de2e27ed9 = default_to(var_e23b09de2e27ed9, 30000);
    state = undefined;
    if (isdefined(vehicle) && isstring(vehicle.currentstate)) {
        state = vehicle.currentstate;
    }
    if (!isdefined(vehicle.var_8a2a32e2464a95db)) {
        vehicle.var_8a2a32e2464a95db = 0;
    }
    if (isstring(state) && (state == "attack" || state == "combat")) {
        vehicle.var_8a2a32e2464a95db = gettime();
    }
    if (isnumber(vehicle.var_8a2a32e2464a95db)) {
        if (vehicle.var_8a2a32e2464a95db == 0) {
            state = "idle";
        } else {
            now = gettime();
            elapsedcombattime = now - vehicle.var_8a2a32e2464a95db;
            if (elapsedcombattime >= var_e23b09de2e27ed9) {
                state = "idle";
            } else if (elapsedcombattime >= var_e52f572dfadb149f) {
                state = "alert";
            } else if (elapsedcombattime < var_e52f572dfadb149f) {
                state = "combat";
            }
        }
    }
    return state;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139f
// Size: 0x85
function function_2d29365e60139df1(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9) {
    state = "???";
    if (isdefined(ent) && isstring(ent.classname)) {
        if (isagent(ent)) {
            state = function_62ca322dde3ab783(ent, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        } else if (ent.classname == "script_vehicle") {
            state = function_cadc473b3a7d171c(ent);
        }
    }
    if (!isdefined(state)) {
        state = "???";
    }
    return state;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142d
// Size: 0xf8
function function_2351f113d5579540(ent) {
    enemy = undefined;
    if (isdefined(ent) && isstring(ent.classname)) {
        if (isagent(ent)) {
            enemy = ent.enemy;
        } else if (ent.classname == "script_vehicle") {
            if (isstring(ent.vehiclename) && ent.vehiclename == "dmz_boss_chopper" && issharedfuncdefined("dmz_bosses_chopper", "chopper_getCurrentTargetPlayer")) {
                enemy = level [[ getsharedfunc("dmz_bosses_chopper", "chopper_getCurrentTargetPlayer") ]](ent);
            } else if (isstring(ent.vehiclename) && ent.vehiclename == "pac_sentry") {
                enemy = ent.var_c6dfdd9743149226;
            } else {
                enemy = ent.enemy;
            }
        }
    }
    return enemy;
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x152e
// Size: 0x426
function function_b5be3a44077aec21(bossinstance, var_985ae874212b863e, var_e52f572dfadb149f, var_e23b09de2e27ed9, var_6b9a0dbbf039dece) {
    level endon("game_ended");
    bossinstance notify("stop_boss_ai_music_thread");
    bossinstance endon("stop_boss_ai_music_thread");
    assertex(isnumber(level.var_b1149892b2595056), "dmz_runBossAIMusicStateThread: unexpected level.bossMusicPlayDistance");
    assertex(isnumber(level.var_7b10b08ddb3f610f), "dmz_runBossAIMusicStateThread: unexpected level.bossMusicEvadeDistance");
    assertex(isstruct(bossinstance), "dmz_runBossAIMusicStateThread: unexpected bossInstance");
    assertex(isarray(var_985ae874212b863e), "dmz_runBossAIMusicStateThread: unexpected musicStateArray");
    if (!isarray(bossinstance.musicplayers)) {
        bossinstance.musicplayers = [];
    }
    bossinstance.var_56524c0776d62d8c = var_e52f572dfadb149f;
    bossinstance.var_1910de7604c2d4a0 = var_e23b09de2e27ed9;
    state = "idle";
    enemy = undefined;
    state_last = "idle";
    enemy_last = undefined;
    killer = undefined;
    var_cbfb00f6fdb0afba = undefined;
    while (!istrue(bossinstance.killed)) {
        boss = default_to(bossinstance.boss, bossinstance.agent);
        state = function_2d29365e60139df1(boss, var_e52f572dfadb149f, var_e23b09de2e27ed9);
        enemy = function_2351f113d5579540(boss);
        hasnewstate = isstring(state) && state != state_last;
        hasnewenemy = isdefined(enemy) && isdefined(enemy_last) && enemy != enemy_last || isdefined(enemy) && !isdefined(enemy_last);
        assertex(isarray(bossinstance.musicplayers), "dmz_runBossAIMusicStateThread: unexpected musicPlayers");
        if (hasnewstate || hasnewenemy) {
            if (state == "dead") {
                break;
            }
            mpair = var_985ae874212b863e[state];
            if (isarray(mpair) && isstring(mpair[0])) {
                music = mpair[0];
                delay = mpair[1];
                var_9df00c73e6741337 = isplayer(enemy) && !array_contains(bossinstance.musicplayers, enemy);
                if (state == "combat" && var_9df00c73e6741337) {
                    function_889b71cbcb02d4e1(bossinstance, enemy, level.var_b1149892b2595056, enemy.team, music, delay, var_6b9a0dbbf039dece);
                } else if (state == "idle" && bossinstance.musicplayers.size > 0) {
                    function_30f2d27959ca7507(bossinstance, bossinstance.musicplayers, music, delay);
                }
            }
        }
        if (bossinstance.musicplayers.size > 0) {
            mpair = var_985ae874212b863e["idle"];
            var_749ad895ea80d046 = isent(boss) && isvector(boss.origin);
            var_bb7805258a1f947d = undefined;
            if (istrue(var_749ad895ea80d046)) {
                var_bb7805258a1f947d = function_38d3ca2b80804e24(bossinstance.musicplayers, boss.origin, level.var_7b10b08ddb3f610f);
            }
            if (isarray(var_bb7805258a1f947d) && var_bb7805258a1f947d.size > 0 && isarray(mpair) && isstring(mpair[0])) {
                music = mpair[0];
                delay = mpair[1];
                function_30f2d27959ca7507(bossinstance, var_bb7805258a1f947d, music, delay);
            }
            playersdead = function_ba92e3ab3234f345(bossinstance.musicplayers);
            if (isarray(playersdead) && playersdead.size > 0) {
                music = "dmz_activity_lose";
                delay = 0;
                function_30f2d27959ca7507(bossinstance, playersdead, music, delay);
            }
        }
        state_last = state;
        enemy_last = enemy;
        waitcount = randomintrange(1, 5);
        waittime = waitcount * 0.05;
        if (isent(boss)) {
            boss waittill_any_timeout_1(waittime, "death");
            continue;
        }
        wait waittime;
    }
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x195c
// Size: 0x104
function function_73f954808739f7bc(bossinstance, killer, killer_music, var_1ccbc0e90fcc38ca, loser_music, var_d4222fe9c4d26866) {
    assertex(isstruct(bossinstance), "dmz_SetDeathBossAIMusicState: unexpected bossInstance");
    assertex(isent(killer), "dmz_SetDeathBossAIMusicState: unexpected killer");
    bossinstance notify("stop_boss_ai_music_thread");
    if (isarray(bossinstance.musicplayers) && bossinstance.musicplayers.size > 0) {
        killer_distance = level.var_b1149892b2595056 * 2;
        var_a0585bc229dcd714 = function_d6fe092bc83da45b(killer, killer_distance, killer.team);
        function_30f2d27959ca7507(bossinstance, var_a0585bc229dcd714, killer_music, var_1ccbc0e90fcc38ca);
        if (isdefined(loser_music)) {
            loser_music = default_to(loser_music, "dmz_activity_lose");
            var_d4222fe9c4d26866 = default_to(var_d4222fe9c4d26866, 3);
            function_30f2d27959ca7507(bossinstance, bossinstance.musicplayers, loser_music, var_d4222fe9c4d26866);
        }
    }
}

// Namespace dmz_audio / namespace_b1b96b070bb1349c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a68
// Size: 0x9b
function function_2e4afbf3aeaf31e4(bossinstance, music, music_delay) {
    assertex(isstruct(bossinstance), "dmz_SetDeathBossAIMusicState: unexpected bossInstance");
    bossinstance notify("stop_boss_ai_music_thread");
    if (isarray(bossinstance.musicplayers) && bossinstance.musicplayers.size > 0) {
        musicdistance = level.var_b1149892b2595056 * 2;
        players = function_d6fe092bc83da45b(bossinstance.boss, musicdistance);
        function_30f2d27959ca7507(bossinstance, players, music, music_delay);
    }
}

