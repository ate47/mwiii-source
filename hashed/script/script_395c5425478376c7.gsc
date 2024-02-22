// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_77c18cdedec620b3;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using script_5aff2dfd3f05edbf;
#using script_3db04fd1b466bdba;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_f3a6ced925f97d70;

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x25c
// Size: 0x19
function autoexec main() {
    utility::registersharedfunc("bunker_buster", "init", &init);
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27c
// Size: 0xfb
function private init() {
    /#
        devgui_init();
    #/
    utility::registersharedfunc("bunker_buster", "missile_gas_volume", &missile_gas_volume);
    utility::registersharedfunc("bunker_buster", "dialog_deploy", &dialog_deploy);
    utility::registersharedfunc("bunker_buster", "dialog_warning", &dialog_warning);
    utility::registersharedfunc("bunker_buster", "dialog_hits", &dialog_hits);
    game["dialog"]["bunker_buster" + "_deploy"] = "dx_br_smis_kbbu_grav_bbkd";
    game["dialog"]["bunker_buster" + "_warning_friendly"] = "dx_br_smis_kbbu_grav_kfsi";
    game["dialog"]["bunker_buster" + "_warning_enemy"] = "dx_br_smis_kbbu_grav_kesi";
    game["dialog"]["bunker_buster" + "_no_hits"] = "dx_br_smis_kbbu_grav_bkne";
    game["dialog"]["bunker_buster" + "_single_hit"] = "dx_br_smis_kbbu_grav_bksh";
    game["dialog"]["bunker_buster" + "_multiple_hits"] = "dx_br_smis_kbbu_grav_bkmh";
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x54
function missile_gas_volume(startposition, endposition, radius, var_70437d3c1365ec0c) {
    level thread function_8800c8028368dc18(endposition, self, self.team, level.bunker_buster.var_3dcc8e3bfb7a7d98, radius, distance(startposition, endposition), var_70437d3c1365ec0c);
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9
// Size: 0x110
function function_8800c8028368dc18(position, owner, team, duration, radius, height, var_70437d3c1365ec0c) {
    trigger = spawn("trigger_radius", position, 0, radius, height);
    trigger namespace_2a9588dfac284b77::registerspawn(1, &sweepgas);
    trigger.height = height;
    trigger.radius = radius;
    trigger.duration = duration;
    trigger endon("death");
    trigger.owner = owner;
    trigger.team = team;
    trigger.playersintrigger = [];
    trigger.var_aeeca2bc23f59ea4 = [];
    if (gas_grenade::function_4cd5239298745de7()) {
        trigger thread namespace_d20f8ef223912e12::function_4b2456ab9e1c7b81(position);
    }
    trigger thread gas_grenade::gas_watchtriggerenter();
    trigger thread gas_grenade::gas_watchtriggerexit();
    trigger thread function_69a839ba80dc08f0(2, var_70437d3c1365ec0c);
    wait(duration);
    trigger notify("gas_cleared");
    trigger thread gas_grenade::gas_destroytrigger();
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0x98
function function_69a839ba80dc08f0(duration, var_70437d3c1365ec0c) {
    level endon("game_ended");
    self endon("death");
    for (;;) {
        ent = self waittill("trigger");
        num = ent getentitynumber();
        if (!isdefined(var_70437d3c1365ec0c.gas_victims[num]) && (isplayer(ent) || isagent(ent)) && ent.team != self.team) {
            var_70437d3c1365ec0c.gas_victims[num] = 1;
        }
    }
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58f
// Size: 0x2d
function dialog_deploy(player) {
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("bunker_buster" + "_deploy", player, 1, 0, 1, undefined, "");
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x68
function dialog_warning(friendlies, enemies) {
    if (isdefined(friendlies) && friendlies.size > 0) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("bunker_buster" + "_warning_friendly", 1, friendlies, 0, undefined, undefined, "");
    }
    if (isdefined(enemies) && enemies.size > 0) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("bunker_buster" + "_warning_enemy", 1, enemies, 0, undefined, undefined, "");
    }
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0x13a
function dialog_hits(player, var_70437d3c1365ec0c) {
    dialog = "";
    var_fd614e2f3ed3515b = [];
    foreach (k, v in var_70437d3c1365ec0c.explosion_victims) {
        var_fd614e2f3ed3515b[k] = 1;
    }
    foreach (k, v in var_70437d3c1365ec0c.gas_victims) {
        var_fd614e2f3ed3515b[k] = 1;
    }
    switch (var_fd614e2f3ed3515b.size) {
    case 0:
        dialog = "bunker_buster" + "_no_hits";
        break;
    case 1:
        dialog = "bunker_buster" + "_single_hit";
        break;
    default:
        dialog = "bunker_buster" + "_multiple_hits";
        break;
    }
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer(dialog, player, 1, 0, undefined, undefined, "");
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x773
// Size: 0xc5
function private devgui_init() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a2fe753948998c89("<unknown string>", "<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_1d3ab9e562b3e3db);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_1d3ab9e562b3e3db);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ac26cf14f95df3f8);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ac26cf14f95df3f8);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ac26cf14f95df3f8);
        devgui::function_fe953f000498048f();
        if (game_utility::isbrstylegametype()) {
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_a2fe753948998c89("<unknown string>", "<unknown string>");
            devgui::function_fe953f000498048f();
        }
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x83f
// Size: 0x28
function private function_1d3ab9e562b3e3db(params) {
    /#
        level.player thread function_a685587c650ff936(int(params[0]));
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x86e
// Size: 0x34
function private function_ac26cf14f95df3f8(params) {
    /#
        direction = int(params[0]);
        level.player thread function_cf8e244be65c5a69(direction);
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x8a9
// Size: 0xec
function private function_a685587c650ff936(team) {
    /#
        player = undefined;
        if (team == 0) {
            player = self;
        } else {
            foreach (p in level.players) {
                if (p.team != self.team) {
                    player = p;
                    continue;
                }
            }
            if (!isdefined(player)) {
                iprintlnbold("<unknown string>");
                return;
            }
        }
        streakinfo = namespace_2b1145f62aa835b8::function_bc5bcad4a3bbd734("<unknown string>", player);
        streakinfo.targetoverride = self.origin;
        streakinfo.uid = player bunker_buster::function_a9a0e979105b948d();
        player thread bunker_buster::function_310cef1f62dd5600(streakinfo);
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x99c
// Size: 0x202
function private function_cf8e244be65c5a69(direction) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        origin = self.origin;
        if (getdvarint(@"hash_1826bea9905c3eea", 0)) {
            origin = level.var_8665203d66afed4f;
            setdvar(@"hash_1826bea9905c3eea", 0);
        } else {
            level.var_8665203d66afed4f = origin;
        }
        missile = function_34ccba134860b117(origin);
        var_aeffb2af0242bf70 = 0;
        if (direction == 2) {
            direction = 0;
            var_aeffb2af0242bf70 = 1;
        }
        var_d990b135122206c6 = missile function_d39fece4c095adf3(direction);
        if (isdefined(var_d990b135122206c6)) {
            if (var_aeffb2af0242bf70) {
                var_b7d610ade1b826e8 = missile function_d39fece4c095adf3(!direction);
            }
        }
        var_6a6e12362fcab6e9 = missile function_e9b8d48cb8dd3d5a();
        if (getdvarint(@"hash_d2398cc34f83ff2b", 1)) {
            level thread function_36582d5c1ccc8447(missile, var_6a6e12362fcab6e9);
            if (isdefined(var_d990b135122206c6) && var_d990b135122206c6.size > 0) {
                var_28dcf1e6dd6c65ff = isdefined(var_d990b135122206c6["<unknown string>"]) + isdefined(var_d990b135122206c6[var_d990b135122206c6.size - 1]["<unknown string>"]);
                for (i = 0; i < var_d990b135122206c6.size - var_28dcf1e6dd6c65ff; i++) {
                    var_bfa21f20831033f3 = var_d990b135122206c6[i];
                    if (i > 1) {
                        var_f5ba189e648743db = var_d990b135122206c6[i - 1];
                        dist = distance(var_bfa21f20831033f3["<unknown string>"], var_f5ba189e648743db["<unknown string>"]);
                        if (dist > 512) {
                            break;
                        }
                        jumpiffalse(dist < 64) LOC_000001a2;
                    } else {
                    LOC_000001a2:
                        missile = function_34ccba134860b117(var_bfa21f20831033f3["<unknown string>"], -32, (0, 0, -1024), missile);
                        var_6a6e12362fcab6e9 = missile function_e9b8d48cb8dd3d5a();
                        level thread function_36582d5c1ccc8447(missile, var_6a6e12362fcab6e9);
                    }
                }
            }
        }
        if (isdefined(missile)) {
            missile thread utility::function_b4b04de87729a6f3(level.framedurationseconds);
            missile function_f6ddf2accdb58432();
        }
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xba5
// Size: 0x1e6
function private function_d39fece4c095adf3(direction) {
    /#
        start = direction == 0 ? self.origin : utility::flat_origin(self.origin);
        end = direction == 0 ? utility::flat_origin(self.origin) : self.origin;
        contents = trace::create_contents(0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0);
        var_a460b86fed63f290 = getdvarint(@"hash_604388345506b32e", 0);
        if (var_a460b86fed63f290 == 0) {
            trace = trace::ray_trace_get_all_results(start, end, [0:self], contents, 1);
        } else if (var_a460b86fed63f290 == 1) {
            trace = trace::capsule_trace_get_all_results(start, end, 16, 32, self.angles, [0:self], contents, 1);
        } else if (var_a460b86fed63f290 == 2) {
            trace = trace::sphere_trace_get_all_results(start, end, 32, [0:self], contents, 1, 0);
        }
        if (trace.size == 1) {
            key = function_5162a2aaad39b2c7(trace, 0);
            if (isstring(key) && key == "<unknown string>") {
                return undefined;
            }
        }
        trace = function_263e0f532fbd08a4(trace, end, direction, 128, 360);
        if (isdefined(trace)) {
            switch (direction) {
            case 0:
                color = (1, 1, 1);
                break;
            case 1:
                color = (1, 0.5, 0);
                break;
            case 2:
                color = (1, 1, 0);
                break;
            }
            trace::draw_trace(trace, color, 1, int(60 / level.framedurationseconds));
        }
        return trace;
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xd92
// Size: 0x258
function private function_263e0f532fbd08a4(trace, end, direction, min_dist, max_dist) {
    /#
        if (!getdvarint(@"hash_e4b86b7a307bc35", 1)) {
            return trace;
        }
        if (trace.size == 0) {
            return undefined;
        }
        var_671cfebd9f2e7d3b = [];
        if (isdefined(trace["<unknown string>"])) {
            debug_data = trace["<unknown string>"];
            trace["<unknown string>"] = undefined;
        }
        if (direction == 1) {
            trace = utility::array_reverse(trace);
        }
        for (i = 0; i < trace.size; i++) {
            if (!isdefined(trace[i])) {
                continue;
            }
            ct = trace[i];
            if (!isdefined(trace[i + 1])) {
                if (var_671cfebd9f2e7d3b.size == 0) {
                    break;
                }
                var_655d9c0442029451 = var_671cfebd9f2e7d3b[var_671cfebd9f2e7d3b.size - 1]["<unknown string>"];
            } else {
                var_655d9c0442029451 = trace[i + 1]["<unknown string>"];
            }
            dist = abs(distance(ct["<unknown string>"], var_655d9c0442029451));
            if (dist == 0) {
                var_671cfebd9f2e7d3b = utility::array_add(var_671cfebd9f2e7d3b, ct);
                break;
            }
            if (dist < min_dist) {
                continue;
            }
            if (getdvarint(@"hash_65fd9d08dc67fde1", 0)) {
                if (dist >= max_dist) {
                    if (i < trace.size) {
                        var_671cfebd9f2e7d3b = utility::array_add(var_671cfebd9f2e7d3b, ct);
                    }
                    break;
                }
            }
            if (direction == 1 && getdvarint(@"hash_95dca2c14e359be2", 1)) {
                test_trace = trace::ray_trace(ct["<unknown string>"], utility::flat_origin(ct["<unknown string>"]), undefined, undefined, 1, 1, 0);
                jumpiffalse(test_trace["<unknown string>"] == "<unknown string>") LOC_000001c0;
            } else {
            LOC_000001c0:
                var_671cfebd9f2e7d3b = utility::array_add(var_671cfebd9f2e7d3b, ct);
            }
        }
        if (var_671cfebd9f2e7d3b.size > 0) {
            if (isdefined(debug_data)) {
                var_671cfebd9f2e7d3b = utility::array_add(var_671cfebd9f2e7d3b, debug_data);
            }
            return var_671cfebd9f2e7d3b;
        }
        if (isdefined(ct) && direction == 1 && getdvarint(@"hash_95dca2c14e359be2", 1)) {
            test_trace = trace::ray_trace(ct["<unknown string>"], utility::flat_origin(ct["<unknown string>"]), undefined, undefined, 1, 1, 0);
            if (test_trace["<unknown string>"] == "<unknown string>") {
                return undefined;
            }
        }
        if (isdefined(debug_data)) {
            trace = utility::array_add(trace, debug_data);
        }
        return trace;
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xff1
// Size: 0x1a1
function private function_34ccba134860b117(origin, offset, velocity, var_8eb5937f6c4488e7) {
    /#
        if (!isdefined(offset)) {
            offset = 4096;
        }
        if (!isdefined(velocity)) {
            velocity = (0, 0, 0);
        }
        var_206dbd116490dd48 = {initvelocity:velocity, sourcepos:origin + (0, 0, offset), goalpos:origin};
        if (!isdefined(var_8eb5937f6c4488e7)) {
            streakinfo = namespace_2b1145f62aa835b8::function_bc5bcad4a3bbd734("<unknown string>", self);
        } else {
            streakinfo = var_8eb5937f6c4488e7.streakinfo;
        }
        missile = magicgrenademanual("<unknown string>", var_206dbd116490dd48.sourcepos, var_206dbd116490dd48.initvelocity, 6, self);
        missile setscriptablepartstate("<unknown string>", "<unknown string>", 0);
        if (!isdefined(var_8eb5937f6c4488e7)) {
            missile setscriptablepartstate("<unknown string>", "<unknown string>", 0);
        }
        if (isdefined(var_8eb5937f6c4488e7)) {
            minimapid = var_8eb5937f6c4488e7.minimapid;
            var_8eb5937f6c4488e7 delete();
        } else {
            minimapid = undefined;
            if (utility::issharedfuncdefined("<unknown string>", "<unknown string>")) {
                minimapid = missile [[ utility::getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", self.team, undefined, 1, 1);
            }
        }
        missile.minimapid = minimapid;
        missile.streakinfo = streakinfo;
        missile.owner = self;
        missile setentityowner(self);
        missile setotherent(self);
        missile forcenetfieldhighlod(1);
        return missile;
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1199
// Size: 0x66
function private function_f6ddf2accdb58432() {
    /#
        if (self.classname != "<unknown string>") {
            namespace_2b1145f62aa835b8::function_6262c3a1ef0924d(0);
        }
        if (isdefined(self.minimapid)) {
            if (utility::issharedfuncdefined("<unknown string>", "<unknown string>")) {
                [[ utility::getsharedfunc("<unknown string>", "<unknown string>") ]](self.minimapid);
            }
            self.minimapid = undefined;
        }
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1206
// Size: 0x77
function private function_e9b8d48cb8dd3d5a() {
    /#
        var_7d1c75f6e04015b8 = namespace_71a41ba7aee93481::function_51afe751c1e36723("<unknown string>", "<unknown string>");
        var_6a6e12362fcab6e9 = undefined;
        if (isdefined(var_7d1c75f6e04015b8)) {
            if (var_7d1c75f6e04015b8.msg == "<unknown string>") {
                var_6a6e12362fcab6e9 = var_7d1c75f6e04015b8.param1;
            } else if (var_7d1c75f6e04015b8.msg == "<unknown string>") {
                self.var_3c76575cf3375e9b = 1;
            }
        }
        return var_6a6e12362fcab6e9;
    #/
}

// Namespace namespace_f3a6ced925f97d70/namespace_fd412e3fb7716847
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1284
// Size: 0xb1
function private function_36582d5c1ccc8447(missile, var_6a6e12362fcab6e9) {
    /#
        if (!getdvarint(@"hash_21fb555b256afb3a", 1)) {
            return;
        }
        var_7526f4deadbaac8e = toma_strike::toma_strike_create_explosion(missile.origin, missile.angles, var_6a6e12362fcab6e9, missile.owner, gettime(), missile.streakinfo);
        var_d2b8a02700752cba = istrue(missile.var_3c76575cf3375e9b) ? "<unknown string>" : "<unknown string>";
        var_7526f4deadbaac8e setscriptablepartstate(var_d2b8a02700752cba, "<unknown string>", 0);
        var_7526f4deadbaac8e thread utility::function_b4b04de87729a6f3(0.1);
    #/
}

