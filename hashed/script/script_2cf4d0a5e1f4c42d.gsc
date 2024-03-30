// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace laststand;

// Namespace laststand / namespace_da6770cba19d3de9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x13
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore, &createaction);
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9
// Size: 0x20
function evaluatescore(bot) {
    if (istrue(bot.inlaststand)) {
        return 999;
    }
    return 0;
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x28
function createaction(squadmaster) {
    return createactionbase("laststand", undefined, "main", "", &actionprocess, self);
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151
// Size: 0x1ca
function actionprocess(bot) {
    /#
        assert(istrue(bot.inlaststand));
    #/
    while (true) {
        teammate = undefined;
        if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(bot.origin)) {
            nextpoint = bot function_c42a53b48c0a683e();
            var_e5dc471579d90471 = 0;
        } else {
            teammate = function_4f3ea8c58542178a(bot);
            nextpoint = function_a0bb005ec23fa9af(bot, teammate);
            var_e5dc471579d90471 = isdefined(teammate) && nextpoint == teammate.origin;
        }
        if (!isdefined(nextpoint)) {
            point = scripts/mp/gametypes/br_circle::getrandompointincircle(bot.origin, 200, 0.5, 1, 1, 1);
            nextpoint = bot getclosestreachablepointonnavmesh(point);
        }
        bot function_9e400058ef021b03(nextpoint, 32);
        msg = bot waittill_any_in_array_or_timeout(["goal", "bad_path"], 1);
        if (msg == "bad_path") {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            continue;
        }
        if (msg == "goal" && var_e5dc471579d90471) {
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
            var_556ab897cc3c3788 = 4096;
            while (isvalidplayer(teammate)) {
                var_be8bb7e6270b5a4a = distancesquared(teammate.origin, bot.origin);
                if (var_be8bb7e6270b5a4a > var_556ab897cc3c3788) {
                    break;
                }
                ret = bot waittill_any_in_array_or_timeout(["last_stand_revived"], 1);
                if (ret == "last_stand_revived") {
                    return;
                }
            }
            /#
                function_f3cf203834e48c6d("<unknown string>");
            #/
        }
    }
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322
// Size: 0xeb
function function_a0bb005ec23fa9af(bot, teammate) {
    attacker = undefined;
    if (isdefined(bot.laststandattacker) && isvalidplayer(bot.laststandattacker)) {
        attacker = bot.laststandattacker;
    }
    nextpoint = undefined;
    if (isdefined(teammate) && isdefined(attacker) && function_cf7b2c0abeafba37(bot, teammate, attacker)) {
        nextpoint = teammate.origin;
    } else if (isdefined(attacker)) {
        var_d043251c1c5ff583 = 200;
        point = bot.origin + vectornormalize(bot.origin - attacker.origin) * var_d043251c1c5ff583;
        nextpoint = bot getclosestreachablepointonnavmesh(point);
    } else if (isdefined(teammate)) {
        nextpoint = teammate.origin;
    }
    return nextpoint;
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415
// Size: 0xf6
function function_4f3ea8c58542178a(bot) {
    var_365493582892e9a2 = 2214144;
    var_2da15eee6b62525c = 0;
    teammateclosest = undefined;
    players = scripts/mp/utility/teams::getteamdata(bot.team, "alivePlayers");
    foreach (teammate in players) {
        if (teammate == bot) {
            continue;
        }
        if (!isvalidplayer(teammate)) {
            continue;
        }
        dist = distancesquared(teammate.origin, bot.origin);
        if (dist > var_365493582892e9a2) {
            continue;
        }
        if (!isdefined(teammateclosest) || dist < var_2da15eee6b62525c) {
            teammateclosest = teammate;
            var_2da15eee6b62525c = dist;
        }
    }
    return teammateclosest;
}

// Namespace laststand / namespace_da6770cba19d3de9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0x73
function function_cf7b2c0abeafba37(bot, closestteammate, attacker) {
    dirtoattacker = vectornormalize(attacker.origin - bot.origin);
    var_16cbde366e22c3ad = vectornormalize(closestteammate.origin - bot.origin);
    return vectordot(dirtoattacker, var_16cbde366e22c3ad) < 0;
}

