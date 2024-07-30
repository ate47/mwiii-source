#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\vehicle.gsc;

#namespace fogofwar;

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187
// Size: 0x7a
function init() {
    var_2a215d89537ea985 = getdvarint(@"hash_7dcc2628da4d8ee9", 0);
    if (!var_2a215d89537ea985) {
        return;
    }
    function_62985528c228d807();
    isenabled = function_a2a780464918dc3a();
    if (isenabled) {
        assert(!isdefined(level.var_ed1cfb3c9d4fe39f));
        level.var_ed1cfb3c9d4fe39f = spawnstruct();
        setupdvars();
        function_1b2f8fdde4aac847();
        function_6b1db739c7687d3d();
        thread setupthreads();
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x209
// Size: 0x1d4
function private setupdvars() {
    assert(isdefined(level.var_ed1cfb3c9d4fe39f));
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    var_872213138b14970c.var_e57875ee12569cf0 = getdvarint(@"hash_ba99b30c43797bf2", 1);
    var_872213138b14970c.var_996d31737882fa92 = getdvarint(@"hash_4cb4ea83e8060b82", 1);
    var_872213138b14970c.var_f35745c691c4a45a = getdvarint(@"hash_d79899fb31780dea", 1);
    var_872213138b14970c.var_e361b1130ac53e8a = getdvarint(@"hash_5ea4ad60f090ee37", 1);
    var_872213138b14970c.var_138acb972c08b806 = getdvarint(@"hash_ba74fc72d7d594e6", 1);
    var_872213138b14970c.var_659e30ad0d164ebb = getdvarint(@"hash_98c4a3109144121b", 2500);
    var_872213138b14970c.var_29ef3a442cfac6da = getdvarint(@"hash_4079e628d612e7fc", 1);
    var_872213138b14970c.var_9b44ac8c8106444f = getdvarint(@"hash_528d3a63b8e9ad35", 7500);
    var_872213138b14970c.var_879459b524bd7e79 = getdvarint(@"hash_23238b7a801bc4e", 1);
    var_872213138b14970c.var_5c3bf42eb00140fe = getdvarint(@"hash_3242683c6dc0c163", 7500);
    var_872213138b14970c.var_d5fca9f4aaa6c917 = getdvarint(@"hash_d84a5db8eef27031", 1);
    var_872213138b14970c.var_4560f74197eb4198 = getdvarint(@"hash_128e08907c53a30a", 7500);
    var_872213138b14970c.var_6c00dbd376a2e823 = getdvarint(@"hash_2bd61a5869101c82", 5000);
    /#
        var_872213138b14970c.debugenabled = getdvarint(@"hash_197051aa098b3b90", 0);
        var_872213138b14970c.debugupdateinterval = getdvarint(@"hash_818b3acd4899a919", 10);
    #/
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e5
// Size: 0x68
function private function_1b2f8fdde4aac847() {
    assert(isdefined(level.var_ed1cfb3c9d4fe39f));
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    var_872213138b14970c.versions = spawnstruct();
    var_872213138b14970c.versions.regions = [];
    var_872213138b14970c.versions.pois = [];
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x455
// Size: 0x1fa
function private setupforplayer() {
    player = self;
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    clientnum = player getentitynumber();
    function_afd245da4ac767de(clientnum);
    mapname = level.mapname;
    var_c8b88cabbc197d04 = 0;
    if (isdefined(var_872213138b14970c.versions.regions[mapname])) {
        var_c8b88cabbc197d04 = var_872213138b14970c.versions.regions[mapname].size;
        assert(var_c8b88cabbc197d04 == var_872213138b14970c.versions.pois[mapname].size);
    }
    var_40c4d898fb1eb8 = function_baa9be37f326e25e(clientnum);
    assert(var_40c4d898fb1eb8 >= 1);
    if (var_c8b88cabbc197d04 >= var_40c4d898fb1eb8) {
        for (versionidx = var_40c4d898fb1eb8 - 1; versionidx < var_872213138b14970c.versions.regions[mapname].size; versionidx++) {
            foreach (region in var_872213138b14970c.versions.regions[mapname][versionidx]) {
                function_ec5f5e757fecb88c(clientnum, region, -1, 2);
            }
            foreach (poi in var_872213138b14970c.versions.pois[mapname][versionidx]) {
                function_ec5f5e757fecb88c(clientnum, -1, poi, 2);
            }
        }
        function_960aeeafe18d262a(clientnum, var_c8b88cabbc197d04 + 1);
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x657
// Size: 0x57
function private function_6b1db739c7687d3d() {
    foreach (player in level.players) {
        player setupforplayer();
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0xd4
function private setupthreads() {
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    /#
        thread debug_think();
    #/
    if (var_872213138b14970c.var_e57875ee12569cf0) {
        thread think();
        level waittill_any_2("prematch_done", "prematch_over");
    } else {
        level waittill_any_2("prematch_done", "prematch_over");
        thread think();
    }
    thread uav_think();
    thread function_bc0290b7a8f6ea2e();
    thread function_7dae73fa4dfd3567();
    foreach (player in level.players) {
        player thread function_96d64f2defea50d();
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x792
// Size: 0x243
function private think() {
    level endon("game_ended");
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    var_1622a9dac549ec70 = gettime();
    while (true) {
        foreach (player in level.players) {
            clientnum = player getentitynumber();
            if (!function_36dcd6a2bfe9e629(clientnum)) {
                player setupforplayer();
            }
            iscomplete = function_cd5d7e6e2bdd664e(clientnum);
            if (iscomplete) {
                continue;
            }
            if (getdvarint(@"hash_63a6ae1db0e57d7", 0)) {
                if (issharedfuncdefined("fogofwar", "should_play_intro")) {
                    if ([[ getsharedfunc("fogofwar", "should_play_intro") ]]()) {
                        flag_wait("flag_dungeon_intro_complete");
                    }
                }
            }
            onground = !var_872213138b14970c.var_996d31737882fa92 || player isonground();
            playerisswimming = player isswimming();
            invalidvehicle = player scripts\cp_mp\utility\player_utility::isinvehicle() && (!var_872213138b14970c.var_996d31737882fa92 || !player.vehicle scripts\common\vehicle::ishelicopter());
            var_cb95887ce6c02555 = !var_872213138b14970c.var_f35745c691c4a45a || !level.ignorescoring;
            isalive = scripts\cp_mp\utility\player_utility::isreallyalive(player);
            if (issharedfuncdefined("fogofwar", "isPlayerInGulag")) {
                ingulag = player [[ getsharedfunc("fogofwar", "isPlayerInGulag") ]]();
            } else {
                ingulag = 0;
            }
            if (var_cb95887ce6c02555 && (onground || invalidvehicle || playerisswimming) && isalive && !ingulag) {
                regionscompleted = function_eed3fe1b82961c75(clientnum);
                if (gettime() > var_1622a9dac549ec70) {
                    function_55a450010056dc64(clientnum);
                    var_1622a9dac549ec70 = gettime() + var_872213138b14970c.var_6c00dbd376a2e823;
                }
                player function_471b438f401fa0c(regionscompleted);
            }
        }
        waitframe();
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9dd
// Size: 0xf7
function private uav_think() {
    level endon("game_ended");
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    while (true) {
        uavowner, uavtype = level waittill("uav_started");
        if (var_872213138b14970c.var_29ef3a442cfac6da && (uavtype == "uav" || uavtype == "directional_uav")) {
            team = level.teamdata[uavowner.team];
            if (isdefined(team)) {
                foreach (player in team["players"]) {
                    player function_b0a5ea61029a806b(uavowner.origin, var_872213138b14970c.var_9b44ac8c8106444f, 1);
                }
            }
        }
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xadc
// Size: 0xd6
function private function_bc0290b7a8f6ea2e() {
    level endon("game_ended");
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    while (true) {
        tower = level waittill("uav_tower_activated");
        if (var_872213138b14970c.var_879459b524bd7e79) {
            team = level.teamdata[tower.activeteam];
            if (isdefined(team)) {
                foreach (player in team["players"]) {
                    player function_b0a5ea61029a806b(tower.origin, var_872213138b14970c.var_5c3bf42eb00140fe, 1);
                }
            }
        }
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbba
// Size: 0x125
function private function_7dae73fa4dfd3567() {
    level endon("game_ended");
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    while (true) {
        var_2d1828e3f6df9c24, helperdronetype = level waittill("helper_drone_started");
        if (var_872213138b14970c.var_138acb972c08b806 && helperdronetype == "scrambler_drone_guard") {
            foreach (teamname, teamdata in level.teamdata) {
                if (teamname != var_2d1828e3f6df9c24.team) {
                    foreach (player in teamdata["players"]) {
                        player function_b0a5ea61029a806b(var_2d1828e3f6df9c24.origin, var_872213138b14970c.var_659e30ad0d164ebb, 2);
                    }
                }
            }
        }
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce7
// Size: 0x6e
function private function_96d64f2defea50d() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    while (true) {
        player waittill("poi_first_visit");
        if (var_872213138b14970c.var_d5fca9f4aaa6c917) {
            player function_b0a5ea61029a806b(player.origin, var_872213138b14970c.var_4560f74197eb4198, 1);
        }
    }
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd5d
// Size: 0x5f
function private function_b0a5ea61029a806b(origin, radius, tilestate) {
    player = self;
    clientnum = player getentitynumber();
    if (!function_36dcd6a2bfe9e629(clientnum)) {
        return;
    }
    regionscompleted = function_ba15177bbe8ff5f2(clientnum, origin, radius, tilestate);
    player function_471b438f401fa0c(regionscompleted);
}

// Namespace fogofwar / namespace_896381a08e76178f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdc4
// Size: 0x86
function private function_471b438f401fa0c(regionscompleted) {
    player = self;
    var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
    if (regionscompleted && var_872213138b14970c.var_e361b1130ac53e8a) {
        for (regioncomplete = 0; regioncomplete < regionscompleted; regioncomplete++) {
            if (issharedfuncdefined("fogofwar", "giveXPWithText")) {
                player [[ getsharedfunc("fogofwar", "giveXPWithText") ]](#"hash_6f0d3f2e6cf9cfa2");
            }
        }
    }
}

/#

    // Namespace fogofwar / namespace_896381a08e76178f
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xe52
    // Size: 0x66
    function private debug_think() {
        level endon("<dev string:x1c>");
        var_872213138b14970c = level.var_ed1cfb3c9d4fe39f;
        while (true) {
            setupdvars();
            if (var_872213138b14970c.debugenabled) {
                function_db5d832dd959272f();
            }
            for (deferredframe = 0; deferredframe < var_872213138b14970c.debugupdateinterval; deferredframe++) {
                waitframe();
            }
        }
    }

#/