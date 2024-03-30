// mwiii decomp prototype
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\asm.gsc;

#namespace combat_utility;

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136
// Size: 0x3
function shootuntilshootbehaviorchange() {
    
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x3
function initgrenadethrowanims() {
    
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a
// Size: 0xc1
function throwgrenadeatplayerasap_combat_utility() {
    /#
        assert(self isbadguy());
    #/
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] function_4c108309dc0d7fd2() == 0) {
            function_b4ebe6632d7e8efe(level.players[i], "lethal", 0);
        }
    }
    function_98deae9464f6c005(1);
    /#
        enemies = getaiarray("<unknown string>");
        if (enemies.size == 0) {
            return;
        }
        var_20d57e479df6089c = 0;
        for (i = 0; i < enemies.size; i++) {
            if (enemies[i].grenadeammo > 0) {
                return;
            }
        }
        println("<unknown string>");
    #/
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0xa1
function function_96d556dea441d1dc(grenadetimer) {
    /#
        if (grenadetimer.isplayertimer) {
            for (i = 0; i < level.players.size; i++) {
                if (level.players[i] == grenadetimer.player) {
                    break;
                }
            }
            return ("<unknown string>" + i + 1 + "<unknown string>" + grenadetimer.weapon.basename);
        }
        return "<unknown string>" + grenadetimer.weapon.basename;
    #/
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x3c
function trygrenadethrow(throwingat, destination, var_4ed24c46c4f57095, armoffset, fastthrow, withbounce, var_973c51e9fd66d178) {
    
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd
// Size: 0x9c
function getgrenadedropvelocity() {
    yaw = randomfloat(360);
    pitch = randomfloatrange(30, 75);
    amntz = sin(pitch);
    cospitch = cos(pitch);
    amntx = cos(yaw) * cospitch;
    amnty = sin(yaw) * cospitch;
    speed = randomfloatrange(100, 200);
    velocity = (amntx, amnty, amntz) * speed;
    return velocity;
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1
// Size: 0x43
function dropgrenade() {
    if (isdefined(self.nodropgrenade)) {
        return;
    }
    grenadeorigin = self gettagorigin("tag_accessory_right");
    velocity = getgrenadedropvelocity();
    self magicgrenademanual(grenadeorigin, velocity, 3);
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb
// Size: 0x47
function getpitchtoshootspot(spot) {
    if (!isdefined(spot)) {
        return 0;
    }
    vectortoenemy = spot - self getshootatpos();
    vectortoenemy = vectornormalize(vectortoenemy);
    pitchdelta = vectortoangles(vectortoenemy)[0];
    return angleclamp180(pitchdelta);
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0x5f
function watchreloading() {
    self.isreloading = 0;
    self.lastreloadstarttime = -1;
    while (true) {
        self waittill("reload_start");
        self.isreloading = 1;
        self.lastreloadstarttime = gettime();
        function_216c67ab6749137a(self, undefined, "reload");
        waittillreloadfinished();
        self.isreloading = 0;
    }
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a0
// Size: 0x68
function waittillreloadfinished() {
    thread timednotify(4, "reloadtimeout");
    self endon("reloadtimeout");
    self endon("weapon_taken");
    while (true) {
        self waittill("reload");
        weap = self getcurrentweapon();
        if (isnullweapon(weap)) {
            break;
        }
        if (self getcurrentweaponclipammo() >= weaponclipsize(weap)) {
            break;
        }
    }
    self notify("reloadtimeout");
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f
// Size: 0x1d
function timednotify(time, msg) {
    self endon(msg);
    wait(time);
    self notify(msg);
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533
// Size: 0x17e
function monitorflash() {
    self endon("death");
    if (!isdefined(level.neverstopmonitoringflash)) {
        self endon("stop_monitoring_flash");
    }
    while (true) {
        amount_distance = undefined;
        origin = undefined;
        var_dda6d54c623139bd = undefined;
        attacker = undefined;
        attackerteam = undefined;
        origin, amount_distance, var_dda6d54c623139bd, attacker, attackerteam, duration = self waittill("flashbang");
        if (isdefined(self.flashbangimmunity) && self.flashbangimmunity) {
            continue;
        }
        if (isdefined(self.script_immunetoflash) && self.script_immunetoflash != 0) {
            continue;
        }
        if (isdefined(self.team) && isdefined(attackerteam) && self.team == attackerteam) {
            amount_distance = 3 * (amount_distance - 0.75);
            if (amount_distance < 0) {
                continue;
            }
            if (isdefined(self.teamflashbangimmunity)) {
                continue;
            }
        }
        if (scripts/common/utility::function_ec40425fb125f6cf("flashbang", attackerteam)) {
            continue;
        }
        var_fbc487faa5bf1ff = 0.2;
        if (amount_distance > 1 - var_fbc487faa5bf1ff) {
            amount_distance = 1;
        } else {
            amount_distance = amount_distance / (1 - var_fbc487faa5bf1ff);
        }
        if (!isdefined(duration)) {
            duration = 4.5;
        }
        duration = duration * amount_distance;
        if (duration < 0.25) {
            continue;
        }
        self.flashingteam = attackerteam;
        flashbangstart(duration);
        self notify("doFlashBanged", origin);
    }
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0xed
function flashbangstart(duration) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(duration));
    #/
    if (isdefined(self.flashbangimmunity) && self.flashbangimmunity) {
        return;
    }
    if (isdefined(self.syncedmeleetarget)) {
        return;
    }
    if (self isinscriptedstate() || scripts/asm/asm_bb::bb_isanimscripted()) {
        return;
    }
    if (!self.allowpain || !self.allowpain_internal) {
        return;
    }
    newflashendtime = gettime() + int(duration * 1000);
    if (isdefined(self.flashendtime)) {
        self.flashendtime = int(max(self.flashendtime, newflashendtime));
    } else {
        self.flashendtime = newflashendtime;
        if (isdefined(self.asm)) {
            scripts/asm/asm::asm_setstate("pain_flashed_transition");
        }
    }
    self notify("flashed");
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ac
// Size: 0x8
function fasteranimspeed() {
    return 1.5;
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bc
// Size: 0x193
function showgrenadetimers() {
    /#
        setdvarifuninitialized(@"hash_b4fd9ea4f6486d24", "<unknown string>");
        huds = undefined;
        playerhuds = undefined;
        while (true) {
            if (getdvarint(@"hash_b4fd9ea4f6486d24") == 0) {
                function_c0d677eae75ed3ea(huds);
                function_c0d677eae75ed3ea(playerhuds);
                huds = undefined;
                playerhuds = undefined;
                wait(0.2);
                continue;
            }
            if (!isdefined(huds)) {
                var_57accdc40b2f50e = function_96de23075e92ba2();
                playerhuds = var_57accdc40b2f50e[1];
                huds = var_57accdc40b2f50e[0];
            }
            foreach (key, hud in huds) {
                hud.value = anim.meleechargetimers[key] - gettime();
                if (hud.value < 0) {
                    continue;
                }
                hud setvalue(hud.value);
            }
            foreach (key, hud in playerhuds) {
                hud.value = anim.meleechargeplayertimers[key] - gettime();
                if (hud.value < 0) {
                    continue;
                }
                hud setvalue(hud.value);
            }
            wait(0.05);
        }
    #/
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x956
// Size: 0x189
function function_96de23075e92ba2() {
    /#
        huds = [];
        count = 0;
        foreach (key, item in anim.meleechargetimers) {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<unknown string>" + key + "<unknown string>";
            hud setvalue(0);
            hud.value = 0;
            huds[key] = hud;
            count++;
        }
        count++;
        playerhuds = [];
        foreach (key, item in anim.meleechargeplayertimers) {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<unknown string>" + key + "<unknown string>";
            hud setvalue(0);
            hud.value = 0;
            playerhuds[key] = hud;
            count++;
        }
        return [huds, playerhuds];
    #/
}

// Namespace combat_utility / namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae6
// Size: 0x61
function function_c0d677eae75ed3ea(huds) {
    /#
        if (!isdefined(huds)) {
            return;
        }
        foreach (hud in huds) {
            hud destroy();
        }
    #/
}

