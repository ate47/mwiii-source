// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;

#namespace namespace_484ab6dce1752cc8;

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355
// Size: 0x1d0
function function_620aa345ac2f9963() {
    if (level.gametype == "dungeons") {
        return;
    }
    var_21e8a7768c0260f2 = function_811510b694ddd963();
    if (isdefined(var_21e8a7768c0260f2)) {
        var_eecca1d1275b620d = function_2ef675c13ca1c4af(%"hash_5c338ed91460dbe1", var_21e8a7768c0260f2.var_702b32c96429baee);
    } else {
        /#
            assertmsg("Undefined project bundle when initializing battle tracks");
        #/
        return;
    }
    level.var_702b32c96429baee = getscriptbundle(var_eecca1d1275b620d).var_702b32c96429baee;
    if (!isdefined(level.var_702b32c96429baee)) {
        /#
            assertmsg("Didn't find a vehicle track list");
        #/
        return;
    }
    foreach (index, var_40627b946d4e9a94 in level.var_702b32c96429baee) {
        if (index <= 1) {
            continue;
        }
        if (!isdefined(var_40627b946d4e9a94.var_88cc26b68d5fba92)) {
            continue;
        }
        trackname = function_2ef675c13ca1c4af(%"hash_8f87dca26d14f0d", var_40627b946d4e9a94.var_88cc26b68d5fba92);
        var_2450b73ccbdae7d = function_50f8a8f765bad85e(trackname, [0:#"hash_7fcaf90080dbf68d", 1:#"hash_b564ddd34fab3f00"]);
        var_40627b946d4e9a94.var_ebb583a772b21a39 = var_2450b73ccbdae7d.var_ebb583a772b21a39;
        var_40627b946d4e9a94.var_cf52bb02eadc20d4 = var_2450b73ccbdae7d.var_cf52bb02eadc20d4;
        if (!isdefined(var_40627b946d4e9a94.var_ebb583a772b21a39)) {
            /#
                assertmsg("Didn't find a SFX alias in track: " + var_40627b946d4e9a94.var_88cc26b68d5fba92);
            #/
        }
        if (!isdefined(var_40627b946d4e9a94.var_cf52bb02eadc20d4)) {
            /#
                assertmsg("Didn't find a music state in track: " + var_40627b946d4e9a94.var_88cc26b68d5fba92);
            #/
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52c
// Size: 0x60
function battle_tracks_onentervehicle(vehicle, player) {
    if (level.gametype == "dungeons") {
        return;
    }
    if (function_c3d244ceadc23533(player)) {
        function_7718d2895fdba333(player);
        if (!function_4c953e9e77258030(vehicle, player)) {
            battle_tracks_stopbattletrackswhenstandingonvehicle(player);
        }
    }
    if (battle_tracks_shouldstartbattletracks(vehicle)) {
        battle_tracks_playbattletrackstoplayer(vehicle, player, 0);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x593
// Size: 0xaf
function battle_tracks_vehicleoccupancyenter(vehicle, player, seatid, var_fc7c7a874b43a31a) {
    if (level.gametype == "dungeons") {
        return;
    }
    var_df653126c71ef4ca = namespace_1fbd40990ee60ede::vehicle_occupancy_isdriverseat(vehicle, seatid);
    var_10e0f337938fcfa6 = battle_tracks_isbattletracksowner(vehicle, player);
    battle_tracks_trystopdrivertogglethink(vehicle, player, var_fc7c7a874b43a31a);
    battle_tracks_hidetogglewidget(player);
    if (var_df653126c71ef4ca) {
        if (!var_10e0f337938fcfa6) {
            battle_tracks_stopbattletrackstoalloccupants(vehicle);
            battle_tracks_updatebattletracks(vehicle, player);
        }
        if (battle_tracks_shouldstartbattletracks(vehicle)) {
            battle_tracks_playbattletrackstoalloccupants(vehicle);
        }
        if (!battle_tracks_hasemptybattletracks(vehicle)) {
            player thread battle_tracks_togglethink(player, vehicle);
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649
// Size: 0x7c
function battle_tracks_onexitvehicle(vehicle, player, seatid) {
    if (level.gametype == "dungeons") {
        return;
    }
    battle_tracks_stopbattletracksforplayer(vehicle.battletracksmusicstate, player, 0);
    battle_tracks_trystopdrivertogglethink(vehicle, player, seatid);
    battle_tracks_hidetogglewidget(player);
    var_10e0f337938fcfa6 = battle_tracks_isbattletracksowner(vehicle, player);
    if (var_10e0f337938fcfa6) {
        battle_tracks_stopbattletrackstoalloccupants(vehicle);
        battle_tracks_clearbattletracks(vehicle);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cc
// Size: 0x43
function battle_tracks_monitorstandingonvehicles(player) {
    if (level.gametype == "dungeons") {
        return;
    }
    level endon("game_ended");
    player endon("disconnect");
    while (1) {
        battle_tracks_tryplayingbattletrackswhenstandingonvehicle(player);
        wait(0.5);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716
// Size: 0xa2
function battle_tracks_updatebattletracks(vehicle, player) {
    vehicle.battletracks = [];
    vehicle.battletracksowner = player;
    vehicle.battletracksmusicstate = "";
    if (battle_tracks_playerselectrandomtracks(vehicle, player)) {
        battle_tracks_updatebattletracksfromplayerdata(vehicle, player, 1, 9);
    } else {
        battle_tracks_updatebattletracksfromplayerdata(vehicle, player, 0, 9);
    }
    /#
        if (function_561f62b5ed736105()) {
            vehicle.battletracks = function_ea5ef1563045fe8c(vehicle);
        }
    #/
    vehicle.battletracks = namespace_3c37cb17ade254d::array_randomize(vehicle.battletracks);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf
// Size: 0x11f
function battle_tracks_updatebattletracksfromplayerdata(vehicle, player, startindex, endindex) {
    data = namespace_1f188a13f7e79610::function_86f6f784630b11fb(vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd());
    for (var_109ebf347b2f2ece = startindex; var_109ebf347b2f2ece <= endindex; var_109ebf347b2f2ece++) {
        var_534056c7a3b8c64 = battle_tracks_gettrackindex(vehicle, player, var_109ebf347b2f2ece, data);
        /#
            if (getdvarint(@"hash_aa9c7230c056a9f8", 0) > 0) {
                var_534056c7a3b8c64 = getdvarint(@"hash_aa9c7230c056a9f8");
            }
        #/
        if (isdefined(var_534056c7a3b8c64) && var_534056c7a3b8c64 > 1) {
            if (getdvarint(@"hash_157cdff8f5182e88", 0) == 0) {
                var_a244f2f1e8cac724 = battle_tracks_getsfxalias(var_534056c7a3b8c64);
                if (isdefined(var_a244f2f1e8cac724) && var_a244f2f1e8cac724 != "") {
                    vehicle.battletracks = namespace_3c37cb17ade254d::array_add(vehicle.battletracks, var_a244f2f1e8cac724);
                    battle_tracks_setmusicstate(vehicle, var_534056c7a3b8c64);
                }
            } else {
                vehicle.battletracks = namespace_3c37cb17ade254d::array_add(vehicle.battletracks, var_534056c7a3b8c64);
            }
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e5
// Size: 0x65
function battle_tracks_setmusicstate(vehicle, var_534056c7a3b8c64) {
    musicstate = battle_tracks_getmusicstate(var_534056c7a3b8c64);
    if (vehicle.battletracksmusicstate == "") {
        vehicle.battletracksmusicstate = musicstate;
    } else {
        /#
            assertex(vehicle.battletracksmusicstate == musicstate, "Unable to play tracks from different music state");
        #/
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951
// Size: 0x4b
function battle_tracks_playerselectrandomtracks(vehicle, player) {
    data = namespace_1f188a13f7e79610::function_86f6f784630b11fb(vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd());
    var_5cd83eed6cc7ed18 = battle_tracks_gettrackindex(vehicle, player, 0, data);
    return isdefined(var_5cd83eed6cc7ed18) && var_5cd83eed6cc7ed18 == 1;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a4
// Size: 0x9a
function battle_tracks_gettrackindex(vehicle, player, var_109ebf347b2f2ece, data) {
    /#
        var_2613246720524878 = getdvarint(@"hash_97029a354c4876c0", 0);
        if (var_2613246720524878 != 0) {
            return var_2613246720524878;
        }
    #/
    if (isdefined(data) && isdefined(data.ref)) {
        var_534056c7a3b8c64 = player getplayerdata(level.loadoutsgroup, "customizationSetup", "vehicleCustomization", data.ref, "tracks", var_109ebf347b2f2ece);
        return var_534056c7a3b8c64;
    } else {
        return undefined;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45
// Size: 0x3f
function battle_tracks_getsfxalias(var_534056c7a3b8c64) {
    if (isdefined(level.var_702b32c96429baee) && isdefined(level.var_702b32c96429baee[var_534056c7a3b8c64])) {
        return level.var_702b32c96429baee[var_534056c7a3b8c64].var_ebb583a772b21a39;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8b
// Size: 0x3f
function battle_tracks_getmusicstate(var_534056c7a3b8c64) {
    if (isdefined(level.var_702b32c96429baee) && isdefined(level.var_702b32c96429baee[var_534056c7a3b8c64])) {
        return level.var_702b32c96429baee[var_534056c7a3b8c64].var_cf52bb02eadc20d4;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1
// Size: 0xbb
function battle_tracks_playbattletrackstoalloccupants(vehicle) {
    if (getdvarint(@"hash_157cdff8f5182e88", 0) == 0) {
        var_6e62512e935b6eeb = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle, 1);
        if (isdefined(vehicle.var_3a442282fb9074e1)) {
            var_6e62512e935b6eeb = array_combine_unique(var_6e62512e935b6eeb, vehicle.var_3a442282fb9074e1);
        }
        foreach (occupant in var_6e62512e935b6eeb) {
            battle_tracks_playbattletrackstoplayer(vehicle, occupant, 0);
        }
    } else {
        vehicle function_6db07c8a8c0f9ae6(vehicle.battletracks);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb93
// Size: 0xba
function battle_tracks_stopbattletrackstoalloccupants(vehicle) {
    if (getdvarint(@"hash_157cdff8f5182e88", 0) == 0) {
        var_6e62512e935b6eeb = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(vehicle, 1);
        if (isdefined(vehicle.var_3a442282fb9074e1)) {
            var_6e62512e935b6eeb = array_combine_unique(var_6e62512e935b6eeb, vehicle.var_3a442282fb9074e1);
        }
        foreach (occupant in var_6e62512e935b6eeb) {
            battle_tracks_stopbattletracksforplayer(vehicle.battletracksmusicstate, occupant, 0);
        }
    } else {
        vehicle function_3a119112e4018367();
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc54
// Size: 0x11a
function battle_tracks_playbattletrackstoplayer(vehicle, player, var_29172b8e5d02be98) {
    if (getdvarint(@"hash_157cdff8f5182e88", 0) != 0) {
        return;
    }
    var_10e0f337938fcfa6 = battle_tracks_isbattletracksowner(vehicle, player);
    if (isdefined(vehicle.battletracksmusicstate) && isdefined(vehicle.battletracks) && isdefined(player)) {
        if (isdefined(vehicle.battletracksowner) && (var_10e0f337938fcfa6 || var_29172b8e5d02be98 || player getwartrackpassengerenabled())) {
            var_a922e318ff7f4a24 = battle_tracks_getbattletracksid(vehicle);
            if (!function_59720efc5c367af2(vehicle, player, var_a922e318ff7f4a24)) {
                /#
                    function_3971973c87f8c8d(vehicle, player);
                #/
                player.battletracksmusicstate = vehicle.battletracksmusicstate;
                player.var_b132b6a670abb56e = var_a922e318ff7f4a24;
                player setplayermusicstate(vehicle.battletracksmusicstate, vehicle.battletracks, vehicle, (0, 0, 0));
            }
        }
        if (!var_10e0f337938fcfa6 && !var_29172b8e5d02be98) {
            player thread function_d9a28875c82616d0(player, vehicle);
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd75
// Size: 0x66
function function_59720efc5c367af2(vehicle, player, var_a922e318ff7f4a24) {
    if (!isdefined(player.battletracksmusicstate)) {
        return 0;
    }
    if (!isdefined(player.var_b132b6a670abb56e)) {
        return 0;
    }
    return player.battletracksmusicstate == vehicle.battletracksmusicstate && player.var_b132b6a670abb56e == var_a922e318ff7f4a24;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde3
// Size: 0x7c
function battle_tracks_stopbattletracksforplayer(battletracksmusicstate, player, var_29172b8e5d02be98) {
    if (getdvarint(@"hash_157cdff8f5182e88", 0) != 0) {
        return;
    }
    if (function_c3d244ceadc23533(player)) {
        if (isdefined(battletracksmusicstate) && isdefined(player)) {
            /#
                function_be79f42e9d2ddc27(battletracksmusicstate, player);
            #/
            player.battletracksmusicstate = undefined;
            player.var_b132b6a670abb56e = undefined;
            player stopplayermusicstate(battletracksmusicstate);
            if (!var_29172b8e5d02be98) {
                player notify("stop_battle_tracks_option_watch");
            }
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0x28
function function_c3d244ceadc23533(player) {
    return isdefined(player.battletracksmusicstate) && isdefined(player.var_b132b6a670abb56e);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe96
// Size: 0x31
function battle_tracks_isbattletracksowner(vehicle, player) {
    return isdefined(vehicle.battletracksowner) && vehicle.battletracksowner == player;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecf
// Size: 0x2d
function battle_tracks_clearbattletracks(vehicle) {
    vehicle.battletracksowner = undefined;
    vehicle.battletracks = undefined;
    vehicle.battletracksmusicstate = undefined;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf03
// Size: 0x33
function battle_tracks_hasemptybattletracks(vehicle) {
    if (!isdefined(vehicle.battletracks)) {
        return 1;
    }
    if (vehicle.battletracks.size == 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e
// Size: 0x184
function battle_tracks_togglethink(player, vehicle) {
    player notify("stop_battle_tracks_toggle_think");
    player endon("stop_battle_tracks_toggle_think");
    player endon("death_or_disconnect");
    player endon("last_stand_start");
    battle_tracks_tryinittogglestate(player);
    var_4844d16e0d10f08b = battle_tracks_gettogglestate(player);
    battle_tracks_updatetogglestate(player, vehicle, var_4844d16e0d10f08b);
    var_5c7ff285b6699ecd = player is_player_gamepad_enabled();
    if (var_5c7ff285b6699ecd) {
        if (vehicle namespace_dbbb37eb352edf96::ishelicopter()) {
            player notifyonplayercommand("update_battle_tracks_toggle_state", "+melee_zoom");
            player notifyonplayercommand("cancel_battle_tracks_toggle_state", "-melee_zoom");
            player.var_23b06600e2a88b42 = "melee_zoom";
        } else {
            player notifyonplayercommand("update_battle_tracks_toggle_state", "+frag");
            player notifyonplayercommand("cancel_battle_tracks_toggle_state", "-frag");
            player.var_23b06600e2a88b42 = "frag";
        }
    } else {
        player notifyonplayercommand("update_battle_tracks_toggle_state", "nightvision");
        player.var_23b06600e2a88b42 = "nightvision";
    }
    while (1) {
        player setclientomnvar("ui_veh_music_toggle_button_holdtime", 0);
        player waittill("update_battle_tracks_toggle_state");
        var_eaeca8280194353e = battle_tracks_getnewtogglestate(player);
        if (var_5c7ff285b6699ecd) {
            player childthread function_338b77c14712dbb3();
            result = player waittill_notify_or_timeout_return("cancel_battle_tracks_toggle_state", 0.25);
            if (result == "timeout") {
                player notify("cancel_battle_tracks_toggle_state");
                battle_tracks_updatetogglestate(player, vehicle, var_eaeca8280194353e);
            }
        } else {
            battle_tracks_updatetogglestate(player, vehicle, var_eaeca8280194353e);
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9
// Size: 0x49
function function_338b77c14712dbb3() {
    self endon("cancel_battle_tracks_toggle_state");
    progress = 0;
    while (1) {
        progress = progress + level.framedurationseconds;
        self setclientomnvar("ui_veh_music_toggle_button_holdtime", min(1, progress / 0.25));
        waitframe();
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1119
// Size: 0x55
function battle_tracks_updatetogglestate(player, vehicle, var_d1d3327f51ed4342) {
    switch (var_d1d3327f51ed4342) {
    case #"hash_fa2ad6f6bd651030":
        battle_tracks_toggleonstate(player, vehicle);
        break;
    case #"hash_3699ac6c262c25ea":
        battle_tracks_toggleoffstate(player, vehicle);
        break;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1175
// Size: 0x29
function battle_tracks_toggleonstate(player, vehicle) {
    battle_tracks_settogglestate(player, "on");
    battle_tracks_playbattletrackstoalloccupants(vehicle);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a5
// Size: 0x29
function battle_tracks_toggleoffstate(player, vehicle) {
    battle_tracks_settogglestate(player, "off");
    battle_tracks_stopbattletrackstoalloccupants(vehicle);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d5
// Size: 0x49
function battle_tracks_getnewtogglestate(player) {
    switch (player.pers["battleTracksToggleState"]) {
    case #"hash_fa2ad6f6bd651030":
        return "off";
    case #"hash_3699ac6c262c25ea":
        return "on";
        break;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1225
// Size: 0x2e
function battle_tracks_tryinittogglestate(player) {
    if (!isdefined(player.pers["battleTracksToggleState"])) {
        battle_tracks_settogglestate(player, "on");
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125a
// Size: 0x98
function battle_tracks_settogglestate(player, value) {
    player.pers["battleTracksToggleState"] = value;
    var_587830fd4042be45 = player getclientomnvar("ui_veh_battle_tracks_toggle_state");
    switch (value) {
    case #"hash_fa2ad6f6bd651030":
        player setclientomnvar("ui_veh_battle_tracks_toggle_state", 1);
        /#
            function_55f68a20f93c4f9a(player, var_587830fd4042be45);
        #/
        break;
    case #"hash_3699ac6c262c25ea":
        player setclientomnvar("ui_veh_battle_tracks_toggle_state", 2);
        /#
            function_495e92841f7d35ec(player, var_587830fd4042be45);
        #/
        break;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f9
// Size: 0x40
function battle_tracks_hidetogglewidget(player) {
    if (isdefined(player)) {
        var_587830fd4042be45 = player getclientomnvar("ui_veh_battle_tracks_toggle_state");
        player setclientomnvar("ui_veh_battle_tracks_toggle_state", 0);
        /#
            function_d852952d0fba338f(player, var_587830fd4042be45);
        #/
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1340
// Size: 0x40
function battle_tracks_gettogglestate(player) {
    /#
        /#
            assertex(isdefined(player.pers["off"]), "<unknown string>");
        #/
    #/
    return player.pers["battleTracksToggleState"];
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1388
// Size: 0x3d
function battle_tracks_togglestateis(player, value) {
    return isdefined(player.pers["battleTracksToggleState"]) && player.pers["battleTracksToggleState"] == value;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13cd
// Size: 0x42
function battle_tracks_trystopdrivertogglethink(vehicle, player, seatid) {
    var_df653126c71ef4ca = isdefined(seatid) && namespace_1fbd40990ee60ede::vehicle_occupancy_isdriverseat(vehicle, seatid);
    if (var_df653126c71ef4ca) {
        player battle_tracks_stoptogglethink(player);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1416
// Size: 0xc9
function battle_tracks_stoptogglethink(player) {
    if (!isdefined(player)) {
        return;
    }
    player notify("stop_battle_tracks_toggle_think");
    if (isdefined(player.var_23b06600e2a88b42)) {
        switch (player.var_23b06600e2a88b42) {
        case #"hash_10931e593d5bdf":
            player notifyonplayercommandremove("update_battle_tracks_toggle_state", "+melee_zoom");
            player notifyonplayercommandremove("cancel_battle_tracks_toggle_state", "-melee_zoom");
            break;
        case #"hash_a8e4a914fb03a4d5":
            player notifyonplayercommandremove("update_battle_tracks_toggle_state", "+frag");
            player notifyonplayercommandremove("cancel_battle_tracks_toggle_state", "-frag");
            break;
        case #"hash_b4b26057ca84210d":
            player notifyonplayercommandremove("update_battle_tracks_toggle_state", "nightvision");
            break;
        }
        player.var_23b06600e2a88b42 = undefined;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e6
// Size: 0x45
function battle_tracks_shouldstartbattletracks(vehicle) {
    if (battle_tracks_hasemptybattletracks(vehicle)) {
        return 0;
    }
    if (isdefined(vehicle.battletracksowner) && battle_tracks_togglestateis(vehicle.battletracksowner, "off")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1533
// Size: 0x4f
function battle_tracks_tryplayingbattletrackswhenstandingonvehicle(player) {
    vehicle = player getmovingplatformparent();
    if (battle_tracks_shouldplaybattletrackswhenstandingonvehicle(vehicle, player)) {
        player thread battle_tracks_standingonvehicletimeout(vehicle, player);
        if (!battle_tracks_standingonsamevehiclewithsametracksowner(vehicle, player)) {
            battle_tracks_stopbattletrackswhenstandingonvehicle(player);
            battle_tracks_playbattletrackswhenstandingonvehicle(vehicle, player);
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1589
// Size: 0x1e
function battle_tracks_playbattletrackswhenstandingonvehicle(vehicle, player) {
    battle_tracks_playbattletrackstoplayer(vehicle, player, 0);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ae
// Size: 0x26
function battle_tracks_stopbattletrackswhenstandingonvehicle(player) {
    if (function_c3d244ceadc23533(player)) {
        function_7718d2895fdba333(player);
        battle_tracks_stopbattletracksfromstandingonvehicle(player);
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15db
// Size: 0x14
function function_7718d2895fdba333(player) {
    player notify("battle_tracks_standingOnVehicleTimeout");
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f6
// Size: 0x3c
function battle_tracks_standingonvehicletimeout(vehicle, player) {
    level endon("game_ended");
    player endon("disconnect");
    player notify("battle_tracks_standingOnVehicleTimeout");
    player endon("battle_tracks_standingOnVehicleTimeout");
    wait(1);
    battle_tracks_stopbattletracksfromstandingonvehicle(player);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1639
// Size: 0x93
function function_d9a28875c82616d0(player, vehicle) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("stop_battle_tracks_option_watch");
    var_5b0fc1b88f867313 = player getwartrackpassengerenabled();
    while (1) {
        wait(0.5);
        var_4192fc05bb9a1187 = player getwartrackpassengerenabled();
        if (var_4192fc05bb9a1187 != var_5b0fc1b88f867313) {
            if (var_4192fc05bb9a1187) {
                if (battle_tracks_shouldstartbattletracks(vehicle)) {
                    battle_tracks_playbattletrackstoplayer(vehicle, player, 1);
                }
            } else {
                battle_tracks_stopbattletracksforplayer(vehicle.battletracksmusicstate, player, 1);
            }
            var_5b0fc1b88f867313 = var_4192fc05bb9a1187;
        }
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0x20
function battle_tracks_stopbattletracksfromstandingonvehicle(player) {
    battle_tracks_stopbattletracksforplayer(player.battletracksmusicstate, player, 0);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fa
// Size: 0x5b
function battle_tracks_shouldplaybattletrackswhenstandingonvehicle(vehicle, player) {
    if (!isdefined(vehicle)) {
        return 0;
    }
    if (!vehicle namespace_1f188a13f7e79610::isvehicle()) {
        return 0;
    }
    if (!battle_tracks_vehicleallowlisteningoutsideoccupancy(vehicle)) {
        return 0;
    }
    if (!namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(vehicle, player)) {
        return 0;
    }
    if (!battle_tracks_shouldstartbattletracks(vehicle)) {
        return 0;
    }
    if (!battle_tracks_playerinlisteningzone(vehicle, player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d
// Size: 0x44
function battle_tracks_standingonsamevehiclewithsametracksowner(vehicle, player) {
    if (!isdefined(player.var_b132b6a670abb56e)) {
        return 0;
    }
    var_b132b6a670abb56e = battle_tracks_getbattletracksid(vehicle);
    return var_b132b6a670abb56e == player.var_b132b6a670abb56e;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a9
// Size: 0x28
function function_4c953e9e77258030(vehicle, player) {
    if (battle_tracks_hasemptybattletracks(vehicle)) {
        return 0;
    }
    return battle_tracks_standingonsamevehiclewithsametracksowner(vehicle, player);
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d9
// Size: 0x47
function battle_tracks_getbattletracksid(vehicle) {
    var_f794f29935653f3e = vehicle getentitynumber() + "";
    var_d92a58c3390f0ff2 = vehicle.battletracksowner getentitynumber() + "";
    return var_f794f29935653f3e + var_d92a58c3390f0ff2;
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1828
// Size: 0x66
function battle_tracks_playerinlisteningzone(vehicle, player) {
    switch (vehicle.targetname) {
    case #"hash_6e693d48c24e303b":
    case #"hash_9386dbfe3d8d881c":
        return namespace_9db09f982acd35b4::isplayerinsiderectangularzonebasedonent(player, vehicle, "tag_origin", -85, 0, 77, 185, 125, 40);
    default:
        return 0;
        break;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1895
// Size: 0x5c
function battle_tracks_vehicleallowlisteningoutsideoccupancy(vehicle) {
    if (isdefined(vehicle.targetname)) {
        switch (vehicle.targetname) {
        case #"hash_6e693d48c24e303b":
        case #"hash_9386dbfe3d8d881c":
            return 1;
        default:
            return 0;
            break;
        }
    } else {
        return 0;
    }
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18f8
// Size: 0x20
function function_561f62b5ed736105() {
    /#
        return getdvar(@"hash_88960e36a4bc7a7d", "<unknown string>") != "<unknown string>";
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191f
// Size: 0xc4
function function_ea5ef1563045fe8c(vehicle) {
    /#
        vehicle.battletracksmusicstate = "<unknown string>";
        result = [];
        var_44b9b57f1594cdf2 = getdvar(@"hash_88960e36a4bc7a7d", "<unknown string>");
        var_5587c2774459b359 = strtok(var_44b9b57f1594cdf2, "<unknown string>");
        foreach (var_ab66d57be4626030 in var_5587c2774459b359) {
            var_d60db1b8fa4a20ce = int(var_ab66d57be4626030);
            result = namespace_3c37cb17ade254d::array_add(result, var_d60db1b8fa4a20ce);
        }
        return result;
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ea
// Size: 0xcd
function function_3971973c87f8c8d(vehicle, player) {
    /#
        if (!function_f15328434523e979()) {
            return;
        }
        println("<unknown string>");
        println("<unknown string>" + gettime());
        println("<unknown string>" + player getentitynumber());
        println("<unknown string>" + vehicle.battletracksmusicstate);
        foreach (var_cb6d46fdb9fa2a22 in vehicle.battletracks) {
            println("<unknown string>" + var_cb6d46fdb9fa2a22);
        }
        println("<unknown string>");
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1abe
// Size: 0x67
function function_be79f42e9d2ddc27(battletracksmusicstate, player) {
    /#
        if (!function_f15328434523e979()) {
            return;
        }
        println("<unknown string>");
        println("<unknown string>" + gettime());
        println("<unknown string>" + player getentitynumber());
        println("<unknown string>" + battletracksmusicstate);
        println("<unknown string>");
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2c
// Size: 0x89
function function_55f68a20f93c4f9a(player, var_587830fd4042be45) {
    /#
        if (!function_f15328434523e979()) {
            return;
        }
        println("<unknown string>");
        println("<unknown string>" + gettime());
        println("<unknown string>" + player getentitynumber());
        println("<unknown string>");
        println("<unknown string>" + var_587830fd4042be45);
        println("<unknown string>" + player getclientomnvar("<unknown string>"));
        println("<unknown string>");
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bbc
// Size: 0x89
function function_495e92841f7d35ec(player, var_587830fd4042be45) {
    /#
        if (!function_f15328434523e979()) {
            return;
        }
        println("<unknown string>");
        println("<unknown string>" + gettime());
        println("<unknown string>" + player getentitynumber());
        println("<unknown string>");
        println("<unknown string>" + var_587830fd4042be45);
        println("<unknown string>" + player getclientomnvar("<unknown string>"));
        println("<unknown string>");
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4c
// Size: 0x89
function function_d852952d0fba338f(player, var_587830fd4042be45) {
    /#
        if (!function_f15328434523e979()) {
            return;
        }
        println("<unknown string>");
        println("<unknown string>" + gettime());
        println("<unknown string>" + player getentitynumber());
        println("<unknown string>");
        println("<unknown string>" + var_587830fd4042be45);
        println("<unknown string>" + player getclientomnvar("<unknown string>"));
        println("<unknown string>");
    #/
}

// Namespace namespace_484ab6dce1752cc8/namespace_6c0d09f1e6fc2bc5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdc
// Size: 0x18
function function_f15328434523e979() {
    /#
        return getdvarint(@"hash_79d2fc5a92fbfcd1", 0) != 0;
    #/
}

