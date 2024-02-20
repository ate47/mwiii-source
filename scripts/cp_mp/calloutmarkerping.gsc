// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\utility\script.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_a655003e419fc731;

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2663
// Size: 0x71
function calloutmarkerping_initcommon() {
    if (!isdefined(level.brloottablename)) {
        level.brloottablename = getdvar(@"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv");
        if (level.brloottablename == "") {
            level.brloottablename = "mp/loot/br/default/loot_item_defs.csv";
        }
    }
    level thread calloutmarkerpingvo_debouncegarbagecollector();
    setdvarifuninitialized(@"hash_28ffde533f721522", 0);
    /#
        level thread function_c35cbd50adbcd4fd();
    #/
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26db
// Size: 0xa5
function calloutmarkerping_enemytodangerdecaycreate(var_394466c2ddb208cb, var_93b12c2dce7c2aa8) {
    player = self;
    player calloutmarkerping_removecallout(var_394466c2ddb208cb);
    var_ed8c23bf6b457573 = getdvarint(@"hash_299d210181a853a", 82);
    if (!isdefined(var_93b12c2dce7c2aa8.origin)) {
        return;
    }
    var_e847bb702009c980 = var_93b12c2dce7c2aa8.origin + (0, 0, var_ed8c23bf6b457573);
    var_d0ae85b60ec1f5f7 = player calloutmarkerping_createcallout(6, var_e847bb702009c980, 0);
    player thread _calloutmarkerping_predicted_timeout(var_d0ae85b60ec1f5f7);
    _calloutmarkerping_predicted_log("Decay to Danger | oldPingIndex: " + var_394466c2ddb208cb + " | newPingIndex: " + var_d0ae85b60ec1f5f7);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2787
// Size: 0x3a
function _calloutmarkerping_predicted_log(message) {
    /#
        if (getdvarint(@"hash_f49a77d2fc3d27e9", 0)) {
            logstring("resolveAssimRequest" + message + "getBundleNameFromLootID" + gettime());
        }
    #/
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c8
// Size: 0x18
function function_c648f0fd527e089a(pingType) {
    return pingType >= 19 && pingType <= 28;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e8
// Size: 0x10
function function_810652bcec49286c(pingType) {
    return pingType == 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2800
// Size: 0x10
function function_5dacc89a40a58737(pingType) {
    return pingType == 9;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2818
// Size: 0x18
function function_476d89b12dfe07a1(pingType) {
    return pingType == 13 || pingType == 14;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2838
// Size: 0x10
function function_caef0e7e004e5475(pingType) {
    return pingType == 15;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2850
// Size: 0x18
function function_d3789a9a4be5df2e(pingType) {
    return pingType >= 6 && pingType <= 18;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2870
// Size: 0x10
function function_74ec310d8f99b6e2(pingType) {
    return pingType == 3;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2888
// Size: 0x10
function function_2a301a38103bd61e(pingType) {
    return pingType == 36;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28a0
// Size: 0x18
function function_666d78f715b8321f(pingType) {
    return pingType == 29 || pingType == 30;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c0
// Size: 0x18
function function_87df78670540e9b2(pingType) {
    return pingType >= 29 && pingType <= 36;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e0
// Size: 0x326
function function_d0006d07465a279c(var_394466c2ddb208cb, pingType, scriptable) {
    player = self;
    var_4e4c314136883c22 = getdvarint(@"hash_e6f7c3f8a50a6fd7", 1);
    if (var_4e4c314136883c22) {
        var_bb224cee75d433a2 = player function_a7e757d42b550a6(var_394466c2ddb208cb);
        waittime = function_e7ff763fd8f43bc4(var_bb224cee75d433a2);
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        return function_ce5c3314571d6a29(var_394466c2ddb208cb, pingType, scriptable);
    }
    if (!isdefined(waittime) || istrue(getdvarint(@"hash_8fa862672ae1781b", 0))) {
        if (pingType == 21) {
            var_d78856cb402135f0 = @"hash_817bed798637d38e";
            var_783c6aee0e4019d6 = 120;
        } else if (function_c648f0fd527e089a(pingType)) {
            if (pingType == 23) {
                var_d78856cb402135f0 = @"hash_8bd5e52ad7441f43";
                var_783c6aee0e4019d6 = 120;
            } else {
                var_d78856cb402135f0 = @"hash_4710528047b1660d";
                var_783c6aee0e4019d6 = 30;
            }
            if (isdefined(scriptable) && isdefined(scriptable.type) && scriptable.type == "br_plunder_box" || scriptable.type == "dmz_supply_drop" || scriptable.type == "dmz_supply_drop_boss" || scriptable.type == "dmz_supply_drop_samsite" || scriptable.type == "dmz_supply_drop_supply") {
                var_d78856cb402135f0 = @"hash_cce27a6c00a3b750";
                var_783c6aee0e4019d6 = 120;
            }
        } else if (function_5dacc89a40a58737(pingType)) {
            var_783c6aee0e4019d6 = 3;
        } else if (function_d3789a9a4be5df2e(pingType)) {
            var_d78856cb402135f0 = @"hash_f1ed16d72234a0cc";
            var_783c6aee0e4019d6 = 60;
        } else if (function_87df78670540e9b2(pingType)) {
            var_d78856cb402135f0 = @"hash_c368219ba5712e18";
            var_783c6aee0e4019d6 = 120;
        } else {
            switch (pingType) {
            case 3:
                var_d78856cb402135f0 = @"hash_abe00a149eb51fc0";
                var_783c6aee0e4019d6 = 15;
                break;
            case 2:
            case 17:
                var_d78856cb402135f0 = @"hash_7c74d4814e0665d5";
                var_783c6aee0e4019d6 = 120;
                break;
            case 4:
                var_1f903310e7279e39 = @"hash_f2b483d963525879";
                var_783c6aee0e4019d6 = 120;
                break;
            case 6:
                var_d78856cb402135f0 = @"hash_d25a3e0be5e90c21";
                var_783c6aee0e4019d6 = 60;
                break;
            case 5:
                var_d78856cb402135f0 = @"hash_4da39a287b93388c";
                var_783c6aee0e4019d6 = 30;
                break;
            case 12:
                var_d78856cb402135f0 = @"hash_dcab804f9c532b7f";
                var_783c6aee0e4019d6 = 9;
                break;
            default:
                /#
                    assertmsg("CalloutMarkerPing: " + "need a proper type for death timeouts! Can't use: " + pingType);
                #/
                var_783c6aee0e4019d6 = 2;
                break;
            }
        }
        if (isdefined(var_d78856cb402135f0) && isdefined(waittime)) {
            waittime = getdvarfloat(var_d78856cb402135f0, waittime);
        } else if (isdefined(var_d78856cb402135f0)) {
            waittime = getdvarfloat(var_d78856cb402135f0, var_783c6aee0e4019d6);
        } else {
            waittime = var_783c6aee0e4019d6;
        }
    }
    return waittime;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0e
// Size: 0x5c
function function_76ecf74c7d722b52(pingType) {
    player = self;
    if (isdefined(player)) {
        for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
            isowner = player function_1e008bf9d31b2b01(var_394466c2ddb208cb);
            if (isowner && pingType == player calloutmarkerping_gettype(var_394466c2ddb208cb)) {
                return var_394466c2ddb208cb;
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c71
// Size: 0x5c
function function_4e740f30357c2c3a(var_f4ce1797c79492d1) {
    player = self;
    if (isdefined(player)) {
        for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
            isowner = player function_1e008bf9d31b2b01(var_394466c2ddb208cb);
            if (isowner && var_f4ce1797c79492d1 == player function_dbea4c5599dd67de(var_394466c2ddb208cb)) {
                return var_394466c2ddb208cb;
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd4
// Size: 0x544
function _calloutmarkerping_predicted_timeout(var_394466c2ddb208cb) {
    player = self;
    /#
        assert(player function_1e008bf9d31b2b01(var_394466c2ddb208cb));
    #/
    player notify("predictiveCalloutResetTimeout_" + var_394466c2ddb208cb);
    pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
    level endon("game_ended");
    player endon("disconnect");
    player endon("predictiveCalloutResetTimeout_" + var_394466c2ddb208cb);
    player endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    waittime = 2;
    var_93b12c2dce7c2aa8 = undefined;
    var_19cc31e0fdf2a990 = 0;
    if (function_d3789a9a4be5df2e(pingType)) {
        ent = player calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(ent)) {
            var_19cc31e0fdf2a990 = getdvarint(@"hash_c022bd4a1215cd2c", 1);
            if (var_19cc31e0fdf2a990 && _calloutmarkerping_isenemy(ent, player)) {
                if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
                    waittime = getdvarfloat(@"hash_dafd6b4196557939", 0);
                } else if (isdefined(level.lootleaders) && namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "kingslayer" && array_contains(level.lootleaders, ent)) {
                    waittime = getdvarfloat(@"hash_736f9d37695743d5", 0);
                } else {
                    waittime = getdvarfloat(@"hash_eac22abe7a18c2d3", 3);
                }
                var_93b12c2dce7c2aa8 = ent;
            }
            if (_calloutmarkerping_isenemy(ent, player) && isagent(ent)) {
                waittime = getdvarfloat(@"hash_dcab804f9c532b7f", 9);
                var_93b12c2dce7c2aa8 = ent;
            }
            if (pingType == 6) {
                player thread calloutmarkerping_removevehiclecalloutonspecialconditions(var_394466c2ddb208cb, ent);
            }
            player thread function_632cc7f8cbf11ae1(var_394466c2ddb208cb, ent);
        }
    } else if (function_c648f0fd527e089a(pingType)) {
        var_d9d7f39e028cee38 = player calloutmarkerping_getent(var_394466c2ddb208cb);
        player thread calloutmarkerping_watchscriptabledeath(var_394466c2ddb208cb, var_d9d7f39e028cee38);
        if (pingType == 20) {
            if (!player isspectatingplayer()) {
                player thread function_1efe712c746d3ca1(var_394466c2ddb208cb);
            }
        }
    } else if (pingType == 2) {
        if (getdvarint(@"hash_a20128c96ee00a7", 0)) {
            player thread calloutmarkerping_navigationcancelproximity(var_394466c2ddb208cb);
        }
    } else if (pingType == 4) {
        var_93bc7962739fd49e = self calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
        /#
            assert(isint(var_93bc7962739fd49e));
        #/
        if (var_93bc7962739fd49e == -1) {
            /#
                assertmsg("CalloutMarkerPing: " + "watchWhenMissionCompletes didn't receive a proper gscObjectiveIndex. Removing ping as a precaution.");
            #/
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
        } else {
            player thread calloutmarkerping_watchwhenobjectivestartsprogress(var_394466c2ddb208cb, var_93bc7962739fd49e);
            player thread calloutmarkerping_watchwhenobjectivedeleted(var_394466c2ddb208cb, var_93bc7962739fd49e);
        }
    } else if (pingType == 5) {
        player thread calloutmarkerping_watchplayerdeathordisconnect(var_394466c2ddb208cb);
        var_f4ce1797c79492d1 = player function_dbea4c5599dd67de(var_394466c2ddb208cb);
        if (var_f4ce1797c79492d1 == 5) {
            var_d9d7f39e028cee38 = player calloutmarkerping_getent(var_394466c2ddb208cb);
            player thread calloutmarkerping_watchscriptabledeath(var_394466c2ddb208cb, var_d9d7f39e028cee38);
        }
    }
    if (!isdefined(var_93b12c2dce7c2aa8)) {
        var_d9d7f39e028cee38 = player calloutmarkerping_getent(var_394466c2ddb208cb);
        waittime = player function_d0006d07465a279c(var_394466c2ddb208cb, pingType, var_d9d7f39e028cee38);
        if (getdvarint(@"hash_94055f5243eb5fa0", 1)) {
            if (isdefined(var_d9d7f39e028cee38) && isdefined(var_d9d7f39e028cee38.type)) {
                if (issubstr(var_d9d7f39e028cee38.type, "ob_loot_cache")) {
                    waittime = 60;
                } else if (isdefined(var_d9d7f39e028cee38.var_a2738a1d42906829) || isdefined(var_d9d7f39e028cee38.var_2f5d509d7b71ce9a) && isdefined(var_d9d7f39e028cee38.var_2f5d509d7b71ce9a.var_b189a678c1c3489a)) {
                    waittime = 0;
                } else {
                    switch (var_d9d7f39e028cee38.type) {
                    case #"hash_c4e1cdfcbfebe45e":
                        waittime = 120;
                        break;
                    case #"hash_4cfd32bbd2544dc2":
                    case #"hash_69b00973eec22e7e":
                    case #"hash_8dc697e88cc411b2":
                    case #"hash_a862ca2b6614f16e":
                    case #"hash_f1b7e128d54c7c3e":
                        waittime = 60;
                        break;
                    case #"hash_9345a268cf04e0e4":
                    case #"hash_a5a46576f54f77c8":
                    case #"hash_c7ea6790348315ee":
                    case #"hash_c9a0fc3f2f68ed28":
                    case #"hash_d6b5e1486d1ce81d":
                    case #"hash_d7d80055b86bb6e0":
                    case #"hash_debe4d6797ce42ca":
                        waittime = 0;
                        break;
                    }
                }
            } else if (isdefined(var_d9d7f39e028cee38) && istrue(var_d9d7f39e028cee38.var_4a4265af0a6f92e9)) {
                waittime = 120;
            }
        }
        if (waittime == 0 || isdefined(var_d9d7f39e028cee38) && istrue(var_d9d7f39e028cee38.var_e601ad111c029b9e)) {
            return;
        }
    }
    _calloutmarkerping_predicted_log("Setup Timeout | wait: " + waittime + " | pingIndex: " + var_394466c2ddb208cb + " | Type: " + pingType);
    wait(waittime);
    if (isdefined(var_93b12c2dce7c2aa8) && isdefined(player) && isalive(var_93b12c2dce7c2aa8) && pingType == 9 && var_19cc31e0fdf2a990) {
        player thread calloutmarkerping_enemytodangerdecaycreate(var_394466c2ddb208cb, var_93b12c2dce7c2aa8);
    } else {
        _calloutmarkerping_predicted_log("Ping Timeout | pingIndex: " + var_394466c2ddb208cb + " | Type: " + pingType);
        var_d9d7f39e028cee38 = player calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(var_d9d7f39e028cee38) && isdefined(var_d9d7f39e028cee38.var_139629996ea22b5) && isdefined(var_d9d7f39e028cee38.var_139629996ea22b5[player getentitynumber()])) {
            var_d9d7f39e028cee38.var_139629996ea22b5[player getentitynumber()] = undefined;
        }
        player calloutmarkerping_removecallout(var_394466c2ddb208cb);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321f
// Size: 0x4e
function _calloutmarkerping_predicted_isanypingactive() {
    player = self;
    for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
        isowner = player function_1e008bf9d31b2b01(var_394466c2ddb208cb);
        if (isowner && player calloutmarkerping_getactive(var_394466c2ddb208cb)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3275
// Size: 0x68
function private function_5a0bc132b2dd3f65() {
    var_93a0836a10e99c34 = self;
    level endon("game_ended");
    var_93a0836a10e99c34 endon("disconnect");
    while (1) {
        optionalarg = var_394466c2ddb208cb = notification = var_93a0836a10e99c34 waittill("luinotifyserver");
        if (!isdefined(notification) || !isdefined(var_394466c2ddb208cb)) {
            continue;
        }
        var_93a0836a10e99c34 function_a1d53ca27932b96d(notification, var_394466c2ddb208cb, optionalarg);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32e4
// Size: 0x1e5
function function_a1d53ca27932b96d(notification, var_394466c2ddb208cb, optionalarg) {
    /#
        assert(isdefined(notification));
    #/
    var_93a0836a10e99c34 = self;
    var_7cd970f4af82282c = "Notification ( " + notification + " )";
    if (isdefined(var_394466c2ddb208cb)) {
        var_7cd970f4af82282c = var_7cd970f4af82282c + " | pingIndex: " + var_394466c2ddb208cb;
    }
    if (isdefined(optionalarg)) {
        var_7cd970f4af82282c = var_7cd970f4af82282c + " | optionalArg: " + optionalarg;
    }
    _calloutmarkerping_predicted_log(var_7cd970f4af82282c);
    switch (notification) {
    case #"hash_bf30d88fa3f51a24":
        var_93a0836a10e99c34 function_2a664ee5c40e868c(var_394466c2ddb208cb);
        break;
    case #"hash_8848543b86c481ce":
        var_93a0836a10e99c34 function_49dc8767adf81886(var_394466c2ddb208cb, optionalarg, 0);
        break;
    case #"hash_48958d4f7bdc5cca":
        var_93a0836a10e99c34 function_49dc8767adf81886(var_394466c2ddb208cb, optionalarg, 1);
        break;
    case #"hash_58db4293949d3d7e":
        var_e5a656eb53015664 = getentbynum(optionalarg);
        /#
            assert(isplayer(var_e5a656eb53015664));
        #/
        var_93a0836a10e99c34 function_45be7f9c916948b6(var_394466c2ddb208cb, var_e5a656eb53015664);
        break;
    case #"hash_40d28501f6704035":
        var_e5a656eb53015664 = getentbynum(optionalarg);
        /#
            assert(isplayer(var_e5a656eb53015664));
        #/
        var_93a0836a10e99c34 function_85bd27e859eec16c(var_394466c2ddb208cb, var_e5a656eb53015664);
        break;
    case #"hash_11ea00e1a93830a7":
        var_93a0836a10e99c34 function_5d665c2bc1e250fa(var_394466c2ddb208cb);
        break;
    case #"hash_5c8ca9abdd242c53":
        var_93a0836a10e99c34 function_99811a65af9a351();
        break;
    case #"hash_f17ec76eaa0b19da":
        var_93a0836a10e99c34 function_5418b333a8e1cf76(var_394466c2ddb208cb);
        break;
    case #"hash_7235872539b9e722":
        function_f9a23942c0cd9461(var_93a0836a10e99c34, var_394466c2ddb208cb);
        break;
    case #"hash_3fe3f4975cc1fe19":
        if ([[ getsharedfunc("teamAssim", "isWaitingForAssimResponse") ]](var_93a0836a10e99c34)) {
            [[ getsharedfunc("teamAssim", "resolveAssimRequest") ]](var_93a0836a10e99c34, var_394466c2ddb208cb);
        }
        break;
    default:
        break;
    }
    var_93a0836a10e99c34 notify("calloutmarkerping_notifyhandled", notification);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34d0
// Size: 0x50
function calloutmarkerping_initplayer() {
    player = self;
    if (!isdefined(player.calloutmarkerpingvohandlerpool)) {
        player.calloutmarkerpingvohandlerpool = [];
    }
    if (!isdefined(player.var_3a9aaf3e5a5c0b5)) {
        player.var_3a9aaf3e5a5c0b5 = [];
    }
    player thread function_5a0bc132b2dd3f65();
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3527
// Size: 0x19
function _calloutmarkerping_scriptableisusable(var_db376ee90688810d) {
    if (!isdefined(var_db376ee90688810d)) {
        return 0;
    }
    return var_db376ee90688810d function_6954a8d7ba8cd9fb();
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3548
// Size: 0x58
function function_cb9269a1545ad6e4(ent) {
    if (isdefined(ent.var_566868292ee2a1b)) {
        ent = ent.var_566868292ee2a1b;
    }
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isdefined(ent.var_47bde44b1acec603)) {
        return 0;
    }
    if (ent.var_47bde44b1acec603 == "") {
        return 0;
    }
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a8
// Size: 0x84
function _calloutmarkerping_isenemy(ent, player) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isplayer(ent) && !isagent(ent)) {
        return 0;
    }
    if (!isdefined(ent.team)) {
        return 0;
    }
    if (ent.team == "neutral" || ent.team == "civilian") {
        return 0;
    }
    return ent.team != player.team;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3634
// Size: 0x6d
function _calloutmarkerping_isplunderextract(ent) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isent(ent)) {
        return (issubstr(ent.type, "brloot_plunder_extraction") || issubstr(ent.type, "equip_fulton_mp"));
    }
    if (!isdefined(ent.model)) {
        return 0;
    }
    return ent.model == "military_skyhook_far";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a9
// Size: 0xd0
function _calloutmarkerping_isdropcrate(ent) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isent(ent)) {
        return 0;
    }
    if (!isdefined(ent.cratetype)) {
        return 0;
    }
    if (istrue(ent.var_28eb33ffd1aa3e63)) {
        return 1;
    }
    return ent.cratetype == "battle_royale_loadout" || ent.cratetype == "battle_royale_chopper_loot" || ent.cratetype == "battle_royale_c130_loot" || ent.cratetype == "killstreak" || ent.cratetype == "battle_royale_juggernaut" || ent.cratetype == "juggernaut" || ent.cratetype == "manual_turret";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3781
// Size: 0x2d
function calloutmarkerping_ismunitionsbox(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "equip_munitionsbox";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b6
// Size: 0x2d
function function_3c11e6303c59cb37(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "equip_utilitybox";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37eb
// Size: 0x2d
function function_ab2631f444db868(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "equip_trophy";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3820
// Size: 0x2d
function function_23c0a0bd88667b79(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "sound_veil_mp";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3855
// Size: 0x2d
function function_faba04054d6e029a(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "sonar_pulse_mp";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388a
// Size: 0x2d
function function_3f392603242529ba(ent) {
    return isdefined(ent.equipmentref) && ent.equipmentref == "equip_deployed_decoy";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bf
// Size: 0x32
function function_32bfb4f432f417f(ent) {
    return isdefined(ent.streakinfo) && isdefined(ent.streakinfo.airdroptype);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f9
// Size: 0x32
function function_a1b34a5b82e7a92e(ent) {
    return isdefined(ent.classname) && string_starts_with(ent.classname, "weapon");
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3933
// Size: 0x36
function _calloutmarkerping_iskiosk(ent) {
    if (!isdefined(ent)) {
        return 0;
    }
    if (!ent getscriptableisloot()) {
        return 0;
    }
    if (ent.type != "br_plunder_box") {
        return 0;
    }
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3971
// Size: 0x89
function function_abff9f14e6d75a76(ent) {
    if (isagent(ent)) {
        return 0;
    }
    if (!isdefined(ent)) {
        return 0;
    }
    if (!isent(ent)) {
        return 0;
    }
    return issubstr(ent.classname, "grenade") || issubstr(ent.classname, "c4_") || issubstr(ent.classname, "proximity_explosive_") || issubstr(ent.classname, "claymore_");
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a02
// Size: 0x59
function calloutmarkerping_canplayerping(player, var_f1c1336c7bbe5fe0) {
    if (player iscodcaster() || player isspectatingplayer()) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (istrue(player.mapmarkermodeenabled) && !isdefined(var_f1c1336c7bbe5fe0)) {
        return 0;
    }
    if (player isusingremote()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a63
// Size: 0xbd
function function_3087d1219984f7f1(lootid) {
    if (isdefined(level.var_6bb18d8a44b66427)) {
        return [[ level.var_6bb18d8a44b66427 ]](lootid);
    }
    var_39f686831584c7e6 = getscriptbundle(%"hash_4074433960d5a78c");
    /#
        assert(isdefined(var_39f686831584c7e6));
    #/
    var_60ce74182e7c83a7 = function_3475769c002400f7(lootid);
    var_db96936d84ec563b = "calloutmarkerpingitem:" + var_60ce74182e7c83a7.var_cb325ddb4a764623;
    calloutmarkerpingitem = getscriptbundle(var_db96936d84ec563b);
    if (isdefined(calloutmarkerpingitem) && isdefined(calloutmarkerpingitem.var_c4e1d2ee105cfd3b)) {
        return calloutmarkerpingitem.var_c4e1d2ee105cfd3b;
    }
    logprint("CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid);
    return undefined;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b28
// Size: 0x1b0
function function_442948452e540d3e(lootid) {
    var_d3eb0030de8df73e = function_3bc031ab2f635f8c(lootid);
    if (var_d3eb0030de8df73e == "calloutmarkerpingitem") {
        return function_3087d1219984f7f1(lootid);
    } else {
        if (istrue(level.var_a9350d89a2e4d752)) {
            var_30e078555972e3b8 = level.br_pickups.var_832ad168567520f7[lootid];
            if (isdefined(var_30e078555972e3b8) && var_30e078555972e3b8 != "") {
                return function_1823ff50bb28148d(var_30e078555972e3b8);
            } else if (var_d3eb0030de8df73e == #"weapon") {
                weaponname = level.br_pickups.var_b13dc7e63676bbe7[lootid];
                return function_8d17e607a79fd65f(weaponname);
            }
        } else if (isdefined(level.brloottablename)) {
            var_44044f276471d2bb = tablelookuprownum(level.brloottablename, 5, lootid);
            if (var_44044f276471d2bb >= 0) {
                var_30e078555972e3b8 = tablelookupbyrow(level.brloottablename, var_44044f276471d2bb, 29);
                if (isdefined(var_30e078555972e3b8) && var_30e078555972e3b8 != "") {
                    return var_30e078555972e3b8;
                } else if (var_d3eb0030de8df73e == "weapon") {
                    weaponname = tablelookupbyrow(level.brloottablename, var_44044f276471d2bb, 1);
                    return function_8d17e607a79fd65f(weaponname);
                }
            } else if (utility::issharedfuncdefined("game", "getBundleNameFromLootID")) {
                var_fbe755f0978c0369 = [[ utility::getsharedfunc("game", "getBundleNameFromLootID") ]](lootid);
                if (isdefined(var_fbe755f0978c0369)) {
                    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                    if (isdefined(itembundle) && isdefined(itembundle.var_317afc5dabc1c012)) {
                        return itembundle.var_317afc5dabc1c012;
                    }
                }
            }
        }
        return #"ping_loot_generic";
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cdf
// Size: 0x286
function function_d1c8c0f877165808(lootid) {
    var_92fce7b1696254e3 = "";
    if (utility::issharedfuncdefined("game", "getBundleNameFromLootID")) {
        var_92fce7b1696254e3 = "";
        var_fbe755f0978c0369 = [[ utility::getsharedfunc("game", "getBundleNameFromLootID") ]](lootid);
        if (isdefined(var_fbe755f0978c0369)) {
            itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
            if (isdefined(itembundle) && isdefined(itembundle.baseweapon)) {
                var_92fce7b1696254e3 = itembundle.baseweapon;
            }
        }
    } else if (istrue(level.var_a9350d89a2e4d752)) {
        if (isdefined(level.br_pickups.var_b13dc7e63676bbe7[lootid])) {
            itemname = level.br_pickups.var_b13dc7e63676bbe7[lootid];
            if (isdefined(itemname) && isdefined(level.br_lootiteminfo[itemname]) && isdefined(level.br_lootiteminfo[itemname].baseweapon)) {
                var_92fce7b1696254e3 = level.br_lootiteminfo[itemname].baseweapon;
            }
        }
    } else {
        /#
            assert(isdefined(level.brloottablename));
        #/
        var_92fce7b1696254e3 = tablelookup(level.brloottablename, 5, lootid, 8);
    }
    var_cce9361200c5117c = namespace_e0ee43ef2dddadaa::function_c9af9fe37668df2(var_92fce7b1696254e3);
    if (isdefined(var_cce9361200c5117c)) {
        switch (var_cce9361200c5117c) {
        case #"hash_fa18d2f6bd57925a":
            return #"hash_6441432d931347cd";
        case #"hash_fa50b9f6bd82f79d":
            return #"hash_11efaf925e9c7e43";
        case #"hash_fa27b9f6bd62a3f2":
            return #"hash_c62b1c92c4397e9a";
        case #"hash_fa50b4f6bd82efbe":
            return #"hash_c2a31b765dc5eabc";
        case #"hash_fa50b6f6bd82f2e4":
            return #"hash_226bf222dc8c769d";
        case #"hash_fa0ed9f6bd4f4e9a":
            return #"hash_81eeb1929ddfc2a9";
        case #"hash_fa4dbdf6bd80bf52":
            return #"hash_156d3011ce7f63e5";
        case #"hash_fa27bdf6bd62aa3e":
            return #"hash_6bc99a3b53f92ba";
        case #"hash_fa24ddf6bd609e07":
            if (issubstr(var_92fce7b1696254e3, "riotshield")) {
                return #"hash_d89b5d4e0ffaa25d";
                goto LOC_000001dc;
            }
            return #"hash_cb9999bd61ccf0ee";
        default:
        LOC_000001dc:
            logprint("CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid);
            return undefined;
            break;
        }
    } else {
        logprint("CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid);
        return undefined;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6c
// Size: 0x242
function function_40a8426c1f049004(lootid) {
    var_d3eb0030de8df73e = function_3bc031ab2f635f8c(lootid);
    if (var_d3eb0030de8df73e == "calloutmarkerpingitem") {
        return function_3087d1219984f7f1(lootid);
    } else {
        var_2c50b12fee8841c9 = "";
        if (utility::issharedfuncdefined("game", "getBundleNameFromLootID")) {
            var_fbe755f0978c0369 = [[ utility::getsharedfunc("game", "getBundleNameFromLootID") ]](lootid);
            if (isdefined(var_fbe755f0978c0369)) {
                itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                if (isdefined(itembundle) && isdefined(itembundle.type)) {
                    var_2c50b12fee8841c9 = function_1823ff50bb28148d(itembundle.type);
                }
            }
        } else if (istrue(level.var_a9350d89a2e4d752)) {
            if (isdefined(level.br_pickups.var_b13dc7e63676bbe7[lootid])) {
                itemname = level.br_pickups.var_b13dc7e63676bbe7[lootid];
                if (isdefined(itemname) && isdefined(level.br_pickups.br_itemtype[itemname])) {
                    var_2c50b12fee8841c9 = level.br_pickups.br_itemtype[itemname];
                }
            }
        } else {
            /#
                assert(isdefined(level.brloottablename));
            #/
            var_2c50b12fee8841c9 = tablelookup(level.brloottablename, 5, lootid, 2);
        }
        switch (var_2c50b12fee8841c9) {
        case #"hash_59b8e9d05b31ff9":
        case #"plunder":
            return #"hash_ad67c90bd02e70b4";
        default:
            scriptablename = function_53c4c53197386572(namespace_38b993c4618e76cd::getScriptableFromLootID(lootid), "");
            switch (scriptablename) {
            case #"hash_1cd9ffa488237604":
                return #"hash_dfbada2220a5a84a";
            case #"hash_672892a4af1e94cc":
                return #"hash_a4a8c0a0a1357b15";
            case #"hash_f1734c15f85881ca":
                return #"hash_31535f4a432b583d";
            case #"hash_57e5eda4a702c559":
                return #"hash_b876b92d2e364260";
            case #"hash_755a9bafcd63b343":
                return #"hash_b2152edf398f29d7";
            default:
                break;
            }
            break;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b5
// Size: 0x3a5
function function_f4293e5a97e51d76(lootid) {
    var_d3eb0030de8df73e = function_3bc031ab2f635f8c(lootid);
    if (var_d3eb0030de8df73e == "calloutmarkerpingitem") {
        return function_3087d1219984f7f1(lootid);
    } else {
        var_2c50b12fee8841c9 = "";
        if (utility::issharedfuncdefined("game", "getBundleNameFromLootID")) {
            var_fbe755f0978c0369 = [[ utility::getsharedfunc("game", "getBundleNameFromLootID") ]](lootid);
            if (isdefined(var_fbe755f0978c0369)) {
                itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                if (isdefined(itembundle) && isdefined(itembundle.type)) {
                    var_2c50b12fee8841c9 = function_1823ff50bb28148d(itembundle.type);
                }
            }
        } else if (istrue(level.var_a9350d89a2e4d752)) {
            if (isdefined(level.br_pickups.var_b13dc7e63676bbe7[lootid])) {
                itemname = level.br_pickups.var_b13dc7e63676bbe7[lootid];
                if (isdefined(itemname) && isdefined(level.br_pickups.br_itemtype[itemname])) {
                    var_2c50b12fee8841c9 = level.br_pickups.br_itemtype[itemname];
                }
            }
        } else {
            /#
                assert(isdefined(level.brloottablename));
            #/
            var_2c50b12fee8841c9 = function_1823ff50bb28148d(tablelookup(level.brloottablename, 5, lootid, 2));
        }
        switch (var_2c50b12fee8841c9) {
        case #"weapon":
            return function_d1c8c0f877165808(lootid);
        case #"lethal":
            return #"hash_9e388e6ace07d134";
        case #"tactical":
            return #"hash_527f18a9a3dc8433";
        case #"revive":
            return #"hash_f943577880ca24e0";
        case #"plunder":
        case #"currency":
            return #"hash_7c03e32ab0a4310e";
        case #"killstreak":
            return #"hash_5982a0b9bd7a5629";
        case #"super":
            return #"hash_4990dd9059fd943";
        case #"key":
            return #"hash_f3fb4b644e42aff8";
        case #"keycard":
            return #"hash_c67d85ebdf3423d6";
        case #"dogtag":
            return #"hash_b49586fdf063238b";
        case #"valuable":
            return #"hash_80947d079e88db1b";
        case #"armor":
            return #"hash_8f0da2f929b5e678";
        case #"gasmask":
            return #"hash_b3e904aa1e989d76";
        default:
            scriptablename = function_53c4c53197386572(namespace_38b993c4618e76cd::getScriptableFromLootID(lootid), "");
            switch (scriptablename) {
            case #"hash_55798564991651ac":
                return #"hash_8f0da2f929b5e678";
            case #"hash_1cd9ffa488237604":
                return #"hash_9fd48685f78dcce5";
            case #"hash_672892a4af1e94cc":
                return #"hash_139b0bd39823ad92";
            case #"hash_f1734c15f85881ca":
                return #"hash_7655b388c76711c4";
            case #"hash_57e5eda4a702c559":
                return #"hash_6bdad0211b2b864e";
            case #"hash_755a9bafcd63b343":
                return #"hash_6db132798ddbf954";
            case #"hash_1b71e2c3430cd301":
            case #"hash_2d1a1b811aed6b26":
            case #"hash_d01e387e6d238502":
                return #"hash_b3e904aa1e989d76";
            default:
                logprint("CalloutMarkerPing: " + "Could not get request VO for loot ID " + lootid);
                return undefined;
                break;
            }
            break;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4561
// Size: 0x99
function function_2f7ac61ee301ea30(var_bb224cee75d433a2, lootid) {
    switch (var_bb224cee75d433a2) {
    case 22:
        return function_40a8426c1f049004(lootid);
    case 28:
        return function_f4293e5a97e51d76(lootid);
    case 17:
    case 23:
    case 24:
    case 25:
        return function_442948452e540d3e(lootid);
    default:
        /#
            assertmsg("LootIDPingVO: Could not get request VO for loot ID.");
        #/
        return undefined;
        break;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4601
// Size: 0x205
function function_1e8231aee9e6076b(var_41a4a181b6606b16) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    var_70b1f16774d513d5 = undefined;
    switch (var_41a4a181b6606b16) {
    case 22:
    case 23:
    case 28:
        var_70b1f16774d513d5 = spawnstruct();
        var_70b1f16774d513d5.object = player;
        var_70b1f16774d513d5.index = player getentitynumber();
        var_70b1f16774d513d5.origin = (0, 0, 0);
        break;
    case 17:
        /#
            assert(isdefined(player.br_kiosk) || isdefined(player.var_59a9ea269513a828));
        #/
        kiosk = function_53c4c53197386572(player.br_kiosk, player.var_59a9ea269513a828);
        var_70b1f16774d513d5 = spawnstruct();
        var_70b1f16774d513d5.object = kiosk;
        var_70b1f16774d513d5.index = kiosk.index;
        var_70b1f16774d513d5.origin = kiosk.origin;
        break;
    case 24:
    case 25:
        if (!isdefined(player.var_2fa5b49969def47)) {
            break;
        }
        var_70b1f16774d513d5 = spawnstruct();
        var_70b1f16774d513d5.object = player.var_2fa5b49969def47;
        var_70b1f16774d513d5.index = player.var_2fa5b49969def47.index;
        var_70b1f16774d513d5.origin = player.var_2fa5b49969def47.origin;
        break;
    case 0:
    case 2:
        break;
    default:
        /#
            assertmsg("LootIDPing: Could not get scriptable index because asset type is not defined.");
        #/
        break;
    }
    return var_70b1f16774d513d5;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x480e
// Size: 0xc9
function private function_b2c7cf2679976cc2(var_41a4a181b6606b16, object) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    switch (var_41a4a181b6606b16) {
    case 17:
    case 24:
    case 25:
        object function_6bc4f6b579285f79(player, 1, 1);
        waitframe();
        break;
    case 0:
    case 2:
    case 22:
    case 23:
    case 28:
        break;
    default:
        /#
            assertmsg("LootIDPing: Could not prepare object because asset type is not defined.");
        #/
        break;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48de
// Size: 0x84
function function_22a98596c2f7f9ef(object, player, lootid) {
    var_da07265f8351bd9e = player function_368af07f7897fd79(5);
    if (var_da07265f8351bd9e) {
        var_394466c2ddb208cb = player function_76ecf74c7d722b52(5);
        var_e14ff7e54e23b1ba = player calloutmarkerping_getent(var_394466c2ddb208cb);
        if (object == var_e14ff7e54e23b1ba) {
            if (isdefined(lootid)) {
                var_93e35211ae22777a = player function_c4e0716fbd549e2d(var_394466c2ddb208cb);
                if (lootid == var_93e35211ae22777a) {
                    return var_394466c2ddb208cb;
                }
            } else {
                return var_394466c2ddb208cb;
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496a
// Size: 0xcc
function function_6a4a22b07cd4a96f(object, team, lootid) {
    /#
        assert(isdefined(level.teamdata[team]));
    #/
    /#
        assert(isdefined(level.teamdata[team]["players"]));
    #/
    teammembers = level.teamdata[team]["players"];
    foreach (member in teammembers) {
        var_394466c2ddb208cb = function_22a98596c2f7f9ef(object, member, lootid);
        if (isdefined(var_394466c2ddb208cb)) {
            return var_394466c2ddb208cb;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3e
// Size: 0xef
function function_faa3cbec7243fe72() {
    player = self;
    var_26f4287f15a26580 = player.br_kiosk;
    var_76345a9e73e6de87 = player.var_59a9ea269513a828;
    var_2a4ca7d150630600 = player.var_2fa5b49969def47;
    if (isdefined(var_26f4287f15a26580) && isdefined(function_6a4a22b07cd4a96f(var_26f4287f15a26580, player.team))) {
        player setclientomnvar("ui_show_lootid_item_pings", 1);
        return;
    }
    if (isdefined(var_76345a9e73e6de87) && isdefined(function_6a4a22b07cd4a96f(var_76345a9e73e6de87, player.team))) {
        player setclientomnvar("ui_show_lootid_item_pings", 1);
        return;
    }
    if (isdefined(var_2a4ca7d150630600) && isdefined(function_6a4a22b07cd4a96f(var_2a4ca7d150630600, player.team)) && isdefined(var_2a4ca7d150630600.var_139629996ea22b5)) {
        player setclientomnvar("ui_show_lootid_item_pings", 1);
        return;
    }
    player setclientomnvar("ui_show_lootid_item_pings", 0);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b34
// Size: 0xa5
function function_6c9b8f9429b7fdca(team) {
    /#
        assert(isdefined(level.teamdata[team]));
    #/
    /#
        assert(isdefined(level.teamdata[team]["players"]));
    #/
    teammembers = level.teamdata[team]["players"];
    foreach (member in teammembers) {
        member function_faa3cbec7243fe72();
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be0
// Size: 0x14c
function function_a3cb3fa19d3d1d11(var_e14ff7e54e23b1ba, var_41a4a181b6606b16, var_93e35211ae22777a) {
    player = self;
    var_da07265f8351bd9e = player function_368af07f7897fd79(5);
    if (var_da07265f8351bd9e) {
        var_4d0dd5009aed72de = player function_76ecf74c7d722b52(5);
        /#
            assert(isdefined(var_4d0dd5009aed72de));
        #/
        var_10dd7119141cc69 = player calloutmarkerping_getent(var_4d0dd5009aed72de);
        var_bbb883cee81e54cb = player function_a7e757d42b550a6(var_4d0dd5009aed72de);
        var_645600fdeaf0aff1 = player function_c4e0716fbd549e2d(var_4d0dd5009aed72de);
        var_3e6eb5bc2a5c6f9c = var_41a4a181b6606b16 == 22 || var_41a4a181b6606b16 == 23 || var_41a4a181b6606b16 == 28;
        var_64de9aff64436066 = getdvarint(@"hash_a6d8c43504ab97df", 0);
        if (!var_3e6eb5bc2a5c6f9c || var_64de9aff64436066) {
            player calloutmarkerping_removecallout(var_4d0dd5009aed72de);
        }
        var_f19d25ce7fcf3460 = var_e14ff7e54e23b1ba == var_10dd7119141cc69 && var_41a4a181b6606b16 == var_bbb883cee81e54cb && var_93e35211ae22777a == var_645600fdeaf0aff1;
        var_3bc390b8f1b2f96b = getdvarint(@"hash_a6d8c43504ab97df", 0);
        if (var_f19d25ce7fcf3460 && (!var_3e6eb5bc2a5c6f9c || var_3bc390b8f1b2f96b)) {
            player calloutmarkerping_playteamsoundfx("uin_ping_cancel", var_4d0dd5009aed72de);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d34
// Size: 0x1eb
function function_1ced737a22161a49(var_41a4a181b6606b16, lootid) {
    player = self;
    if (!calloutmarkerping_canplayerping(player)) {
        return;
    }
    var_6b10a57d86c5874a = player function_1e8231aee9e6076b(var_41a4a181b6606b16);
    if (isdefined(var_6b10a57d86c5874a)) {
        if (function_a3cb3fa19d3d1d11(var_6b10a57d86c5874a.object, var_41a4a181b6606b16, lootid)) {
            function_6c9b8f9429b7fdca(player.team);
            return;
        }
        function_b2c7cf2679976cc2(var_41a4a181b6606b16, var_6b10a57d86c5874a.object);
        var_394466c2ddb208cb = player calloutmarkerping_createcallout(var_41a4a181b6606b16, var_6b10a57d86c5874a.origin, var_6b10a57d86c5874a.index, lootid);
        if (isdefined(var_6b10a57d86c5874a.object) && isdefined(var_6b10a57d86c5874a.object.var_46a3a8565ac0c17c)) {
            if (!isdefined(var_6b10a57d86c5874a.object.var_139629996ea22b5)) {
                var_6b10a57d86c5874a.object.var_139629996ea22b5 = [];
            }
            entnum = player getentitynumber();
            if (!isdefined(var_6b10a57d86c5874a.object.var_139629996ea22b5[entnum])) {
                var_6b10a57d86c5874a.object.var_139629996ea22b5[entnum] = spawnstruct();
            }
            var_6b10a57d86c5874a.object.var_139629996ea22b5[entnum].var_93a0836a10e99c34 = player;
            var_6b10a57d86c5874a.object.var_139629996ea22b5[entnum].var_394466c2ddb208cb = var_394466c2ddb208cb;
            var_6b10a57d86c5874a.object.var_139629996ea22b5[entnum].lootid = lootid;
        }
        player thread _calloutmarkerping_predicted_timeout(var_394466c2ddb208cb);
        player thread function_6b813a30256c8bc7(var_41a4a181b6606b16, lootid);
        function_6c9b8f9429b7fdca(player.team);
        player calloutmarkerping_playteamsoundfx("uin_ping_item", var_394466c2ddb208cb);
        return var_394466c2ddb208cb;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f26
// Size: 0x75
function function_6b813a30256c8bc7(var_41a4a181b6606b16, lootid) {
    player = self;
    wait(getdvarfloat(@"hash_355f123c0bff2170", 0.5));
    var_5ab0dc648937d4ea = function_2f7ac61ee301ea30(var_41a4a181b6606b16, lootid);
    if (isdefined(var_5ab0dc648937d4ea) && isdefined(player)) {
        var_394466c2ddb208cb = player function_368af07f7897fd79(5);
        if (isdefined(var_394466c2ddb208cb)) {
            player calloutmarkerpingvo_play(var_5ab0dc648937d4ea, 5);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fa2
// Size: 0x64
function _calloutmarkerping_checkforbuybackrequest(var_394466c2ddb208cb) {
    player = self;
    if (isalive(player)) {
        return;
    }
    pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
    if (!function_c648f0fd527e089a(pingType)) {
        return;
    }
    instance = player calloutmarkerping_getent(var_394466c2ddb208cb);
    if (!_calloutmarkerping_iskiosk(instance)) {
        return;
    }
    player notify("buybackRequested");
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x500d
// Size: 0x5d
function function_2ecdd6eb53bbd808(pingType, var_394466c2ddb208cb) {
    player = self;
    if (function_87df78670540e9b2(pingType)) {
        var_7a183ae28b9c66f5 = player function_a7e757d42b550a6(var_394466c2ddb208cb);
        return player function_31f315111c6a03c2(var_7a183ae28b9c66f5);
    } else {
        /#
            assertmsg("CalloutMarkerPing: " + "Invalid type when trying to play audio for creating a callout marker ping.");
        #/
        return undefined;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5071
// Size: 0x23b
function calloutmarkerpingvo_createcalloutbattlechatter(var_394466c2ddb208cb) {
    if (!isdefined(var_394466c2ddb208cb)) {
        /#
            assertmsg("CalloutMarkerPing: " + "VO - pingIndex passed in was invalid!");
        #/
        return;
    }
    player = self;
    var_c1074ab6cac2169f = player calloutmarkerping_getent(var_394466c2ddb208cb);
    var_3ef0fdcee94cadff = undefined;
    pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
    if (function_810652bcec49286c(pingType)) {
        /#
            println("uin_ping_item" + "equip_armorbox");
        #/
        return;
    }
    if (isdefined(level.var_5f9eb8185e287adc)) {
        var_3ef0fdcee94cadff = player [[ level.var_5f9eb8185e287adc ]](var_c1074ab6cac2169f, pingType, var_394466c2ddb208cb);
    }
    if (!isdefined(var_3ef0fdcee94cadff)) {
        if (function_c648f0fd527e089a(pingType)) {
            var_3ef0fdcee94cadff = player function_f9aa0f44521459d7(var_394466c2ddb208cb, var_c1074ab6cac2169f);
            if (!isdefined(var_3ef0fdcee94cadff)) {
                return;
            }
        } else if (pingType == 23) {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringworld(var_394466c2ddb208cb);
        } else if (function_d3789a9a4be5df2e(pingType) && (pingType != 6 || function_cb9269a1545ad6e4(var_c1074ab6cac2169f)) && pingType != 18 && pingType != 17) {
            /#
                assert(isent(var_c1074ab6cac2169f));
            #/
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringentity(var_c1074ab6cac2169f);
        } else if (function_74ec310d8f99b6e2(pingType)) {
            var_3ef0fdcee94cadff = #"hash_e3b4682201d84039";
        } else if (function_87df78670540e9b2(pingType)) {
            var_3ef0fdcee94cadff = function_2ecdd6eb53bbd808(pingType, var_394466c2ddb208cb);
        } else {
            switch (pingType) {
            case 2:
            case 17:
            case 18:
                if (namespace_36f464722d326bbe::isBRStyleGameType() && isdefined(player.br_infil_type)) {
                    var_3ef0fdcee94cadff = #"hash_92ddd951ec0801d5";
                } else {
                    var_3ef0fdcee94cadff = #"hash_950a284047c4c938";
                }
                break;
            case 6:
                var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringvehicle(var_c1074ab6cac2169f);
                break;
            case 4:
                var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringworld(var_394466c2ddb208cb);
                break;
            default:
                /#
                    assertmsg("CalloutMarkerPing: " + "Invalid type when trying to play audio for creating a callout marker ping.");
                #/
                break;
            }
        }
    }
    player calloutmarkerpingvo_play(var_3ef0fdcee94cadff, pingType, var_c1074ab6cac2169f);
    if (issharedfuncdefined("vo", "onPing")) {
        player [[ getsharedfunc("vo", "onPing") ]](var_394466c2ddb208cb, pingType, var_3ef0fdcee94cadff, var_c1074ab6cac2169f);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52b3
// Size: 0x163
function _calloutmarkerping_onpingchallenge(var_394466c2ddb208cb) {
    player = self;
    pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
    player function_f3bb4f4911a1beb2("pmc_missions", "onPing", var_394466c2ddb208cb, pingType);
    if (!issharedfuncdefined("challenges", "onPing")) {
        return;
    }
    if (function_c648f0fd527e089a(pingType)) {
        self [[ getsharedfunc("challenges", "onPing") ]]("object");
    } else if (function_d3789a9a4be5df2e(pingType)) {
        ent = self calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(ent)) {
            if (_calloutmarkerping_isenemy(ent, self)) {
                self [[ getsharedfunc("challenges", "onPing") ]]("enemy");
            } else if (!isplayer(ent)) {
                self [[ getsharedfunc("challenges", "onPing") ]]("object");
            }
        }
    } else if (function_74ec310d8f99b6e2(pingType)) {
        self [[ getsharedfunc("challenges", "onPing") ]]("danger");
    } else {
        switch (pingType) {
        case 5:
        case 6:
            self [[ getsharedfunc("challenges", "onPing") ]]("object");
            break;
        case 2:
        case 4:
            break;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541d
// Size: 0xad1
function calloutmarkerpingvo_getcalloutaliasstringentity(var_7a5b847ea66815f) {
    var_27e49251bb3376ea = self;
    if (isdefined(var_7a5b847ea66815f) && isent(var_7a5b847ea66815f)) {
        ent = var_7a5b847ea66815f;
    } else {
        /#
            assertmsg("CalloutMarkerPing: " + "improper entity sent to get a vo alias!");
        #/
        return "";
    }
    isfriendly = is_equal(ent.team, var_27e49251bb3376ea.team);
    if (isplayer(ent) && isfriendly) {
        return #"hash_ba35331e5424e961";
    } else if (isdefined(ent.juggcontext) || istrue(ent.isjuggernaut)) {
        if (!function_6641a5b759148e1b()) {
            if (isfriendly) {
                return #"hash_f9d0187fee631069";
            } else {
                return #"hash_8ef3df121eb09344";
            }
        } else if (isdefined(ent.var_9329e0d3ce1d5ca8)) {
            return #"hash_b1184ffadd1841e1";
        } else {
            return #"hash_c280c66c7d0377be";
        }
    } else if (isdefined(ent.streakname)) {
        var_ec1c995bec9df0d0 = function_e57c4849c7935da(ent, var_27e49251bb3376ea);
        if (isdefined(var_ec1c995bec9df0d0)) {
            return var_ec1c995bec9df0d0;
        }
    } else if (calloutmarkerping_ismunitionsbox(ent)) {
        if (isfriendly) {
            return #"hash_beed927ad14272f6";
        } else {
            return #"hash_9d85348fe7f7fd17";
        }
    } else if (function_3c11e6303c59cb37(ent)) {
        if (isfriendly) {
            return #"hash_beed927ad14272f6";
        } else {
            return #"hash_9d85348fe7f7fd17";
        }
    } else if (function_ab2631f444db868(ent)) {
        if (isfriendly) {
            return #"hash_87dfb0a97d487905";
        } else {
            return #"hash_2791df8f0febaa08";
        }
    } else if (function_23c0a0bd88667b79(ent)) {
        if (isfriendly) {
            return #"hash_e2fd444152d125a6";
        } else {
            return #"hash_422e7dacaf02e067";
        }
    } else if (function_faba04054d6e029a(ent)) {
        if (isfriendly) {
            return #"hash_1a192c08a51aa187";
        } else {
            return #"hash_9fee601f6a38d0ae";
        }
    } else if (function_3f392603242529ba(ent)) {
        if (isfriendly) {
            return #"hash_50318dab695e2d91";
        } else {
            return #"hash_fbaa88946c97859c";
        }
    } else if (function_32bfb4f432f417f(ent)) {
        airdroptype = ent.streakinfo.airdroptype;
        switch (airdroptype) {
        case #"hash_2289ec11d77bce8f":
        case #"hash_56979e0566996b2e":
            airdroptype = "carepackage";
            break;
        case #"hash_4ad475e6e15635bd":
            airdroptype = "juggernaut_box";
            break;
        case #"hash_b597e9a707180461":
            airdroptype = "loadoutdrop";
            break;
        }
        pingType = "killstreak";
        if (airdroptype == "loadoutdrop") {
            pingType = "fieldupgrade";
        }
        var_9d38ff79b3a86204 = undefined;
        if (level.teambased) {
            if (isdefined(ent.team) && self.team != ent.team) {
                var_9d38ff79b3a86204 = "hostile";
            }
        } else if (isdefined(ent.owner) && self != ent.owner) {
            var_9d38ff79b3a86204 = "hostile";
        }
        var_51134e8308c78a49 = "ping_" + pingType + "_" + airdroptype;
        if (isdefined(var_9d38ff79b3a86204)) {
            var_51134e8308c78a49 = var_51134e8308c78a49 + "_" + var_9d38ff79b3a86204;
        }
        return function_1823ff50bb28148d(var_51134e8308c78a49);
    } else if (function_a1b34a5b82e7a92e(ent)) {
        if (istrue(ent.iscustomweapon)) {
            return #"hash_61e45880333ea885";
        }
        weaponname = strtok(ent.classname, "+")[0];
        return function_8d17e607a79fd65f(weaponname);
    } else if (isdefined(ent.equipmentref) && ent.equipmentref == "equip_armorbox") {
        if (isfriendly) {
            return #"hash_eeb2f76aa07b1207";
        } else {
            return #"hash_dbaed258b9ac512e";
        }
    } else if (isdefined(ent.cratetype) && ent.cratetype == "loadout_drop_cp") {
        return #"hash_aaf81e97912a54f4";
    } else if (function_abff9f14e6d75a76(ent)) {
        if (istrue(ent.var_c5ed7e1af63fb508)) {
            return #"hash_2791df8f0febaa08";
        }
        prefix = #"hash_51a14b1bf8223917";
        var_49e6ef3edadd524e = "";
        if (isdefined(ent.weapon_object)) {
            var_49e6ef3edadd524e = function_f581838ce4328f7a(ent.weapon_object);
        } else if (isdefined(ent.var_93083caf1530fefa) && isdefined(ent.var_93083caf1530fefa.weapon_object)) {
            var_49e6ef3edadd524e = function_f581838ce4328f7a(ent.var_93083caf1530fefa.weapon_object);
        }
        var_c7faed30fb7d597c = "";
        if (namespace_4fb9dddfb8c1a67a::isequipmentlethal(var_49e6ef3edadd524e)) {
            var_c7faed30fb7d597c = "lethal_generic";
        } else if (namespace_4fb9dddfb8c1a67a::isequipmenttactical(var_49e6ef3edadd524e)) {
            var_c7faed30fb7d597c = "tactical_generic";
        }
        switch (var_49e6ef3edadd524e) {
        case #"hash_d9108a0595d7d0b9":
            var_c7faed30fb7d597c = "buster";
            break;
        case #"hash_fa1e80f6bd5b8e72":
            var_c7faed30fb7d597c = "c4";
            break;
        case #"hash_36b7174a04de8799":
            var_c7faed30fb7d597c = "claymore";
            break;
        case #"hash_333525cef39d0c66":
            var_c7faed30fb7d597c = "decoy";
            break;
        case #"hash_8059d93d3568c07":
            var_c7faed30fb7d597c = "gas";
            break;
        case #"hash_9d57562863499a06":
            var_c7faed30fb7d597c = "proxmine";
            break;
        case #"hash_11a03a12f93f62b2":
            var_c7faed30fb7d597c = "shockstick";
            break;
        case #"hash_a0319e349a692b8f":
            var_c7faed30fb7d597c = "thermite";
            break;
        case #"hash_e1f6f84e4cd950eb":
            var_c7faed30fb7d597c = "smoke";
            break;
        case #"hash_17c70dc48424ba92":
            var_c7faed30fb7d597c = "breacher_drone";
            break;
        case #"hash_5f29cda9550e6a3a":
            var_c7faed30fb7d597c = "butterfly_mine";
            break;
        case #"hash_a68928468343f517":
            if (isfriendly) {
                return #"hash_511d39b9a1ee9cc8";
            } else {
                return #"hash_5e910c8fe775babd";
            }
            break;
        }
        if (isfriendly) {
            return function_2ef675c13ca1c4af(prefix, var_c7faed30fb7d597c);
        } else {
            return function_2ef675c13ca1c4af(prefix, var_c7faed30fb7d597c, "_hostile");
        }
    } else if (_calloutmarkerping_isplunderextract(ent)) {
        return #"hash_c370a434325eefae";
    } else if (ent.model == "military_ammo_restock_location" || ent.model == "military_ammo_restock_location_solid") {
        return #"hash_dfc8971b3a3d7a81";
    } else if (ent.model == "military_armor_station_01_open_full") {
        return #"hash_eeb2f76aa07b1207";
    } else if (issubstr(ent.model, "offhand_wm_container_gas_tank")) {
        return #"hash_489f4c169e5adb27";
    } else if (issubstr(ent.model, "train_")) {
        return #"hash_950a284047c4c938";
    } else if (issubstr(ent.model, "cuniform")) {
        return #"hash_4f145e816e953cb9";
    } else if (function_6641a5b759148e1b() && isdefined(ent.subcategory) && ent.subcategory == "elimTarget") {
        return #"hash_bc91ebc8ef1fbfa4";
    } else if (function_6641a5b759148e1b() && istrue(ent.var_950c1ab89c9c4e2a)) {
        return #"hash_63d201bec507d7cf";
    } else if (function_6641a5b759148e1b() && function_cb9269a1545ad6e4(ent)) {
        if (isdefined(ent.var_566868292ee2a1b)) {
            ent = ent.var_566868292ee2a1b;
        }
        if (ent.var_47bde44b1acec603 == "chemist") {
            return #"hash_16063b12e7e0e407";
        } else if (ent.var_47bde44b1acec603 == "pyro") {
            return #"hash_966c59c3d2889590";
        } else if (ent.var_47bde44b1acec603 == "trapper") {
            return #"hash_9b6b7da0814a3dd7";
        }
        return #"hash_b1184ffadd1841e1";
    } else if (_calloutmarkerping_isenemy(ent, self)) {
        enemyweapon = ent getcurrentweapon();
        if (isplayer(ent)) {
            if (istrue(ent.inlaststand)) {
                return #"hash_5063297c85d5385e";
            } else if (!isreallyalive(ent)) {
                return #"hash_7f659e0d3ce8b202";
            }
        }
        if (namespace_d325722f2754c2c4::isriotshield(enemyweapon)) {
            return #"hash_d55968f5896ed400";
        } else if (isweapon(enemyweapon) && !isnullweapon(enemyweapon) && weaponclass(enemyweapon) == "sniper") {
            return #"hash_56fbaece3612bdf8";
        } else if (isdefined(ent.basearchetype) && ent.basearchetype == "rusher") {
            return #"hash_526f96d183a4ee53";
        }
        if (function_6641a5b759148e1b() && isdefined(level.var_d7b3bd9ad64c74b) && isdefined(level.var_d7b3bd9ad64c74b[ent getentitynumber()]) && isdefined(level.var_d7b3bd9ad64c74b[ent getentitynumber()]["tier"])) {
            tier = level.var_d7b3bd9ad64c74b[ent getentitynumber()]["tier"];
            var_3b28a86af95d6cea = namespace_14d36171baccf528::function_e2292dcf63eccf7a(ent, "elite");
            switch (tier) {
            case 1:
                return ter_op(istrue(var_3b28a86af95d6cea), #"hash_766ad1c8b387e329", #"hash_6d3407b8a9e701d6");
            case 2:
                return ter_op(istrue(var_3b28a86af95d6cea), #"hash_7667b1c8b38576f2", #"hash_6d3406b8a9e70023");
            case 3:
                return ter_op(istrue(var_3b28a86af95d6cea), #"hash_7663cdc8b381bdaf", #"hash_6d3405b8a9e6fe70");
            default:
                return #"hash_c280c66c7d0377be";
                break;
            }
        }
    } else if (issubstr(ent.model, "mortar")) {
        return #"hash_3eb64c04862d60ee";
    } else if (issubstr(ent.model, "oxygen")) {
        return #"hash_43c6735ef7fe8279";
    } else if (issubstr(ent.model, "turret")) {
        return #"hash_2fc2274289b135cf";
    } else if (issubstr(ent.model, "gas_cutter")) {
        return #"hash_836741b5a9a3bad5";
    }
    return #"hash_c280c66c7d0377be";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ef6
// Size: 0x6ef
function function_f9aa0f44521459d7(var_394466c2ddb208cb, var_c1074ab6cac2169f) {
    player = self;
    var_3ef0fdcee94cadff = "";
    var_db376ee90688810d = undefined;
    var_9da49b7a0e592d6d = 0;
    var_8b819c2af4c98ead = 0;
    var_3d5823cc55965dd7 = 0;
    isusable = 0;
    if (isdefined(var_c1074ab6cac2169f)) {
        var_db376ee90688810d = var_c1074ab6cac2169f;
    } else {
        /#
            assertmsg("CalloutMarkerPing: " + "didn't get a valid scriptable instance when adding a ping and trying to create VO at ping type: " + player calloutmarkerping_gettype(var_394466c2ddb208cb));
        #/
        return undefined;
    }
    if (isdefined(var_db376ee90688810d)) {
        var_9da49b7a0e592d6d = var_db376ee90688810d scriptableisdoor();
        if (var_9da49b7a0e592d6d) {
            var_8b819c2af4c98ead = var_db376ee90688810d scriptabledoorisclosed();
        } else {
            var_3d5823cc55965dd7 = var_db376ee90688810d scriptableislootcache();
        }
    }
    if (var_3d5823cc55965dd7) {
        if (var_db376ee90688810d getscriptablehaspart("body") && var_db376ee90688810d getscriptablepartstate("body") != "fully_opening_unusable") {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_db376ee90688810d);
        } else if (isdefined(var_db376ee90688810d.var_46a3a8565ac0c17c) && (var_db376ee90688810d.var_46a3a8565ac0c17c == 15 || var_db376ee90688810d.var_46a3a8565ac0c17c == 13) || isdefined(var_db376ee90688810d.type) && issubstr(var_db376ee90688810d.type, "dmz_supply_drop")) {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_db376ee90688810d);
        }
    } else if (var_9da49b7a0e592d6d && !var_8b819c2af4c98ead) {
        var_3ef0fdcee94cadff = #"hash_395d52d740aee345";
    } else if (var_9da49b7a0e592d6d) {
        return undefined;
    } else if (isdefined(var_db376ee90688810d.customweaponname) && var_db376ee90688810d.customweaponname != "") {
        var_3ef0fdcee94cadff = #"hash_61e45880333ea885";
    } else if (isdefined(var_db376ee90688810d) && isdefined(var_db376ee90688810d.entity)) {
        if (_calloutmarkerping_isdropcrate(var_db376ee90688810d.entity)) {
            if (var_db376ee90688810d.entity.cratetype == "battle_royale_cash_crate") {
                var_3ef0fdcee94cadff = #"hash_377eabe3259d7176";
            } else if (var_db376ee90688810d.entity.cratetype == "battle_royale_elite_chopper") {
                var_3ef0fdcee94cadff = #"hash_8e61679e86bd4657";
            } else if (!isdefined(var_db376ee90688810d.entity.team) || var_db376ee90688810d.entity.team == player.team) {
                var_3ef0fdcee94cadff = #"hash_aaf81e97912a54f4";
            } else {
                var_3ef0fdcee94cadff = #"hash_df79177ad830a4e1";
            }
        } else if (istrue(var_db376ee90688810d.entity.isjuggernaut)) {
            if (!isdefined(var_db376ee90688810d.entity.team) || var_db376ee90688810d.entity.team == player.team) {
                var_3ef0fdcee94cadff = #"hash_96902b2a9d7757ff";
            } else {
                var_3ef0fdcee94cadff = #"hash_719a5222c33fb876";
            }
        } else if (_calloutmarkerping_isplunderextract(var_c1074ab6cac2169f) || isdefined(var_c1074ab6cac2169f.type) && var_c1074ab6cac2169f.type == "dmz_exfil_site") {
            var_3ef0fdcee94cadff = #"hash_c78fbe4067075afd";
        } else if (isdefined(var_db376ee90688810d.entity.model) && (var_db376ee90688810d.entity.model == "military_ammo_restock_location" || var_db376ee90688810d.entity.model == "military_ammo_restock_location_solid" || var_db376ee90688810d.entity.model == "military_ammo_restock_location_solid_mp")) {
            var_3ef0fdcee94cadff = #"hash_dfc8971b3a3d7a81";
        } else if (isdefined(var_db376ee90688810d.model) && (var_db376ee90688810d.model == "veh9_mil_air_drone_redeploy_relocate" || var_db376ee90688810d.model == "veh9_mil_air_drone_redeploy_relocate_hack")) {
            var_3ef0fdcee94cadff = #"hash_b2e52b074f412495";
        } else if (isdefined(var_db376ee90688810d.entity.vehiclename) && var_db376ee90688810d.entity.vehiclename == "cargo_train") {
            var_3ef0fdcee94cadff = #"hash_4f581684012440ec";
        } else if (isdefined(var_db376ee90688810d.entity.var_8862825a0618bda) && var_db376ee90688810d.entity.var_8862825a0618bda == "tacCam") {
            if (var_db376ee90688810d.entity.team == player.team) {
                var_3ef0fdcee94cadff = #"hash_f9f87d4203f5cdee";
            } else {
                var_3ef0fdcee94cadff = #"hash_59b1fbfabd1d2bf";
            }
        } else if (isdefined(var_db376ee90688810d.type) && var_db376ee90688810d.type == "veh9_mil_air_cargo_plane_airdrop_dmz") {
            var_3ef0fdcee94cadff = #"hash_4f581684012440ec";
        } else if (istrue(var_db376ee90688810d.entity.var_54dc11292e53791b)) {
            return;
        } else {
            var_3ef0fdcee94cadff = #"hash_950a284047c4c938";
        }
    } else if (isdefined(var_c1074ab6cac2169f.type) && (var_c1074ab6cac2169f.type == "dmz_gas_station" || var_c1074ab6cac2169f.type == "dmz_gas_station_marine")) {
        return undefined;
    } else if (issharedfuncdefined("pickups", "isDogTag") && isdefined(var_db376ee90688810d.type) && [[ getsharedfunc("pickups", "isDogTag") ]](var_db376ee90688810d.type)) {
        if (issharedfuncdefined("dogtag", "getDogTagVictimAndKiller")) {
            var_e9a68e6d68d81012 = [[ getsharedfunc("dogtag", "getDogTagVictimAndKiller") ]](var_db376ee90688810d.count)[0];
            if (isdefined(level.dogTagInfo) && isdefined(level.dogTagInfo[var_e9a68e6d68d81012]) && isdefined(level.dogTagInfo[var_e9a68e6d68d81012].team) && self.team == level.dogTagInfo[var_e9a68e6d68d81012].team) {
                var_3ef0fdcee94cadff = #"hash_97e406a910aacd64";
            } else {
                var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_c1074ab6cac2169f);
            }
        } else {
            var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_c1074ab6cac2169f);
        }
    } else if (isdefined(var_db376ee90688810d) && isdefined(var_db376ee90688810d.type) && var_db376ee90688810d.type == "map2map_tacmap_location_scriptable") {
        var_3ef0fdcee94cadff = #"hash_950a284047c4c938";
    } else if (isdefined(var_db376ee90688810d) && isdefined(var_db376ee90688810d.type) && var_db376ee90688810d.type == "ob_aethernest_cyst_scriptable") {
        var_3ef0fdcee94cadff = #"hash_6b93faad153de372";
    } else {
        var_3ef0fdcee94cadff = player calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_c1074ab6cac2169f);
    }
    return var_3ef0fdcee94cadff;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65ed
// Size: 0x2d5
function calloutmarkerpingvo_getcalloutaliasstringvehicle(var_7a5b847ea66815f) {
    player = self;
    if (isdefined(var_7a5b847ea66815f) && isent(var_7a5b847ea66815f)) {
        var_f5013bae6266622f = var_7a5b847ea66815f;
    } else {
        /#
            assertmsg("CalloutMarkerPing: " + "improper entity sent to get a vo alias!");
        #/
        return "";
    }
    if (istrue(var_7a5b847ea66815f.var_4a4265af0a6f92e9)) {
        return #"hash_ab3839c038df043";
    } else if (istrue(var_7a5b847ea66815f ent_flag_exist("armored_convoy_spawned"))) {
        return #"hash_4184ece37fc62f34";
    } else if (istrue(var_7a5b847ea66815f.var_177d31bd38d64887)) {
        return #"hash_50e215208a82d207";
    } else if (isdefined(var_f5013bae6266622f.streakname)) {
        var_ec1c995bec9df0d0 = function_e57c4849c7935da(var_f5013bae6266622f, player);
        if (isdefined(var_ec1c995bec9df0d0)) {
            return var_ec1c995bec9df0d0;
        }
    }
    if (issharedfuncdefined("ping", "ping_cp_getCPVehicleCallout")) {
        result = [[ getsharedfunc("ping", "ping_cp_getCPVehicleCallout") ]](var_f5013bae6266622f);
        if (isdefined(result) && istrue(result.bshouldreturnvalue)) {
            return result.vocalloutstring;
        }
    }
    if (isdefined(var_f5013bae6266622f.infil) && isdefined(level.var_c96464f39952b78a)) {
        vehiclename = [[ level.var_c96464f39952b78a ]](var_f5013bae6266622f);
        return function_2ef675c13ca1c4af(#"hash_f2ffb8c48b7ba213", vehiclename, "_neutral");
    }
    if (!isdefined(var_f5013bae6266622f.vehiclename)) {
        /#
            assertmsg("CalloutMarkerPing: " + " Vehicle Callout - our entity's vehicleName is undefined!");
        #/
        return #"hash_dbe73992c2a084d2";
    }
    vehicleRef = var_f5013bae6266622f function_d93ec4635290febd();
    var_ee8ef5ba92ab121d = undefined;
    var_5011b777abe6b90e = undefined;
    if (isdefined(vehicleRef)) {
        var_5011b777abe6b90e = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle(vehicleRef);
    }
    if (isdefined(var_5011b777abe6b90e)) {
        var_ee8ef5ba92ab121d = var_5011b777abe6b90e.var_ee8ef5ba92ab121d;
    }
    if (!isdefined(var_ee8ef5ba92ab121d) || var_ee8ef5ba92ab121d == "") {
        var_ee8ef5ba92ab121d = "generic";
    }
    if (var_f5013bae6266622f namespace_5a0f3ca265d3a4c8::vehicle_damage_isburningdown()) {
        return function_2ef675c13ca1c4af(#"hash_9216f9fdf0e7ccd", var_ee8ef5ba92ab121d);
    }
    if (istrue(var_f5013bae6266622f namespace_1f188a13f7e79610::function_b7148a3bfc4defb2())) {
        return function_2ef675c13ca1c4af(#"hash_3cdaf22ea7689e07", var_ee8ef5ba92ab121d);
    }
    if (function_6641a5b759148e1b() && isdefined(vehicleRef)) {
        if (vehicleRef == "veh9_palfa") {
            return #"hash_ab3839c038df043";
        } else if (vehicleRef == "veh9_blima") {
            return #"hash_50e215208a82d207";
        }
    }
    var_44502c6387ec229 = _calloutmarkerping_isvehicleoccupiedbyenemy(var_f5013bae6266622f, player.team) || isdefined(vehicleRef) && vehicleRef == "dmz_boss_chopper";
    if (istrue(var_44502c6387ec229)) {
        return function_2ef675c13ca1c4af(#"hash_f2ffb8c48b7ba213", var_ee8ef5ba92ab121d, "_hostile");
    } else {
        return function_2ef675c13ca1c4af(#"hash_f2ffb8c48b7ba213", var_ee8ef5ba92ab121d, "_neutral");
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c9
// Size: 0x62e
function function_e57c4849c7935da(ent, player) {
    if (!isdefined(ent) || !isdefined(ent.streakname)) {
        return undefined;
    }
    switch (ent.streakname) {
    case #"hash_413c38e72fe8b5bf":
        if (ent.team == player.team) {
            return #"hash_59408556a75167b3";
            goto LOC_0000006b;
        }
        return #"hash_7966e41de8cb58e2";
    case #"hash_349713b5ad494dda":
    LOC_0000006b:
        if (ent.team == player.team) {
            return #"hash_fc944993a946b947";
            goto LOC_0000009c;
        }
        return #"hash_6f281585cf73646e";
    case #"hash_28d0236400e33fd0":
    LOC_0000009c:
        if (ent.team == player.team) {
            return #"hash_d9c435be4f34edd2";
            goto LOC_000000cd;
        }
        return #"hash_13c1846b179fbbbb";
    case #"hash_b161e185f1b8e117":
    LOC_000000cd:
        if (ent.team == player.team) {
            return #"hash_7114a9557a202484";
            goto LOC_000000fe;
        }
        return #"hash_e456fa711248fa51";
    case #"hash_691f39dddd9116b8":
    case #"hash_887ad77192b9c4fb":
    LOC_000000fe:
        if (ent.team == player.team) {
            return #"hash_be6f026064897fcc";
            goto LOC_0000012f;
        }
        return #"hash_406af2df399ae929";
    case #"hash_cf0ef5bef19a311b":
    LOC_0000012f:
        if (ent.team == player.team) {
            return #"hash_360f10c75ff6ddfc";
            goto LOC_00000160;
        }
        return #"hash_4d95da7e5634edb9";
    case #"hash_2289ec11d77bce8f":
    LOC_00000160:
        if (ent.team == player.team) {
            return #"hash_e351b2fe727be6cf";
            goto LOC_00000191;
        }
        return #"hash_ab3aafafec352426";
    case #"hash_cd0a0403551fc411":
    case #"hash_56979e0566996b2e":
    case #"hash_e477c24ee18bb2f6":
    case #"hash_4ad475e6e15635bd":
    LOC_00000191:
        if (ent.team == player.team) {
            return #"hash_9d7b23b318712100";
            goto LOC_000001c2;
        }
        return #"hash_5cf853da13e8c3e5";
    case #"hash_4d5aa76e8707f47b":
    LOC_000001c2:
        if (ent.team == player.team) {
            return #"hash_ad2379a582fc4da4";
            goto LOC_000001f3;
        }
        return #"hash_1bec31af9b0e7f31";
    case #"hash_bf2f9adbd2b41d5":
    LOC_000001f3:
        if (ent.team == player.team) {
            return #"hash_8fc0e5069411c5f0";
            goto LOC_00000224;
        }
        return #"hash_e8e93cda7053ab35";
    case #"hash_4220be38a5f150b8":
    case #"hash_8c766d6477287bb6":
    case #"hash_b4ac3581c343a029":
    case #"hash_42fd64e842a4c3d7":
    case #"hash_e6bea339d3cbd3e8":
    LOC_00000224:
        if (ent.team == player.team) {
            return #"hash_cdea6db76ffafeab";
            goto LOC_00000255;
        }
        return #"hash_6905e10cb42d87aa";
    case #"hash_e171e5b86ef0a4cc":
    LOC_00000255:
        if (ent.team == player.team) {
            return #"hash_307d8ad9d54e300a";
            goto LOC_00000286;
        }
        return #"hash_36b6c6096f34a903";
    case #"hash_634b246c3da5c56f":
    case #"hash_e51f2e3d5cdd8ed8":
    LOC_00000286:
        if (ent.team == player.team) {
            return #"hash_cbc2104ab33f85db";
            goto LOC_000002b7;
        }
        return #"hash_dcf31d1198c3587a";
    case #"hash_10e585c25e7e9f60":
    case #"hash_27002778019fb447":
    case #"hash_566a2018a7c11f4a":
    LOC_000002b7:
        if (ent.team == player.team) {
            return #"hash_4f145e816e953cb9";
            goto LOC_000002e8;
        }
        return #"hash_34238a0a2d34bff4";
    case #"hash_4d35eb58f9d545f0":
    LOC_000002e8:
        if (ent.team == player.team) {
            return #"hash_8ca459b6a15c00b2";
            goto LOC_00000319;
        }
        return #"hash_d4713ac3c37a175b";
    case #"hash_9e36e3bd3a9dd00d":
    LOC_00000319:
        if (ent.team == player.team) {
            return #"hash_a57f8806e4b78ae1";
            goto LOC_0000034a;
        }
        return #"hash_51236cff45bc900c";
    case #"hash_e40585107590f016":
    LOC_0000034a:
        if (ent.team == player.team) {
            return #"hash_6805124b5acc8eb0";
            goto LOC_0000037b;
        }
        return #"hash_8f7adf3133703f5";
    case #"hash_6362d6aae3e5a62e":
    LOC_0000037b:
        if (ent.team == player.team) {
            return #"hash_a0bff3197e235812";
            goto LOC_000003ac;
        }
        return #"hash_37634f9d5ed5d2fb";
    case #"hash_19dd9a3a4147e09e":
    LOC_000003ac:
        if (ent.team == player.team) {
            return #"hash_f89fb62acc3816d2";
            goto LOC_000003dd;
        }
        return #"hash_8752b51765e204bb";
    case #"hash_b571a6187bf67f9e":
    LOC_000003dd:
        if (ent.team == player.team) {
            return #"hash_cb83e421f5269fd2";
            goto LOC_0000040e;
        }
        return #"hash_e4406cd4873badbb";
    case #"hash_ab5712e297cd430e":
    LOC_0000040e:
        if (ent.team == player.team) {
            return #"hash_a6bd49f96added49";
            goto LOC_0000043f;
        }
        return #"hash_aed08ea80f8bc64";
    case #"hash_7a687f6a4d685110":
    LOC_0000043f:
        if (ent.team == player.team) {
            return #"hash_c2e546b2adeee70c";
            goto LOC_00000470;
        }
        return #"hash_efa4fe7114ed8f69";
    default:
    LOC_00000470:
        /#
            assertmsg("CalloutMarkerPing: " + "Vehicle Callout String needs to be set for streak: " + ent.streakname);
        #/
        break;
    }
    return undefined;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eff
// Size: 0x5bf
function calloutmarkerpingvo_getcalloutaliasstringworld(var_394466c2ddb208cb) {
    player = self;
    if (!namespace_36f464722d326bbe::isBRStyleGameType() && getgametype() != "ob") {
        return #"hash_950a284047c4c938";
    }
    var_6d7cff43e352d995 = player calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
    /#
        assert(isint(var_6d7cff43e352d995));
    #/
    if (isdefined(level.questinfo) && isdefined(level.questinfo.quests) && isdefined(level.questinfo.quests["vip"]) && isdefined(level.questinfo.quests["vip"].instances)) {
        foreach (var_a8899121a97b2449 in level.questinfo.quests["vip"].instances) {
            var_c00e9479f3c48b03 = var_a8899121a97b2449.objectiveiconid;
            if (!isdefined(var_c00e9479f3c48b03)) {
                continue;
            }
            if (var_c00e9479f3c48b03 == var_6d7cff43e352d995) {
                return #"hash_c280c66c7d0377be";
            }
        }
    }
    if (isdefined(level.pleaForHelp) && isdefined(level.pleaForHelp.var_807ffb67240349f5)) {
        foreach (request in level.pleaForHelp.var_807ffb67240349f5) {
            if (!isdefined(request.objid) || request.objid != var_6d7cff43e352d995) {
                continue;
            }
            return #"hash_819b611ac5ccd652";
        }
    }
    var_759cea0c926c3b8a = function_b0837574dc6d3b32(var_6d7cff43e352d995);
    if (isdefined(var_759cea0c926c3b8a)) {
        switch (var_759cea0c926c3b8a) {
        case #"hash_1075324f0436e1a1":
            return #"hash_31a86e897611eeae";
        case #"hash_4cbfef445e35dd14":
            return #"hash_377eabe3259d7176";
        case #"hash_90ee989288818d54":
            return #"hash_6b93faad153de372";
        case #"hash_f128412207d3dff":
        case #"hash_ef52726f863e918c":
            return #"hash_54f65a6d138898e0";
        case #"hash_e72b710c86eed3e4":
            return #"hash_2a647e3265a23cca";
        case #"hash_c810e4c79ffe58":
            return #"hash_b1184ffadd1841e1";
        case #"hash_512b4048208f0ea9":
            return #"hash_9b1c153f9b3277ef";
        case #"hash_52e64b07a8b95f29":
            return #"hash_cda3e31b9c16d6e9";
        default:
            break;
        }
    }
    var_2d618a34e27d5476 = undefined;
    if (player function_929ee540ad474f2f("ui_br_objective_index")) {
        var_2d618a34e27d5476 = player getclientomnvar("ui_br_objective_index");
    }
    if (isdefined(var_2d618a34e27d5476) && var_2d618a34e27d5476 != 0) {
        var_b92f1cf567538eee = tablelookup("mp/brmissions.csv", 0, var_2d618a34e27d5476, 1);
        var_1070d193895b35b4 = tablelookup("mp/brmissions.csv", 0, var_2d618a34e27d5476, 18);
        var_962b7ef0a10e1038 = #"hash_f2a9ff4e59bb1f21";
        if (isdefined(var_1070d193895b35b4) && var_1070d193895b35b4 != "") {
            /#
                assert(isstring(var_1070d193895b35b4));
            #/
            switch (var_1070d193895b35b4) {
            case #"hash_96e641d7fe5b1cf1":
            case #"hash_d43a3732d39e4a11":
            case #"hash_de61e484b9734ea1":
                return #"hash_f576f46190038d0f";
            case #"hash_96815ed47cc355cf":
                return #"hash_e28085aadfae5d1c";
            case #"hash_cc7c1c701864c7bf":
            case #"hash_d0eb8b9de6742b83":
                return #"hash_e28085aadfae5d1c";
            case #"hash_5c57b61aa79410db":
                return #"hash_5e9b42bb250430c0";
            case #"hash_d0eb63c46c25ef55":
                return #"hash_39c77413b23b120f";
            case #"hash_7b0c576c4a7e4890":
                return #"hash_1daccafd917e11f4";
            case #"hash_bf5597954aaed3d7":
                return #"hash_6d1373895a7152e3";
            case #"hash_d22bc78737d8a069":
                if (isdefined(var_b92f1cf567538eee) && var_b92f1cf567538eee == "elite_safecracker") {
                    return #"hash_a86ee45822e748c6";
                    goto LOC_000003fc;
                }
                return var_962b7ef0a10e1038;
            case #"hash_f4a9126c03d3385b":
            LOC_000003fc:
                if (isdefined(var_b92f1cf567538eee) && var_b92f1cf567538eee == "dmz_domination") {
                    return #"hash_3bba1ed64a43b055";
                    goto LOC_00000423;
                }
                return #"hash_66cc0ef5625f2905";
            case #"hash_75b6db03edb1e84e":
            LOC_00000423:
                return #"hash_a2509d6e12c5af05";
            case #"hash_194f31f722d1fa09":
            case #"hash_82ea0e6e4f123b62":
                return #"hash_df615c25af2daf17";
            case #"hash_e0b82e0f064c17d6":
                if (var_2d618a34e27d5476 == 46) {
                    return #"hash_63d201bec507d7cf";
                    goto LOC_00000455;
                }
                return #"hash_2c71ed5d278ca7aa";
            case #"hash_e91729d4ef79ca26":
            LOC_00000455:
                return #"hash_d09eb4ecd4f2077f";
            case #"hash_37bb23543c319104":
                return #"hash_bc91ebc8ef1fbfa4";
            case #"hash_1e754eb11fa62651":
            case #"hash_9db32d30f2603c35":
                return #"hash_efb7d5d607796b80";
            case #"hash_cf3abe09f0094696":
                return #"hash_950a284047c4c938";
            case #"hash_4f0e37558d043245":
                if (isdefined(var_b92f1cf567538eee) && var_b92f1cf567538eee == "zombienest_eliminate") {
                    return #"hash_c280c66c7d0377be";
                }
                break;
            default:
                break;
            }
        }
    }
    return #"hash_950a284047c4c938";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c6
// Size: 0x76
function function_d7fb39f0e6e8f752(scriptablename) {
    if (!istrue(level.var_a9350d89a2e4d752)) {
        if (!isdefined(level.br_pickups) || !isdefined(level.br_pickups.var_11feb85e78e7cee8)) {
            return undefined;
        }
        row = tablelookuprownum_reversefromrow(level.brloottablename, 1, scriptablename, level.br_pickups.var_11feb85e78e7cee8 - 1);
        return row;
    }
    return undefined;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7544
// Size: 0x2e9
function calloutmarkerpingvo_getcalloutaliasstringloot(var_394466c2ddb208cb, var_394382528911801d) {
    player = self;
    if (isdefined(var_394382528911801d) && isdefined(var_394382528911801d.type)) {
        var_869d699197f920a2 = var_394382528911801d.type;
        if (issharedfuncdefined("loot", "lootGetScriptableName")) {
            var_869d699197f920a2 = [[ getsharedfunc("loot", "lootGetScriptableName") ]](var_394382528911801d);
        }
        if (!isdefined(var_869d699197f920a2)) {
            return #"";
        }
    } else {
        /#
            assertmsg("CalloutMarkerPing: " + "entity or entity type not defined for scriptable for ping of type: " + player calloutmarkerping_gettype(var_394466c2ddb208cb));
        #/
        return #"";
    }
    if (issubstr(var_869d699197f920a2, "activity_starter")) {
        if (issharedfuncdefined("pmc_missions", "onPingContractPhone")) {
            [[ getsharedfunc("pmc_missions", "onPingContractPhone") ]](player);
        }
    }
    if (!istrue(level.var_a9350d89a2e4d752)) {
        row = function_d7fb39f0e6e8f752(var_869d699197f920a2);
        if (!isdefined(row) || row < 0) {
            return function_abc85f8465a92be8(var_869d699197f920a2, var_394382528911801d, player);
        }
    }
    if (istrue(level.var_a9350d89a2e4d752)) {
        type = level.br_pickups.br_itemtype[var_869d699197f920a2];
        if (!isdefined(type)) {
            type = #"";
        }
    } else {
        type = function_1823ff50bb28148d(tablelookupbyrow(level.brloottablename, row, 2));
    }
    if (type == #"weapon") {
        return function_8d17e607a79fd65f(var_869d699197f920a2);
    }
    if (type == #"hash_49f2c8b380d62270" && isdefined(var_394382528911801d.var_65f2e31ba81e1b45) && isdefined(var_394382528911801d.task) && var_394382528911801d.task.teams[0] != player.team) {
        return #"hash_950a284047c4c938";
    }
    if (istrue(level.var_a9350d89a2e4d752)) {
        var_832ad168567520f7 = level.br_pickups.var_59e01317f76cf924[var_869d699197f920a2];
        if (!isdefined(var_832ad168567520f7)) {
            var_832ad168567520f7 = "";
        }
        if (var_832ad168567520f7 == "" || var_832ad168567520f7 == "ping_loot_generic") {
            return function_abc85f8465a92be8(var_869d699197f920a2, var_394382528911801d, player);
        }
    } else {
        var_832ad168567520f7 = tablelookupbyrow(level.brloottablename, row, 29);
    }
    if (!isdefined(var_832ad168567520f7) || var_832ad168567520f7 == "") {
        /#
            assertmsg("CalloutMarkerPing: " + "Could not find scriptable ping alias in loottable for " + var_869d699197f920a2 + ".");
        #/
        return #"ping_loot_generic";
    }
    if (!function_d03495fe6418377b(var_832ad168567520f7)) {
        if (var_832ad168567520f7 == "ping_loot_ammo_midcaliber" && namespace_3c37cb17ade254d::issharedfuncdefined("player", "lookupCurrentOperator")) {
            if (player [[ namespace_3c37cb17ade254d::getsharedfunc("player", "lookupCurrentOperator") ]](player.team) == "luna_western") {
                return #"hash_139b0bd39823ad92";
            }
        }
        return function_1823ff50bb28148d(var_832ad168567520f7);
    }
    return var_832ad168567520f7;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7835
// Size: 0x234
function function_abc85f8465a92be8(var_869d699197f920a2, var_394382528911801d, player) {
    if (var_869d699197f920a2 == "brloot_plunder_extraction_site_01" || var_869d699197f920a2 == "brloot_plunder_extraction_site_02" || var_869d699197f920a2 == "equip_fulton_mp") {
        return #"hash_c370a434325eefae";
    } else if (var_869d699197f920a2 == "ks_airdrop_crate_br") {
        return #"hash_5e9b42bb250430c0";
    } else if (var_869d699197f920a2 == "br_carriable_propane" || var_869d699197f920a2 == "br_carriable_neurotoxin") {
        return #"hash_b4e5d4709fde95ac";
    } else if (var_869d699197f920a2 == "fortress_tacmap_location" || var_869d699197f920a2 == "fortress_tacmap_location_scriptable") {
        return #"hash_aa0b34e2e32d1de8";
    } else if (var_869d699197f920a2 == "br_plunder_box" || var_869d699197f920a2 == "br_plunder_box_nocollision") {
        return #"hash_86e6aa05dfa9ed3e";
    } else if (var_869d699197f920a2 == "dmz_activity_icon") {
        return #"hash_f2a9ff4e59bb1f21";
    } else if (var_869d699197f920a2 == "military_ammo_restock_noent") {
        return #"hash_dfc8971b3a3d7a81";
    } else if (var_869d699197f920a2 == "dmz_samsite_icon") {
        if (isdefined(var_394382528911801d.team) && isdefined(player) && isdefined(player.team)) {
            if (player.team == var_394382528911801d.team) {
                return #"hash_c4bb81a4113340dc";
            } else {
                return #"hash_904b835819b20803";
            }
        }
        return #"hash_9b893e8e80c5182e";
    } else if (issubstr(var_869d699197f920a2, "uav_tower")) {
        if (isdefined(var_394382528911801d.var_dcc5f31ec71d6d8a) && isdefined(player) && isdefined(player.team)) {
            if (player.team == var_394382528911801d.var_dcc5f31ec71d6d8a) {
                return #"hash_b27bffe6b0b70e83";
            } else {
                return #"hash_c42f31aa52cdc1ca";
            }
        }
        return #"hash_872e13b3730ced3b";
    } else if (var_869d699197f920a2 == "scriptable_redeploy_drone") {
        return #"hash_b2e52b074f412495";
    } else if (var_869d699197f920a2 == "sealion_chance_machine") {
        return #"hash_aa42356a6e397720";
    } else if (var_869d699197f920a2 == "ob_jup_aethertear") {
        return #"hash_6bf0e0e2b9d348a9";
    } else if (var_869d699197f920a2 == "br_nuke_safe") {
        return #"hash_a86ee45822e748c6";
    }
    return #"ping_loot_generic";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a71
// Size: 0x2dd
function function_8d17e607a79fd65f(weaponname) {
    if (isdefined(level.br_pickups) && isdefined(level.br_pickups.var_59e01317f76cf924)) {
        if (isdefined(level.br_pickups.var_59e01317f76cf924[weaponname])) {
            return level.br_pickups.var_59e01317f76cf924[weaponname];
        }
    }
    if (isdefined(level.br_lootiteminfo) && isdefined(level.br_lootiteminfo[weaponname]) && isdefined(level.br_lootiteminfo[weaponname].fullweaponobj)) {
        weaponname = level.br_lootiteminfo[weaponname].fullweaponobj.basename;
    }
    if (isdefined(weaponname) && (issubstr(weaponname, "iw9_dm_la700") || issubstr(weaponname, "iw9_dm_xmike2010"))) {
        weaponname = ter_op(weaponname == "iw9_dm_la700", "iw9_sn_la700", "iw9_sn_xmike2010");
    }
    if (issubstr(weaponname, "_me_riotshield")) {
        return #"hash_e6879b73c425b645";
    } else if (issubstr(weaponname, "_me_") || isendstr(weaponname, "_me")) {
        return #"hash_9a82a986f78b6";
    } else if (issubstr(weaponname, "_pi_") || isendstr(weaponname, "_pi")) {
        return #"hash_cd5f060d817d69ad";
    } else if (issubstr(weaponname, "_sh_") || isendstr(weaponname, "_sh")) {
        return #"hash_7c509a84250d2df4";
    } else if (issubstr(weaponname, "_sm_") || isendstr(weaponname, "_sm")) {
        return #"hash_6b8874a19007433b";
    } else if (issubstr(weaponname, "_ar_") || isendstr(weaponname, "_ar")) {
        return #"hash_f856404f7930d595";
    } else if (issubstr(weaponname, "_lm_") || isendstr(weaponname, "_lm")) {
        return #"hash_80d611a10adce102";
    } else if (!issubstr(weaponname, "crossbow") && (issubstr(weaponname, "_dm_") || isendstr(weaponname, "_dm"))) {
        return #"hash_c5eb56a131ee4d21";
    } else if (!issubstr(weaponname, "crossbow") && (issubstr(weaponname, "_sn_") || isendstr(weaponname, "_sn"))) {
        return #"hash_f0b69038ddb805b5";
    } else if (issubstr(weaponname, "_la_") || isendstr(weaponname, "_la")) {
        return #"hash_c96f150eea6f45e2";
    } else if (issubstr(weaponname, "_br_") || isendstr(weaponname, "_br")) {
        return #"hash_2e6888b438d9db8";
    } else {
        return #"ping_loot_generic";
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d55
// Size: 0x93
function function_9bb1120b45cfa775(var_394466c2ddb208cb) {
    player = self;
    var_c1074ab6cac2169f = player calloutmarkerping_getent(var_394466c2ddb208cb);
    if (!isdefined(var_c1074ab6cac2169f)) {
        return #"hash_be4cc85a249d4af5";
    }
    if (!isent(var_c1074ab6cac2169f)) {
        return #"hash_be4cc85a249d4af5";
    }
    vehicleRef = var_c1074ab6cac2169f function_d93ec4635290febd();
    if (!isdefined(vehicleRef)) {
        return #"hash_be4cc85a249d4af5";
    }
    if (function_6641a5b759148e1b()) {
        if (vehicleRef == "veh9_palfa") {
            return #"hash_28e8ccedd7fd880c";
        }
    }
    return #"hash_be4cc85a249d4af5";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7df0
// Size: 0x142
function function_befa2cbd9d478179(var_394466c2ddb208cb) {
    player = self;
    var_2d618a34e27d5476 = undefined;
    if (player function_929ee540ad474f2f("ui_br_objective_index")) {
        var_2d618a34e27d5476 = player getclientomnvar("ui_br_objective_index");
    }
    if (isdefined(var_2d618a34e27d5476) && var_2d618a34e27d5476 != 0) {
        var_1070d193895b35b4 = tablelookup("mp/brmissions.csv", 0, var_2d618a34e27d5476, 18);
        var_962b7ef0a10e1038 = #"hash_f2a9ff4e59bb1f21";
        if (isdefined(var_1070d193895b35b4) && var_1070d193895b35b4 != "") {
            /#
                assert(isstring(var_1070d193895b35b4));
            #/
            switch (var_1070d193895b35b4) {
            case #"hash_f4a9126c03d3385b":
                return #"hash_92e9c29aaf5df02e";
            case #"hash_e0b82e0f064c17d6":
                return #"hash_63d201bec507d7cf";
            default:
                return #"hash_bca5e472447f8c73";
                break;
            }
        }
    }
    var_6d7cff43e352d995 = player calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
    var_759cea0c926c3b8a = function_b0837574dc6d3b32(var_6d7cff43e352d995);
    if (isdefined(var_759cea0c926c3b8a)) {
        switch (var_759cea0c926c3b8a) {
        case #"hash_1075324f0436e1a1":
            return #"hash_4a7f14fa17b76265";
        default:
            break;
        }
    }
    return #"hash_bca5e472447f8c73";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3a
// Size: 0x406
function calloutmarkerpingvo_getaffirmaliasstringloot(var_394466c2ddb208cb, var_394382528911801d, var_dfb9f3c233e2b8f3) {
    player = self;
    if (isdefined(var_394382528911801d) && isdefined(var_394382528911801d.type)) {
        var_869d699197f920a2 = var_394382528911801d.type;
    } else {
        pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
        /#
            assertmsg("CalloutMarkerPing: " + "entity or entity type not defined for scriptable for ping type: " + pingType);
        #/
        return "";
    }
    if (utility::issharedfuncdefined("game", "getBundleNameFromScriptable")) {
        var_fbe755f0978c0369 = [[ utility::getsharedfunc("game", "getBundleNameFromScriptable") ]](var_869d699197f920a2);
        if (isdefined(var_fbe755f0978c0369)) {
            itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
            if (isdefined(itembundle) && isdefined(itembundle.var_359e971d09addafc)) {
                return itembundle.var_359e971d09addafc;
            }
        }
    }
    row = function_d7fb39f0e6e8f752(var_869d699197f920a2);
    if (!isdefined(row) || row < 0) {
        if (isdefined(var_394382528911801d) && isdefined(var_394382528911801d.entity)) {
            if (_calloutmarkerping_isdropcrate(var_394382528911801d.entity)) {
                return #"hash_4a7f14fa17b76265";
            }
        }
        if (var_869d699197f920a2 == "brloot_plunder_extraction_site_01" || var_869d699197f920a2 == "brloot_plunder_extraction_site_02" || var_869d699197f920a2 == "equip_fulton_mp") {
            return #"hash_2f0e31588eee8365";
        } else if (var_869d699197f920a2 == "br_plunder_box" || var_869d699197f920a2 == "br_plunder_box_nocollision") {
            return #"hash_4b2e7401eb29aab5";
        } else if (var_869d699197f920a2 == "dmz_samsite_icon") {
            return #"hash_d58aeb2b1b4050f9";
        } else if (var_869d699197f920a2 == "dmz_uav_tower" || var_869d699197f920a2 == "dmz_uav_tower_short") {
            return #"hash_340b075cc2841a64";
        } else if (var_869d699197f920a2 == "fortress_tacmap_location" || var_869d699197f920a2 == "fortress_tacmap_location_scriptable" || var_869d699197f920a2 == "merc_stronghold_center_objective_marker") {
            return #"hash_89076fd71c7c42bf";
        } else if (var_869d699197f920a2 == "dmz_exfil_site") {
            return #"hash_11fa7946ddf751cd";
        } else if (isdefined(var_394382528911801d.entity) && isdefined(var_394382528911801d.entity.vehiclename) && var_394382528911801d.entity.vehiclename == "cargo_train") {
            return #"hash_be4cc85a249d4af5";
        } else if (var_869d699197f920a2 == "jup_zm_pap_fxanim" || var_869d699197f920a2 == "jup_zm_mystery_box_all_fxanim" || var_869d699197f920a2 == "military_ammo_restock_noent" || var_869d699197f920a2 == "scriptable_redeploy_drone" || var_869d699197f920a2 == "dmz_gas_station" || var_869d699197f920a2 == "dmz_gas_station_marine" || var_869d699197f920a2 == "jup_zm_machine_wunderfizz" || isdefined(var_394382528911801d.var_a2738a1d42906829) || issubstr(var_869d699197f920a2, "wallbuy_")) {
            return #"hash_11fa7946ddf751cd";
        }
        if (!istrue(level.var_a9350d89a2e4d752)) {
            return #"hash_df30101ebcf2d491";
        }
    }
    if (istrue(level.var_a9350d89a2e4d752)) {
        type = level.br_pickups.br_itemtype[var_869d699197f920a2];
        if (!isdefined(type)) {
            type = #"";
        }
    } else {
        type = function_1823ff50bb28148d(tablelookupbyrow(level.brloottablename, row, 2));
    }
    if (type == #"weapon") {
        return #"hash_1b67e457ede92dc0";
    }
    if (istrue(level.var_a9350d89a2e4d752)) {
        var_832ad168567520f7 = level.br_pickups.var_caf82339100de589[var_869d699197f920a2];
    } else {
        var_832ad168567520f7 = tablelookupbyrow(level.brloottablename, row, 30);
    }
    if (!isdefined(var_832ad168567520f7) || var_832ad168567520f7 == "") {
        if (!istrue(level.var_a9350d89a2e4d752)) {
            /#
                assertmsg("CalloutMarkerPing: " + "Could not find scriptable ping alias in loottable for " + var_869d699197f920a2 + ".");
            #/
        }
        return #"hash_df30101ebcf2d491";
    }
    return var_832ad168567520f7;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8348
// Size: 0xdc
function calloutmarkerping_createcallout(pingType, var_8512c523dca1fd8f, objectid, lootid) {
    player = self;
    var_60693f12aa0f707d = undefined;
    if (isdefined(lootid)) {
        /#
            assert(isdefined(objectid));
        #/
        var_60693f12aa0f707d = player function_c013e9dddee96e76(pingType, var_8512c523dca1fd8f, objectid, lootid);
    } else if (isdefined(objectid)) {
        var_60693f12aa0f707d = player function_c013e9dddee96e76(pingType, var_8512c523dca1fd8f, objectid);
    } else {
        var_60693f12aa0f707d = player function_c013e9dddee96e76(pingType, var_8512c523dca1fd8f);
    }
    if (isdefined(var_60693f12aa0f707d)) {
        var_c0f9139ffd72e62d = getentbynum(var_60693f12aa0f707d.var_51b8d478055e5509);
        if (isplayer(var_c0f9139ffd72e62d)) {
            _calloutmarkerping_predicted_log("Remove Callout ID Notify ( reallocated ) | pingIndex: " + var_60693f12aa0f707d.var_394466c2ddb208cb);
            var_c0f9139ffd72e62d notify("predictiveCalloutClear_" + var_60693f12aa0f707d.var_394466c2ddb208cb);
        }
        return var_60693f12aa0f707d.var_394466c2ddb208cb;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x842b
// Size: 0xd7
function calloutmarkerping_removecallout(var_394466c2ddb208cb) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    if (!player function_1e008bf9d31b2b01(var_394466c2ddb208cb)) {
        _calloutmarkerping_predicted_log("Remove Callout ( failed due to owner mismatch ) | pingIndex: " + var_394466c2ddb208cb);
    } else {
        _calloutmarkerping_predicted_log("Remove Callout | pingIndex: " + var_394466c2ddb208cb);
        pingType = player calloutmarkerping_gettype(var_394466c2ddb208cb);
        if (isdefined(pingType) && pingType >= 2 && pingType < 37) {
            if (pingType == 2) {
                if (issharedfuncdefined("ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer")) {
                    [[ getsharedfunc("ping", "calloutMarkerPing_squadLeaderBeaconKillForPlayer") ]](player);
                }
            }
            player function_4a7d51f2dfc2fa5d(var_394466c2ddb208cb);
            if (pingType == 5) {
                player function_6c9b8f9429b7fdca(player.team);
            }
        }
    }
    _calloutmarkerping_predicted_log("Remove Callout ID Notify ( removed ) | pingIndex: " + var_394466c2ddb208cb);
    player notify("predictiveCalloutClear_" + var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8509
// Size: 0xd8
function function_9a7200f5142066ba(player, var_394466c2ddb208cb, var_b80d3534a140c29a, var_7b65a266737ce5e6, waittilltimeout) {
    entity = self;
    if (!isplayer(player)) {
        return;
    }
    player endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    if (isdefined(var_b80d3534a140c29a)) {
        foreach (endonnotify in var_b80d3534a140c29a) {
            entity endon(endonnotify);
        }
    }
    if (isdefined(waittilltimeout) && isdefined(var_7b65a266737ce5e6)) {
        entity waittill_any_in_array_or_timeout(var_7b65a266737ce5e6, waittilltimeout);
    } else if (isdefined(waittilltimeout)) {
        wait(waittilltimeout);
    } else if (isdefined(var_7b65a266737ce5e6)) {
        entity function_5adca43f839a3cce(var_7b65a266737ce5e6);
    }
    player calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85e8
// Size: 0xd8
function function_6bc4f6b579285f79(player, var_8c7d921795d81e3, var_2229564b4895f551) {
    scriptable = self;
    if (isdefined(player)) {
        var_ba5325edfebd6a58 = self function_1a0b76d2ca8a1547(player, function_53c4c53197386572(var_8c7d921795d81e3, 0), function_53c4c53197386572(var_2229564b4895f551, 0));
    } else {
        var_ba5325edfebd6a58 = self function_1a0b76d2ca8a1547();
    }
    if (isdefined(var_ba5325edfebd6a58)) {
        foreach (var_697ef06ff2ab334b in var_ba5325edfebd6a58) {
            player = getentbynum(var_697ef06ff2ab334b.var_93a0836a10e99c34);
            if (isplayer(player)) {
                player notify("predictiveCalloutClear_" + var_697ef06ff2ab334b.var_394466c2ddb208cb);
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86c7
// Size: 0x9f
function function_cd96f73dbca496b8(objid) {
    var_ba5325edfebd6a58 = function_5a64d34a848aeda6(objid);
    if (isdefined(var_ba5325edfebd6a58)) {
        foreach (var_697ef06ff2ab334b in var_ba5325edfebd6a58) {
            player = getentbynum(var_697ef06ff2ab334b.var_93a0836a10e99c34);
            if (isplayer(player)) {
                player notify("predictiveCalloutClear_" + var_697ef06ff2ab334b.var_394466c2ddb208cb);
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x876d
// Size: 0x92
function calloutmarkerping_watchwhenobjectivestartsprogress(var_394466c2ddb208cb, var_93bc7962739fd49e) {
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "watchWhenMissionCompletes needs to be called with a player");
    #/
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    while (1) {
        var_8a2e167f6894d193 = level waittill("Objective_SetShowProgress");
        if (function_53ebc25dcfe48d00(self, var_8a2e167f6894d193) && isdefined(var_8a2e167f6894d193) && var_8a2e167f6894d193 == var_93bc7962739fd49e) {
            _calloutmarkerping_predicted_log("Objective started progress | pingIndex: " + var_394466c2ddb208cb + " | gscObjID: " + var_93bc7962739fd49e);
            break;
        }
    }
    calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8806
// Size: 0x86
function calloutmarkerping_watchwhenobjectivedeleted(var_394466c2ddb208cb, var_93bc7962739fd49e) {
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "calloutMarkerPing_watchWhenObjectiveDeleted needs to be called with a player");
    #/
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    while (1) {
        var_e2ac79b49840672c = level waittill("Objective_Delete");
        if (isdefined(var_e2ac79b49840672c) && var_e2ac79b49840672c == var_93bc7962739fd49e) {
            _calloutmarkerping_predicted_log("Objective deleted | pingIndex: " + var_394466c2ddb208cb + " | gscObjID: " + var_93bc7962739fd49e);
            break;
        }
    }
    calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8893
// Size: 0x171
function function_632cc7f8cbf11ae1(var_394466c2ddb208cb, ent) {
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "watchEntityDeathOrEnemyDeathDisconnect needs to be called with a player");
    #/
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    _calloutmarkerping_predicted_log("Watch Entity Death or Enemy Disconnect | pingIndex: " + var_394466c2ddb208cb);
    if (!isdefined(ent)) {
        /#
            assertmsg("CalloutMarkerPing: " + "an undefined ent was passed into watchEntityDeathOrEnemyDeathDisconnect. That shouldn't happen!");
        #/
    }
    if (!isent(ent)) {
        ent waittill_any_3("death", "pickup", "explode");
    } else if (isplayer(ent)) {
        val = ent waittill_any_return_2("death", "disconnect");
        if (isdefined(level.var_1a2b600a06ec21f4) && !istrue(level.var_1a2b600a06ec21f4.var_dd7fbece86363b3f) || val == "disconnect") {
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
        } else {
            thread calloutmarkerping_enemytodangerdecaycreate(var_394466c2ddb208cb, ent);
        }
    } else if (isagent(ent)) {
        ent waittill("death");
        if (isdefined(level.var_1a2b600a06ec21f4) && !istrue(level.var_1a2b600a06ec21f4.var_dd7fbece86363b3f)) {
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
        } else {
            thread calloutmarkerping_enemytodangerdecaycreate(var_394466c2ddb208cb, ent);
        }
    } else {
        if (!istrue(ent.isdestroyed)) {
            ent waittill_any_3("death", "pickup", "explode");
        }
        calloutmarkerping_removecallout(var_394466c2ddb208cb);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a0b
// Size: 0x1cb
function calloutmarkerping_watchplayerdeathordisconnect(var_394466c2ddb208cb) {
    player = self;
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "watchPlayerDeathOrDisconnect needs to be called with a player");
    #/
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    _calloutmarkerping_predicted_log("Watch Player Death or Disconnect | pingIndex: " + var_394466c2ddb208cb);
    var_41a4a181b6606b16 = player function_a7e757d42b550a6(var_394466c2ddb208cb);
    switch (var_41a4a181b6606b16) {
    case 22:
    case 23:
    case 28:
        lootid = player function_c4e0716fbd549e2d(var_394466c2ddb208cb);
        var_c08eeee95b85512a = isdefined(lootid) && function_3bc031ab2f635f8c(lootid) != "calloutmarkerpingitem";
        if (var_c08eeee95b85512a) {
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            if (function_73e183e02834309d(scriptablename)) {
                utility::function_ee012c2dd711a8ce("self_pickedupitem", scriptablename, "death_or_disconnect");
            } else if (isdefined(scriptablename)) {
                /#
                    assert(isstring(scriptablename) && scriptablename != "");
                #/
                waittill_any_2("death_or_disconnect", "self_pickedupitem_" + scriptablename);
            }
        } else {
            self waittill("death_or_disconnect");
        }
        break;
    case 24:
    case 25:
        if (getdvarint(@"hash_6f618729986d661", 1) && utility::ismp() && issharedfuncdefined("ping", "calloutMarkerPing_watchItemTakenFromContainer")) {
            lootid = player function_c4e0716fbd549e2d(var_394466c2ddb208cb);
            [[ getsharedfunc("ping", "calloutMarkerPing_watchItemTakenFromContainer") ]](player, player.var_2fa5b49969def47, lootid);
        } else {
            self waittill("death_or_disconnect");
        }
        break;
    default:
        self waittill("death_or_disconnect");
        break;
    }
    calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bdd
// Size: 0x59
function function_1efe712c746d3ca1(var_394466c2ddb208cb) {
    player = self;
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "watchPlayerEnterSpectate needs to be called with a player");
    #/
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    _calloutmarkerping_predicted_log("Watch Player Enter Spectate | pingIndex: " + var_394466c2ddb208cb);
    player waittill("br_spectatorInitialized");
    calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c3d
// Size: 0x1bd
function calloutmarkerping_watchscriptabledeath(var_394466c2ddb208cb, var_db376ee90688810d) {
    /#
        assertex(isplayer(self), "CalloutMarkerPing: " + "watchScriptableDeath needs to be called with a player");
    #/
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    _calloutmarkerping_predicted_log("Watch Scriptable Death | pingIndex: " + var_394466c2ddb208cb);
    if (!isdefined(var_db376ee90688810d)) {
        /#
            assertmsg("CalloutMarkerPing: " + ": an undefined scriptableInstance ent was passed into watchScriptableDeath. That shouldn't happen!");
        #/
    } else if (var_db376ee90688810d.type == "equip_fulton_mp") {
        ent = var_db376ee90688810d.entity;
        if (!isdefined(ent)) {
            /#
                assertmsg("CalloutMarkerPing: " + ": attempted to use an undefined scriptableInstance.entity");
            #/
            return;
        }
        ent waittill_any_2("death", "fulton_takeoff");
    } else {
        var_122cecc87707e886 = function_ce51e08dcc037220(var_db376ee90688810d.origin, "undefined", "CalloutMarkerPing: " + ": scriptableInstance.entity.script_noteworthy is undefined");
        if (isdefined(var_db376ee90688810d.entity) && isdefined(var_db376ee90688810d.entity.script_noteworthy)) {
            var_f060782b4775f90e = var_db376ee90688810d.entity.script_noteworthy;
        } else {
            var_f060782b4775f90e = var_122cecc87707e886;
        }
        var_825eb5c6acf63494 = function_ce51e08dcc037220(var_db376ee90688810d.type, 1, "CalloutMarkerPing: " + ": scriptableInstance.type is invalid");
        level waittill_any_8("pickedupweapon_kill_callout_" + var_825eb5c6acf63494 + var_122cecc87707e886, "lootcache_opened_kill_callout" + var_122cecc87707e886, "dropbag_kill_callout_" + var_122cecc87707e886, "tablethide_kill_callout_" + var_122cecc87707e886, "carriable_kill_callout_" + var_122cecc87707e886, "buystation_kill_callout_" + var_122cecc87707e886, "redeploy_drone_kill_callout_" + var_122cecc87707e886, "forced_kill_callout_" + var_f060782b4775f90e);
    }
    _calloutmarkerping_predicted_log("Watch scriptable death ( removed ) | pingIndex: " + var_394466c2ddb208cb);
    calloutmarkerping_removecallout(var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e01
// Size: 0x1a
function calloutmarkerping_onplayerdisconnect(player) {
    if (!isdefined(player)) {
        return;
    }
    player calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e22
// Size: 0x4d
function calloutmarkerping_removeallcalloutsforplayer() {
    player = self;
    if (isdefined(player)) {
        for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
            isowner = player function_1e008bf9d31b2b01(var_394466c2ddb208cb);
            if (isowner) {
                player calloutmarkerping_removecallout(var_394466c2ddb208cb);
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e76
// Size: 0x7f
function calloutmarkerping_removeallcalloutsforallplayers(var_884a98392ce1109b) {
    var_c502004b162c0807 = 0;
    foreach (player in level.players) {
        player calloutmarkerping_removeallcalloutsforplayer();
        if (istrue(var_884a98392ce1109b)) {
            var_c502004b162c0807++;
            if (var_c502004b162c0807 % 10 == 0) {
                waitframe();
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8efc
// Size: 0xd7
function calloutmarkerpingvo_calculatesounddebouncelength(pingType, var_e64b7437e7151a62) {
    if (function_c648f0fd527e089a(pingType)) {
        return (var_e64b7437e7151a62 + 500);
    } else if (function_d3789a9a4be5df2e(pingType)) {
        return (var_e64b7437e7151a62 + 500);
    } else if (function_74ec310d8f99b6e2(pingType)) {
        return (var_e64b7437e7151a62 + 500);
    } else if (function_87df78670540e9b2(pingType)) {
        return (var_e64b7437e7151a62 + 500);
    } else {
        switch (pingType) {
        case 2:
            return (var_e64b7437e7151a62 + 500);
        case 6:
            return (var_e64b7437e7151a62 + 500);
        case 4:
            return (var_e64b7437e7151a62 + 500);
        case 5:
            return (var_e64b7437e7151a62 + 500);
        default:
            /#
                println("uin_ping_item" + "ob_jup_aethertear");
            #/
            return (var_e64b7437e7151a62 + 500);
            break;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fda
// Size: 0x51
function function_bb7fe8982d035c10(var_9090af2a5c319a58) {
    player = self;
    /#
        assert(isdefined(player.calloutmarkerpingvohandlerpool));
    #/
    /#
        assert(isstring(var_9090af2a5c319a58));
    #/
    if (!isdefined(player.calloutmarkerpingvohandlerpool[var_9090af2a5c319a58])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9033
// Size: 0x10f
function calloutmarkerpingvo_handleraddnewelement(pingType, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62) {
    player = self;
    /#
        assert(isdefined(player.calloutmarkerpingvohandlerpool));
    #/
    /#
        assert(isdefined(pingType));
    #/
    /#
        assert(isdefined(currtime));
    #/
    /#
        assert(isstring(var_9090af2a5c319a58));
    #/
    /#
        assert(isdefined(var_e64b7437e7151a62));
    #/
    var_37f40cb76aeadd2a = player.calloutmarkerpingvohandlerpool.size;
    if (var_37f40cb76aeadd2a > 10) {
        return 0;
    }
    var_e42bea5e21788553 = calloutmarkerpingvo_calculatesounddebouncelength(pingType, var_e64b7437e7151a62);
    /#
        assert(isdefined(var_e42bea5e21788553));
    #/
    var_a4e4c581c371283d = var_e42bea5e21788553 + currtime;
    /#
        assert(var_a4e4c581c371283d >= currtime);
    #/
    var_c8895c40ca12d15 = spawnstruct();
    var_c8895c40ca12d15.sounddebouncetimestamp = var_a4e4c581c371283d;
    var_c8895c40ca12d15.cancelled = 0;
    player.calloutmarkerpingvohandlerpool[var_9090af2a5c319a58] = var_c8895c40ca12d15;
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x914a
// Size: 0x178
function calloutmarkerpingvo_canplaywithspamavoidance(pingType, var_5ab0dc648937d4ea, var_e64b7437e7151a62) {
    player = self;
    if (!isdefined(player) || !isplayer(player)) {
        return 0;
    }
    if (istrue(level.var_5d4c8322d01b9c50)) {
        return 0;
    }
    if (istrue(player.var_5d4c8322d01b9c50) || getdvarint(@"hash_28ffde533f721522", 0)) {
        return 0;
    }
    currtime = gettime();
    var_9090af2a5c319a58 = "pingType" + pingType;
    /#
        assert(isstring(var_9090af2a5c319a58));
    #/
    var_c7704a4bc6945a9f = player function_bb7fe8982d035c10(var_9090af2a5c319a58);
    if (var_c7704a4bc6945a9f) {
        sounddebouncetimestamp = player.calloutmarkerpingvohandlerpool[var_9090af2a5c319a58].sounddebouncetimestamp;
        /#
            assert(isdefined(sounddebouncetimestamp));
        #/
        if (currtime >= sounddebouncetimestamp) {
            var_964d2b3a97d9acda = player calloutmarkerpingvo_handleraddnewelement(pingType, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62);
            return istrue(var_964d2b3a97d9acda);
        }
        if (var_5ab0dc648937d4ea == #"hash_6d43a076a8b18354" && player.calloutmarkerpingvohandlerpool[var_9090af2a5c319a58].cancelled == 0) {
            player.calloutmarkerpingvohandlerpool[var_9090af2a5c319a58].cancelled = 1;
            return 1;
        }
        return 0;
    } else if (var_5ab0dc648937d4ea == #"hash_6d43a076a8b18354") {
        return 0;
    } else {
        var_964d2b3a97d9acda = player calloutmarkerpingvo_handleraddnewelement(pingType, currtime, var_9090af2a5c319a58, var_e64b7437e7151a62);
        return istrue(var_964d2b3a97d9acda);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c9
// Size: 0x11b
function calloutmarkerpingvo_debouncegarbagecollector() {
    level endon("game_ended");
    /#
        assert(-1);
    #/
    while (1) {
        wait(10);
        currenttime = gettime();
        for (var_accfe4f0f3b0d4fd = 0; var_accfe4f0f3b0d4fd < level.players.size; var_accfe4f0f3b0d4fd++) {
            player = level.players[var_accfe4f0f3b0d4fd];
            if (!isdefined(player) || !isdefined(player.calloutmarkerpingvohandlerpool)) {
                continue;
            }
            foreach (key, var_12a061ceea3ee7cb in player.calloutmarkerpingvohandlerpool) {
                /#
                    assert(isstring(key));
                #/
                /#
                    assert(isdefined(var_12a061ceea3ee7cb));
                #/
                /#
                    assert(isdefined(var_12a061ceea3ee7cb.sounddebouncetimestamp));
                #/
                if (currenttime > var_12a061ceea3ee7cb.sounddebouncetimestamp) {
                    player.calloutmarkerpingvohandlerpool[key] = undefined;
                }
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x93eb
// Size: 0x68
function calloutmarkerpingvo_getmaxsoundaliaslength(var_c197335aad9f5e31, var_a542114a7ee5abb5, var_c1934d5aad9ba188, var_a53ceb4a7edf2f4c) {
    var_196ffc81c8206c2a = 0;
    if (var_c197335aad9f5e31) {
        var_1dc4f593a85f62df = lookupsoundlength(var_a542114a7ee5abb5, 1);
        if (var_1dc4f593a85f62df > var_196ffc81c8206c2a) {
            var_196ffc81c8206c2a = var_1dc4f593a85f62df;
        }
    }
    if (var_c1934d5aad9ba188) {
        var_1dc4f593a85f62df = lookupsoundlength(var_a53ceb4a7edf2f4c, 1);
        if (var_1dc4f593a85f62df > var_196ffc81c8206c2a) {
            var_196ffc81c8206c2a = var_1dc4f593a85f62df;
        }
    }
    return var_196ffc81c8206c2a;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x945b
// Size: 0x214
function calloutmarkerping_playteamsoundfx(alias, var_394466c2ddb208cb) {
    player = self;
    if (!isdefined(player) || !isplayer(player) || !isdefined(alias)) {
        return;
    }
    if (!soundexists(alias)) {
        /#
            assertmsg("CalloutMarkerPing: " + "Ping_PlayTeamSound alias not found: " + alias);
        #/
    }
    var_82076cfff3bd567a = undefined;
    var_8512c523dca1fd8f = undefined;
    if (isdefined(var_394466c2ddb208cb)) {
        var_82076cfff3bd567a = player calloutmarkerping_getent(var_394466c2ddb208cb);
        var_8512c523dca1fd8f = player calloutmarkerping_getorigin(var_394466c2ddb208cb);
    }
    /#
        assert(issharedfuncdefined("game", "getSquadmates"));
    #/
    var_96674628376eaba6 = [[ getsharedfunc("game", "getSquadmates") ]](player.team, player.var_ff97225579de16a, 1);
    foreach (teammate in var_96674628376eaba6) {
        if (player != teammate) {
            if (istrue(player.gulagarena) && !istrue(teammate.gulagarena) || !istrue(player.gulagarena) && istrue(teammate.gulagarena)) {
                continue;
            }
            var_5c0879e9dea157af = teammate function_4076aa2e6c3de4c8();
            jumpiffalse(var_5c0879e9dea157af) LOC_00000179;
        } else {
        LOC_00000179:
            if (player isspectatingplayer()) {
                var_dd7368df13bc1a31 = teammate;
            } else if (isdefined(var_82076cfff3bd567a)) {
                var_dd7368df13bc1a31 = spawn("script_origin", var_82076cfff3bd567a.origin);
                var_dd7368df13bc1a31.istempsfxent = 1;
            } else if (isdefined(var_8512c523dca1fd8f)) {
                var_dd7368df13bc1a31 = spawn("script_origin", var_8512c523dca1fd8f);
                var_dd7368df13bc1a31.istempsfxent = 1;
            } else {
                var_dd7368df13bc1a31 = player;
            }
            var_dd7368df13bc1a31 playsoundtoplayer(alias, teammate);
            if (isdefined(var_dd7368df13bc1a31.istempsfxent)) {
                var_dd7368df13bc1a31 delete();
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9676
// Size: 0x86
function calloutmarkerpingvo_getfulloperatorvoaliasfromsimplealias2d(var_5bb586139a747c1c) {
    player = self;
    if (!isdefined(player.operatorcustomization) || !isdefined(player.operatorcustomization.voice)) {
        /#
            assertmsg("CalloutMarkerPing: " + "VO - player has no operatorCustomization!");
        #/
        return;
    }
    var_a542114a7ee5abb5 = "dx_mpp_" + player.operatorcustomization.voice + "_" + var_5bb586139a747c1c;
    return var_a542114a7ee5abb5;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9704
// Size: 0x86
function calloutmarkerpingvo_getfulloperatorvoaliasfromsimplealias3d(var_5bb586139a747c1c) {
    player = self;
    if (!isdefined(player.operatorcustomization) || !isdefined(player.operatorcustomization.voice)) {
        /#
            assertmsg("CalloutMarkerPing: " + "VO - player has no operatorCustomization!");
        #/
        return;
    }
    var_a53ceb4a7edf2f4c = "dx_mpb_" + player.operatorcustomization.voice + "_" + var_5bb586139a747c1c;
    return var_a53ceb4a7edf2f4c;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9792
// Size: 0x190
function calloutmarkerpingvo_play(var_5ab0dc648937d4ea, pingType, targetent) {
    var_7a7f371d8726fb41 = self;
    if (!isdefined(var_7a7f371d8726fb41) || !isplayer(var_7a7f371d8726fb41)) {
        return;
    }
    if (!isdefined(pingType)) {
        return;
    }
    if (!isdefined(var_5ab0dc648937d4ea) || var_5ab0dc648937d4ea == "" || var_5ab0dc648937d4ea == #"") {
        /#
            assertmsg("CalloutMarkerPing: " + "VO - soundType passed in was invalid for ping type: " + pingType);
        #/
        return;
    }
    var_4f632c1568af9fc0 = level.bcinfo["asset"][function_1823ff50bb28148d(var_5ab0dc648937d4ea)];
    var_196ffc81c8206c2a = 2000;
    var_57d0946b275fea34 = var_7a7f371d8726fb41 calloutmarkerpingvo_canplaywithspamavoidance(pingType, var_5ab0dc648937d4ea, var_196ffc81c8206c2a);
    if (istrue(var_57d0946b275fea34)) {
        logprint("calloutmarkerping::calloutMarkerPingVO_play - PlaySoundEvent()");
        logprint("self         = " + var_7a7f371d8726fb41.name);
        logprint("sessionstate = " + var_7a7f371d8726fb41.sessionstate);
        logprint("targetEnt    = " + isdefined(targetent));
        if (isdefined(targetent)) {
            logprint("tEntclassname = " + targetent.classname);
            logprint("tEntOrigin    = " + targetent.origin);
            if (isent(targetent) && isplayer(targetent)) {
                logprint("tEntSessionstate = " + targetent.sessionstate);
            }
        }
        if (isdefined(var_4f632c1568af9fc0)) {
            if (isdefined(targetent) && isent(targetent)) {
                var_7a7f371d8726fb41 function_c664a2459d6f3eaa(var_4f632c1568af9fc0, targetent);
            } else {
                var_7a7f371d8726fb41 function_c664a2459d6f3eaa(var_4f632c1568af9fc0);
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9929
// Size: 0x210
function calloutmarkerping_navigationcancelproximity(var_394466c2ddb208cb) {
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    self notify("calloutMarkerPing_navigationCancelProximity");
    self endon("calloutMarkerPing_navigationCancelProximity");
    var_220a4dc6346cbce8 = getdvarfloat(@"hash_7c74d4814e0665d5", 120);
    var_c1c5f124f3099349 = getdvarint(@"hash_37dfb2340c8f1ded", 10);
    /#
        assertex(var_220a4dc6346cbce8 > var_c1c5f124f3099349, "CalloutMarkerPing: " + "Navigation's general death timeout needs to be higher than the minimum proximity wait time.");
    #/
    wait(var_c1c5f124f3099349);
    if (!self calloutmarkerping_getactive(var_394466c2ddb208cb)) {
        /#
            assertmsg("CalloutMarkerPing: " + "This probably shouldn't happen, as this thread should have cleared itself..");
        #/
        return;
    }
    var_a0c7efbc36968a9d = self calloutmarkerping_getorigin(var_394466c2ddb208cb);
    var_24e75a7f4ff07f6a = getdvarint(@"hash_aa5168815ed6f2f9", 47089);
    var_dff4ae73cff54257 = getdvarint(@"hash_93e80752445801c0", 1);
    var_8d61d476bcb70d31 = getdvarint(@"hash_f53af4867ef2f684", 1);
    while (1) {
        /#
            assert(isdefined(self) && isdefined(self.origin) && isdefined(var_a0c7efbc36968a9d));
        #/
        if (var_dff4ae73cff54257 == 1) {
            distancesq = distancesquared(self.origin, var_a0c7efbc36968a9d);
        } else {
            distancesq = var_24e75a7f4ff07f6a;
            var_96674628376eaba6 = [[ getsharedfunc("game", "getFriendlyPlayers") ]](self.team, 1);
            foreach (teammate in var_96674628376eaba6) {
                var_2c32a427b3bd3226 = distancesquared(teammate.origin, var_a0c7efbc36968a9d);
                if (var_2c32a427b3bd3226 < distancesq) {
                    distancesq = var_2c32a427b3bd3226;
                }
            }
        }
        if (distancesq < var_24e75a7f4ff07f6a) {
            calloutmarkerping_playteamsoundfx("uin_ping_cancel", var_394466c2ddb208cb);
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
            return;
        }
        wait(var_8d61d476bcb70d31);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b40
// Size: 0x8e
function calloutmarkerpingvo_playpredictivepingcleared(var_394466c2ddb208cb, pingType, var_dfb9f3c233e2b8f3) {
    player = self;
    player notify("calloutMarkerPingVO_playPredictivePingCleared");
    player endon("calloutMarkerPingVO_playPredictivePingCleared");
    player calloutmarkerping_playteamsoundfx("uin_ping_cancel", var_394466c2ddb208cb);
    wait(getdvarfloat(@"hash_7206cb95b7dfb4f0", 0.5));
    if (isdefined(player)) {
        if (isplayer(var_dfb9f3c233e2b8f3)) {
            var_dfb9f3c233e2b8f3 calloutmarkerpingvo_play(#"hash_6d43a076a8b18354", pingType);
        } else {
            player calloutmarkerpingvo_play(#"hash_6d43a076a8b18354", pingType);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bd5
// Size: 0x3d
function calloutmarkerpingvo_playpredictivepingacknowledgedcancel(var_394466c2ddb208cb, var_dfb9f3c233e2b8f3) {
    var_93a0836a10e99c34 = self;
    pingType = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
    var_93a0836a10e99c34 calloutmarkerpingvo_playpredictivepingcleared(var_394466c2ddb208cb, pingType, var_dfb9f3c233e2b8f3);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c19
// Size: 0x2ac
function calloutmarkerpingvo_playpredictivepingacknowledged(var_394466c2ddb208cb, var_dfb9f3c233e2b8f3) {
    var_93a0836a10e99c34 = self;
    var_93a0836a10e99c34 notify("calloutMarkerPingVO_playPredictivePingAcknowledged");
    var_93a0836a10e99c34 endon("calloutMarkerPingVO_playPredictivePingAcknowledged");
    pingType = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
    if (function_c648f0fd527e089a(pingType)) {
        var_c1074ab6cac2169f = var_93a0836a10e99c34 calloutmarkerping_getent(var_394466c2ddb208cb);
        var_5ab0dc648937d4ea = var_93a0836a10e99c34 calloutmarkerpingvo_getaffirmaliasstringloot(var_394466c2ddb208cb, var_c1074ab6cac2169f, var_dfb9f3c233e2b8f3);
    } else if (function_d3789a9a4be5df2e(pingType)) {
        ent = var_93a0836a10e99c34 calloutmarkerping_getent(var_394466c2ddb208cb);
        if (isdefined(ent) && isent(ent)) {
            if (isdefined(ent.subcategory) && ent.subcategory == "elimTarget") {
                var_5ab0dc648937d4ea = #"hash_2cbd89d5c65961b3";
            } else if (_calloutmarkerping_isenemy(ent, var_93a0836a10e99c34)) {
                var_5ab0dc648937d4ea = #"hash_155094923a25c305";
            } else if (issubstr(ent.model, "oxygen")) {
                var_5ab0dc648937d4ea = #"hash_2dd233c754baffbc";
            } else if (issubstr(ent.model, "gas_cutter")) {
                var_5ab0dc648937d4ea = #"hash_3370e531d64ff8e2";
            } else if (istrue(ent.var_4a4265af0a6f92e9)) {
                var_5ab0dc648937d4ea = #"hash_28e8ccedd7fd880c";
            } else if (pingType == 6) {
                var_5ab0dc648937d4ea = var_93a0836a10e99c34 function_9bb1120b45cfa775(var_394466c2ddb208cb);
            }
        }
        if (!isdefined(var_5ab0dc648937d4ea)) {
            var_5ab0dc648937d4ea = #"hash_11fa7946ddf751cd";
        }
    } else if (function_74ec310d8f99b6e2(pingType)) {
        var_5ab0dc648937d4ea = #"hash_bca5e472447f8c73";
    } else if (function_87df78670540e9b2(pingType)) {
        var_5ab0dc648937d4ea = #"hash_11fa7946ddf751cd";
    } else {
        switch (pingType) {
        case 2:
            if (namespace_36f464722d326bbe::isBRStyleGameType() && isdefined(var_93a0836a10e99c34.br_infil_type)) {
                var_5ab0dc648937d4ea = #"hash_f26b98445fbb71ae";
            } else {
                var_5ab0dc648937d4ea = #"hash_11fa7946ddf751cd";
            }
            break;
        case 4:
            var_5ab0dc648937d4ea = var_93a0836a10e99c34 function_befa2cbd9d478179(var_394466c2ddb208cb);
            break;
        case 6:
            var_5ab0dc648937d4ea = var_93a0836a10e99c34 function_9bb1120b45cfa775(var_394466c2ddb208cb);
            break;
        case 5:
            var_5ab0dc648937d4ea = #"hash_df30101ebcf2d491";
            break;
        default:
            var_5ab0dc648937d4ea = #"hash_11fa7946ddf751cd";
            /#
                assertmsg("CalloutMarkerPing: " + "Callout type is not found.");
            #/
            break;
        }
    }
    wait(getdvarfloat(@"hash_1d83539430a13314", 0.5));
    if (isplayer(var_dfb9f3c233e2b8f3)) {
        var_dfb9f3c233e2b8f3 calloutmarkerpingvo_play(var_5ab0dc648937d4ea, pingType);
    } else if (isdefined(var_93a0836a10e99c34)) {
        var_93a0836a10e99c34 calloutmarkerpingvo_play(var_5ab0dc648937d4ea, pingType);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ecc
// Size: 0x59
function calloutmarkerpingvo_playpredictivepingadded(var_394466c2ddb208cb) {
    player = self;
    player notify("calloutMarkerPingVO_playPredictivePingAdded");
    player endon("calloutMarkerPingVO_playPredictivePingAdded");
    player endon("calloutMarkerPingVO_playPredictivePingCleared");
    player endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    wait(getdvarfloat(@"hash_490c0274864a18be", 0));
    if (isdefined(player)) {
        player calloutmarkerpingvo_createcalloutbattlechatter(var_394466c2ddb208cb);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f2c
// Size: 0x18f
function calloutmarkerping_removevehiclecalloutonspecialconditions(var_394466c2ddb208cb, var_9849802214c4fa0a) {
    self endon("disconnect");
    self endon("predictiveCalloutClear_" + var_394466c2ddb208cb);
    /#
        assert(isplayer(self));
    #/
    /#
        assert(self calloutmarkerping_gettype(var_394466c2ddb208cb) == 6);
    #/
    /#
        assert(isent(var_9849802214c4fa0a));
    #/
    /#
        assert(issharedfuncdefined("game", "getFriendlyPlayers"));
    #/
    var_7daf7f78e6ef64b7 = var_9849802214c4fa0a getentitynumber();
    var_ff305cfc399bb107 = "forced_kill_callout_" + var_7daf7f78e6ef64b7;
    var_451ebbf6c53edc68 = 0.25;
    var_4ced3a2a73d90ee6 = 0;
    var_43835bb50b9d7f75 = self.team;
    var_87ba069d66691559 = _calloutmarkerping_isvehicleoccupiedbyenemy(var_9849802214c4fa0a, var_43835bb50b9d7f75);
    while (1) {
        var_50dfdbdc6da80233 = _calloutmarkerping_shouldremovecalloutifwholesquadinvehicle(var_394466c2ddb208cb, var_9849802214c4fa0a, var_43835bb50b9d7f75);
        if (var_50dfdbdc6da80233) {
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
            return;
        }
        var_12b40880a002e52 = _calloutmarkerping_isvehicleoccupiedbyenemy(var_9849802214c4fa0a, var_43835bb50b9d7f75);
        if (var_12b40880a002e52) {
            if (!var_87ba069d66691559) {
                calloutmarkerping_removecallout(var_394466c2ddb208cb);
            }
            var_4ced3a2a73d90ee6 = var_4ced3a2a73d90ee6 + var_451ebbf6c53edc68;
            if (var_4ced3a2a73d90ee6 >= 3) {
                vehicleowner = var_9849802214c4fa0a getvehicleowner();
                if (isdefined(vehicleowner)) {
                    thread calloutmarkerping_enemytodangerdecaycreate(var_394466c2ddb208cb, vehicleowner);
                } else {
                    calloutmarkerping_removecallout(var_394466c2ddb208cb);
                }
                return;
            }
        }
        message = function_3462378d38b69cc8(var_451ebbf6c53edc68, var_ff305cfc399bb107);
        if (message == var_ff305cfc399bb107) {
            calloutmarkerping_removecallout(var_394466c2ddb208cb);
            return;
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0c2
// Size: 0x59
function function_3462378d38b69cc8(timeout, string1) {
    ent = spawnstruct();
    if (isdefined(string1)) {
        childthread waittill_string_no_endon_death(string1, ent);
    }
    ent childthread function_2c91b6c857aa73cc(timeout);
    msg = ent waittill("returned");
    ent notify("die");
    return msg;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa123
// Size: 0xd9
function _calloutmarkerping_shouldremovecalloutifwholesquadinvehicle(var_394466c2ddb208cb, var_9849802214c4fa0a, var_43835bb50b9d7f75) {
    var_93a0836a10e99c34 = self;
    var_d6eedd657b73ecf1 = 0;
    var_96674628376eaba6 = [[ getsharedfunc("game", "getSquadmates") ]](var_43835bb50b9d7f75, var_93a0836a10e99c34.var_ff97225579de16a, 1);
    foreach (player in var_96674628376eaba6) {
        if (player namespace_f8065cafc523dba5::isinvehicle() && player.vehicle == var_9849802214c4fa0a) {
            var_93a0836a10e99c34 calloutmarkerping_hide(var_394466c2ddb208cb, player);
            var_d6eedd657b73ecf1++;
        }
    }
    if (var_d6eedd657b73ecf1 == var_96674628376eaba6.size) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa204
// Size: 0xa2
function _calloutmarkerping_isvehicleoccupiedbyenemy(var_9849802214c4fa0a, var_43835bb50b9d7f75) {
    var_37d16028d16d8807 = isdefined(var_9849802214c4fa0a.ownerteam) && var_9849802214c4fa0a.ownerteam != var_43835bb50b9d7f75 || isdefined(var_9849802214c4fa0a.vehicleteam) && var_9849802214c4fa0a.vehicleteam != var_43835bb50b9d7f75;
    var_fa4121b60e749e3 = isdefined(var_9849802214c4fa0a.isempty) && var_9849802214c4fa0a.isempty == 0 || isdefined(var_9849802214c4fa0a.vehicleteam);
    if (var_fa4121b60e749e3 && var_37d16028d16d8807) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2ae
// Size: 0x256
function function_6a9d273f570c2d97(var_394466c2ddb208cb, var_3fbb10d80249baac, var_c198f7ca473378fb, var_f713679ecb32c725) {
    var_93a0836a10e99c34 = self;
    if (!isdefined(var_93a0836a10e99c34.var_7ab947f079adf78a)) {
        return;
    }
    var_8c75532deab80ef2 = var_93a0836a10e99c34.var_7ab947f079adf78a[var_394466c2ddb208cb];
    if (!isdefined(var_8c75532deab80ef2) || !isdefined(var_8c75532deab80ef2.pingType)) {
        return;
    }
    pingType = var_8c75532deab80ef2.pingType;
    if (!isdefined(var_93a0836a10e99c34.var_e42370a2eda517e9) || !isdefined(var_93a0836a10e99c34.var_e42370a2eda517e9[pingType])) {
        return;
    }
    var_e42370a2eda517e9 = var_93a0836a10e99c34.var_e42370a2eda517e9[pingType];
    if (var_f713679ecb32c725) {
        var_8c75532deab80ef2.var_f20158543e075304++;
    }
    eventparams = [];
    eventparams[eventparams.size] = "ping_id";
    eventparams[eventparams.size] = var_e42370a2eda517e9;
    eventparams[eventparams.size] = "ping_type";
    eventparams[eventparams.size] = pingType;
    eventparams[eventparams.size] = "tac_map_active";
    eventparams[eventparams.size] = istrue(var_93a0836a10e99c34 istacmapactive());
    eventparams[eventparams.size] = "canceled";
    eventparams[eventparams.size] = var_3fbb10d80249baac;
    eventparams[eventparams.size] = "cancel_reason";
    eventparams[eventparams.size] = var_c198f7ca473378fb;
    eventparams[eventparams.size] = "player_x";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[0];
    eventparams[eventparams.size] = "player_y";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[1];
    eventparams[eventparams.size] = "player_z";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[2];
    var_8512c523dca1fd8f = var_8c75532deab80ef2.var_8512c523dca1fd8f;
    if (isdefined(var_8512c523dca1fd8f)) {
        eventparams[eventparams.size] = "ping_x";
        eventparams[eventparams.size] = var_8512c523dca1fd8f[0];
        eventparams[eventparams.size] = "ping_y";
        eventparams[eventparams.size] = var_8512c523dca1fd8f[1];
        eventparams[eventparams.size] = "ping_z";
        eventparams[eventparams.size] = var_8512c523dca1fd8f[2];
    } else {
        eventparams[eventparams.size] = "ping_x";
        eventparams[eventparams.size] = 0;
        eventparams[eventparams.size] = "ping_y";
        eventparams[eventparams.size] = 0;
        eventparams[eventparams.size] = "ping_z";
        eventparams[eventparams.size] = 0;
    }
    eventparams[eventparams.size] = "acknowledged";
    eventparams[eventparams.size] = var_f713679ecb32c725;
    eventparams[eventparams.size] = "acknowledged_count";
    eventparams[eventparams.size] = var_8c75532deab80ef2.var_f20158543e075304;
    var_93a0836a10e99c34 dlog_recordplayerevent("dlog_event_br_ping_usage", eventparams);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa50b
// Size: 0x11a
function function_a74e2d6a089bd337(var_394466c2ddb208cb) {
    var_93a0836a10e99c34 = self;
    if (!isdefined(var_93a0836a10e99c34.var_7ab947f079adf78a)) {
        var_93a0836a10e99c34.var_7ab947f079adf78a = [];
    }
    var_8c75532deab80ef2 = var_93a0836a10e99c34.var_7ab947f079adf78a[var_394466c2ddb208cb];
    if (!isdefined(var_8c75532deab80ef2)) {
        var_93a0836a10e99c34.var_7ab947f079adf78a[var_394466c2ddb208cb] = spawnstruct();
        var_8c75532deab80ef2 = var_93a0836a10e99c34.var_7ab947f079adf78a[var_394466c2ddb208cb];
        var_8c75532deab80ef2.var_f20158543e075304 = 0;
        var_8c75532deab80ef2.pingType = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
        var_8c75532deab80ef2.var_8512c523dca1fd8f = var_93a0836a10e99c34 calloutmarkerping_getorigin(var_394466c2ddb208cb);
    }
    if (!isdefined(var_93a0836a10e99c34.var_e42370a2eda517e9)) {
        var_93a0836a10e99c34.var_e42370a2eda517e9 = [];
    }
    pingType = var_8c75532deab80ef2.pingType;
    if (!isdefined(var_93a0836a10e99c34.var_e42370a2eda517e9[pingType])) {
        var_93a0836a10e99c34.var_e42370a2eda517e9[pingType] = 1;
    } else {
        var_93a0836a10e99c34.var_e42370a2eda517e9[pingType]++;
    }
    var_93a0836a10e99c34 function_6a9d273f570c2d97(var_394466c2ddb208cb, 0, "", 0);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa62c
// Size: 0x60
function function_a366e9660606bff8() {
    var_93a0836a10e99c34 = self;
    if (isdefined(var_93a0836a10e99c34)) {
        for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
            isowner = var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb);
            if (isowner && var_93a0836a10e99c34 calloutmarkerping_getactive(var_394466c2ddb208cb)) {
                var_93a0836a10e99c34 function_6a9d273f570c2d97(var_394466c2ddb208cb, 1, "clear_all", 0);
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa693
// Size: 0x12e
function function_317d089ea4ed0a21(pingType, reason) {
    var_93a0836a10e99c34 = self;
    eventparams = [];
    eventparams[eventparams.size] = "ping_id";
    eventparams[eventparams.size] = var_93a0836a10e99c34.var_3a9aaf3e5a5c0b5[pingType];
    eventparams[eventparams.size] = "ping_type";
    eventparams[eventparams.size] = pingType;
    eventparams[eventparams.size] = "tac_map_active";
    eventparams[eventparams.size] = istrue(var_93a0836a10e99c34 istacmapactive());
    eventparams[eventparams.size] = "canceled";
    eventparams[eventparams.size] = 1;
    eventparams[eventparams.size] = "cancel_reason";
    eventparams[eventparams.size] = reason;
    eventparams[eventparams.size] = "player_x";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[0];
    eventparams[eventparams.size] = "player_y";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[1];
    eventparams[eventparams.size] = "player_z";
    eventparams[eventparams.size] = var_93a0836a10e99c34.origin[2];
    eventparams[eventparams.size] = "ping_x";
    eventparams[eventparams.size] = 0;
    eventparams[eventparams.size] = "ping_y";
    eventparams[eventparams.size] = 0;
    eventparams[eventparams.size] = "ping_z";
    eventparams[eventparams.size] = 0;
    var_93a0836a10e99c34 dlog_recordplayerevent("dlog_event_br_ping_usage", eventparams);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c8
// Size: 0x45
function function_1e008bf9d31b2b01(var_394466c2ddb208cb) {
    player = self;
    clientnum = player getentitynumber();
    owner = player function_705c264a572c0c59(var_394466c2ddb208cb);
    if (clientnum == owner) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa815
// Size: 0x73
function private function_49dc8767adf81886(var_394466c2ddb208cb, pingType, var_e5975945af891990) {
    /#
        assert(var_394466c2ddb208cb < 10);
    #/
    /#
        assert(isdefined(pingType));
    #/
    var_93a0836a10e99c34 = self;
    var_93a0836a10e99c34 function_6a9d273f570c2d97(var_394466c2ddb208cb, 1, "clear_single", 0);
    function_ec3fedcb7195cfd7(var_93a0836a10e99c34, var_394466c2ddb208cb);
    var_93a0836a10e99c34 notify("predictiveCalloutClear_" + var_394466c2ddb208cb);
    if (!var_e5975945af891990) {
        var_93a0836a10e99c34 thread calloutmarkerpingvo_playpredictivepingcleared(undefined, pingType);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa88f
// Size: 0xd0
function private function_45be7f9c916948b6(var_394466c2ddb208cb, var_60fdfb1cfd734d00) {
    /#
        assert(var_394466c2ddb208cb < 10);
    #/
    var_93a0836a10e99c34 = self;
    /#
        assert(var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb));
    #/
    /#
        assert(isplayer(var_60fdfb1cfd734d00));
    #/
    var_93a0836a10e99c34 function_6a9d273f570c2d97(var_394466c2ddb208cb, 0, "", 1);
    _calloutmarkerping_predicted_log("Refreshing ping timeout. Ping: " + var_394466c2ddb208cb + " Client: " + var_93a0836a10e99c34 getentitynumber());
    var_93a0836a10e99c34 thread _calloutmarkerping_predicted_timeout(var_394466c2ddb208cb);
    var_93a0836a10e99c34 thread calloutmarkerpingvo_playpredictivepingacknowledged(var_394466c2ddb208cb, var_60fdfb1cfd734d00);
    target = var_93a0836a10e99c34 calloutmarkerping_getent(var_394466c2ddb208cb);
    if (isdefined(target)) {
        var_ced0426e7e729ed5 = spawnstruct();
        var_ced0426e7e729ed5.target = target;
        var_93a0836a10e99c34 callback::callback("on_tacmap_ping_scriptable_or_ent", var_ced0426e7e729ed5);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa966
// Size: 0x58
function private function_85bd27e859eec16c(var_394466c2ddb208cb, var_60fdfb1cfd734d00) {
    /#
        assert(var_394466c2ddb208cb < 10);
    #/
    var_93a0836a10e99c34 = self;
    /#
        assert(var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb));
    #/
    /#
        assert(isplayer(var_60fdfb1cfd734d00));
    #/
    var_93a0836a10e99c34 thread calloutmarkerpingvo_playpredictivepingacknowledgedcancel(var_394466c2ddb208cb, var_60fdfb1cfd734d00);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa9c5
// Size: 0x31
function private function_86767e1fccad74f1() {
    if (!isdefined(level.var_15fafd55bbed3780)) {
        level.var_15fafd55bbed3780 = getdvarint(@"hash_a06ce354e4b4f9d6", 0);
    }
    return level.var_15fafd55bbed3780;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa9fe
// Size: 0xf8
function private function_2a664ee5c40e868c(var_394466c2ddb208cb) {
    /#
        assert(var_394466c2ddb208cb < 10);
    #/
    var_93a0836a10e99c34 = self;
    /#
        assert(var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb));
    #/
    if (issharedfuncdefined("ping", "calloutMarkerPing_markerAdded")) {
        [[ getsharedfunc("ping", "calloutMarkerPing_markerAdded") ]](var_93a0836a10e99c34, var_394466c2ddb208cb);
    }
    if (function_f956b46f8e151d30(var_93a0836a10e99c34, var_394466c2ddb208cb)) {
        return;
    }
    if (function_a5747eb82ee7bb73(var_93a0836a10e99c34, var_394466c2ddb208cb)) {
        return;
    }
    var_93a0836a10e99c34 function_a74e2d6a089bd337(var_394466c2ddb208cb);
    function_caadd21a226bf96(var_93a0836a10e99c34, var_394466c2ddb208cb);
    var_93a0836a10e99c34 thread _calloutmarkerping_predicted_timeout(var_394466c2ddb208cb);
    var_93a0836a10e99c34 _calloutmarkerping_checkforbuybackrequest(var_394466c2ddb208cb);
    var_93a0836a10e99c34 thread calloutmarkerpingvo_playpredictivepingadded(var_394466c2ddb208cb);
    var_93a0836a10e99c34 _calloutmarkerping_onpingchallenge(var_394466c2ddb208cb);
    if (function_86767e1fccad74f1()) {
        iprintlnbold("Ping of type " + var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb) + " has been added.");
    }
    if (var_394466c2ddb208cb == 4) {
        objindex = self calloutmarkerping_getgscobjectiveindex(var_394466c2ddb208cb);
        if (objindex != -1) {
            objective_setplayintro(objindex, 0);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaafd
// Size: 0x14
function function_5991bc039b1244ec(player) {
    player calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab18
// Size: 0xbb
function private function_f9a23942c0cd9461(var_93a0836a10e99c34, pingType) {
    if (!issharedfuncdefined("teamAssim", "isEnabled") || !issharedfuncdefined("teamAssim", "resolveAssimRequest") || !issharedfuncdefined("teamAssim", "requestNearbyTeamChange") || !issharedfuncdefined("teamAssim", "isWaitingForAssimResponse")) {
        return;
    }
    if (![[ getsharedfunc("teamAssim", "isEnabled") ]]()) {
        return;
    }
    if (function_476d89b12dfe07a1(pingType)) {
        [[ getsharedfunc("teamAssim", "requestNearbyTeamChange") ]](var_93a0836a10e99c34, pingType == 13);
    }
    if (function_caef0e7e004e5475(pingType)) {
        [[ getsharedfunc("teamAssim", "requestLeaveTeam") ]](var_93a0836a10e99c34);
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabda
// Size: 0x69
function private function_5d665c2bc1e250fa(var_394466c2ddb208cb) {
    /#
        assert(var_394466c2ddb208cb < 10);
    #/
    var_93a0836a10e99c34 = self;
    /#
        assert(var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb));
    #/
    _calloutmarkerping_predicted_log("Refreshing Timeout | pingIndex: " + var_394466c2ddb208cb + " | owner: " + var_93a0836a10e99c34 getentitynumber());
    var_93a0836a10e99c34 thread _calloutmarkerping_predicted_timeout(var_394466c2ddb208cb);
    var_93a0836a10e99c34 calloutmarkerping_playteamsoundfx("uin_ping_enemy", var_394466c2ddb208cb);
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac4a
// Size: 0x49
function private function_99811a65af9a351() {
    var_93a0836a10e99c34 = self;
    var_776ce2faf67beed7 = _calloutmarkerping_predicted_isanypingactive();
    if (var_776ce2faf67beed7) {
        var_93a0836a10e99c34 function_a366e9660606bff8();
        var_93a0836a10e99c34 calloutmarkerping_playteamsoundfx("uin_ping_cancel");
        function_8c4b1d9591dc12ab(var_93a0836a10e99c34);
    }
    var_93a0836a10e99c34 calloutmarkerping_removeallcalloutsforplayer();
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac9a
// Size: 0x7a
function function_7a87e3b6a7645c79(var_9b55b6a174c841ef) {
    var_1560c7d5cacc7888 = 32;
    if (var_1560c7d5cacc7888 > 32) {
        return undefined;
    }
    pingdata = spawnstruct();
    var_9eb6df06f8b7b0ee = 67108864 - 1;
    pingdata.lootid = var_9b55b6a174c841ef & var_9eb6df06f8b7b0ee;
    var_9b55b6a174c841ef = var_9b55b6a174c841ef >> 26;
    var_80d584b74f2c0886 = 64 - 1;
    pingdata.var_41a4a181b6606b16 = var_9b55b6a174c841ef & var_80d584b74f2c0886;
    return pingdata;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad1c
// Size: 0x165
function private function_5418b333a8e1cf76(var_9b55b6a174c841ef) {
    if (getdvarint(@"hash_43a226ede0c4e131", 0)) {
        return;
    }
    player = self;
    pingdata = function_7a87e3b6a7645c79(var_9b55b6a174c841ef);
    /#
        assert(isdefined(pingdata));
    #/
    var_6b10a57d86c5874a = player function_1e8231aee9e6076b(pingdata.var_41a4a181b6606b16);
    var_6c1b950caed8e9a3 = function_6a4a22b07cd4a96f(var_6b10a57d86c5874a.object, player.team, pingdata.lootid);
    if (isdefined(var_6c1b950caed8e9a3)) {
        playernum = player getentitynumber();
        var_e2ec7af41ccc1c1c = player function_705c264a572c0c59(var_6c1b950caed8e9a3);
        var_fd1c5decdf4eed9a = playernum != var_e2ec7af41ccc1c1c;
    }
    if (isdefined(var_6c1b950caed8e9a3) && var_fd1c5decdf4eed9a) {
        var_90bb4d49be1ad85c = getentbynum(var_e2ec7af41ccc1c1c);
        if (var_90bb4d49be1ad85c function_9482e9c50b5fe82(player, var_6c1b950caed8e9a3)) {
            var_90bb4d49be1ad85c function_69aa7fcdcfff4e0a(player, var_6c1b950caed8e9a3, 0);
            var_90bb4d49be1ad85c function_85bd27e859eec16c(var_6c1b950caed8e9a3, player);
        } else {
            var_90bb4d49be1ad85c function_69aa7fcdcfff4e0a(player, var_6c1b950caed8e9a3, 1);
            var_90bb4d49be1ad85c function_45be7f9c916948b6(var_6c1b950caed8e9a3, player);
        }
    } else {
        var_394466c2ddb208cb = player thread namespace_ede58c1e66c2c280::function_1ced737a22161a49(pingdata.var_41a4a181b6606b16, pingdata.lootid);
        if (isdefined(var_394466c2ddb208cb)) {
            player function_a74e2d6a089bd337(var_394466c2ddb208cb);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae88
// Size: 0x26
function function_6b9641d0060c3a2c(target) {
    target.var_a49938597b3587f0 = [];
    target.var_8c7acce8a4d9c2c = [];
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaeb5
// Size: 0x181
function function_ffd6eed18c767472(oldtarget, newtarget, var_7b11fc99302d2789, var_7b24d2e62b387965, var_c313310ef3c37a7e) {
    /#
        assert(isdefined(oldtarget) && isdefined(newtarget) && isdefined(var_7b11fc99302d2789));
    #/
    if (!isdefined(var_c313310ef3c37a7e)) {
        var_c313310ef3c37a7e = (0, 0, 0);
    }
    index = undefined;
    if (function_c648f0fd527e089a(var_7b11fc99302d2789)) {
        index = newtarget.index;
    } else if (function_d3789a9a4be5df2e(var_7b11fc99302d2789)) {
        index = newtarget getentitynumber();
    } else if (var_7b11fc99302d2789 == 4) {
        index = newtarget;
    }
    /#
        assert(isdefined(index));
    #/
    oldtarget.var_ad4f035f68ad85ad = var_c313310ef3c37a7e;
    oldtarget.var_b71b168e8ed463ce = index;
    oldtarget.var_a7aa780bf65803d2 = var_7b24d2e62b387965;
    if (isdefined(oldtarget.var_8c7acce8a4d9c2c)) {
        foreach (entnumber, var_394466c2ddb208cb in oldtarget.var_8c7acce8a4d9c2c) {
            var_93a0836a10e99c34 = undefined;
            if (isdefined(oldtarget.var_a49938597b3587f0)) {
                var_93a0836a10e99c34 = oldtarget.var_a49938597b3587f0[entnumber];
            }
            if (!isdefined(var_93a0836a10e99c34) || var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb) == 1) {
                continue;
            }
            function_49cdea45f60452c8(var_93a0836a10e99c34, var_394466c2ddb208cb, oldtarget);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb03d
// Size: 0x2d
function function_c068efdf0abd5258(target) {
    target.var_ad4f035f68ad85ad = undefined;
    target.var_b71b168e8ed463ce = undefined;
    target.var_a7aa780bf65803d2 = undefined;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb071
// Size: 0x52b
function function_1062f2af5c7d843e(scriptablename, weaponobj) {
    player = self;
    scriptablename = tolower(scriptablename);
    var_3ef0fdcee94cadff = "";
    if (isdefined(weaponobj)) {
        if (issubstr(scriptablename, "_me_riotshield")) {
            var_3ef0fdcee94cadff = #"hash_d3338ced812bf832";
        } else if (issubstr(scriptablename, "weapon_me") || issubstr(scriptablename, "_me_")) {
            var_3ef0fdcee94cadff = #"hash_30380a30cfda0e97";
        } else if (issubstr(scriptablename, "weapon_dm") || issubstr(scriptablename, "_dm_")) {
            var_3ef0fdcee94cadff = #"hash_c206fbb38234743c";
        } else {
            switch (weaponclass(weaponobj.basename)) {
            case #"hash_8cdaf2e4ecfe5b51":
                var_3ef0fdcee94cadff = #"hash_7172c1f52346dd5e";
                break;
            case #"hash_900cb96c552c5e8e":
                var_3ef0fdcee94cadff = #"hash_1bfcfdb323bee2a2";
                break;
            case #"hash_690c0d6a821b42e":
                var_3ef0fdcee94cadff = #"hash_7fd9900fc3e72621";
                break;
            case #"hash_fa24dff6bd60a12d":
                var_3ef0fdcee94cadff = #"hash_6af60b3a8e944db";
                break;
            case #"hash_6191aaef9f922f96":
                var_3ef0fdcee94cadff = #"hash_f487031d7cfa8ce2";
                break;
            case #"hash_61e969dacaaf9881":
                var_3ef0fdcee94cadff = #"hash_213374fa019312ed";
                break;
            case #"hash_719417cb1de832b6":
                var_3ef0fdcee94cadff = #"hash_fc919071e35cbafa";
                break;
            }
        }
    }
    if (var_3ef0fdcee94cadff == "") {
        switch (scriptablename) {
        case #"hash_e7803d9decd089c2":
            var_3ef0fdcee94cadff = #"hash_d86d80a3a22139ae";
            break;
        case #"hash_672892a4af1e94cc":
            var_3ef0fdcee94cadff = #"hash_aea59979b1f54a59";
            break;
        case #"hash_f1734c15f85881ca":
            var_3ef0fdcee94cadff = #"hash_67ed261687481469";
            break;
        case #"hash_acd2c79dce3b9907":
            var_3ef0fdcee94cadff = #"hash_675c54d7f1e7f6f";
            break;
        case #"hash_d5db533de9b14785":
            var_3ef0fdcee94cadff = #"hash_faa320e6a2c6f1b";
            break;
        case #"hash_249e26ddc4c6db40":
            var_3ef0fdcee94cadff = #"hash_b50ca3477e505b16";
            break;
        case #"hash_4acc5cb6e8055bbd":
        case #"hash_1ca613bc31b3e214":
        case #"hash_51fb8cf9a443524f":
        case #"hash_e5931853d3884ea6":
            var_3ef0fdcee94cadff = #"hash_b3e0e90b24bb67d4";
            break;
        case #"hash_12214dbd291d3d03":
        case #"hash_1892477817b6077b":
        case #"hash_736e4b57f09fd01f":
        case #"hash_64cb76a790aa0ddf":
        case #"hash_9ad472e96ffa7649":
        case #"hash_b9494439da2d7ca5":
        case #"hash_c305b5221d5d1429":
        case #"hash_c740a7ba6ff37781":
        case #"hash_cb5f2338e9122fd6":
        case #"hash_d4b690624f898e02":
        case #"hash_e6613df7bf5f6ebe":
        case #"hash_e8e7b62030261269":
            var_3ef0fdcee94cadff = #"hash_6f2dd4de8f85fd61";
            break;
        case #"hash_46fa1fc325bffb72":
        case #"hash_541953bbb2a0b9b6":
        case #"hash_7a4600eb72241347":
        case #"hash_925b7857be808b57":
        case #"hash_e47d766c40ac831b":
        case #"hash_4b5ae4745b98e56":
        case #"hash_2838637cb090a498":
        case #"hash_b3aa5201c2e89945":
        case #"hash_36b47d09e6eca09d":
        case #"hash_4326cb8d4b104ef9":
        case #"hash_fcf0917a32b55c2a":
            var_3ef0fdcee94cadff = #"hash_f39d4797a0c44bae";
            break;
        }
    }
    if (var_3ef0fdcee94cadff == "") {
        if (issubstr(scriptablename, "plunder_cash")) {
            var_3ef0fdcee94cadff = #"hash_b4bab207ae9179cb";
        } else if (issubstr(scriptablename, "taccover") || issubstr(scriptablename, "trophy") || issubstr(scriptablename, "recondrone") || issubstr(scriptablename, "super") || issubstr(scriptablename, "balloon") || issubstr(scriptablename, "deployed_decoy")) {
            var_3ef0fdcee94cadff = #"hash_d497fe78e69e0532";
        } else if (issubstr(scriptablename, "access_card")) {
            var_3ef0fdcee94cadff = #"hash_2a1db9f9b686ec99";
        } else if (issubstr(scriptablename, "loot_key") || issubstr(scriptablename, "loot_multi_key")) {
            var_3ef0fdcee94cadff = #"hash_97fb4e55806df5bf";
        } else if (issubstr(scriptablename, "killstreak")) {
            var_3ef0fdcee94cadff = #"hash_e893ef3b6d7c58a8";
        } else if (issubstr(scriptablename, "valuable")) {
            var_3ef0fdcee94cadff = #"hash_d9107ed89e7c5302";
        } else if (issubstr(scriptablename, "_me_riotshield")) {
            var_3ef0fdcee94cadff = #"hash_d3338ced812bf832";
        } else if (issubstr(scriptablename, "weapon_me")) {
            var_3ef0fdcee94cadff = #"hash_30380a30cfda0e97";
        } else if (issubstr(scriptablename, "weapon_dm")) {
            var_3ef0fdcee94cadff = #"hash_c206fbb38234743c";
        }
    }
    if (var_3ef0fdcee94cadff != "") {
        if (issharedfuncdefined("sound", "trySayLocalSound")) {
            level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](player, var_3ef0fdcee94cadff);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5a3
// Size: 0xb3
function function_47990577bda08bb4(player, var_24cf8955fecf23ac) {
    if (!isdefined(player) || !isdefined(var_24cf8955fecf23ac)) {
        return;
    }
    foreach (var_93a0836a10e99c34 in var_24cf8955fecf23ac) {
        if (var_93a0836a10e99c34 != player) {
            for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
                isowner = var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb);
                if (isowner && var_93a0836a10e99c34 calloutmarkerping_getactive(var_394466c2ddb208cb)) {
                    var_93a0836a10e99c34 calloutmarkerping_hide(var_394466c2ddb208cb, player);
                }
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb65d
// Size: 0xb3
function function_3d92221d673d555c(player, var_7a36c6d035ca56e5) {
    if (!isdefined(player) || !isdefined(var_7a36c6d035ca56e5)) {
        return;
    }
    foreach (var_93a0836a10e99c34 in var_7a36c6d035ca56e5) {
        if (var_93a0836a10e99c34 != player) {
            for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
                isowner = var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb);
                if (isowner && var_93a0836a10e99c34 calloutmarkerping_getactive(var_394466c2ddb208cb)) {
                    var_93a0836a10e99c34 calloutmarkerping_show(var_394466c2ddb208cb, player);
                }
            }
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb717
// Size: 0x3d
function private function_f956b46f8e151d30(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    target = function_b6cb97b6f81f0fd2(var_93a0836a10e99c34, var_394466c2ddb208cb);
    if (isdefined(target) && function_49cdea45f60452c8(var_93a0836a10e99c34, var_394466c2ddb208cb, target)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb75c
// Size: 0x87
function private function_49cdea45f60452c8(var_93a0836a10e99c34, var_394466c2ddb208cb, oldtarget) {
    if (isdefined(oldtarget) && isdefined(oldtarget.var_ad4f035f68ad85ad) && isdefined(oldtarget.var_b71b168e8ed463ce) && isdefined(oldtarget.var_a7aa780bf65803d2)) {
        var_93a0836a10e99c34 calloutmarkerping_removecallout(var_394466c2ddb208cb);
        var_93a0836a10e99c34 calloutmarkerping_createcallout(oldtarget.var_a7aa780bf65803d2, oldtarget.var_ad4f035f68ad85ad, oldtarget.var_b71b168e8ed463ce);
        return 1;
    }
    return 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb7eb
// Size: 0xf7
function private function_a5747eb82ee7bb73(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    target = function_b6cb97b6f81f0fd2(var_93a0836a10e99c34, var_394466c2ddb208cb);
    if (!isdefined(target) || !isdefined(target.var_7b5e5c2bbc8f9f79)) {
        return 0;
    }
    if (var_93a0836a10e99c34 function_368af07f7897fd79(4)) {
        oldindex = var_93a0836a10e99c34 function_76ecf74c7d722b52(4);
        if (var_93a0836a10e99c34 calloutmarkerping_getgscobjectiveindex(oldindex) == target.var_7b5e5c2bbc8f9f79) {
            var_93a0836a10e99c34 function_4a7d51f2dfc2fa5d(var_394466c2ddb208cb);
            var_93a0836a10e99c34 function_4a7d51f2dfc2fa5d(oldindex);
            return 1;
        }
    }
    scriptable = var_93a0836a10e99c34 calloutmarkerping_getent(var_394466c2ddb208cb);
    var_3ef0fdcee94cadff = var_93a0836a10e99c34 function_f9aa0f44521459d7(var_394466c2ddb208cb, scriptable);
    var_93a0836a10e99c34 calloutmarkerpingvo_play(var_3ef0fdcee94cadff, 4, target);
    var_93a0836a10e99c34 function_4a7d51f2dfc2fa5d(var_394466c2ddb208cb);
    var_bd1e08e0a832e094 = var_93a0836a10e99c34 function_c013e9dddee96e76(11, target.origin, target.var_7b5e5c2bbc8f9f79);
    return 1;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb8ea
// Size: 0x9f
function private function_caadd21a226bf96(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    target = function_b6cb97b6f81f0fd2(var_93a0836a10e99c34, var_394466c2ddb208cb);
    if (isdefined(target) && isdefined(target.var_a49938597b3587f0) && isdefined(target.var_8c7acce8a4d9c2c)) {
        if (!isdefined(var_93a0836a10e99c34.var_74c9b4d7a9d4ec62)) {
            var_93a0836a10e99c34.var_74c9b4d7a9d4ec62 = [];
        }
        var_93a0836a10e99c34.var_74c9b4d7a9d4ec62[var_394466c2ddb208cb] = target;
        target.var_a49938597b3587f0[var_93a0836a10e99c34 getentitynumber()] = var_93a0836a10e99c34;
        target.var_8c7acce8a4d9c2c[var_93a0836a10e99c34 getentitynumber()] = var_394466c2ddb208cb;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb990
// Size: 0x50
function private function_8c4b1d9591dc12ab(var_93a0836a10e99c34) {
    for (var_394466c2ddb208cb = 0; var_394466c2ddb208cb < 10; var_394466c2ddb208cb++) {
        isowner = var_93a0836a10e99c34 function_1e008bf9d31b2b01(var_394466c2ddb208cb);
        if (isowner && var_93a0836a10e99c34 calloutmarkerping_getactive(var_394466c2ddb208cb)) {
            function_ec3fedcb7195cfd7(var_93a0836a10e99c34, var_394466c2ddb208cb);
        }
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb9e7
// Size: 0x94
function private function_ec3fedcb7195cfd7(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    target = undefined;
    if (isdefined(var_93a0836a10e99c34.var_74c9b4d7a9d4ec62)) {
        target = var_93a0836a10e99c34.var_74c9b4d7a9d4ec62[var_394466c2ddb208cb];
        var_93a0836a10e99c34.var_74c9b4d7a9d4ec62[var_394466c2ddb208cb] = undefined;
    }
    if (isdefined(target) && isdefined(target.var_a49938597b3587f0) && isdefined(target.var_8c7acce8a4d9c2c)) {
        target.var_a49938597b3587f0[var_93a0836a10e99c34 getentitynumber()] = undefined;
        target.var_8c7acce8a4d9c2c[var_93a0836a10e99c34 getentitynumber()] = undefined;
    }
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xba82
// Size: 0x9e
function private function_b6cb97b6f81f0fd2(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    pingType = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
    target = undefined;
    if (function_c648f0fd527e089a(pingType) || function_d3789a9a4be5df2e(pingType)) {
        target = var_93a0836a10e99c34 calloutmarkerping_getent(var_394466c2ddb208cb);
    }
    if (isdefined(target) && isdefined(target.entity)) {
        target = target.entity;
    }
    var_ced0426e7e729ed5 = spawnstruct();
    var_ced0426e7e729ed5.target = target;
    var_93a0836a10e99c34 callback::callback("on_tacmap_ping_scriptable_or_ent", var_ced0426e7e729ed5);
    return target;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbb28
// Size: 0xfd
function private function_53ebc25dcfe48d00(player, objid) {
    if (!function_a23877559a8e22e8()) {
        return 1;
    }
    if (!isdefined(level.objectives)) {
        return 1;
    }
    currentobjective = undefined;
    foreach (objective in level.objectives) {
        if (isdefined(objective.objidnum) && objective.objidnum == objid) {
            currentobjective = objective;
            break;
        }
    }
    if (!isdefined(currentobjective)) {
        return 1;
    }
    return isdefined(currentobjective.touchlist) && isdefined(currentobjective.touchlist[player.team]) && currentobjective.touchlist[player.team].size > 0;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc2d
// Size: 0x85
function private function_a23877559a8e22e8() {
    if (!isdefined(level.gametype)) {
        return 0;
    }
    gametype = level.gametype;
    return gametype == "dom" || gametype == "koth" || gametype == "hc_koth" || gametype == "lp_koth" || gametype == "cdl_koth" || gametype == "koth_horde" || gametype == "grnd" || gametype == "gwai" || gametype == "hq";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbcba
// Size: 0xf
function private function_6641a5b759148e1b() {
    return namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz";
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcd1
// Size: 0x290
function function_ce5c3314571d6a29(var_394466c2ddb208cb, pingType, scriptable) {
    player = self;
    if (pingType == 21) {
        waittime = getdvarfloat(@"hash_95248e22b4b46e33", 120);
    } else if (function_c648f0fd527e089a(pingType)) {
        if (pingType == 23) {
            waittime = getdvarfloat(@"hash_cce27a6c00a3b750", 120);
        } else {
            waittime = getdvarfloat(@"hash_e6261a609ec4112a", 30);
        }
        if (isdefined(scriptable) && isdefined(scriptable.type) && scriptable.type == "br_plunder_box" || scriptable.type == "dmz_supply_drop" || scriptable.type == "dmz_supply_drop_boss" || scriptable.type == "dmz_supply_drop_samsite" || scriptable.type == "dmz_supply_drop_supply") {
            waittime = getdvarfloat(@"hash_cce27a6c00a3b750", 120);
        }
    } else if (function_5dacc89a40a58737(pingType)) {
        waittime = 3;
    } else if (function_d3789a9a4be5df2e(pingType)) {
        waittime = getdvarfloat(@"hash_be114e61e75d4839", 60);
    } else if (function_87df78670540e9b2(pingType)) {
        waittime = getdvarfloat(@"hash_9cdd2e8a0a819ed2", 120);
    } else {
        switch (pingType) {
        case 3:
            waittime = getdvarfloat(@"hash_5f52828b2ccf6cbd", 15);
            break;
        case 2:
        case 17:
            waittime = getdvarfloat(@"hash_9cdd2e8a0a819ed2", 120);
            break;
        case 4:
            waittime = getdvarfloat(@"hash_ccd1bcd6036c7446", 120);
            break;
        case 6:
            waittime = getdvarfloat(@"hash_1b586a47dbf318ae", 60);
            break;
        case 5:
            waittime = getdvarfloat(@"hash_5bcef0d3e309d5f9", 30);
            break;
        case 12:
            waittime = getdvarfloat(@"hash_cbf3b191a8e466fc", 9);
            break;
        default:
            /#
                assertmsg("CalloutMarkerPing: " + "need a proper type for death timeouts! Can't use: " + pingType);
            #/
            waittime = 2;
            break;
        }
    }
    return waittime;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf69
// Size: 0x45
function function_3bc031ab2f635f8c(lootid) {
    var_5577636292591c8b = "";
    if (isdefined(lootid)) {
        var_5577636292591c8b = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
        if (!isdefined(var_5577636292591c8b)) {
            namespace_9c840bb9f2ecbf00::demoforcesre("No loot type defined for " + lootid);
            var_5577636292591c8b = "";
        }
    }
    return var_5577636292591c8b;
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb6
// Size: 0x37
function function_c35cbd50adbcd4fd() {
    /#
        thread function_36b4f023a49e3ff3();
        waitframe();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("Remove Callout ID Notify ( removed ) | pingIndex: ");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("Watch Scriptable Death | pingIndex: ", @"hash_abc406da71abacd3");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_a655003e419fc731/namespace_ede58c1e66c2c280
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbff4
// Size: 0xa3
function private function_36b4f023a49e3ff3() {
    /#
        level endon("script_origin");
        while (1) {
            if (getdvarint(@"hash_abc406da71abacd3", 0)) {
                setdvar(@"hash_abc406da71abacd3", 0);
                foreach (bot in level.players) {
                    if (isbot(bot)) {
                        bot calloutmarkerping_createcallout(16, bot.origin);
                    }
                }
            }
            waitframe();
        }
    #/
}
