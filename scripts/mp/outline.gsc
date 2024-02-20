// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using script_2342b8aad723994e;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\outline.gsc;

#namespace outline;

// Namespace outline/namespace_b903a23a81915f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec
// Size: 0x4e
function init() {
    level.outlineids = 0;
    level.outlineents = [];
    level.outlineidspending = [];
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&outlineonplayerdisconnect);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&outlineonplayerjoinedteam);
    namespace_c31609f90efcf2ca::registeronplayerjoinsquadcallback(&outlineonplayerjoinedsquad);
    level thread outlineidswatchpending();
}

// Namespace outline/namespace_b903a23a81915f18
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541
// Size: 0x24f
function outlineenableinternal(var_f20913fec7561c5f, playersvisibleto, hudoutlineassetname, prioritygroup, type, var_fa3b23d51c2dc7, squadindex) {
    /#
        assertex(type != "TEAM" || isdefined(var_fa3b23d51c2dc7), "outlineEnableInternal() passed type "TEAM" without teamVisibleTo being defined.");
    #/
    /#
        assertex(type != "SQUAD" || isdefined(var_fa3b23d51c2dc7) && isdefined(squadindex), "outlineEnableInternal() passed type "SQUAD" without defined teamVisibleTo and defined squadIndex.");
    #/
    if (!isdefined(var_f20913fec7561c5f.outlines)) {
        var_f20913fec7561c5f.outlines = [];
    }
    var_e1cecb04682e8442 = spawnstruct();
    var_e1cecb04682e8442.isdisabled = 0;
    var_e1cecb04682e8442.priority = outlineprioritygroupmap(prioritygroup);
    var_e1cecb04682e8442.playersvisibleto = playersvisibleto;
    var_e1cecb04682e8442.playersvisibletopending = [];
    var_e1cecb04682e8442.hudoutlineassetname = hudoutlineassetname;
    var_e1cecb04682e8442.type = type;
    var_e1cecb04682e8442.team = var_fa3b23d51c2dc7;
    var_e1cecb04682e8442.var_ff97225579de16a = squadindex;
    id = outlinegenerateuniqueid();
    var_f20913fec7561c5f.outlines[id] = var_e1cecb04682e8442;
    outlineaddtogloballist(var_f20913fec7561c5f);
    var_cda6602a02c53ba3 = [];
    foreach (player in var_e1cecb04682e8442.playersvisibleto) {
        if (!canoutlineforplayer(player)) {
            var_e1cecb04682e8442.playersvisibletopending[var_e1cecb04682e8442.playersvisibletopending.size] = player;
            level.outlineidspending[id] = var_f20913fec7561c5f;
        } else {
            var_25a840a406e8542a = outlinegethighestinfoforplayer(var_f20913fec7561c5f, player);
            if (!isdefined(var_25a840a406e8542a) || var_25a840a406e8542a == var_e1cecb04682e8442 || var_25a840a406e8542a.priority == var_e1cecb04682e8442.priority) {
                var_cda6602a02c53ba3[var_cda6602a02c53ba3.size] = player;
            }
        }
    }
    if (var_cda6602a02c53ba3.size > 0) {
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            var_f20913fec7561c5f function_3430d5003d0cc9f(var_cda6602a02c53ba3, prioritygroup);
        } else {
            var_f20913fec7561c5f _hudoutlineenableforclients(var_cda6602a02c53ba3, var_e1cecb04682e8442.hudoutlineassetname);
        }
    }
    return id;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x798
