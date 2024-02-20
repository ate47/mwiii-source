// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_930a1e7bd882c1d;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\deathicons.gsc;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using script_a34750d17473c49;

#namespace namespace_147cc21b507a21ed;

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x44
function init() {
    var_1f065571b3854f0 = namespace_71073fa38f11492::isbrgametypefuncdefined("infilSequence");
    level.var_b4e9d46918f067bb = getdvarint(@"hash_c4a4576c5ca4960", 0) || var_1f065571b3854f0;
    level.var_a696a93807abb2fd = spawnstruct();
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe17
// Size: 0xc
function function_b4e9d46918f067bb() {
    return level.var_b4e9d46918f067bb;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2b
// Size: 0xe7
function main() {
    if (!function_b4e9d46918f067bb()) {
        return;
    }
    var_567639d26f6a140b = getent("infil_plane", "script_noteworthy");
    if (isdefined(var_567639d26f6a140b)) {
        var_567639d26f6a140b hide();
    }
    level.brlatespawnplayer = &latespawnplayer;
    setdvarifuninitialized(@"hash_4265a52f9f8a703", 1);
    setdvarifuninitialized(@"hash_8be4acc5eebb19ca", 1);
    setdvarifuninitialized(@"hash_e65dc975d6fcfca0", 0);
    level._effect["vfx_br_ac130_clouds"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_ac130_clouds");
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        level._effect["vfx_br_infil_cloud_anim"] = loadfx("vfx/mgl/iw8_br/gameplay/infil/vfx_br_infil_cloud_anim");
        level._effect["vfx_br_infil_cloud_anim_moving"] = loadfx("vfx/mgl/iw8_br/gameplay/infil/vfx_br_infil_cloud_anim");
    } else {
        level._effect["vfx_br_infil_cloud_anim"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_anim");
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf19
// Size: 0x70
function function_5df8c6abd0b861cd() {
    if (!function_b4e9d46918f067bb()) {
        return;
    }
    c130pathstruct = undefined;
    if (!istrue(level.br_infils_disabled) && !istrue(level.var_59ff09549058dda2)) {
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("createC130PathStruct")) {
            c130pathstruct = namespace_71073fa38f11492::runbrgametypefunc("createC130PathStruct");
        } else {
            c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path();
        }
    }
    level.var_a696a93807abb2fd.c130pathstruct = c130pathstruct;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0x1ae
function function_f5c1889669d23a75() {
    if (!function_b4e9d46918f067bb()) {
        return;
    }
    level.br_c130spawndone = 0;
    level.br_latejoininfilready = 0;
    if (!istrue(level.br_infils_disabled)) {
        setdvarifuninitialized(@"hash_fc6ebbeb3426b854", 0);
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("infilSequence")) {
            namespace_71073fa38f11492::runbrgametypefunc("infilSequence");
        } else {
            players = undefined;
            if (namespace_71073fa38f11492::isbrgametypefuncdefined("getInfilPlayers")) {
                players = namespace_71073fa38f11492::runbrgametypefunc("getInfilPlayers");
            }
            /#
                assert(isdefined(level.var_a696a93807abb2fd.c130pathstruct));
            #/
            if (!getdvarint(@"hash_fc6ebbeb3426b854", 0)) {
                beginbrc130playeraniminfilsequence(level.var_a696a93807abb2fd.c130pathstruct, "player", players);
            } else {
                beginbrc130playeraniminfilsequence(level.var_a696a93807abb2fd.c130pathstruct, "script_model");
            }
            level thread namespace_ad389306d44fc6b4::waittoplayinfildialog();
        }
    } else {
        namespace_4b0406965e556711::gameflagset("prematch_fade_done");
        waitframe();
        level.allowprematchdamage = 0;
        players = undefined;
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("getInfilPlayers")) {
            players = namespace_71073fa38f11492::runbrgametypefunc("getInfilPlayers");
        }
        if (!isdefined(players) || players.size > 0) {
            waitforc130andforcespawnallplayers(players);
        }
        foreach (player in level.players) {
            player.plotarmor = undefined;
        }
        gameflagset("br_ready_to_jump");
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1145
// Size: 0x207
function latespawnplayer() {
    self endon("disconnect");
    if (!function_b4e9d46918f067bb()) {
        return;
    }
    player = self;
    istutorial = namespace_d3d40f75bb4e4c32::istutorial() || namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf();
    if (getdvar(@"hash_215446c7a0657e95") != "" || istutorial) {
        oldlatespawnplayer();
    } else if (!isalive(player)) {
        var_92a929921d302e13 = getdvarint(@"hash_25ad2925d6075c8f", 0) == 2;
        var_afe7b88ab44f0601 = !istrue(level.br_c130spawndone) || !isdefined(level.latejoinersanimstruct);
        if (!var_92a929921d302e13 && var_afe7b88ab44f0601) {
            var_a2e7df444a8aafa9 = isbot(player) && namespace_d3d40f75bb4e4c32::isBrPracticeMode();
            while (!istrue(level.br_latejoininfilready) && !var_a2e7df444a8aafa9) {
                if (!var_a2e7df444a8aafa9) {
                    player namespace_d20f8ef223912e12::function_258c4f40dee8189a();
                    player setclientomnvar("ui_br_transition_type", 4);
                }
                wait(0.3);
            }
            player thread latespawnsnatchtoc130();
        } else {
            player.br_isininfil = 0;
            player.br_infilstarted = 1;
            isUIBot = player namespace_d20f8ef223912e12::function_7dbb8165d792b06c();
            if (var_92a929921d302e13 && isbot(player) && !isUIBot) {
                player.jumped = 1;
                player namespace_99ac021a7547cae3::addtoalivecount();
            }
            if (!namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
                teamplayers = getteamdata(player.team, "players");
                if (!isdefined(teamplayers) || teamplayers.size == 0) {
                    teamplayers = [0:self];
                }
                setupbrsquadleader(teamplayers);
            }
            if (isUIBot) {
                player thread namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
            } else {
                player thread missedinfilplayerhandler();
            }
        }
    } else {
        /#
            assertmsg("This shouldn't happen because lateSpawnPlayer() will only be called once!");
        #/
    }
    player setclientomnvar("ui_br_transition_type", 0);
    player setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1353
// Size: 0xf7
function oldlatespawnplayer() {
    self endon("disconnect");
    if (!function_b4e9d46918f067bb()) {
        return;
    }
    player = self;
    /#
        println("scripted_scene");
    #/
    if (!isalive(player)) {
        player namespace_99ac021a7547cae3::spawnplayer(0);
    }
    if (!namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
        if (level.teambased) {
            teamplayers = getteamdata(player.team, "players");
            if (!isdefined(teamplayers) || teamplayers.size == 0) {
                teamplayers = [0:self];
            }
            var_fc8439660d24b9c4 = setupbrsquadleader(teamplayers);
            if (isdefined(var_fc8439660d24b9c4)) {
                /#
                    println("+gostand");
                #/
                registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4);
            } else {
                /#
                    println("br_infils_legacy::transitionPlayersOutOfAC130Cinematic()");
                #/
            }
        } else {
            player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("jumpMasterState", 2);
            registerbrsquadleaderjumpcommands(player);
        }
    }
    player.br_infilstarted = 1;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0x2f7
function latespawnsnatchtoc130() {
    player = self;
    player endon("disconnect");
    if (!isalive(player)) {
        player.latetoinfil = 1;
        player namespace_99ac021a7547cae3::spawnplayer(0);
    }
    player namespace_f8065cafc523dba5::function_a593971d75d82113();
    player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_legacy::lateSpawnSnatchToC130()");
    player.latetoinfil = undefined;
    player freezecontrols(1);
    if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        player.infilanimindex = 1;
    }
    if (!isdefined(player.infilanimindex) && level.teambased) {
        teamplayers = getteamdata(player.team, "players");
        var_f5b09a636e6e3153 = [];
        for (i = 0; i < teamplayers.size - 1; i++) {
            var_f5b09a636e6e3153[i] = i + 2;
        }
        for (i = 0; i < var_f5b09a636e6e3153.size; i++) {
            used = 0;
            foreach (var_736d8d9188ccbd45 in teamplayers) {
                if (var_736d8d9188ccbd45 != player && var_736d8d9188ccbd45 namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                    continue;
                }
                if (isdefined(var_736d8d9188ccbd45.infilanimindex) && isdefined(var_f5b09a636e6e3153[i]) && var_736d8d9188ccbd45.infilanimindex == var_f5b09a636e6e3153[i]) {
                    used = 1;
                    break;
                }
            }
            if (!used) {
                player.infilanimindex = var_f5b09a636e6e3153[i];
                break;
            }
        }
    }
    player playerjoininfil();
    player playerlinktopositionent(level.latejoinersanimstruct);
    player.c130 = level.latejoinersanimstruct.movingc130;
    player setorigin(level.latejoinersanimstruct.movingc130.origin);
    player playerplayinfilloopanim(level.latejoinersanimstruct);
    waitframe();
    if (isdefined(player.team) && level.teambased) {
        teamplayers = getteamdata(player.team, "players");
        foreach (otherplayer in teamplayers) {
            player showtoplayer(otherplayer);
            otherplayer showtoplayer(player);
        }
    }
    if (!isbot(player)) {
        namespace_ad389306d44fc6b4::orbitcam(level.br_ac130);
    }
    wait(0.5);
    player freezecontrols(0);
    player setclientomnvar("ui_br_transition_type", 0);
    player.br_infilstarted = 1;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174f
// Size: 0x84
function playerlinktopositionent(animstruct) {
    if (isai(self) && !istrue(self.hasspawned)) {
        return;
    }
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + self.infilanimindex;
    if (isent(animstruct.playerpositionents[var_8e3afd40d3c95b46])) {
        self playerlinkto(animstruct.playerpositionents[var_8e3afd40d3c95b46], "tag_player");
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17da
// Size: 0x12
function function_35be50043c0855ae() {
    return getdvarint(@"hash_9cea5b03e26fe23", 0);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f4
// Size: 0x183
function playinfilplayeranims(animstruct, players) {
    var_e4c30d4c191baae = getanimlength(level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_redux_player1"]);
    if (function_35be50043c0855ae()) {
        var_e4c30d4c191baae = 0;
    }
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player thread [[ level.parachutetakeweaponscb ]]();
        player namespace_d20f8ef223912e12::playerexecutionsdisable();
        player.c130 = animstruct.movingc130;
        player.plotarmor = 1;
        player playerlinktopositionent(animstruct);
        var_a1483d10035e2a59 = "sdr_mp_infil_ac130_redux_player" + player.infilanimindex;
        player playanimscriptsceneevent("scripted_scene", var_a1483d10035e2a59);
    }
    wait(var_e4c30d4c191baae);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player thread playerplayinfilloopanim(animstruct);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197e
// Size: 0x54
function playerplayinfilloopanim(animstruct) {
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_a1483d10035e2a59 = "sdr_mp_infil_ac130_loop_pl0" + self.infilanimindex;
    self playanimscriptsceneevent("scripted_scene", var_a1483d10035e2a59);
    thread watchinfiljumpanim(animstruct);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d9
// Size: 0x616
function watchinfiljumpanim(animstruct) {
    self endon("death_or_disconnect");
    if (!isdefined(level.infiljumpentsspawned)) {
        level.infiljumpentsspawned = 0;
    }
    self.hasspawnweapons = 0;
    self waittill("br_jump");
    teamplayers = getteamdata(self.team, "players");
    var_ef848feb5c017e25 = [];
    if (self.jumptype == "leader") {
        foreach (player in teamplayers) {
            if (isdefined(player.infilanimindex)) {
                var_ef848feb5c017e25[var_ef848feb5c017e25.size] = player;
            }
        }
    } else if (self.jumptype == "solo" || self.jumptype == "outOfBounds") {
        var_ef848feb5c017e25 = [0:self];
    }
    var_bee01cb211c7e185 = var_ef848feb5c017e25.size > 0;
    if (var_bee01cb211c7e185) {
        var_a2117ea816a8b7f1 = getdvarint(@"hash_8be4acc5eebb19ca", 1) != 0;
        if (level.infiljumpentsspawned >= 100) {
            var_a2117ea816a8b7f1 = 0;
        }
        var_77b785278f139079 = undefined;
        if (var_a2117ea816a8b7f1) {
            var_77b785278f139079 = 0;
            var_c00a2e62499631e9 = getanimsforplanefacing(animstruct);
            var_66809387054fc02a = var_c00a2e62499631e9[2];
            var_4d261ef98868b4e6 = var_c00a2e62499631e9[1];
            var_8dec95713ec1f7ba = var_c00a2e62499631e9[0];
            var_9b145eb55513dbb5["parent"] = spawn("script_model", animstruct.movingc130.origin);
            level.infiljumpentsspawned++;
            var_9b145eb55513dbb5["parent"] setmodel("generic_prop_x10");
            var_9b145eb55513dbb5["parent"] linkto(animstruct.movingc130, "tag_body", (0, 0, 0), (0, 0, 0));
            foreach (player in var_ef848feb5c017e25) {
                if (!isdefined(player.infilanimindex)) {
                    player.infilanimindex = 1;
                }
                var_8e3afd40d3c95b46 = "j_prop_" + player.infilanimindex + 2;
                var_9b145eb55513dbb5[var_8e3afd40d3c95b46] = spawn("script_model", var_9b145eb55513dbb5["parent"] gettagorigin(var_8e3afd40d3c95b46));
                level.infiljumpentsspawned++;
                var_9b145eb55513dbb5[var_8e3afd40d3c95b46] setmodel("tag_player");
                var_9b145eb55513dbb5[var_8e3afd40d3c95b46] linkto(var_9b145eb55513dbb5["parent"], var_8e3afd40d3c95b46, (0, 0, 0), (0, 0, 0));
                player playerlinkto(var_9b145eb55513dbb5[var_8e3afd40d3c95b46], "tag_player");
                player namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
                player playanimscriptsceneevent("scripted_scene", var_66809387054fc02a);
                player.infilanimindex = undefined;
                player.var_db122a8941dfee14 = undefined;
                player playlocalsound("evt_br_infil_jump_stinger");
                level thread playjumpsoundtosquad(player);
            }
            var_9b145eb55513dbb5["parent"] scriptmodelplayanim(var_8dec95713ec1f7ba, "prop");
            var_7a79e5c326955318 = getanimlength(var_4d261ef98868b4e6);
            var_886f7978500acb10 = 1;
            var_7a79e5c326955318 = max(var_7a79e5c326955318, var_886f7978500acb10 + 0.1);
            wait(var_7a79e5c326955318 - var_886f7978500acb10);
            foreach (player in var_ef848feb5c017e25) {
                player cameradefault();
            }
            wait(var_886f7978500acb10);
            foreach (ent in var_9b145eb55513dbb5) {
                ent delete();
                level.infiljumpentsspawned--;
            }
        } else {
            var_77b785278f139079 = 1;
            waittillframeend();
        }
        foreach (player in var_ef848feb5c017e25) {
            player.infilanimindex = undefined;
            player.var_db122a8941dfee14 = undefined;
            player stopanimscriptsceneevent();
            player notify("infil_jump_done");
            player namespace_d20f8ef223912e12::playerexecutionsenable();
            player namespace_71073fa38f11492::runbrgametypefunc("onInfilJumpCompleted");
        }
        if (var_77b785278f139079) {
            waitframe();
            if (isdefined(animstruct.movingc130)) {
                if (isdefined(animstruct.movingc130.playeroffsets) && isdefined(animstruct.movingc130.currentplayeroffset)) {
                    foreach (player in var_ef848feb5c017e25) {
                        offset = animstruct.movingc130.playeroffsets[animstruct.movingc130.currentplayeroffset];
                        player setorigin(animstruct.movingc130.origin + offset, 1, 1);
                        animstruct.movingc130.currentplayeroffset++;
                        if (animstruct.movingc130.currentplayeroffset == animstruct.movingc130.playeroffsets.size) {
                            animstruct.movingc130.currentplayeroffset = 0;
                        }
                        player namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
                        level thread playjumpsoundtosquad(player);
                    }
                }
            }
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff6
// Size: 0x1a8
function getanimsforplanefacing(animstruct) {
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    var_4b52f031a2cbef8e = anglestoforward(animstruct.movingc130.angles);
    var_d8bb89f41ae3d919 = anglestoright(animstruct.movingc130.angles);
    var_172d42d175e16c61 = vectordot(playerforward, var_4b52f031a2cbef8e);
    var_ed451f0ea36c48c6 = vectordot(playerforward, var_d8bb89f41ae3d919);
    cos45 = cos(45);
    if (var_172d42d175e16c61 < -1 * cos45) {
        return [0:"sdr_mp_infil_ac130_jump_genpropx10", 1:level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_jump_genpropx10"], 2:"sdr_mp_infil_ac130_jump"];
    }
    if (var_ed451f0ea36c48c6 > cos45) {
        return [0:"sdr_mp_infil_ac130_jump_genpropx10_90_l", 1:level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_jump_genpropx10_90_l"], 2:"sdr_mp_infil_ac130_jump_90_l"];
    } else if (var_ed451f0ea36c48c6 < -1 * cos45) {
        return [0:"sdr_mp_infil_ac130_jump_genpropx10_90_r", 1:level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_jump_genpropx10_90_r"], 2:"sdr_mp_infil_ac130_jump_90_r"];
    } else if (var_ed451f0ea36c48c6 > 0) {
        return [0:"sdr_mp_infil_ac130_jump_genpropx10_180_l", 1:level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_jump_genpropx10_180_l"], 2:"sdr_mp_infil_ac130_jump_180_l"];
    } else {
        return [0:"sdr_mp_infil_ac130_jump_genpropx10_180_r", 1:level.var_1a209bd995a7fa83["sdr_mp_infil_ac130_jump_genpropx10_180_r"], 2:"sdr_mp_infil_ac130_jump_180_r"];
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a5
// Size: 0x41
function playjumpsoundtosquad(player) {
    aliasname = "evt_br_infil_squadmate_jump";
    if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        aliasname = "evt_br_infil_squad_leader_jump";
    }
    player playsoundtoteam(aliasname, player.team, player);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ed
// Size: 0x38
function missedinfilplayerhandler() {
    player = self;
    player.br_infilstarted = 1;
    player namespace_cb965d2f71fefddc::addrespawntoken(1);
    player namespace_47fd1e79a44628cd::playergulagautowin("missedInfil", undefined, undefined, 1);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x222c
// Size: 0xa9
function playerjoininfil() {
    level endon("game_ended");
    self endon("disconnect");
    self notify("joining_Infil");
    player = self;
    player.br_infilstarted = 1;
    if (!istrue(level.c130inbounds)) {
        self setclientomnvar("ui_hide_minimap", 1);
    }
    player.health = player.maxhealth;
    player namespace_ad389306d44fc6b4::spawnplayertoc130();
    player playersetupcontrolsforinfil();
    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isInInfilPlane", 1);
    level.infilstruct.playersinc130++;
    player namespace_d3d40f75bb4e4c32::function_64fa4c213439177f();
    player thread playercleanupinfilondisconnect();
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22dc
// Size: 0x7a
function playersetupcontrolsforinfil(var_a19e18e7cc768828) {
    if (!isdefined(var_a19e18e7cc768828)) {
        var_a19e18e7cc768828 = 0;
    }
    self setclientomnvar("ui_br_infil_started", 1);
    self setclientomnvar("ui_br_infiled", 0);
    if (!var_a19e18e7cc768828) {
        self notifyonplayercommand("halo_jump_c130", "+gostand");
    } else {
        self notifyonplayercommand("halo_jump_solo_c130", "+gostand");
    }
    self notifyonplayercommand("br_pass_squad_leader", "+usereload");
    self notifyonplayercommand("br_pass_squad_leader", "+activate");
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235d
// Size: 0x79
function playercleanupinfilondisconnect() {
    level endon("game_ended");
    self endon("death");
    self endon("cancel_c130");
    self endon("br_jump");
    self waittill("disconnect");
    if (isdefined(level.infilstruct) && isdefined(level.infilstruct.playersinc130) && level.infilstruct.playersinc130 > 0) {
        level.infilstruct.playersinc130--;
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23dd
// Size: 0x3b7
function beginbrc130playeraniminfilsequence(c130pathstruct, infil_anim_type, players) {
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(-1);
    }
    level.infilstruct = spawnstruct();
    level.infilstruct.playersinc130 = 0;
    if (!isdefined(c130pathstruct)) {
        c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path();
    }
    level.infilstruct.c130pathstruct = c130pathstruct;
    namespace_ad389306d44fc6b4::spawnc130(undefined, undefined, undefined, level.infilstruct.c130pathstruct);
    animstruct = buildac130infilanimstruct(level.br_ac130, infil_anim_type);
    level.latejoinersanimstruct = animstruct;
    infilvideopreload(players);
    if (isdefined(level.preinfilstreamfunc)) {
        [[ level.preinfilstreamfunc ]](animstruct);
    }
    level.infilcinematicactive = 1;
    level.allowprematchdamage = 0;
    level.br_ac130 thread gunship_updateplayercount();
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    transitionplayerstoac130cinematic(var_fa371b137df55a75, infil_anim_type, animstruct.staticc130);
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() || namespace_d3d40f75bb4e4c32::isdmzbotpracticematch()) {
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (isdefined(player) && isplayer(player)) {
                player notify("play_intro");
            }
        }
    }
    infilvideoplay(players);
    infilvideowaituntilcomplete(players);
    level thread infilallfadetoblack(0, 3.45, 0.6, undefined, players);
    playac130infilanim(animstruct, players);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    transitionplayersoutofac130cinematic(var_fa371b137df55a75, infil_anim_type);
    level.infilcinematicactive = 0;
    level.infilstruct.infil_anim_type = infil_anim_type;
    thread namespace_71073fa38f11492::runbrgametypefunc("onInfilSequenceEnd", players);
    namespace_d3d40f75bb4e4c32::brleaderdialog("match_start", 0, players);
    istutorial = namespace_d3d40f75bb4e4c32::istutorial() || namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf();
    if (!istutorial) {
        var_cb130a107612fddf = getdvar(@"hash_215446c7a0657e95") == "";
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            if (!istrue(player.br_isininfil) && var_cb130a107612fddf) {
                continue;
            }
            player thread playerjoininfil();
            if (player isplayerheadless()) {
                registerheadlessinfil(player);
            }
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("addToC130Infil")) {
            level.br_ac130 namespace_71073fa38f11492::runbrgametypefunc("addToC130Infil");
        }
    }
    if (isdefined(level.headlessinfilplayers)) {
        level thread headlessinfils();
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x279b
// Size: 0x7d
function infilvideopreload(players) {
    var_4f105563ca74cf73 = "mp_donetsk_c130_intro";
    if (!isdefined(players)) {
        preloadcinematicforall(var_4f105563ca74cf73);
    } else {
        foreach (player in players) {
            if (isdefined(player)) {
                player preloadcinematicforplayer(var_4f105563ca74cf73);
            }
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281f
// Size: 0x15
function function_f94830ac89cbe22c(waittime) {
    wait(waittime);
    self stopsounds();
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x283b
// Size: 0x202
function infilvideoplay(players) {
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    allplayers = level.players.size == var_fa371b137df55a75.size;
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    if (allplayers) {
        setglobalsoundcontext("lobby_fade", "", 2);
    }
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        if (!allplayers) {
            player setentitysoundcontext("lobby_fade", "", 2);
        }
        player playlocalsound("br_infil_part1_lr");
        if (function_35be50043c0855ae()) {
            player thread function_f94830ac89cbe22c(7);
        }
        player clearsoundsubmix("mp_br_lobby_fade", 1.5);
        player setsoundsubmix("solo_cin_igc_music", 0.5);
        br_infil_intro = function_17ee301cf0b5ba85("br_infil_intro");
        player setplayermusicstate(br_infil_intro);
    }
    var_4f105563ca74cf73 = "mp_donetsk_c130_intro";
    if (allplayers) {
        playcinematicforall(var_4f105563ca74cf73);
    } else {
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player playcinematicforplayer(var_4f105563ca74cf73);
        }
    }
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        if (!istrue(player.latetoinfil)) {
            player setclientomnvar("ui_br_bink_overlay_state", 3);
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a44
// Size: 0x32
function infilvideocompletecallback(channel, val) {
    if (channel == "bink_complete") {
        self setclientomnvar("ui_br_bink_overlay_state", 0);
        self stopcinematicforplayer();
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7d
// Size: 0x11f
function infilvideowaituntilcomplete(players) {
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&infilvideocompletecallback);
    time = 3.2;
    wait(time);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    if (isdefined(level.var_9d615a366ec2fb6f)) {
        level.var_9d615a366ec2fb6f = undefined;
    }
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player notify("beginC130");
    }
    if (isdefined(level.throwingknives)) {
        foreach (throwingknife in level.throwingknives) {
            if (isdefined(throwingknife)) {
                throwingknife thread namespace_eb0feb5c721a9f11::throwing_knife_deletepickup();
            }
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba3
// Size: 0x10f
function gunship_updateplayercount() {
    level endon("game_ended");
    self notify("ac130_player_count");
    self endon("ac130_player_count");
    var_512e1c239c8f0640 = getdvarint(@"hash_57377f405b99ecd2", 0);
    if (var_512e1c239c8f0640) {
        level.infilstruct.var_129d4a6c887fcfa5 = level.players.size;
        if (isdefined(level.var_7b37b2193f163b9b) && isdefined(level.var_7b37b2193f163b9b.var_156f390a5362bc55)) {
            level.infilstruct.var_129d4a6c887fcfa5 = level.infilstruct.var_129d4a6c887fcfa5 + level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
        }
    }
    while (1) {
        if (var_512e1c239c8f0640) {
            setomnvar("ui_br_players_left_in_plane", level.infilstruct.var_129d4a6c887fcfa5);
        } else {
            setomnvar("ui_br_players_left_in_plane", level.infilstruct.playersinc130);
        }
        if (!isdefined(self)) {
            break;
        }
        wait(0.5);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb9
// Size: 0x8e
function spawnplayerpositionparentent(animstruct, ac130) {
    animstruct.playerpositionents["parent"] = spawn("script_model", ac130.origin);
    animstruct.playerpositionents["parent"] setmodel("generic_prop_x5");
    animstruct.playerpositionents["parent"] linkto(ac130, "", (0, 0, 0), (0, 0, 0));
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4e
// Size: 0x9a
function spawnplayerpositionent(animstruct, var_3e904658641f342f) {
    animstruct.playerpositionents[var_3e904658641f342f] = spawn("script_model", animstruct.playerpositionents["parent"] gettagorigin(var_3e904658641f342f));
    animstruct.playerpositionents[var_3e904658641f342f] setmodel("tag_player");
    animstruct.playerpositionents[var_3e904658641f342f] linkto(animstruct.playerpositionents["parent"], var_3e904658641f342f, (0, 0, 0), (0, 0, 0));
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2def
// Size: 0x6bf
function buildac130infilanimstruct(movingc130, infil_anim_type) {
    animstruct = spawnstruct();
    if (isdefined(movingc130)) {
        movingc130.animstruct = animstruct;
        animstruct.movingc130 = movingc130;
    }
    animstruct.staticc130 = getent("infil_plane", "script_noteworthy");
    if (isdefined(animstruct.staticc130)) {
        animstruct.staticc130 show();
    } else {
        animstruct.staticc130 = spawn("script_model", getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0)));
        animstruct.staticc130 setmodel("veh8_mil_air_acharlie130_magma_animated");
        animstruct.staticc130.cleanme = 1;
    }
    animstruct.cameraent = spawn("script_model", animstruct.staticc130.origin);
    animstruct.cameraent setmodel("generic_prop_x5");
    if (isdefined(movingc130)) {
        animstruct.cameraentmoving = spawn("script_model", animstruct.movingc130.origin);
        animstruct.cameraentmoving setmodel("generic_prop_x5");
        animstruct.cameraentmoving linkto(animstruct.movingc130, "tag_origin", (0, 0, 0), (0, 0, 0));
        animstruct.cameraentmoving forcenetfieldhighlod(1);
    }
    spawnplayerpositionparentent(animstruct, animstruct.staticc130);
    if (infil_anim_type == "script_model") {
        animstruct.playerslot1 = spawn("script_model", animstruct.staticc130.origin);
        animstruct.playerslot1 setmodel("fullbody_usmc_ar_br_infil");
        animstruct.playerslot2 = spawn("script_model", animstruct.staticc130.origin);
        animstruct.playerslot2 setmodel("fullbody_usmc_ar_br_infil");
        animstruct.playerslot3 = spawn("script_model", animstruct.staticc130.origin);
        animstruct.playerslot3 setmodel("fullbody_usmc_ar_br_infil");
        animstruct.playerslot4 = spawn("script_model", animstruct.staticc130.origin);
        animstruct.playerslot4 setmodel("fullbody_usmc_ar_br_infil");
        animstruct.playerslot1 linkto(animstruct.playerpositionents["parent"], "j_prop_1", (0, 0, 0), (0, 0, 0));
        animstruct.playerslot2 linkto(animstruct.playerpositionents["parent"], "j_prop_2", (0, 0, 0), (0, 0, 0));
        animstruct.playerslot3 linkto(animstruct.playerpositionents["parent"], "j_prop_3", (0, 0, 0), (0, 0, 0));
        animstruct.playerslot4 linkto(animstruct.playerpositionents["parent"], "j_prop_4", (0, 0, 0), (0, 0, 0));
        animstruct.infil_anim_type = "script_model";
    } else {
        var_589033938efc0461 = [0:"j_prop_1", 1:"j_prop_2", 2:"j_prop_3", 3:"j_prop_4"];
        foreach (var_3e904658641f342f in var_589033938efc0461) {
            spawnplayerpositionent(animstruct, var_3e904658641f342f);
        }
        animstruct.infil_anim_type = "player";
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        animstruct.aidoorchief = spawn("script_model", animstruct.staticc130.origin);
        animstruct.aidoorchief setmodel("body_mp_western_otter_3_1_lod1");
        head = spawn("script_model", animstruct.aidoorchief gettagorigin("j_neck"));
        head setmodel("head_mp_eastern_metalghost_1_1");
        head linkto(animstruct.aidoorchief, "j_neck", (-9, 1, 0), (0, 0, 0));
    } else {
        animstruct.aidoorchief = spawn("script_model", animstruct.staticc130.origin);
        animstruct.aidoorchief setmodel("fullbody_usmc_ar_br_infil");
    }
    if (isdefined(movingc130)) {
        animstruct.movingc130.innards linkto(animstruct.movingc130, "", (0, 0, 0), (0, 0, 0));
    }
    animstruct.aidoorchief linkto(animstruct.playerpositionents["parent"], "j_prop_5", (0, 0, 0), (0, 0, 0));
    animstruct.cameraent linkto(animstruct.staticc130, "", (0, 0, 0), (0, 0, 0));
    animstruct.cloudanimfx = spawnfx(level._effect["vfx_br_infil_cloud_anim"], animstruct.staticc130.origin);
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        animstruct.var_352d21900a2aa86f = spawnfx(level._effect["vfx_br_infil_cloud_anim_moving"], animstruct.movingc130.origin + (-500, 0, 0));
    }
    return animstruct;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b6
// Size: 0x93
function setuphudelemninfilblack(hudelem) {
    hudelem.x = 0;
    hudelem.y = 0;
    hudelem setshader("black", 640, 480);
    hudelem.alignx = "left";
    hudelem.aligny = "top";
    hudelem.horzalign = "fullscreen";
    hudelem.vertalign = "fullscreen";
    hudelem.sort = -1;
    hudelem setshowinrealism(1);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3550
// Size: 0x4e7
function infilallfadetoblack(fadeintime, var_e4ab5ef161c5ffcb, fadeouttime, var_bfd3cec846e4fbf7, players, var_69618eb692fc8288) {
    if (!isdefined(var_69618eb692fc8288)) {
        var_69618eb692fc8288 = 0;
    }
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    allplayers = level.players.size == var_fa371b137df55a75.size;
    if (allplayers && !isdefined(level.infilblackoverlay)) {
        level.infilblackoverlay = newhudelem();
        setuphudelemninfilblack(level.infilblackoverlay);
    } else if (!allplayers) {
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player.infilblackoverlay = newclienthudelem(player);
            setuphudelemninfilblack(player.infilblackoverlay);
        }
    }
    if (isdefined(fadeintime) && fadeintime > 0) {
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            if (!var_69618eb692fc8288) {
                player setsoundsubmix("iw8_br_infil_fadeout", 0);
                player setsoundsubmix("mp_br_infil_music", 0);
            }
            if (!allplayers) {
                player.infilblackoverlay.alpha = 0;
                player.infilblackoverlay fadeovertime(fadeintime);
                player.infilblackoverlay.alpha = 1;
            }
        }
        if (allplayers) {
            level.infilblackoverlay.alpha = 0;
            level.infilblackoverlay fadeovertime(fadeouttime);
            level.infilblackoverlay.alpha = 1;
        }
        wait(fadeintime);
    }
    if (allplayers) {
        level.infilblackoverlay.alpha = 1;
    }
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        if (!var_69618eb692fc8288) {
            player setsoundsubmix("mp_br_infil_anim", 0);
            player setsoundsubmix("mp_br_infil_ac130", 0);
        }
        if (!allplayers) {
            player.infilblackoverlay.alpha = 1;
        }
    }
    if (isdefined(var_bfd3cec846e4fbf7)) {
        level waittill(var_bfd3cec846e4fbf7);
    }
    if (isdefined(var_e4ab5ef161c5ffcb) && var_e4ab5ef161c5ffcb > 0) {
        wait(var_e4ab5ef161c5ffcb);
    }
    if (isdefined(fadeouttime) && fadeouttime > 0) {
        if (allplayers) {
            level.infilblackoverlay.alpha = 1;
            level.infilblackoverlay fadeovertime(fadeouttime);
            level.infilblackoverlay.alpha = 0;
        }
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            if (!var_69618eb692fc8288) {
                player setclienttriggeraudiozone("mp_br_c130_infil_int", fadeouttime);
                player clearsoundsubmix("iw8_br_infil_fadeout", 2);
                player notify("deaths_door_exit");
                player namespace_4887422e77f3514e::function_a2b4e6088394bade();
            }
            if (!allplayers) {
                player.infilblackoverlay.alpha = 1;
                player.infilblackoverlay fadeovertime(fadeouttime);
                player.infilblackoverlay.alpha = 0;
            }
        }
        wait(fadeouttime);
    }
    if (allplayers) {
        level.infilblackoverlay.alpha = 0;
    } else {
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(player.infilblackoverlay)) {
                player.infilblackoverlay destroy();
            }
            player.infilblackoverlay = undefined;
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a3e
// Size: 0x33c
function transitionplayerstoac130cinematic(players, infil_anim_type, c130) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(c130)) {
            player.c130 = level.br_ac130;
        }
        if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            player utility::hidehudenable();
        }
        /#
            if (player isnoclip()) {
                player noclip();
            }
            if (player isufo()) {
                player ufo();
            }
        #/
    }
    namespace_b984803e2ef247a2::removealldeathicons();
    setomnvar("ui_hide_player_icons", 1);
    thread infilallfadetoblack(1, 1.5, 1, "prematch_respawn_finished", players);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_bc667001f9dd3808(c130.origin);
    }
    level.infiltransistioning = 1;
    waitandpause(1);
    waitframe();
    namespace_15d3019056d1bcea::emptyallvehicles();
    setomnvar("ui_in_infil", 1);
    namespace_4b0406965e556711::gameflagset("prematch_fade_done");
    waitforc130andforcespawnallplayers(players);
    level notify("prematch_respawn_finished");
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.sessionstate) || player.sessionstate == "spectator") {
            continue;
        }
        namespace_71073fa38f11492::function_d72afaccedfc946e("onPlayerTeleport", player, player.origin, c130.origin, "c130");
        player setorigin(c130.origin);
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            player setclientomnvar("ui_options_menu", 0);
        }
    }
    waitandpause(1.5);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearpredictedstreampos();
        player endprematchskydiving();
        player.br_isininfil = 1;
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            player setclientomnvar("ui_options_menu", -1);
        }
    }
    if (infil_anim_type == "script_model") {
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            player namespace_f8065cafc523dba5::function_a593971d75d82113();
            player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_legacy::transitionPlayersToAC130Cinematic()");
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d81
// Size: 0x23b
function waitforc130andforcespawnallplayers(players) {
    /#
        println("<unknown string>");
    #/
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player endprematchskydiving();
        if (!isalive(player)) {
            player c130forcespawnplayer();
        } else {
            player.br_infilstarted = 1;
        }
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(player.br_iseliminated)) {
            namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        }
        player notify("beginC130");
    }
    if (!namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
        if (level.teambased) {
            foreach (team in level.teamnamelist) {
                teamplayers = getteamdata(team, "players");
                var_fc8439660d24b9c4 = setupbrsquadleader(teamplayers);
                if (isdefined(var_fc8439660d24b9c4)) {
                    registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4);
                    var_fc8439660d24b9c4 thread watchbrsquadleaderdisconnect(team);
                }
                namespace_d20f8ef223912e12::updatesquadleaderpassstateforteam(team);
            }
        } else {
            var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
            foreach (player in var_fa371b137df55a75) {
                if (isdefined(player)) {
                    registerbrsquadleaderjumpcommands(player);
                }
            }
        }
    }
    if (!namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        level.disablespawning = 1;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 1);
    }
    level.snatchspawnalltoc130done = 1;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc3
// Size: 0x95
function c130forcespawnplayer() {
    self endon("disconnect");
    if (self.team == "codcaster") {
        return;
    }
    if (self.class == "") {
        self.class = "custom1";
        self.pers["class"] = "custom1";
    }
    /#
        println("<unknown string>");
    #/
    namespace_99ac021a7547cae3::spawnplayer(0);
    self.br_infilstarted = 1;
    self notify("brWaitAndSpawnClientComplete");
    self setclientomnvar("ui_br_transition_type", 0);
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x405f
// Size: 0xe0
function transitionplayersoutofac130cinematic(players, infil_anim_type) {
    var_505a6d9b4eb5d4f3 = infil_anim_type == "script_model";
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player.instantclassswapallowed = 1;
        if (get_int_or_0(player.hidehudenabled) > 0) {
            player utility::hidehuddisable();
        }
        player visionsetfadetoblackforplayer("", 1);
        if (var_505a6d9b4eb5d4f3) {
            player namespace_f8065cafc523dba5::function_6fb380927695ee76();
            player namespace_f8065cafc523dba5::function_985b0973f29da4f8("br_infils_legacy::transitionPlayersOutOfAC130Cinematic()");
        }
    }
    setomnvar("ui_in_infil", -1);
    level.infiltransistioning = undefined;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4146
// Size: 0x93
function clearsoundsubmixmpbrinfilac130(players) {
    waitandpause(7.7);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_ac130", 30);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e0
// Size: 0x93
function clearsoundsubmixmpbrinfilanim(players) {
    waitandpause(0.65);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_anim", 3);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427a
// Size: 0x93
function clearsoundsubmixfadetoblackamb(players) {
    waitandpause(0.5);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 1);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4314
// Size: 0xa4
function setsoundsubmixfadetoblackamb(players) {
    waitandpause(2);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("solo_cin_igc_music", 0.5);
        player setsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 2);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43bf
// Size: 0x38
function playac130infilanim(animstruct, players) {
    thread setsoundsubmixfadetoblackamb(players);
    playac130animinternal(animstruct, players);
    transitionac130tomovinganim(animstruct, players);
    endac130infilanimsinternal(animstruct, players);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43fe
// Size: 0x78f
function playac130animinternal(animstruct, players) {
    animstruct endon("stopScene");
    var_384446a35f40358c = undefined;
    /#
        var_384446a35f40358c = getdvarint(@"hash_441165c7b355dd1b", -1);
    #/
    if (animstruct.infil_anim_type == "player") {
        if (!isdefined(players)) {
            foreach (team in level.teamnamelist) {
                teamplayers = getteamdata(team, "players");
                var_f5b09a636e6e3153 = [0:1, 1:2, 2:3, 3:4];
                foreach (index, player in teamplayers) {
                    player namespace_f8065cafc523dba5::function_a593971d75d82113();
                    player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_legacy::playAC130AnimInternal() - if");
                    player.infilanimindex = var_f5b09a636e6e3153[index % var_f5b09a636e6e3153.size];
                    /#
                        if (var_384446a35f40358c != -1) {
                            player.infilanimindex = var_384446a35f40358c;
                        }
                    #/
                    foreach (otherplayer in teamplayers) {
                        player showtoplayer(otherplayer);
                    }
                }
            }
        } else {
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                player namespace_f8065cafc523dba5::function_a593971d75d82113();
                player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_legacy::playAC130AnimInternal() - else");
                player showtoplayer(player);
                player.infilanimindex = 1;
            }
        }
    } else {
        /#
            animindex = var_384446a35f40358c;
            if (animindex < 0) {
                animindex = 1;
            }
            var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
            foreach (player in var_fa371b137df55a75) {
                if (!isdefined(player)) {
                    continue;
                }
                player.infilanimindex = animindex;
            }
        #/
    }
    var_e74da054403180a2 = 34;
    var_5eea6039c4f26fdf = 5.6;
    var_108437a9e3168337 = 50.7;
    var_63916e6c46c30b92 = 2;
    var_5004850b0ec526a1 = 4;
    /#
        var_e74da054403180a2 = getdvarfloat(@"hash_3f7dc593f9b4e95c", var_e74da054403180a2);
        var_5eea6039c4f26fdf = getdvarfloat(@"hash_679c9529942a3229", var_5eea6039c4f26fdf);
        var_108437a9e3168337 = getdvarfloat(@"hash_601d2c6b86673b4", var_108437a9e3168337);
        var_63916e6c46c30b92 = getdvarfloat(@"hash_dda086f6c3d3840f", var_63916e6c46c30b92);
        var_5004850b0ec526a1 = getdvarfloat(@"hash_e3dc33638e3c4ed4", var_5004850b0ec526a1);
    #/
    starttimesec = ter_op(function_35be50043c0855ae(), 12.5, 0);
    animstruct.cameraent scriptmodelplayanim("sdr_mp_infil_ac130_redux_players_cam", "camera", starttimesec);
    if (isdefined(animstruct.cameraentmoving)) {
        animstruct.cameraentmoving scriptmodelplayanim("sdr_mp_infil_ac130_redux_players_cam", "camera", starttimesec);
    }
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130 stoploopsound();
    }
    animstruct.aidoorchief hide();
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player setsoundsubmix("mp_br_infil_anim", 0);
        player setsoundsubmix("mp_br_infil_music", 0);
        player setsoundsubmix("mp_br_infil_ac130", 0);
        player setclienttriggeraudiozone("mp_br_c130_infil_int", 1);
        animstruct.cameraentlinktag = "j_prop_" + player.infilanimindex;
        player cameraunlink();
        player cameralinkto(animstruct.cameraent, animstruct.cameraentlinktag, 1, 1);
        player setclientdvar(@"hash_df1dc712c4a91588", var_e74da054403180a2);
        player enablephysicaldepthoffieldscripting();
        player setphysicaldepthoffield(var_5eea6039c4f26fdf, var_108437a9e3168337, var_63916e6c46c30b92, var_5004850b0ec526a1);
        player _freezelookcontrols(1);
        animstruct.aidoorchief showtoplayer(player);
    }
    thread clearsoundsubmixmpbrinfilanim(players);
    thread getlightingvalues();
    playfxontag(level._effect["vfx_br_ac130_clouds"], animstruct.staticc130, "tag_body");
    animstruct.staticc130 scriptmodelplayanim("sdr_mp_infil_ac130_redux_players_ac130", "plane");
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130 scriptmodelplayanim("sdr_mp_infil_ac130_redux_players_ac130", "plane");
        animstruct.movingc130.innards scriptmodelplayanim("sdr_mp_infil_ac130_redux_players_ac130", "planeInnards");
    }
    animstruct.playerpositionents["parent"] scriptmodelplayanim("sdr_mp_infil_ac130_redux_character_link", "prop");
    if (animstruct.infil_anim_type == "script_model") {
        animstruct.playerslot1 scriptmodelplayanim("sdr_mp_infil_ac130_redux_player1", "p1");
        animstruct.playerslot2 scriptmodelplayanim("sdr_mp_infil_ac130_redux_player2", "p2");
        animstruct.playerslot3 scriptmodelplayanim("sdr_mp_infil_ac130_redux_player3", "p3");
        animstruct.playerslot4 scriptmodelplayanim("sdr_mp_infil_ac130_redux_player4", "p4");
    } else if (animstruct.infil_anim_type == "player") {
        thread playinfilplayeranims(animstruct, players);
    }
    animstruct.aidoorchief scriptmodelplayanim("sdr_mp_infil_ac130_redux_doorchief", "doorchief");
    level thread offlight(animstruct);
    level thread redlight(animstruct);
    level thread greenlight(animstruct);
    level thread playerwind(animstruct, players);
    level thread cloud_cover(animstruct);
    level thread infil_light_dvars(animstruct);
    level thread delaystreamtomovingplane(animstruct, players);
    if (function_35be50043c0855ae()) {
        animstruct.cameraent waittillmatch("camera", "transition");
    } else {
        animstruct.cameraent waittill_match_or_timeout("camera", "transition", 30);
    }
    animstruct notify("infil_reset_light_dvars");
    level clearplayerwind(animstruct, players);
    var_31524ff7e103fe42 = 0.1;
    var_6dbf75f07032be02 = 0;
    var_965e07b090747071 = 0.2;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b94
// Size: 0x51b
function transitionac130tomovinganim(animstruct, players) {
    var_d69c3085d8cf2730 = 65;
    var_decc5773bf6d2dc5 = 14;
    var_6642ae82a680f3e9 = 35;
    var_ce7b1c2d2f4235c0 = 2;
    var_5e0f870c68f3cfab = 4;
    /#
        var_d69c3085d8cf2730 = getdvarfloat(@"hash_f80d61afa659d962", var_d69c3085d8cf2730);
        var_decc5773bf6d2dc5 = getdvarfloat(@"hash_91844e25654ff137", var_decc5773bf6d2dc5);
        var_6642ae82a680f3e9 = getdvarfloat(@"hash_12df3e4329486542", var_6642ae82a680f3e9);
        var_ce7b1c2d2f4235c0 = getdvarfloat(@"hash_a5fccaf38e6c6141", var_ce7b1c2d2f4235c0);
        var_5e0f870c68f3cfab = getdvarfloat(@"hash_78941d68c2877ae6", var_5e0f870c68f3cfab);
    #/
    if (isdefined(animstruct.cameraentmoving)) {
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player setallstreamloaddist(0);
            if (!isdefined(player.infilanimindex)) {
                player.infilanimindex = 1;
            }
            animstruct.cameraentlinktag = "j_prop_" + player.infilanimindex;
            player cameraunlink();
            player cameralinkto(animstruct.cameraentmoving, animstruct.cameraentlinktag, 1, 1);
            player setclientdvar(@"hash_df1dc712c4a91588", var_d69c3085d8cf2730);
            player setphysicaldepthoffield(var_decc5773bf6d2dc5, var_6642ae82a680f3e9, var_ce7b1c2d2f4235c0, var_5e0f870c68f3cfab);
            player notify("infil_move");
        }
        thread clearsoundsubmixfadetoblackamb(players);
    } else {
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player setallstreamloaddist(0);
        }
    }
    if (isdefined(animstruct.cloudanimfx)) {
        if (isdefined(animstruct.movingc130)) {
            animstruct.cloudanimfx.origin = animstruct.movingc130.origin;
        }
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        if (isdefined(animstruct.var_352d21900a2aa86f) && isdefined(animstruct.movingc130)) {
            animstruct.var_352d21900a2aa86f.origin = animstruct.movingc130.origin;
        }
    }
    animstruct.staticc130 hide();
    animstruct.cameraent unlink();
    animstruct.playerpositionents["parent"] unlink();
    if (isdefined(animstruct.movingc130)) {
        animstruct.playerpositionents["parent"] linkto(animstruct.movingc130, "", (0, 0, 0), (0, 0, 0));
        animstruct.cameraent linkto(animstruct.movingc130, "", (0, 0, 0), (0, 0, 0));
        animstruct.movingc130 notify("start_moving");
    }
    setomnvar("ui_hide_player_icons", 0);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player setclienttriggeraudiozone("mp_br_c130_infil_ext", 2);
    }
    thread clearsoundsubmixmpbrinfilac130(players);
    if (animstruct.infil_anim_type == "script_model") {
        animstruct.playerslot1 scriptmodelplayanim("sdr_mp_infil_ac130_loop_pl01", "p1");
        animstruct.playerslot2 scriptmodelplayanim("sdr_mp_infil_ac130_loop_pl02", "p2");
        animstruct.playerslot3 scriptmodelplayanim("sdr_mp_infil_ac130_loop_pl03", "p3");
        animstruct.playerslot4 scriptmodelplayanim("sdr_mp_infil_ac130_loop_pl04", "p4");
    }
    animstruct.aidoorchief scriptmodelplayanim("sdr_mp_infil_ac130_loop_doorchief", "doorchief");
    level thread playac130infilloopanims(animstruct);
    if (isdefined(animstruct.cameraentmoving)) {
        animstruct.cameraentmoving waittillmatch("camera", "end");
    }
    /#
    #/
    thread unfreezeplayercontrols(1.2, players);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b6
// Size: 0x89
function unfreezeplayercontrols(delaytime, players) {
    wait(delaytime);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player _freezelookcontrols(0);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5146
// Size: 0x120
function endac130infilanimsinternal(animstruct, players) {
    thread lightsreset();
    stopfxontag(level._effect["vfx_br_ac130_clouds"], animstruct.staticc130, "tag_body");
    animstruct.staticc130 stoploopsound();
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130 playloopsound("br_ac130_lp");
    }
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
        player cameraunlink();
        player setclientdvar(@"hash_df1dc712c4a91588", 65);
        player disablephysicaldepthoffieldscripting();
        player setdof_default();
    }
    level thread stopstreamtomovingplane(animstruct, players);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x526d
// Size: 0x7c
function playac130infilloopanims(animstruct) {
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130 scriptmodelplayanim("sdr_mp_infil_ac130_loop2_plane", "plane");
        animstruct.movingc130.innards scriptmodelplayanim("sdr_mp_infil_ac130_loop2_plane", "planeInnards");
    }
    animstruct.playerpositionents["parent"] scriptmodelplayanim("sdr_mp_infil_ac130_loop_genpropx10", "prop");
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f0
// Size: 0x7e
function offlight(animstruct) {
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (var_4d81cddc98ed9537 in var_620d0024527f448c) {
        var_4d81cddc98ed9537 setscriptablepartstate("light_blinking_slow", "light_off_hold", 1);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5375
// Size: 0x9e
function redlight(animstruct) {
    animstruct endon("stopScene");
    animstruct.staticc130 waittillmatch("plane", "gored");
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (var_4d81cddc98ed9537 in var_620d0024527f448c) {
        var_4d81cddc98ed9537 setscriptablepartstate("light_blinking_slow", "light_on", 1);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541a
// Size: 0x9e
function greenlight(animstruct) {
    animstruct endon("stopScene");
    animstruct.staticc130 waittillmatch("plane", "gogreen");
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (var_4d81cddc98ed9537 in var_620d0024527f448c) {
        var_4d81cddc98ed9537 setscriptablepartstate("light_blinking_slow", "light_jump", 1);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54bf
// Size: 0xe1
function playerwind(animstruct, players) {
    if (function_35be50043c0855ae()) {
        return;
    }
    animstruct endon("stopScene");
    animstruct.staticc130 waittill_match_or_timeout("plane", "opendoor", 30);
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player) || isbot(player)) {
            continue;
        }
        player setwind("100", 1);
    }
    animstruct.aidoorchief setwind("100");
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55a7
// Size: 0xad
function clearplayerwind(animstruct, players) {
    var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
    foreach (player in var_fa371b137df55a75) {
        if (!isdefined(player)) {
            continue;
        }
        player setwind("1");
        player.manualoverridewindmaterial = undefined;
    }
    animstruct.aidoorchief setwind("0");
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x565b
// Size: 0x57
function cloud_cover(animstruct) {
    animstruct endon("stopScene");
    animstruct.staticc130 waittillmatch("plane", "transitionstart");
    triggerfx(animstruct.cloudanimfx);
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        triggerfx(animstruct.var_352d21900a2aa86f);
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56b9
// Size: 0x149
function infil_light_dvars(animstruct) {
    var_c3ed855fe7c983e3 = getdvarfloat(@"hash_8667c0bb90c5bfc3");
    var_1800e53d66415e2d = getdvarint(@"hash_63eb1893f96ac98d");
    var_5506432d2291c178 = getdvarint(@"hash_1dde331a8e0153d8");
    var_488f9b9fe1ead0a6 = getdvarfloat(@"hash_9ab6a766fc4e0c06");
    var_99598b81ba0f7519 = getdvarfloat(@"hash_a589d43a51d526df");
    setdvar(@"hash_8667c0bb90c5bfc3", 1000);
    setdvar(@"hash_63eb1893f96ac98d", 6);
    setdvar(@"hash_1dde331a8e0153d8", 8);
    setdvar(@"hash_9ab6a766fc4e0c06", 0.25);
    setdvar(@"hash_a589d43a51d526df", 0.5);
    animstruct waittill_either("infil_reset_light_dvars", "stopScene");
    setdvar(@"hash_8667c0bb90c5bfc3", var_c3ed855fe7c983e3);
    setdvar(@"hash_63eb1893f96ac98d", var_1800e53d66415e2d);
    setdvar(@"hash_1dde331a8e0153d8", var_5506432d2291c178);
    setdvar(@"hash_9ab6a766fc4e0c06", var_488f9b9fe1ead0a6);
    setdvar(@"hash_a589d43a51d526df", var_99598b81ba0f7519);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5809
// Size: 0x15a
function delaystreamtomovingplane(animstruct, players) {
    if (isdefined(animstruct.movingc130) && getdvarint(@"hash_eb8a05afa7735e5f", 1) == 1) {
        delaytime = getdvarint(@"hash_d01d0472d843d39e", 8);
        wait(delaytime);
        var_11f3b4465c8b637b = animstruct.movingc130.origin;
        forward = getdvarint(@"hash_7abcda2d7aabbe4c", 0);
        if (forward > 0) {
            dir = anglestoforward(animstruct.movingc130.angles);
            var_11f3b4465c8b637b = animstruct.movingc130.origin + dir * forward;
        }
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player setpredictedstreamloaddist(0);
            player namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_11f3b4465c8b637b);
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x596a
// Size: 0xca
function stopstreamtomovingplane(animstruct, players) {
    if (isdefined(animstruct.movingc130) && getdvarint(@"hash_eb8a05afa7735e5f", 1) == 1) {
        delaytime = getdvarint(@"hash_b7c6d487b0f5506b", 5);
        wait(delaytime);
        var_fa371b137df55a75 = ter_op(isdefined(players), players, level.players);
        foreach (player in var_fa371b137df55a75) {
            if (!isdefined(player)) {
                continue;
            }
            player thread namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
        }
    }
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a3b
// Size: 0x3
function getlightingvalues() {
    
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a45
// Size: 0x3
function lightsreset() {
    
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4f
// Size: 0x121
function function_36ebdcea4a9d96ce(infil_anim_type) {
    /#
        level.infil_vignette_anim_type = infil_anim_type;
        var_b37140bfa8ba2461 = spawn("<unknown string>", getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0)));
        var_b37140bfa8ba2461 setmodel("<unknown string>");
        var_b37140bfa8ba2461.cleanme = 1;
        var_b37140bfa8ba2461.innards = spawn("<unknown string>", getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0)));
        var_b37140bfa8ba2461.innards setmodel("<unknown string>");
        var_b37140bfa8ba2461.innards linkto(var_b37140bfa8ba2461, "<unknown string>");
        var_b37140bfa8ba2461.innards.cleanme = 1;
        var_2c43414ff4583b64 = buildac130infilanimstruct(var_b37140bfa8ba2461, infil_anim_type);
        transitionplayerstoac130cinematic(level.players, infil_anim_type, var_b37140bfa8ba2461);
        playac130infilanim(var_2c43414ff4583b64);
        transitionplayersoutofac130cinematic(level.players, infil_anim_type);
        namespace_d3d40f75bb4e4c32::cleanac130struct(var_2c43414ff4583b64);
        return var_2c43414ff4583b64;
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5b77
// Size: 0x48
function movetowithpause(point, time, accel, decel) {
    /#
        if (function_136f4218b1d719b9()) {
            thread function_7451d3cc68574219(point, time, accel, decel);
            return;
        }
    #/
    self moveto(point, time, accel, decel);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5bc6
// Size: 0x48
function rotatetowithpause(angles, time, accel, decel) {
    /#
        if (function_136f4218b1d719b9()) {
            thread function_de3c7a095bbfa623(angles, time, accel, decel);
            return;
        }
    #/
    self rotateto(angles, time, accel, decel);
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c15
// Size: 0x1a0
function function_ec887b61b1baeba8(host) {
    /#
        animstruct = buildac130infilanimstruct(undefined, "<unknown string>");
        models = [0:animstruct.cameraent, 1:animstruct.staticc130, 2:animstruct.playerpositionents["<unknown string>"], 3:animstruct.playerslot1, 4:animstruct.playerslot2, 5:animstruct.playerslot3, 6:animstruct.playerslot4, 7:animstruct.aidoorchief];
        models = array_removeundefined(models);
        while (function_136f4218b1d719b9()) {
            function_9384c9ed097bf7b9(host, "<unknown string>");
            if (!function_136f4218b1d719b9()) {
                break;
            }
            startorigin = host.origin;
            startangles = host getplayerangles();
            animstruct.staticc130 show();
            animstruct.cameraentlinktag = undefined;
            function_3a001a7d1d9a2ca3(host, animstruct, models);
            transitionplayerstoac130cinematic([0:host], "<unknown string>", animstruct.staticc130);
            thread playac130animinternal(animstruct);
            function_9384c9ed097bf7b9(host, "<unknown string>");
            function_3c95f70d7b40e916(host, animstruct, models);
            endac130infilanimsinternal(animstruct);
            transitionplayersoutofac130cinematic([0:host], "<unknown string>");
            host setorigin(startorigin);
            host setplayerangles(startangles);
            wait(0.5);
        }
        namespace_d3d40f75bb4e4c32::cleanac130struct(animstruct);
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5dbc
// Size: 0x3e
function function_3a001a7d1d9a2ca3(player, animstruct, models) {
    /#
        level.var_ca629cf434263639 = 0;
        thread function_710d2b779609907d(player, models, animstruct);
        thread function_b51365f787d44355(player, animstruct);
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e01
// Size: 0x7d
function function_3c95f70d7b40e916(player, animstruct, models) {
    /#
        level.var_ca629cf434263639 = undefined;
        animstruct notify("<unknown string>");
        foreach (model in models) {
            model scriptmodelclearanim();
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e85
// Size: 0x48
function function_9384c9ed097bf7b9(player, var_1131de9c9b830e78) {
    /#
        while (player buttonpressed(var_1131de9c9b830e78) && function_136f4218b1d719b9()) {
            waitframe();
        }
        while (!player buttonpressed(var_1131de9c9b830e78) && function_136f4218b1d719b9()) {
            waitframe();
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed4
// Size: 0x123
function function_710d2b779609907d(player, models, animstruct) {
    /#
        animstruct endon("<unknown string>");
        while (1) {
            level.var_ca629cf434263639 = 0;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            foreach (model in models) {
                model scriptmodelpauseanim(1);
            }
            level.var_ca629cf434263639 = 1;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            foreach (model in models) {
                model scriptmodelpauseanim(0);
            }
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ffe
// Size: 0x187
function function_b51365f787d44355(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        /#
            assert(isdefined(animstruct.cameraent));
        #/
        while (1) {
            while (!player buttonpressed("<unknown string>") || !isdefined(animstruct.cameraentlinktag)) {
                waitframe();
            }
            player namespace_f8065cafc523dba5::function_6fb380927695ee76();
            player namespace_f8065cafc523dba5::function_985b0973f29da4f8("<unknown string>");
            player cameraunlink();
            player disablephysicaldepthoffieldscripting();
            player _freezelookcontrols(0);
            org = animstruct.cameraent gettagorigin(animstruct.cameraentlinktag) + (0, 0, -60);
            angles = animstruct.cameraent gettagangles(animstruct.cameraentlinktag);
            player setorigin(org);
            player setplayerangles(angles);
            if (!player isufo()) {
                player ufo();
            }
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (player isufo()) {
                player ufo();
            }
            player cameralinkto(animstruct.cameraent, animstruct.cameraentlinktag, 1, 1);
            player namespace_f8065cafc523dba5::function_a593971d75d82113();
            player namespace_f8065cafc523dba5::function_379bb555405c16bb("<unknown string>");
            player enablephysicaldepthoffieldscripting();
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x618c
// Size: 0xa2
function function_77108c1c4c1defef(func, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        function_3fc888ca7a09b8d(func, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d);
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x6235
// Size: 0x1c8
function function_3fc888ca7a09b8d(func, timer, param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d) {
    /#
        waitandpause(timer);
        if (isdefined(var_5a6a8cfa11882c6d)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4, var_5a6a8cfa11882c6d);
        } else if (isdefined(var_5a6a89fa118825d4)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807, var_5a6a89fa118825d4);
        } else if (isdefined(var_5a6a8afa11882807)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555, var_5a6a8afa11882807);
        } else if (isdefined(var_f3cb1651d632a555)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8, var_f3cb1651d632a555);
        } else if (isdefined(param8)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7, param8);
        } else if (isdefined(param7)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6, param7);
        } else if (isdefined(param6)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5, param6);
        } else if (isdefined(param5)) {
            self builtin [[ func ]](param1, param2, param3, param4, param5);
        } else if (isdefined(param4)) {
            self builtin [[ func ]](param1, param2, param3, param4);
        } else if (isdefined(param3)) {
            self builtin [[ func ]](param1, param2, param3);
        } else if (isdefined(param2)) {
            self builtin [[ func ]](param1, param2);
        } else if (isdefined(param1)) {
            self builtin [[ func ]](param1);
        } else {
            self builtin [[ func ]]();
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6404
// Size: 0x85
function function_7451d3cc68574219(point, timesec, accel, decel) {
    /#
        self moveto(point, timesec, accel, decel);
        while (timesec > 0) {
            waitframe();
            if (istrue(level.var_ca629cf434263639)) {
                self moveto(self.origin, timesec, accel, decel);
                while (istrue(level.var_ca629cf434263639)) {
                    waitframe();
                }
                self moveto(point, timesec, accel, decel);
            }
            timesec = timesec - level.framedurationseconds;
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6490
// Size: 0x85
function function_de3c7a095bbfa623(angles, timesec, accel, decel) {
    /#
        self rotateto(angles, timesec, accel, decel);
        while (timesec > 0) {
            waitframe();
            if (istrue(level.var_ca629cf434263639)) {
                self rotateto(self.angles, timesec, accel, decel);
                while (istrue(level.var_ca629cf434263639)) {
                    waitframe();
                }
                self rotateto(angles, timesec, accel, decel);
            }
            timesec = timesec - level.framedurationseconds;
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x651c
// Size: 0x2e4
function function_b0f7742c6d38dbd1(animstruct) {
    /#
        var_4a64c51edab7d63b = anglestoaxis(animstruct.movingc130.angles);
        var_ca8604d07949e4ec = -1 * var_4a64c51edab7d63b["<unknown string>"];
        var_f8ff5945440f4cdb = var_4a64c51edab7d63b["<unknown string>"];
        foreach (player in level.players) {
            var_15314da30b44470 = player.infilanimindex - 1;
            var_1126685ee85ab1e2 = "<unknown string>" + player.infilanimindex;
            var_3df9d9a1027fb9bc = animstruct.cameraentmoving gettagorigin(var_1126685ee85ab1e2);
            cameraangles = animstruct.cameraentmoving gettagangles(var_1126685ee85ab1e2);
            baseorigin = player getvieworigin();
            var_b7034ef67b8ca88d = var_3df9d9a1027fb9bc;
            var_5a5ade6f6717ebc2 = anglestoforward(cameraangles);
            var_fad8ba79dadaf9ee = (var_5a5ade6f6717ebc2[0] * -1, var_5a5ade6f6717ebc2[1] * -1, 0);
            var_fad8ba79dadaf9ee = vectornormalize(var_fad8ba79dadaf9ee);
            denominator = vectordot(var_fad8ba79dadaf9ee, var_5a5ade6f6717ebc2);
            difference = baseorigin - var_b7034ef67b8ca88d;
            t = vectordot(difference, var_fad8ba79dadaf9ee) / denominator;
            result = var_b7034ef67b8ca88d + t * var_5a5ade6f6717ebc2;
            offset = result - baseorigin;
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + offset[0] + "<unknown string>" + offset[1] + "<unknown string>" + offset[2] + "<unknown string>");
            var_47293b1e94ff8fb0 = baseorigin + var_ca8604d07949e4ec * offset[0] + var_f8ff5945440f4cdb * offset[2];
            var_ac59002aa0721741 = distance(var_3df9d9a1027fb9bc, var_47293b1e94ff8fb0);
            var_cf201622a9fd5646 = var_47293b1e94ff8fb0 - var_3df9d9a1027fb9bc;
            var_cf201622a9fd5646 = vectornormalize(var_cf201622a9fd5646);
            var_abdc396b57c7f955 = vectordot(var_5a5ade6f6717ebc2, var_cf201622a9fd5646);
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + var_ac59002aa0721741 + "<unknown string>" + var_abdc396b57c7f955 + "<unknown string>");
            var_4200398f14c8db5 = var_3df9d9a1027fb9bc - var_47293b1e94ff8fb0;
            var_629f52c3d96c0cb9 = length(var_4200398f14c8db5);
            var_867d9818ce7f2161 = acos(var_4200398f14c8db5[2] / var_629f52c3d96c0cb9);
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + var_629f52c3d96c0cb9 + "<unknown string>" + var_867d9818ce7f2161 + "<unknown string>");
        }
    #/
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6807
// Size: 0xaa
function headlessinfils() {
    dist = distance(level.br_ac130.pathstruct.startpt, level.br_ac130.pathstruct.endpt);
    time = dist / namespace_ad389306d44fc6b4::getc130speed() / level.headlessinfilplayers.size;
    for (i = 0; i < level.headlessinfilplayers.size; i++) {
        wait(time);
        level.headlessinfilplayers[i] notify("halo_jump_c130");
    }
    level.headlessinfilplayers = undefined;
}

// Namespace namespace_147cc21b507a21ed/namespace_973962356ce55fee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b8
// Size: 0x39
function registerheadlessinfil(player) {
    if (!isdefined(level.headlessinfilplayers)) {
        level.headlessinfilplayers = [];
    }
    level.headlessinfilplayers[level.headlessinfilplayers.size] = player;
}
