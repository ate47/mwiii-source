// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace namespace_c8f50c27f5dd5ed8;

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1
// Size: 0xda
function function_b60c68caa2f279ab() {
    namespace_49e179ec476603d6::function_900f562c61c6a5d6("currency", &function_1c4d7b495f377496, &function_794ffcdb7828ea7a, &function_794ffcdb7828ea7a, &function_d66381667ff586f7, &function_90e18d5608cfd1e9, &function_5142ec2757db7df6);
    level.var_d9f04e5f1fe187c8 = getdvarint(@"hash_d6c1c3a63fffaa05", 4000);
    level.var_fc4c0fbec2dbd28c = getdvarint(@"hash_92f1f3fc3fa4338f", 499);
    if (getdvarint(@"hash_ee227f9b528f4b62", 1)) {
        level.var_986acb83cc29ed77.var_48c807bcc0ab526 = [];
        level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe = [];
        namespace_49e179ec476603d6::function_5958815b72ad58a0("currency", #"hash_79cd484b40e882b", &function_32e0e65cc21dd2fe);
        callback::add("player_vehicle_enter", &function_3bc86b6f6e18eea7);
        callback::add("player_vehicle_exit", &function_aba001929fc2df47);
    }
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0xd5
function function_32e0e65cc21dd2fe(var_fbe755f0978c0369) {
    itembundle = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"itemspawnentry:", var_fbe755f0978c0369), [0:#"subtype", 1:#"scriptable"]);
    if (isdefined(itembundle.subtype) && itembundle.subtype == "essence" && isdefined(itembundle.scriptable) && !function_fc64178f71375137(level.var_986acb83cc29ed77.var_48c807bcc0ab526, itembundle.scriptable)) {
        level.var_986acb83cc29ed77.var_48c807bcc0ab526[level.var_986acb83cc29ed77.var_48c807bcc0ab526.size] = itembundle.scriptable;
    }
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae
// Size: 0x26
function function_794ffcdb7828ea7a(itembundle, item, var_11648d9cb3869a36, var_18fc734ec7194ede) {
    return 1;
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc
// Size: 0x110
function function_1c4d7b495f377496(itembundle, item, var_11648d9cb3869a36) {
    var_8d02a463027120aa = itembundle.subtype;
    var_3d7ffadeef043c6 = item.count;
    if (!isdefined(var_8d02a463027120aa) || var_8d02a463027120aa == "" || var_8d02a463027120aa != "essence") {
        var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_2cdc55ba39d97d70(item.type);
        /#
            /#
                assertmsg("<unknown string>" + var_fbe755f0978c0369 + "<unknown string>");
            #/
        #/
        return [0:var_3d7ffadeef043c6, 1:0];
    }
    if (isdefined(self.zombie_point_scalar) && !istrue(item.var_8f6468c1705602c2)) {
        var_3d7ffadeef043c6 = var_3d7ffadeef043c6 * self.zombie_point_scalar;
    }
    reason = #"hash_55afab6ccc2a9711";
    if (isdefined(self.var_2fa5b49969def47)) {
        reason = #"cache";
    }
    currency::function_3036cef61495210f(var_8d02a463027120aa, var_3d7ffadeef043c6, reason);
    return [0:0, 1:var_3d7ffadeef043c6];
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4
// Size: 0x5c
function function_d66381667ff586f7() {
    itembundle = undefined;
    quantity = 0;
    var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_61d960957fcf3ca0("jup_currency_essence");
    if (isdefined(var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        quantity = currency::function_15975e20bbd2c824("essence");
    }
    return [0:itembundle, 1:quantity];
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558
// Size: 0x70
function function_90e18d5608cfd1e9(quantity) {
    var_ff239359935aa777 = currency::function_15975e20bbd2c824("essence");
    quantity = int(min(quantity, var_ff239359935aa777));
    quantity = int(min(quantity, level.var_d9f04e5f1fe187c8));
    quantity = int(min(quantity, 4095));
    currency::function_a06aa3b8c98e131e("essence", quantity);
    return var_ff239359935aa777 - currency::function_15975e20bbd2c824("essence");
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0
// Size: 0x168
function function_5142ec2757db7df6(itembundle, count, droporigin, dropangles) {
    count = int(min(count, level.var_d9f04e5f1fe187c8));
    count = int(min(count, 4095));
    var_c6cf9438b9779eb3 = count > level.var_fc4c0fbec2dbd28c ? "essence_container_large" : "essence_container";
    var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_61d960957fcf3ca0(var_c6cf9438b9779eb3);
    if (!isdefined(var_fbe755f0978c0369)) {
        /#
            assertmsg("CommonItemError: Failed to associate an itemspawnentry bundle to ref [" + var_c6cf9438b9779eb3 + "].");
        #/
        return;
    }
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: Script bundle not found for itemspawnentry [" + var_fbe755f0978c0369 + "]");
        #/
        return;
    }
    payload = [0:#"hash_5f9c433bdcfb4e14", 1:self getentitynumber()];
    item = namespace_49e179ec476603d6::function_d59d110ccf0f5b8b(itembundle, count, droporigin, dropangles, 0, 0, payload);
    item.var_8f6468c1705602c2 = 1;
    namespace_49e179ec476603d6::function_a703a4241f091edc(item, 300);
    params = spawnstruct();
    params.item = item;
    params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
    params.payload = payload;
    callback::callback("player_item_drop", params);
    return item;
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x740
// Size: 0xab
function function_3bc86b6f6e18eea7(params) {
    if (!isplayer(params.player)) {
        return;
    }
    var_8c7c6282b017568f = params.vehicle getentitynumber();
    if (!isdefined(level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f])) {
        level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f] = [];
        level thread function_d62127a5f04bf35a(params.vehicle);
    }
    level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f][params.player getentitynumber()] = gettime();
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f2
// Size: 0xcc
function function_aba001929fc2df47(params) {
    if (!isplayer(params.player)) {
        return;
    }
    if (isdefined(params.var_7558f98f3236963d)) {
        return;
    }
    var_8c7c6282b017568f = params.vehicle getentitynumber();
    if (isdefined(level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f])) {
        level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f][params.player getentitynumber()] = undefined;
        if (level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f].size == 0) {
            level.var_986acb83cc29ed77.var_e4c2d4cb4855b6fe[var_8c7c6282b017568f] = undefined;
            params.vehicle notify("ob_end_watch_vehicle_overlap_essence");
        }
    }
}

// Namespace namespace_c8f50c27f5dd5ed8/namespace_990cd49f5c79b158
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c5
// Size: 0x22b
function function_d62127a5f04bf35a(vehicle) {
    vehicle endon("death");
    vehicle endon("ob_end_watch_vehicle_overlap_essence");
    var_15877ef521e5cb07 = function_abf76cc289cf03a3(vehicle.model);
    var_15877ef521e5cb07 = var_15877ef521e5cb07 + (15, 15, 25);
    while (1) {
        wait(0.25);
        driver = vehicle_occupancy::vehicle_occupancy_getdriver(vehicle);
        if (!isplayer(driver)) {
            continue;
        }
        var_5067c2728e302fbe = vehicle physics_getentityaabb();
        var_2c966acb0468d8f8 = vectorlerp(var_5067c2728e302fbe["min"], var_5067c2728e302fbe["max"], 0.5);
        var_8b0579be668e5c32 = length((var_5067c2728e302fbe["max"] - var_5067c2728e302fbe["min"]) * 0.5);
        var_a328c553ecb440e7 = anglestoaxis(vehicle.angles);
        var_8c26ad19a0970e6d = [0:var_a328c553ecb440e7["forward"], 1:var_a328c553ecb440e7["right"], 2:var_a328c553ecb440e7["up"]];
        scriptables = getlootscriptablearrayinradius(undefined, undefined, var_2c966acb0468d8f8, var_8b0579be668e5c32);
        foreach (scriptable in scriptables) {
            if (!scriptable getscriptableisusableonanypart() || !function_fc64178f71375137(level.var_986acb83cc29ed77.var_48c807bcc0ab526, function_40fd49171fad19d3(scriptable.type))) {
                continue;
            }
            collision = 1;
            var_abef6236abf0cefb = scriptable.origin - var_2c966acb0468d8f8;
            for (i = 0; i <= 2; i++) {
                var_9ca188f217947e12 = abs(vectordot(var_8c26ad19a0970e6d[i], var_abef6236abf0cefb));
                if (var_9ca188f217947e12 > var_15877ef521e5cb07[i]) {
                    collision = 0;
                    break;
                }
            }
            if (!collision) {
                continue;
            }
            namespace_49e179ec476603d6::function_ccb2889218715cb1(scriptable, undefined, undefined, driver, 1);
        }
    }
}