// Size: 0x1bb
function outlinedisableinternal(id, var_420a996e67989dc4) {
    if (!isdefined(var_420a996e67989dc4)) {
        level.outlineents = array_removeundefined(level.outlineents);
        return;
    } else if (!isdefined(var_420a996e67989dc4.outlines)) {
        outlineremovefromgloballist(var_420a996e67989dc4);
        return;
    }
    var_77c349ecef6fb0d9 = var_420a996e67989dc4.outlines[id];
    if (!isdefined(var_77c349ecef6fb0d9) || var_77c349ecef6fb0d9.isdisabled) {
        return;
    }
    var_77c349ecef6fb0d9.isdisabled = 1;
    foreach (player in var_77c349ecef6fb0d9.playersvisibleto) {
        if (!isdefined(player)) {
            continue;
        }
        if (!canoutlineforplayer(player)) {
            var_77c349ecef6fb0d9.playersvisibletopending[var_77c349ecef6fb0d9.playersvisibletopending.size] = player;
            level.outlineidspending[id] = var_420a996e67989dc4;
        } else {
            var_25a840a406e8542a = outlinegethighestinfoforplayer(var_420a996e67989dc4, player);
            if (isdefined(var_25a840a406e8542a)) {
                if (var_25a840a406e8542a.priority <= var_77c349ecef6fb0d9.priority) {
                    var_420a996e67989dc4 _hudoutlineenableforclient(player, var_25a840a406e8542a.hudoutlineassetname);
                }
            } else if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
                var_420a996e67989dc4 namespace_b903a23a81915f18::function_32dfa50c47325abe(player, "equipment", 1);
            } else {
                var_420a996e67989dc4 hudoutlinedisableforclient(player);
            }
        }
    }
    if (var_77c349ecef6fb0d9.playersvisibletopending.size == 0) {
        var_420a996e67989dc4.outlines[id] = undefined;
        if (var_420a996e67989dc4.outlines.size == 0) {
            outlineremovefromgloballist(var_420a996e67989dc4);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x31
function hudoutline_channels_init() {
    self.hudoutlinechannels = [];
    self.var_2876398bde7a4cf4 = "outline_depth_white";
    hudoutline_add_channel_internal("default", 0, self.var_2876398bde7a4cf4);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x992
// Size: 0x109
function hudoutline_add_channel_internal(channelname, priority, var_4430b08d5a2d47bf) {
    if (!isdefined(self.hudoutlinechannels)) {
        namespace_b903a23a81915f18::hudoutline_channels_init();
    }
    if (function_bf76e3eaccf13673(self.hudoutlinechannels, channelname) == -1) {
        var_52bf811c168d0d09 = self.hudoutlinechannels.size;
        index = ter_op(var_52bf811c168d0d09 > 0, var_52bf811c168d0d09, 0);
        for (i = 0; i < var_52bf811c168d0d09; i++) {
            if (self.hudoutlinechannels[i].var_c060921d335b9210 >= priority) {
                index = i;
                break;
            }
        }
        var_b1cdfae547ad011 = spawnstruct();
        var_b1cdfae547ad011.channelname = channelname;
        var_b1cdfae547ad011.var_c060921d335b9210 = priority;
        var_b1cdfae547ad011.var_4430b08d5a2d47bf = var_4430b08d5a2d47bf;
        var_b1cdfae547ad011.var_41272a9c461e0853 = [];
        self.hudoutlinechannels = array_insert(self.hudoutlinechannels, var_b1cdfae547ad011, index);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa2
// Size: 0x234
function hudoutline_enable_internal(var_ff3fe241243b175b, channelname, hudoutlineasset) {
    if (!isdefined(channelname)) {
        channelname = "default";
    }
    if (!isdefined(self.hudoutlinechannels)) {
        hudoutline_channels_init();
    }
    var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    if (var_97a487044b719f14 == -1) {
        if (!isdefined(hudoutlineasset)) {
            hudoutlineasset = self.var_2876398bde7a4cf4;
        }
        hudoutline_add_channel_internal(channelname, self.hudoutlinechannels[0].var_c060921d335b9210 - 1, hudoutlineasset);
        var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    }
    if (channelname != "default" && isdefined(hudoutlineasset) && self.hudoutlinechannels[var_97a487044b719f14].var_4430b08d5a2d47bf != hudoutlineasset && function_370c25acb4da9fe9(channelname, self)) {
        self.hudoutlinechannels[var_97a487044b719f14].var_4430b08d5a2d47bf = hudoutlineasset;
        function_a2d9562a736f54e3(channelname, self, hudoutlineasset);
    }
    if (!isdefined(self.hudoutlinecurchannel)) {
        hudoutline_activate_channel(channelname, var_ff3fe241243b175b);
    }
    var_a948959983e82f10 = self.hudoutlinecurchannel.var_c060921d335b9210;
    var_c8446d6318008d2c = self.hudoutlinechannels[var_97a487044b719f14].var_c060921d335b9210;
    if (!array_contains(self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853, var_ff3fe241243b175b)) {
        self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853 = array_add(self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853, var_ff3fe241243b175b);
    }
    if (self.hudoutlinecurchannel.channelname != channelname && var_a948959983e82f10 < var_c8446d6318008d2c) {
        hudoutline_activate_channel(channelname, var_ff3fe241243b175b);
    } else if (self.hudoutlinecurchannel.channelname == channelname) {
        function_f980012fc1b73aee(self, channelname, var_ff3fe241243b175b);
    } else if (self.hudoutlinecurchannel.channelname != channelname && var_a948959983e82f10 > var_c8446d6318008d2c && !array_contains(self.hudoutlinecurchannel.var_41272a9c461e0853, var_ff3fe241243b175b)) {
        hudoutline_activate_channel(channelname, var_ff3fe241243b175b);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x43
function function_bf76e3eaccf13673(var_a531b6ffdacf9ab5, channelname) {
    for (i = 0; i < var_a531b6ffdacf9ab5.size; i++) {
        if (var_a531b6ffdacf9ab5[i].channelname == channelname) {
            return i;
        }
    }
    return -1;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd28
// Size: 0x55
function function_370c25acb4da9fe9(channelname, ent) {
    var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    if (var_97a487044b719f14 >= 0 && self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd85
// Size: 0xeb
function function_f980012fc1b73aee(ent, channelname, var_ff3fe241243b175b) {
    if (!function_2bd2083ae492439a(ent, var_ff3fe241243b175b)) {
        function_af1ed457ea26863c(ent, channelname, var_ff3fe241243b175b);
    } else {
        foreach (var_5214f6c13b097aa8 in self.hudoutlinechannels) {
            var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
            if (var_97a487044b719f14 >= 0 && var_5214f6c13b097aa8.var_c060921d335b9210 > self.hudoutlinechannels[var_97a487044b719f14].var_c060921d335b9210 && array_contains(var_5214f6c13b097aa8.var_41272a9c461e0853, var_ff3fe241243b175b)) {
                return;
            }
        }
        function_af1ed457ea26863c(ent, channelname, var_ff3fe241243b175b);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe77
// Size: 0x7c
function function_2bd2083ae492439a(ent, var_ff3fe241243b175b) {
    foreach (channel in ent.hudoutlinechannels) {
        if (array_contains(channel.var_41272a9c461e0853, var_ff3fe241243b175b)) {
            return 1;
        }
    }
    return 0;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefb
// Size: 0xa0
function function_a2d9562a736f54e3(channelname, ent, hudoutlineasset) {
    var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    if (var_97a487044b719f14 >= 0) {
        foreach (var_ff3fe241243b175b in self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853) {
            ent hudoutlineenableforclient(var_ff3fe241243b175b, hudoutlineasset);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa2
// Size: 0xa3
function function_af1ed457ea26863c(ent, channelname, var_ff3fe241243b175b) {
    var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    if (var_97a487044b719f14 >= 0) {
        channel = self.hudoutlinechannels[var_97a487044b719f14];
        ent hudoutlineenableforclient(var_ff3fe241243b175b, channel.var_4430b08d5a2d47bf);
        if (!array_contains(channel.var_41272a9c461e0853, var_ff3fe241243b175b)) {
            self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853 = array_add(channel.var_41272a9c461e0853, var_ff3fe241243b175b);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104c
// Size: 0xa1
function hudoutline_activate_channel(channelname, var_ff3fe241243b175b) {
    if (isdefined(self.hudoutlinecurchannel) && self.hudoutlinecurchannel.channelname != channelname && array_contains(self.hudoutlinecurchannel.var_41272a9c461e0853, var_ff3fe241243b175b)) {
        function_32dfa50c47325abe(var_ff3fe241243b175b, self.hudoutlinecurchannel.channelname, 0);
    }
    self.hudoutlinecurchannel = self.hudoutlinechannels[function_bf76e3eaccf13673(self.hudoutlinechannels, channelname)];
    function_f980012fc1b73aee(self, channelname, var_ff3fe241243b175b);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f4
// Size: 0x148
function function_32dfa50c47325abe(var_10afc5ce5a1feebe, channelname, var_d6ee45fafd47e3cc) {
    if (!isdefined(var_d6ee45fafd47e3cc)) {
        var_d6ee45fafd47e3cc = 0;
    }
    var_97a487044b719f14 = function_bf76e3eaccf13673(self.hudoutlinechannels, channelname);
    channel = self.hudoutlinechannels[var_97a487044b719f14];
    if (isdefined(channel)) {
        for (i = 0; i < channel.var_41272a9c461e0853.size; i++) {
            if (channel.var_41272a9c461e0853[i] == var_10afc5ce5a1feebe) {
                self hudoutlinedisableforclient(var_10afc5ce5a1feebe);
                if (var_d6ee45fafd47e3cc) {
                    self.hudoutlinechannels[var_97a487044b719f14].var_41272a9c461e0853 = array_remove_index(channel.var_41272a9c461e0853, i, 0);
                }
                break;
            }
        }
        for (i = self.hudoutlinechannels.size - 1; i >= 0; i--) {
            if (self.hudoutlinechannels[i].var_c060921d335b9210 > channel.var_c060921d335b9210) {
                continue;
            }
            if (array_contains(self.hudoutlinechannels[i].var_41272a9c461e0853, var_10afc5ce5a1feebe)) {
                hudoutline_activate_channel(self.hudoutlinechannels[i].channelname, var_10afc5ce5a1feebe);
                break;
            }
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1243
// Size: 0x11b
function outlinerefreshinternal(var_420a996e67989dc4) {
    if (!isdefined(var_420a996e67989dc4.outlines) || var_420a996e67989dc4.outlines.size == 0) {
        return;
    }
    foreach (var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
        if (!isdefined(var_e1cecb04682e8442) || var_e1cecb04682e8442.isdisabled) {
            continue;
        }
        foreach (player in var_e1cecb04682e8442.playersvisibleto) {
            if (!isdefined(player)) {
                continue;
            }
            var_25a840a406e8542a = outlinegethighestinfoforplayer(var_420a996e67989dc4, player);
            if (isdefined(var_25a840a406e8542a)) {
                var_420a996e67989dc4 _hudoutlineenableforclient(player, var_25a840a406e8542a.hudoutlineassetname);
            }
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1365
// Size: 0x1c
function outlineonplayerdisconnect(player) {
    outlineremoveplayerfromvisibletoarrays(player);
    outlinedisableinternalall(player);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1388
// Size: 0x50
function outlineonplayerjoinedteam(player) {
    if (!isdefined(player.team) || player.team == "spectator" || player.team == "codcaster") {
        return;
    }
    thread outlineonplayerjoinedteam_onfirstspawn(player);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13df
// Size: 0x42
function outlineonplayerjoinedteam_onfirstspawn(player) {
    player notify("outlineOnPlayerJoinedTeam_onFirstSpawn");
    player endon("outlineOnPlayerJoinedTeam_onFirstSpawn");
    player endon("disconnect");
    player waittill("spawned_player");
    outlineremoveplayerfromvisibletoarrays(player);
    outlinedisableinternalall(player);
    outlineaddplayertoexistingallandteamoutlines(player);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1428
// Size: 0x44
function outlineonplayerjoinedsquad(player) {
    /#
        assertex(isdefined(player.team) && player.team != "spectator", "outlineOnPlayerJoinedSquad() called on player with invalid team.");
    #/
    thread outlineonplayerjoinedsquad_onfirstspawn(player);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1473
// Size: 0x3c
function outlineonplayerjoinedsquad_onfirstspawn(player) {
    player notify("outlineOnPlayerJoinedSquad_onFirstSpawn");
    player endon("outlineOnPlayerJoinedSquad_onFirstSpawn");
    player endon("disconnect");
    player waittill("spawned_player");
    outlineremoveplayerfromvisibletoarrays(player, 1);
    outlineaddplayertoexistingsquadoutlines(player);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b6
// Size: 0x196
function outlineremoveplayerfromvisibletoarrays(player, var_e1f59b5642da1702) {
    level.outlineents = array_removeundefined(level.outlineents);
    foreach (var_420a996e67989dc4 in level.outlineents) {
        var_8408cba753aba3e3 = 0;
        if (!isdefined(var_420a996e67989dc4) || !isdefined(var_420a996e67989dc4.outlines)) {
            continue;
        }
        foreach (var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
            if (!isdefined(var_e1cecb04682e8442.playersvisibleto)) {
                continue;
            }
            if (istrue(var_e1f59b5642da1702)) {
                jumpiffalse(var_e1cecb04682e8442.type != "SQUAD") LOC_000000f7;
            } else {
            LOC_000000f7:
                var_e1cecb04682e8442.playersvisibleto = array_removeundefined(var_e1cecb04682e8442.playersvisibleto);
                if (isdefined(player) && array_contains(var_e1cecb04682e8442.playersvisibleto, player)) {
                    var_e1cecb04682e8442.playersvisibleto = array_remove(var_e1cecb04682e8442.playersvisibleto, player);
                    var_8408cba753aba3e3 = 1;
                }
            }
        }
        if (var_8408cba753aba3e3 && isdefined(var_420a996e67989dc4) && isdefined(player)) {
            var_420a996e67989dc4 hudoutlinedisableforclient(player);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1653
// Size: 0x193
function outlineaddplayertoexistingallandteamoutlines(player) {
    foreach (var_420a996e67989dc4 in level.outlineents) {
        if (!isdefined(var_420a996e67989dc4) || !isdefined(var_420a996e67989dc4.outlines)) {
            continue;
        }
        var_25a840a406e8542a = undefined;
        foreach (var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
            if (var_e1cecb04682e8442.type == "ALL" || var_e1cecb04682e8442.type == "TEAM" && var_e1cecb04682e8442.team == player.team) {
                if (!array_contains(var_e1cecb04682e8442.playersvisibleto, player)) {
                    var_e1cecb04682e8442.playersvisibleto[var_e1cecb04682e8442.playersvisibleto.size] = player;
                } else {
                    /#
                        assertmsg("Found a team outline call on a player's new team that already had a reference to him. This should never happen. Are we letting a player change teams to his own team?");
                    #/
                }
                if (!isdefined(var_25a840a406e8542a) || var_e1cecb04682e8442.priority > var_25a840a406e8542a.priority) {
                    var_25a840a406e8542a = var_e1cecb04682e8442;
                }
            }
        }
        if (isdefined(var_25a840a406e8542a)) {
            var_420a996e67989dc4 _hudoutlineenableforclient(player, var_25a840a406e8542a.hudoutlineassetname);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ed
// Size: 0x1c6
function outlineaddplayertoexistingsquadoutlines(player) {
    if (!isdefined(player.var_ff97225579de16a)) {
        /#
            assertmsg("outlineAddPlayerToExistingSquadOutlines() called on player without player.sessionsquadid defined.");
        #/
    }
    foreach (var_420a996e67989dc4 in level.outlineents) {
        if (!isdefined(var_420a996e67989dc4) || !isdefined(var_420a996e67989dc4.outlines)) {
            continue;
        }
        var_25a840a406e8542a = undefined;
        foreach (var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
            if (var_e1cecb04682e8442.type == "SQUAD" && var_e1cecb04682e8442.team == player.team && isdefined(var_e1cecb04682e8442.var_ff97225579de16a) && var_e1cecb04682e8442.var_ff97225579de16a == player.var_ff97225579de16a) {
                if (!array_contains(var_e1cecb04682e8442.playersvisibleto, player)) {
                    var_e1cecb04682e8442.playersvisibleto[var_e1cecb04682e8442.playersvisibleto.size] = player;
                } else {
                    /#
                        assertmsg("Found a squad outline call on a player's new squad that already had a reference to him. This should never happen. Are we letting a player change squads to his own squad?");
                    #/
                }
                if (!isdefined(var_25a840a406e8542a) || var_e1cecb04682e8442.priority > var_25a840a406e8542a.priority) {
                    var_25a840a406e8542a = var_e1cecb04682e8442;
                }
            }
        }
        if (isdefined(var_25a840a406e8542a)) {
            var_420a996e67989dc4 _hudoutlineenableforclient(player, var_25a840a406e8542a.hudoutlineassetname);
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ba
// Size: 0x8d
function outlinedisableinternalall(var_420a996e67989dc4) {
    if (!isdefined(var_420a996e67989dc4) || !isdefined(var_420a996e67989dc4.outlines) || var_420a996e67989dc4.outlines.size == 0) {
        return;
    }
    foreach (id, _ in var_420a996e67989dc4.outlines) {
        outlinedisableinternal(id, var_420a996e67989dc4);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4e
// Size: 0x35
function outlineaddtogloballist(var_420a996e67989dc4) {
    if (!array_contains(level.outlineents, var_420a996e67989dc4)) {
        level.outlineents[level.outlineents.size] = var_420a996e67989dc4;
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x25
function outlineremovefromgloballist(var_420a996e67989dc4) {
    level.outlineents = array_remove(level.outlineents, var_420a996e67989dc4);
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab6
// Size: 0xce
function outlinegethighestpriorityid(var_420a996e67989dc4) {
    result = -1;
    if (!isdefined(var_420a996e67989dc4.outlines) || var_420a996e67989dc4.size == 0) {
        return result;
    }
    var_25a840a406e8542a = undefined;
    foreach (id, var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
        if (!isdefined(var_e1cecb04682e8442) || var_e1cecb04682e8442.isdisabled) {
            continue;
        }
        if (!isdefined(var_25a840a406e8542a) || var_e1cecb04682e8442.priority > var_25a840a406e8542a.priority) {
            var_25a840a406e8542a = var_e1cecb04682e8442;
            result = id;
        }
    }
    return result;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8c
// Size: 0xdc
function outlinegethighestinfoforplayer(var_420a996e67989dc4, player) {
    var_25a840a406e8542a = undefined;
    if (!isdefined(var_420a996e67989dc4.outlines) || var_420a996e67989dc4.size == 0) {
        return var_25a840a406e8542a;
    }
    foreach (var_e1cecb04682e8442 in var_420a996e67989dc4.outlines) {
        if (!isdefined(var_e1cecb04682e8442) || var_e1cecb04682e8442.isdisabled) {
            continue;
        }
        if (array_contains(var_e1cecb04682e8442.playersvisibleto, player) && (!isdefined(var_25a840a406e8542a) || var_e1cecb04682e8442.priority > var_25a840a406e8542a.priority)) {
            var_25a840a406e8542a = var_e1cecb04682e8442;
        }
    }
    return var_25a840a406e8542a;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c70
// Size: 0x2e
function outlinegenerateuniqueid() {
    /#
        assertex(isdefined(level.outlineids), "Outline enable called on entity before _outline::init() function has been called.");
    #/
    level.outlineids++;
    return level.outlineids;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca6
// Size: 0xf6
function outlineprioritygroupmap(prioritygroup) {
    prioritygroup = tolower(prioritygroup);
    priority = undefined;
    switch (prioritygroup) {
    case #"hash_981112ec5a4f9d1b":
        priority = 0;
        break;
    case #"hash_5b627208a88fd4c5":
        priority = 1;
        break;
    case #"hash_93c71e7b6c0b81d7":
        priority = 2;
        break;
    case #"hash_ab671284a3fc4e3d":
        priority = 3;
        break;
    case #"hash_ddbe11dc920809f1":
        priority = 4;
        break;
    case #"hash_1cac65e1b8bf24a7":
        priority = 5;
        break;
    case #"hash_1f9d0ab7b01d7818":
        priority = 6;
        break;
    case #"hash_df6b3b2585101bc7":
        priority = 7;
        break;
    case #"hash_6d308d6c437ce11c":
        priority = 8;
        break;
    default:
        /#
            assertmsg("Invalid priority group passed to outlinePriorityGroupMap(): " + prioritygroup);
        #/
        priority = 0;
        break;
    }
    return priority;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da4
// Size: 0xb1
function outlineiddowatch() {
    foreach (index, ent in level.outlineidspending) {
        if (!isdefined(ent)) {
            continue;
        }
        if (!isdefined(ent.outlines)) {
            continue;
        }
        var_e1cecb04682e8442 = ent.outlines[index];
        if (!isdefined(var_e1cecb04682e8442)) {
            continue;
        }
        if (var_e1cecb04682e8442.playersvisibletopending.size > 0) {
            if (outlinerefreshpending(ent, index)) {
                level.outlineidspending[index] = undefined;
            }
        }
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5c
// Size: 0x14
function outlineidswatchpending() {
    while (1) {
        waittillframeend();
        outlineiddowatch();
        waitframe();
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e77
// Size: 0x14f
function outlinerefreshpending(var_420a996e67989dc4, id) {
    var_e1cecb04682e8442 = var_420a996e67989dc4.outlines[id];
    foreach (index, player in var_e1cecb04682e8442.playersvisibletopending) {
        if (!isdefined(player)) {
            continue;
        }
        if (canoutlineforplayer(player)) {
            var_25a840a406e8542a = outlinegethighestinfoforplayer(var_420a996e67989dc4, player);
            if (isdefined(var_25a840a406e8542a) && var_25a840a406e8542a.hudoutlineassetname != "invisible") {
                var_420a996e67989dc4 hudoutlineenableforclient(player, var_25a840a406e8542a.hudoutlineassetname);
            } else {
                var_420a996e67989dc4 hudoutlinedisableforclient(player);
            }
            var_e1cecb04682e8442.playersvisibletopending[index] = undefined;
        }
    }
    var_e1cecb04682e8442.playersvisibletopending = array_removeundefined(var_e1cecb04682e8442.playersvisibletopending);
    if (var_e1cecb04682e8442.playersvisibletopending.size == 0) {
        if (var_e1cecb04682e8442.isdisabled) {
            var_420a996e67989dc4.outlines[id] = undefined;
        }
        if (var_420a996e67989dc4.outlines.size == 0) {
            outlineremovefromgloballist(var_420a996e67989dc4);
        }
        return 1;
    }
    return 0;
}

// Namespace outline/namespace_b903a23a81915f18
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fce
// Size: 0x1d
function canoutlineforplayer(player) {
    return player.sessionstate != "spectator";
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff3
// Size: 0x62
function function_3430d5003d0cc9f(var_cda6602a02c53ba3, prioritygroup) {
    foreach (operator in var_cda6602a02c53ba3) {
        namespace_b903a23a81915f18::hudoutline_enable_internal(operator, prioritygroup);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205c
// Size: 0x32
function _hudoutlineenableforclient(client, hudoutlineassetname) {
    if (hudoutlineassetname == "invisible") {
        self hudoutlinedisableforclient(client);
    } else {
        self hudoutlineenableforclient(client, hudoutlineassetname);
    }
}

// Namespace outline/namespace_b903a23a81915f18
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2095
// Size: 0x32
function _hudoutlineenableforclients(var_b66f9e35e36435bb, hudoutlineassetname) {
    if (hudoutlineassetname == "invisible") {
        self hudoutlinedisableforclients(var_b66f9e35e36435bb);
    } else {
        self hudoutlineenableforclients(var_b66f9e35e36435bb, hudoutlineassetname);
    }
}
