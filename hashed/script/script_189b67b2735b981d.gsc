// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_7ef95bba57dc4b82;
#using script_4c770a9a4ad7659c;
#using script_15de7dc4d21f1da3;
#using script_436add9de781cdfb;

#namespace namespace_1f982ef62dd6c744;

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x8b
function function_ce3fed6316f195b9(tablename) {
    for (row = 0; 1; row++) {
        eventname = tablelookupbyrow(tablename, row, 1);
        delay = tablelookupbyrow(tablename, row, 3);
        var_d2f366b8f6b1f04b = tablelookupbyrow(tablename, row, 4);
        var_99b24fc8d56e8f8e = tablelookupbyrow(tablename, row, 5);
        if (eventname == "") {
            break;
        }
        function_81e38b9504bed322(eventname, delay, var_d2f366b8f6b1f04b, var_99b24fc8d56e8f8e);
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bd
// Size: 0x75
function function_81e38b9504bed322(eventname, delay, var_d2f366b8f6b1f04b, var_99b24fc8d56e8f8e) {
    result = spawnstruct();
    result.delay = delay;
    result.var_d2f366b8f6b1f04b = var_d2f366b8f6b1f04b;
    result.var_99b24fc8d56e8f8e = var_99b24fc8d56e8f8e;
    result.lines = [];
    level.var_20e6a6f36157adc[eventname] = result;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x939
// Size: 0x76
function function_ebda2510d1d4f81d(tablename) {
    for (row = 0; 1; row++) {
        var_638952fa86a33c2e = tablelookupbyrow(tablename, row, 0);
        eventname = tablelookupbyrow(tablename, row, 1);
        var_aea36014c00aafb3 = tablelookupbyrow(tablename, row, 2);
        if (var_638952fa86a33c2e == "") {
            break;
        }
        function_6b8aa0609ecb3cbd(row, var_638952fa86a33c2e, eventname, var_aea36014c00aafb3);
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b6
// Size: 0x4a
function function_6b8aa0609ecb3cbd(index, var_638952fa86a33c2e, eventname, var_aea36014c00aafb3) {
    level.var_20e6a6f36157adc[eventname].lines[var_638952fa86a33c2e] = var_aea36014c00aafb3;
    level.var_3c611fe759d6cf8d[var_aea36014c00aafb3] = index;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa07
// Size: 0xc8
function function_2fa456bb8a94b7a1(eventname, stateid, var_9c40af0f61186602) {
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (isdefined(event) && isdefined(event.var_1a2e4136162e552b)) {
        return;
    }
    var_e3fb66cb950f273 = spawnstruct();
    var_e3fb66cb950f273.eventid = stateid;
    var_e3fb66cb950f273.omnvar = ter_op(isdefined(var_9c40af0f61186602), var_9c40af0f61186602, "ui_talkinggun_faceid");
    if (!isdefined(level.event)) {
        level.var_20e6a6f36157adc[eventname] = spawnstruct();
    }
    level.var_20e6a6f36157adc[eventname].var_1a2e4136162e552b = var_e3fb66cb950f273;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad6
// Size: 0x52
function function_c961767b96992af9() {
    thread function_b77041c06bd0e53a();
    thread function_e8084259d5e9e5a6();
    thread function_2f181c374b1af79d();
    /#
        thread function_3d9dc061bbfb25ab();
    #/
    level.var_20e6a6f36157adc = [];
    level.var_3c611fe759d6cf8d = [];
    function_ce3fed6316f195b9("talkinggunscreen_lines.csv");
    function_ebda2510d1d4f81d("talkinggunscreen_lines.csv");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x10d
function function_b04504ffd83192e1() {
    self.var_d1d541d826231cad = spawnstruct();
    self.var_d1d541d826231cad.var_b364fee4d7c7a6d7 = 0;
    self.var_d1d541d826231cad.var_49e5355e2642f48d = 0;
    self.var_d1d541d826231cad.var_56560380a4b1a392 = [];
    self.var_d1d541d826231cad.var_759862146a4569cb = 0;
    self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
    self.var_d1d541d826231cad.var_b303cb73dd6407f5 = 0;
    self.var_d1d541d826231cad.var_e759da6edf27a220 = 0;
    self.var_d1d541d826231cad.lastdamagedtime = 0;
    self.var_d1d541d826231cad.var_6a8d989a494b74c4 = 1;
    self.var_d1d541d826231cad.var_fbcfc873987ae39e = 0;
    self.var_d1d541d826231cad.var_cf433c13dd493f3f = [];
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc43
// Size: 0x140
function function_2f181c374b1af79d() {
    level endon("game_ended");
    while (1) {
        wait(0.5);
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player) || !isdefined(player.var_d1d541d826231cad)) {
                continue;
            }
            var_89b4ea3ab817d07d = isdefined(player.carryobject);
            var_3821a301c5c7366d = isdefined(player.touchinggameobjects) && player.touchinggameobjects.size > 0;
            var_a6e1e8c33f7a40fe = isdefined(player.usinggameobjects) && player.usinggameobjects.size > 0;
            activeobjective = var_89b4ea3ab817d07d || var_3821a301c5c7366d || var_a6e1e8c33f7a40fe;
            if (activeobjective) {
                if (!istrue(player.var_d1d541d826231cad.var_67a0bf18d97e0f61)) {
                    function_55b08d6d71b41402(player, "obj_capture");
                }
            }
            player.var_d1d541d826231cad.var_67a0bf18d97e0f61 = activeobjective;
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8a
// Size: 0x224
function function_b77041c06bd0e53a() {
    level endon("game_ended");
    while (1) {
        wait(1);
        time = gettime() / 1000;
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player) || !isdefined(player.var_d1d541d826231cad) || !isdefined(player.pers["totalDistTraveled"])) {
                continue;
            }
            if (!isdefined(player.var_d1d541d826231cad.var_3b66eb954d36d751)) {
                player.var_d1d541d826231cad.var_3b66eb954d36d751 = 0;
            }
            if (!isdefined(player.var_d1d541d826231cad.var_62fb673b6d0038e4)) {
                player.var_d1d541d826231cad.var_62fb673b6d0038e4 = player.pers["totalDistTraveled"];
            }
            var_db19fbcd5af07943 = player.pers["totalDistTraveled"] - player.var_d1d541d826231cad.var_62fb673b6d0038e4;
            player.var_d1d541d826231cad.var_62fb673b6d0038e4 = player.pers["totalDistTraveled"];
            var_7855fd9575dfd1bf = player getstance() == "prone";
            if (var_db19fbcd5af07943 < 100) {
                player.var_d1d541d826231cad.var_3b66eb954d36d751 = player.var_d1d541d826231cad.var_3b66eb954d36d751 + 1;
                if (time > player.var_d1d541d826231cad.var_49e5355e2642f48d + 30 && !var_7855fd9575dfd1bf && player.var_d1d541d826231cad.var_3b66eb954d36d751 > 15) {
                    function_55b08d6d71b41402(player, "idle");
                }
            } else {
                player.var_d1d541d826231cad.var_3b66eb954d36d751 = 0;
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb5
// Size: 0x159
function function_e8084259d5e9e5a6() {
    self endon("game_ended");
    while (1) {
        wait(0.1);
        time = gettime() / 1000;
        if (isdefined(level.var_1642386c8e73a981) && level.var_1642386c8e73a981.size > 0) {
            foreach (player in level.var_1642386c8e73a981) {
                if (!isdefined(player)) {
                    continue;
                }
                var_94df8a1c478efe5c = player playerads() > 0.3;
                if (var_94df8a1c478efe5c) {
                    if (player.var_d1d541d826231cad.var_759862146a4569cb == 0) {
                        player.var_d1d541d826231cad.var_759862146a4569cb = time;
                    }
                    if (time - player.var_d1d541d826231cad.var_759862146a4569cb > 4) {
                        function_55b08d6d71b41402(player, "aiming_idle");
                    }
                } else if (player.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                    player.var_d1d541d826231cad.var_759862146a4569cb = 0;
                }
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1115
// Size: 0x93
function function_b97b71722a3dc5f0(player, eventname) {
    if (!isdefined(player.var_d1d541d826231cad)) {
        return 0;
    }
    if (!isdefined(player.var_d1d541d826231cad.var_56560380a4b1a392[eventname])) {
        return 0;
    }
    var_735a70be53a0e4b5 = gettime() / 1000;
    event = level.var_20e6a6f36157adc[eventname];
    return var_735a70be53a0e4b5 < player.var_d1d541d826231cad.var_56560380a4b1a392[eventname] + event.var_99b24fc8d56e8f8e;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b0
// Size: 0xb6
function function_7b50742a287d3ca1(player) {
    if (!isdefined(player.var_d1d541d826231cad)) {
        return 0;
    }
    if (player.var_d1d541d826231cad.active) {
        return 1;
    }
    if (function_b52945d0ec45b0cc(player)) {
        if (function_d8239f9d7164d68e(player.primaryweaponobj)) {
            return 1;
        }
        foreach (weapon in player.primaryweapons) {
            if (function_d8239f9d7164d68e(weapon)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126e
// Size: 0x33
function function_b52945d0ec45b0cc(player) {
    if (namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(player)) {
        return 1;
    }
    if (player namespace_448ccf1ca136fbbe::isusingremote()) {
        return 1;
    }
    if (player function_415fe9eeca7b2e2b()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a9
// Size: 0x3c
function function_547117b1a7105f45(player, delay, line) {
    player endon("death_or_disconnect");
    wait(delay);
    player setclientomnvar("ui_talkinggun_soundid", level.var_3c611fe759d6cf8d[line]);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ec
// Size: 0x8a
function function_a1e1b35a0bd2f57c(player, eventname) {
    if (!function_7b50742a287d3ca1(player)) {
        return 0;
    }
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (!isdefined(event) || !isdefined(event.lines) || !isdefined(event.lines[player.var_d1d541d826231cad.var_de1fd66f1b22f6a9])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137e
// Size: 0x5b
function function_e4d7e0e2fa1fe358() {
    if (issharedfuncdefined("game", "gameFlag")) {
        var_dfd52ef074fb36af = [[ getsharedfunc("game", "gameFlag") ]]("prematch_done");
        if (namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.skipprematch) && !var_dfd52ef074fb36af) {
            return 1;
        }
        return var_dfd52ef074fb36af;
    }
    return 1;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0x10e
function function_cd101ca0e17cfd60(player, eventname) {
    if (!function_7b50742a287d3ca1(player)) {
        return 0;
    }
    if (!function_e4d7e0e2fa1fe358()) {
        return 0;
    }
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (!function_a1e1b35a0bd2f57c(player, eventname)) {
        return 0;
    }
    var_735a70be53a0e4b5 = gettime() / 1000;
    if (var_735a70be53a0e4b5 < player.var_d1d541d826231cad.var_b364fee4d7c7a6d7) {
        return 0;
    }
    if (function_b97b71722a3dc5f0(player, eventname)) {
        return 0;
    }
    player.var_d1d541d826231cad.var_b364fee4d7c7a6d7 = var_735a70be53a0e4b5 + event.var_d2f366b8f6b1f04b + event.delay;
    player.var_d1d541d826231cad.var_49e5355e2642f48d = var_735a70be53a0e4b5;
    player.var_d1d541d826231cad.var_56560380a4b1a392[eventname] = var_735a70be53a0e4b5 + event.delay;
    return 1;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0x67
function function_9667b86a2c02b9a(player, eventname) {
    if (!function_7b50742a287d3ca1(player)) {
        return undefined;
    }
    if (!function_e4d7e0e2fa1fe358()) {
        return undefined;
    }
    if (!isdefined(level.var_20e6a6f36157adc)) {
        function_c961767b96992af9();
    }
    event = level.var_20e6a6f36157adc[eventname];
    if (!isdefined(event)) {
        return undefined;
    }
    return event.var_1a2e4136162e552b;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1566
// Size: 0xb0
function function_55b08d6d71b41402(player, eventname) {
    var_daf69d284bd60fdf = function_9667b86a2c02b9a(player, eventname);
    if (isdefined(var_daf69d284bd60fdf)) {
        player setclientomnvar(var_daf69d284bd60fdf.omnvar, var_daf69d284bd60fdf.eventid);
    }
    if (!function_cd101ca0e17cfd60(player, eventname)) {
        return;
    }
    /#
        iprintlnbold("close_call" + eventname);
    #/
    event = level.var_20e6a6f36157adc[eventname];
    thread function_547117b1a7105f45(player, event.delay, event.lines[player.var_d1d541d826231cad.var_de1fd66f1b22f6a9]);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161d
// Size: 0xb4
function function_c5f05871ba7c3aa3() {
    var_dd2decf8db7e69b8 = self getweaponammostock(self.currentweapon);
    var_ab0ee360900bcb85 = weaponmaxammo(self.currentweapon);
    if (namespace_36f464722d326bbe::isBRStyleGameType() && issharedfuncdefined("br_weapons", "br_ammo_type_for_weapon")) {
        ammotype = [[ getsharedfunc("br_weapons", "br_ammo_type_for_weapon") ]](self.currentweapon);
        if (isdefined(ammotype)) {
            var_ab0ee360900bcb85 = level.var_e6ea72fc5e3fcd00[ammotype];
        }
    }
    if (var_dd2decf8db7e69b8 > var_ab0ee360900bcb85 * 0.3) {
        function_55b08d6d71b41402(self, "reload_start");
    } else {
        function_55b08d6d71b41402(self, "ammo_reserve_low");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d8
// Size: 0x19
function function_81f5578aed261da1(player) {
    function_55b08d6d71b41402(player, "loot_found");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f8
// Size: 0xc4
function function_44cdb18eb18593de(team, activity) {
    if (isdefined(activity) && isdefined(activity.name) && activity.name == "hold") {
        return;
    }
    wait(1);
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == team) {
                function_55b08d6d71b41402(player, "contract_start");
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c3
// Size: 0x1f
function function_952d1a246a3ece86(player) {
    wait(2);
    function_55b08d6d71b41402(player, "activate_uav");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e9
// Size: 0x8b
function function_bf5315076804b215(team) {
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == team) {
                function_55b08d6d71b41402(player, "contract_complete");
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x187b
// Size: 0x72
function function_4cca00246f03b1f2(player, droppedweapon, var_b947c76fcef1afdb) {
    var_de1fd66f1b22f6a9 = player.var_d1d541d826231cad.var_de1fd66f1b22f6a9;
    while (1) {
        wait(20);
        if (!isdefined(droppedweapon)) {
            return;
        }
        playsoundatpos(var_b947c76fcef1afdb, level.var_20e6a6f36157adc["no_user_bark"].lines[var_de1fd66f1b22f6a9]);
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f4
// Size: 0x97
function function_aba04688789ce643(droppedweapon, objweapon, var_cdce80998ec668ee) {
    if (!function_d8239f9d7164d68e(droppedweapon)) {
        return;
    }
    if (!function_cd101ca0e17cfd60(self, "dropped")) {
        return;
    }
    if (isdefined(var_cdce80998ec668ee)) {
        var_b947c76fcef1afdb = var_cdce80998ec668ee;
    } else {
        var_b947c76fcef1afdb = droppedweapon.origin;
    }
    playsoundatpos(var_b947c76fcef1afdb, level.var_20e6a6f36157adc["dropped"].lines[self.var_d1d541d826231cad.var_de1fd66f1b22f6a9]);
    thread function_4cca00246f03b1f2(self, droppedweapon, var_b947c76fcef1afdb);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1992
// Size: 0x2a
function function_bd70b31dd13292bc(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    wait(2);
    function_55b08d6d71b41402(player, "player_death_revived_teammate");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c3
// Size: 0x6a
function function_bd70a21dd1326d59(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(player.var_d1d541d826231cad) && istrue(player.var_d1d541d826231cad.var_6a8d989a494b74c4)) {
        player.var_d1d541d826231cad.var_6a8d989a494b74c4 = 0;
    }
    wait(2);
    function_55b08d6d71b41402(player, "teammate_death_revived_me");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a34
// Size: 0x5c4
function function_14c5b1a6f5a9f37c(data) {
    if (isdefined(data.victim.var_d1d541d826231cad)) {
        data.victim.var_d1d541d826231cad.var_e759da6edf27a220 = 0;
        data.victim.var_d1d541d826231cad.var_56560380a4b1a392 = [];
        data.victim.var_d1d541d826231cad.var_6a8d989a494b74c4 = 1;
        data.victim.var_d1d541d826231cad.active = 0;
    }
    if (data.attacker == data.victim) {
        return;
    }
    if (!isplayer(data.attacker)) {
        return;
    }
    foreach (otherplayer in level.var_1642386c8e73a981) {
        if (!isdefined(otherplayer)) {
            continue;
        }
        if (otherplayer == data.attacker || otherplayer == data.victim) {
            continue;
        }
        if (!isdefined(otherplayer.var_d1d541d826231cad)) {
            continue;
        }
        if (!isdefined(otherplayer.var_d1d541d826231cad.var_cf433c13dd493f3f[data.victim.guid])) {
            continue;
        }
        if (gettime() / 1000 < otherplayer.var_d1d541d826231cad.var_cf433c13dd493f3f[data.victim.guid] + 1) {
            function_55b08d6d71b41402(otherplayer, "kill_steal");
        }
    }
    if (!isdefined(data.attacker.var_d1d541d826231cad)) {
        return;
    }
    data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 = data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 + 1;
    if (function_a1e1b35a0bd2f57c(data.attacker, "close_call") && gettime() / 1000 < data.attacker.var_d1d541d826231cad.lastdamagedtime + 2 && data.attacker.health < 50) {
        if (randomfloat(1) < 0.5) {
            function_55b08d6d71b41402(data.attacker, "close_call");
            return;
        }
    }
    if (string_starts_with(data.weaponfullstring, "throwingknife_mp")) {
        function_55b08d6d71b41402(data.attacker, "throwing_knife_kill");
    }
    if (isdefined(data.attacker.vehicle) && data.meansofdeath == "MOD_CRUSH") {
        function_55b08d6d71b41402(data.attacker, "enemy_rammed");
    }
    if (!namespace_e0ee43ef2dddadaa::isspreadweapon(data.objweapon) && namespace_169cd7a8fbc76ee5::isheadshot(data.hitloc, data.meansofdeath, data.attacker)) {
        function_55b08d6d71b41402(data.attacker, "headshot_kill");
    } else if (data.objweapon issilenced()) {
        function_55b08d6d71b41402(data.attacker, "stealth_kill");
    } else if (data.meansofdeath == "MOD_MELEE") {
        function_55b08d6d71b41402(data.attacker, "melee_kill");
    }
    if (isdefined(data.attacker.recentkillcount) && data.attacker.recentkillcount > 1) {
        if (data.attacker.recentkillcount == 2) {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_double");
        } else if (data.attacker.recentkillcount == 3) {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_triple");
        } else {
            function_55b08d6d71b41402(data.attacker, "killed_enemy_multi");
        }
    }
    if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 5) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_5x");
    } else if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 10) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_10x");
    } else if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 15) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_15x");
    } else if (data.attacker.var_d1d541d826231cad.var_e759da6edf27a220 == 20) {
        function_55b08d6d71b41402(data.attacker, "killed_enemy_20x");
    } else {
        function_55b08d6d71b41402(data.attacker, "killed_enemy");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fff
// Size: 0xbc
function function_27fe46449778a3e3(winner) {
    if (isdefined(level.var_1642386c8e73a981)) {
        foreach (player in level.var_1642386c8e73a981) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(player.team)) {
                continue;
            }
            if (isplayer(winner) ? player == winner : player.team == winner) {
                function_55b08d6d71b41402(player, "round_won");
            } else {
                function_55b08d6d71b41402(player, "round_lost");
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c2
// Size: 0x109
function function_967de5f2484e51ef(player, killstreakname) {
    wait(1);
    if (killstreakname == "uav") {
        function_55b08d6d71b41402(self, "activate_uav");
    } else if (killstreakname == "scrambler_drone_guard") {
        function_55b08d6d71b41402(self, "activate_counter_uav");
    } else if (killstreakname == "cruise_predator" || killstreakname == "chopper_gunner" || killstreakname == "gunship" || killstreakname == "pac_sentry") {
        function_55b08d6d71b41402(self, "activate_rided");
    } else if (killstreakname == "precision_airstrike" || killstreakname == "toma_strike" || killstreakname == "directional_uav" || killstreakname == "fuel_airstrike" || killstreakname == "hover_jet" || killstreakname == "auto_drone" || killstreakname == "airdrop_escort") {
        function_55b08d6d71b41402(self, "activate_guided");
    } else if (killstreakname == "assault_drone") {
        function_55b08d6d71b41402(self, "activate_drone");
    }
    function_55b08d6d71b41402(self, "killstreak_used");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d2
// Size: 0x31
function function_d0c66e5691fa4856(player, event) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    wait(2);
    function_55b08d6d71b41402(player, event);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220a
// Size: 0x34
function function_556866c3c047a8b8(victim) {
    level endon("game_ended");
    victim endon("death_or_disconnect");
    self endon("death_or_disconnect");
    wait(0.5);
    function_55b08d6d71b41402(self, "enemy_armor_depleted");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2245
// Size: 0x40
function function_f0b105c339fb3e1(objweapon) {
    var_cf4209c200f8bbf4 = function_f3bb4f4911a1beb2("weapons", "getWeaponGroup", objweapon);
    return isdefined(var_cf4209c200f8bbf4) && (var_cf4209c200f8bbf4 == "weapon_sniper" || var_cf4209c200f8bbf4 == "weapon_dmr");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228d
// Size: 0x307
function function_a81df078cbb965a5() {
    self endon("game_ended");
    while (1) {
        partname = modelindex = psoffsettime = shitloc = vdir = vpoint = var_fcdf19e3cdd29669 = objweapon = smeansofdeath = idflags = idamage = victim = eattacker = einflictor = self waittill("post_player_damaged");
        if (!isdefined(victim) || !isdefined(eattacker)) {
            /#
                iprintln("MOD_GRENADE_SPLASH");
            #/
            continue;
        }
        if (!function_7b50742a287d3ca1(eattacker) && !function_7b50742a287d3ca1(victim)) {
            continue;
        }
        if (eattacker == victim) {
            continue;
        }
        var_d69f8f4e2cbf2640 = isdefined(objweapon.basename) && objweapon.basename == "danger_circle_br";
        if (var_d69f8f4e2cbf2640) {
            continue;
        }
        var_f32cb8be96d9c669 = distancesquared(victim.origin, eattacker.origin) > 250000;
        if (isplayer(victim) && victim.health > 1) {
            if (smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE_SPLASH") {
                thread function_d0c66e5691fa4856(victim, "player_damaged_explosive");
            } else if (victim.health < 30) {
                thread function_d0c66e5691fa4856(victim, "health_low");
            } else if (function_f0b105c339fb3e1(objweapon) && istrue(var_f32cb8be96d9c669)) {
                thread function_d0c66e5691fa4856(victim, "player_damaged_sniper");
            } else {
                thread function_d0c66e5691fa4856(victim, "player_damaged");
            }
            if (isdefined(victim.var_d1d541d826231cad) && victim.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                victim.var_d1d541d826231cad.var_759862146a4569cb = gettime() / 1000;
            }
            if (isdefined(victim.var_d1d541d826231cad)) {
                victim.var_d1d541d826231cad.lastdamagedtime = gettime() / 1000;
            }
        }
        if (isplayer(eattacker) && victim.health > 1) {
            if (isdefined(eattacker.var_d1d541d826231cad)) {
                eattacker.var_d1d541d826231cad.var_cf433c13dd493f3f[victim.guid] = gettime() / 1000;
            }
            if (function_f0b105c339fb3e1(objweapon) && istrue(var_f32cb8be96d9c669)) {
                thread function_d0c66e5691fa4856(eattacker, "enemy_damaged_sniper");
            } else {
                thread function_d0c66e5691fa4856(eattacker, "enemy_damaged");
            }
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259b
// Size: 0xe6
function function_3addbb064480340() {
    self endon("game_ended");
    while (1) {
        currenttime = gettime() / 1000;
        for (k = 0; k < level.var_1642386c8e73a981.size; k++) {
            if (!isplayer(level.var_1642386c8e73a981[k])) {
                continue;
            }
            if (currenttime < level.var_1642386c8e73a981[k].var_d1d541d826231cad.var_fbcfc873987ae39e + 10) {
                continue;
            }
            if (level.var_1642386c8e73a981[k] issprinting()) {
                if (randomfloat(1) < 0.3) {
                    function_55b08d6d71b41402(level.var_1642386c8e73a981[k], "sprint");
                } else {
                    function_cd101ca0e17cfd60(level.var_1642386c8e73a981[k], "sprint");
                }
            }
        }
        wait(0.3);
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2688
// Size: 0x1ba
function function_eb8660dbfa7117b5() {
    self endon("disconnect");
    self endon("remove_talking_gun");
    while (1) {
        self waittill("weapon_fired");
        firetime = weaponfiretime(self.currentweapon.basename);
        time = gettime() / 1000;
        if (isdefined(self.var_d1d541d826231cad)) {
            if (isdefined(self.var_d1d541d826231cad) && self.var_d1d541d826231cad.var_759862146a4569cb != 0) {
                self.var_d1d541d826231cad.var_759862146a4569cb = gettime() / 1000;
            }
            if (self.var_d1d541d826231cad.var_76665eaaaabda31 == 0) {
                self.var_d1d541d826231cad.var_76665eaaaabda31 = time;
                self.var_d1d541d826231cad.var_b303cb73dd6407f5 = time + firetime + 0.1;
            } else if (time < self.var_d1d541d826231cad.var_b303cb73dd6407f5) {
                if (time > self.var_d1d541d826231cad.var_76665eaaaabda31 + 1.5) {
                    function_55b08d6d71b41402(self, "war_cry");
                    self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
                } else {
                    self.var_d1d541d826231cad.var_b303cb73dd6407f5 = time + firetime + 0.1;
                }
            } else {
                self.var_d1d541d826231cad.var_76665eaaaabda31 = 0;
            }
        }
        if (self getcurrentweaponclipammo() == 0 && self getweaponammostock(self.currentweapon) == 0) {
            function_55b08d6d71b41402(self, "player_zero_ammo");
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2849
// Size: 0x2e
function function_cd39869120c7218() {
    self endon("disconnect");
    self endon("remove_talking_gun");
    while (1) {
        self waittill("weapon_inspect");
        function_55b08d6d71b41402(self, "weapon_inspect");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287e
// Size: 0x26e
function function_26acd7206ca70734(var_d27680ff86693f5c) {
    var_51ba34154a645b70 = isdefined(self.var_47bde44b1acec603);
    var_1ab543205027c0a8 = isdefined(var_d27680ff86693f5c.eattacker) && var_d27680ff86693f5c.eattacker namespace_1f188a13f7e79610::isvehicle() && isdefined(var_d27680ff86693f5c.eattacker.owner) && isplayer(var_d27680ff86693f5c.eattacker.owner);
    if ((!isdefined(var_d27680ff86693f5c.eattacker) || !isplayer(var_d27680ff86693f5c.eattacker)) && !var_1ab543205027c0a8) {
        return;
    }
    if (var_51ba34154a645b70) {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "dmz_boss_kill");
    } else if (function_a1e1b35a0bd2f57c(var_d27680ff86693f5c.eattacker, "close_call") && gettime() / 1000 < var_d27680ff86693f5c.eattacker.var_d1d541d826231cad.lastdamagedtime + 2 && var_d27680ff86693f5c.eattacker.health < 50) {
        if (randomfloat(1) < 0.5) {
            function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "close_call");
            return;
        }
    } else if (var_1ab543205027c0a8 && var_d27680ff86693f5c.smeansofdeath == "MOD_CRUSH") {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker.owner, "enemy_rammed");
    } else if (!namespace_e0ee43ef2dddadaa::isspreadweapon(var_d27680ff86693f5c.sweapon) && namespace_169cd7a8fbc76ee5::isheadshot(var_d27680ff86693f5c.shitloc, var_d27680ff86693f5c.smeansofdeath, var_d27680ff86693f5c.eattacker)) {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "headshot_kill");
    } else if (var_d27680ff86693f5c.sweapon issilenced()) {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "stealth_kill");
    } else if (var_d27680ff86693f5c.smeansofdeath == "MOD_MELEE") {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "melee_kill");
    } else {
        function_55b08d6d71b41402(var_d27680ff86693f5c.eattacker, "player_killed_agent");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af3
// Size: 0x95
function function_aea35499f76041bb() {
    self endon("death_or_disconnect");
    self endon("remove_talking_gun");
    self.var_d1d541d826231cad.var_fbcfc873987ae39e = gettime() / 1000;
    if (issharedfuncdefined("game", "gameFlag") && ![[ getsharedfunc("game", "gameFlag") ]]("prematch_done")) {
        level waittill("prematch_done");
        wait(5);
    }
    self.var_d1d541d826231cad.var_fbcfc873987ae39e = gettime() / 1000;
    function_55b08d6d71b41402(self, "deploy");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b8f
// Size: 0x18a
function function_d8239f9d7164d68e(droppedweapon) {
    if (!isdefined(droppedweapon)) {
        return 0;
    }
    var_a1c804ffa2416774 = undefined;
    if (isweapon(droppedweapon) && !isnullweapon(droppedweapon)) {
        var_a1c804ffa2416774 = droppedweapon;
    } else if (isdefined(droppedweapon.objweapon)) {
        if (isnullweapon(droppedweapon.objweapon)) {
            return 0;
        }
        var_a1c804ffa2416774 = droppedweapon.objweapon;
    } else if (isdefined(droppedweapon.classname) && droppedweapon.classname == "scriptable") {
        if (!isdefined(droppedweapon.customweaponname)) {
            return 0;
        }
        var_a1c804ffa2416774 = droppedweapon.customweaponname;
    } else {
        /#
            iprintlnbold("<unknown string>");
        #/
        return 0;
    }
    attachments = getweaponattachments(var_a1c804ffa2416774);
    foreach (attachment in attachments) {
        perks = namespace_e0ee43ef2dddadaa::attachmentperkmap(var_a1c804ffa2416774, attachment);
        foreach (perk in perks) {
            if (string_starts_with(perk, "specialty_talkinggun")) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d21
// Size: 0x3d
function function_7fd5a6abcd15e5ba() {
    self endon("game_ended");
    while (1) {
        player = vehicle = level waittill("enter_vehicle");
        function_55b08d6d71b41402(player, "vehicle_enter");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d65
// Size: 0x43
function function_7143e9d45cff1d4c() {
    self endon("game_ended");
    while (1) {
        player = vehicle = level waittill("exit_vehicle");
        wait(0.1);
        function_55b08d6d71b41402(player, "vehicle_exit");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2daf
// Size: 0x91
function function_572b61079927196b() {
    while (1) {
        winners = level waittill("br_ending_start");
        foreach (player in level.var_1642386c8e73a981) {
            if (isdefined(winners) && array_contains(winners, player)) {
                function_55b08d6d71b41402(player, "round_won");
            }
            function_f70b3ce9138e10b(player);
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e47
// Size: 0xf9
function function_ef6885141252869(player, grenade) {
    issuper = function_f3bb4f4911a1beb2("weapons", "isSuperWeapon", grenade.weapon_object);
    if (issuper) {
        function_55b08d6d71b41402(player, "equipment_deployed");
    } else if (namespace_4fb9dddfb8c1a67a::isequipmentlethal(grenade.equipmentref)) {
        if (grenade.equipmentref != "equip_throwing_knife") {
            function_55b08d6d71b41402(player, "grenade_lethal_used");
        }
    } else if (namespace_4fb9dddfb8c1a67a::isequipmenttactical(grenade.equipmentref)) {
        switch (grenade.equipmentref) {
        case #"hash_6d194c409057b2":
        case #"hash_4b4a6458f00d9319":
        case #"hash_7c09786dbc292c05":
        case #"hash_8770d1da0d7395b9":
            break;
        default:
            function_55b08d6d71b41402(player, "grenade_tactical_used");
            break;
        }
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f47
// Size: 0x209
function function_2cc0d17b7e641e00(player, var_de1fd66f1b22f6a9) {
    var_cedefd3160bf7cc = !isdefined(player.var_d1d541d826231cad) || player.var_d1d541d826231cad.var_6a8d989a494b74c4;
    if (!isdefined(level.var_1642386c8e73a981)) {
        level.var_1642386c8e73a981 = [];
    }
    if (!isdefined(player.var_d1d541d826231cad)) {
        player function_b04504ffd83192e1();
    }
    player.var_d1d541d826231cad.var_de1fd66f1b22f6a9 = var_de1fd66f1b22f6a9;
    player.var_d1d541d826231cad.active = 1;
    player.var_d1d541d826231cad.var_6a8d989a494b74c4 = 0;
    level.var_1642386c8e73a981[level.var_1642386c8e73a981.size] = player;
    if (!isdefined(level.var_3f30d667ff99b732)) {
        level.var_3f30d667ff99b732 = 1;
        level namespace_7f0bcee5d45a1dea::add("player_death", &function_14c5b1a6f5a9f37c);
        namespace_a2c409363d7f24e7::function_ba46cf958ae0cbda(&function_aba04688789ce643);
        namespace_a2c409363d7f24e7::function_39027364b9c16127(&function_aba04688789ce643);
        level namespace_7f0bcee5d45a1dea::add("on_ai_killed", &function_26acd7206ca70734);
        level thread function_a81df078cbb965a5();
        level thread function_3addbb064480340();
        level thread function_7fd5a6abcd15e5ba();
        level thread function_7143e9d45cff1d4c();
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_d9d9691c846bdad7::function_3a363ae38f309166(&function_c5f05871ba7c3aa3);
            level thread function_572b61079927196b();
        }
    }
    player thread function_eb8660dbfa7117b5();
    player thread function_cd39869120c7218();
    weaponname = getcompleteweaponname(player.currentweapon);
    if (isdefined(player.tookweaponfrom) && isdefined(player.tookweaponfrom[weaponname])) {
        if (player.tookweaponfrom[weaponname] == player) {
            function_55b08d6d71b41402(self, "reunited_deploy");
        } else {
            function_55b08d6d71b41402(self, "stranger_deploy");
        }
    } else if (var_cedefd3160bf7cc) {
        player thread function_aea35499f76041bb();
    }
    if (var_de1fd66f1b22f6a9 != "doom") {
        player setclientomnvar("ui_talkinggun_faceid", var_de1fd66f1b22f6a9);
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3157
// Size: 0xc0
function function_f70b3ce9138e10b(player) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(player.var_d1d541d826231cad)) {
        return;
    }
    player notify("remove_talking_gun");
    player.var_d1d541d826231cad.active = 0;
    for (k = 0; k < level.var_1642386c8e73a981.size; k++) {
        if (level.var_1642386c8e73a981[k] == player) {
            var_321cffbb6b6baa79 = level.var_1642386c8e73a981.size - 1;
            level.var_1642386c8e73a981[k] = level.var_1642386c8e73a981[var_321cffbb6b6baa79];
            level.var_1642386c8e73a981[var_321cffbb6b6baa79] = undefined;
            break;
        }
    }
    player setclientomnvar("ui_talkinggun_faceid", "none");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x321e
// Size: 0xb
function function_da3d9f34d24ac85a() {
    function_f70b3ce9138e10b(self);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3230
// Size: 0x22
function function_96f59fefd781e47() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3259
// Size: 0x22
function function_96f5afefd78207a() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "robot");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3282
// Size: 0x22
function function_96f5bfefd7822ad() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "hypeman");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32ab
// Size: 0x22
function function_96f54fefd781348() {
    if (!getdvarint(@"hash_18bf04d5c5766462")) {
        return;
    }
    function_2cc0d17b7e641e00(self, "blackcell");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32d4
// Size: 0x10
function function_fc6e0b02abb995cb() {
    function_2cc0d17b7e641e00(self, "announcer");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32eb
// Size: 0x10
function function_73e4ae4f932e9f30() {
    function_2cc0d17b7e641e00(self, "robot");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3302
// Size: 0x10
function function_cc0fddfe26b772a7() {
    function_2cc0d17b7e641e00(self, "blackcell");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3319
// Size: 0x10
function function_fc09644394bf843f() {
    function_2cc0d17b7e641e00(self, "npc");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3330
// Size: 0x10
function function_44d73a43ca35cbcc() {
    function_2cc0d17b7e641e00(self, "cat");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3347
// Size: 0x10
function function_514a7643d295a3a2() {
    function_2cc0d17b7e641e00(self, "dog");
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x335e
// Size: 0x94
function function_3d9dc061bbfb25ab() {
    /#
        while (1) {
            eventname = getdvar(@"hash_53cb08e924ea65a4");
            if (eventname != "<unknown string>") {
                event = level.var_20e6a6f36157adc[eventname];
                thread function_547117b1a7105f45(self, event.delay, event.lines[self.var_d1d541d826231cad.var_de1fd66f1b22f6a9]);
                setdvar(@"hash_53cb08e924ea65a4", "<unknown string>");
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f9
// Size: 0x17a
function function_62e0bcef615a8d1d() {
    /#
        setdevdvarifuninitialized(@"hash_ed477691433d09ec", "<unknown string>");
        thread function_a5408bdf77302300();
    #/
    function_2cc0d17b7e641e00(self, "doom");
    var_5275b9018a6575aa = "ui_doomscreen_faceid";
    function_2fa456bb8a94b7a1("contract_complete", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("loot_found", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("obj_capture", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killstreak_used", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("round_won", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("knocked_down_enemy", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("self_apply", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("war_cry", 1, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("highalert_spotted", 2, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("teammate_death_revived_me", 2, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("round_lost", 2, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("sprint", 2, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("player_knocked_down", 3, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("highalert_spotted_left", 7, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("highalert_spotted_right", 8, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killed_enemy_multi", 9, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killed_enemy_5x", 9, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killed_enemy_10x", 9, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killed_enemy_15x", 9, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("killed_enemy_20x", 9, var_5275b9018a6575aa);
    function_2fa456bb8a94b7a1("nuke_earned", 9, var_5275b9018a6575aa);
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x357a
// Size: 0x18
function function_ade69726300553ac() {
    function_f70b3ce9138e10b(self);
    if (isdefined(self)) {
        self notify("remove_doom_screen");
    }
}

// Namespace namespace_1f982ef62dd6c744/namespace_27c74152ccb91331
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3599
// Size: 0xe6
function function_a5408bdf77302300() {
    /#
        self endon("<unknown string>");
        while (1) {
            eventname = getdvar(@"hash_ed477691433d09ec");
            if (eventname != "<unknown string>") {
                var_cabc886d846dd979 = 0;
                switch (eventname) {
                case #"hash_dd65780f43656833":
                    var_cabc886d846dd979 = 1;
                    break;
                case #"hash_bcd16c32933c3b91":
                    var_cabc886d846dd979 = 2;
                    break;
                case #"hash_1f1d7b3efcb82111":
                    var_cabc886d846dd979 = 3;
                    break;
                case #"hash_95f8d06c03be72f6":
                    var_cabc886d846dd979 = 7;
                    break;
                case #"hash_ec1d2322d127982b":
                    var_cabc886d846dd979 = 8;
                    break;
                case #"hash_379a17913fa2594a":
                    var_cabc886d846dd979 = 9;
                    break;
                }
                self setclientomnvar("<unknown string>", var_cabc886d846dd979);
                setdvar(@"hash_ed477691433d09ec", "<unknown string>");
            }
            wait(0.05);
        }
    #/
}
