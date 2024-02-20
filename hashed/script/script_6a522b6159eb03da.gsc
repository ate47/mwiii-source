// mwiii decomp prototype
#using scripts\mp\utility\teams.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_8c8677d2a078818d;

// Namespace namespace_8c8677d2a078818d/namespace_f77f8b2f20f85e34
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2
// Size: 0x24
function init() {
    if (!getdvarint(@"hash_58f1cc219ff0d6c0", 0)) {
        return;
    }
    level.endgame = &function_e8ab535c260b2949;
}

// Namespace namespace_8c8677d2a078818d/namespace_f77f8b2f20f85e34
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd
// Size: 0xca
function function_e8ab535c260b2949(winner, endreasontext, nukedetonated) {
    if (isdefined(level.var_e8ab535c260b2949)) {
        return;
    }
    level.var_e8ab535c260b2949 = 1;
    if (winner != "tie") {
        if (isgameplayteam(winner)) {
            topplayers = array_sort_with_func(getteamdata(winner, "players"), &compare_player_score);
        } else {
            topplayers = level.placement["all"];
        }
        function_9049bca68f1f0984(topplayers);
    }
    /#
        if (!level.onlinegame && winner == "<unknown string>") {
            topplayers = [0:level.player];
            function_9049bca68f1f0984(topplayers);
        }
    #/
    wait(5);
    level thread namespace_d576b6dc7cef9c62::endgame_regularmp(winner, endreasontext, undefined, nukedetonated);
}

// Namespace namespace_8c8677d2a078818d/namespace_f77f8b2f20f85e34
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae
// Size: 0xca
function function_9049bca68f1f0984(topplayers) {
    foreach (player in topplayers) {
        hud = newclienthudelem(player);
        hud.alignx = "center";
        hud.foreground = 1;
        hud.fontscale = 3;
        hud.alpha = 1;
        hud.x = 320;
        hud.y = 300;
        hud settext("JUP_MP/PLAYER_WAGER_WINNER");
    }
}

