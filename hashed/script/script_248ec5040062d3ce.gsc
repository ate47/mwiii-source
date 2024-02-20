// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_dlog.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;

#namespace namespace_2a0940ff51ea0cff;

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a
// Size: 0x14
function main() {
    function_c0b3ddc9a6bdcc46("veh9_techo_rebel_armor", &function_c036143411f3540);
}

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x245
// Size: 0x4c
function private function_c036143411f3540() {
    if (!function_9697379150687859("veh9_techo_rebel_armor")) {
        return;
    }
    callbacks = [];
    callbacks["spawn"] = &function_c1b385596f29457e;
    callbacks["armorShouldMitigateDamage"] = &function_96939d4c4815b891;
    function_8497e7e46b5e397("veh9_techo_rebel_armor", callbacks);
    function_1b72aff42925d411();
}

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x298
// Size: 0xdc
function private function_1b72aff42925d411() {
    var_f18669893e89dd0 = undefined;
    var_44efe20b6ff851cb = undefined;
    if (issharedfuncdefined("veh9_techo_rebel_armor", "armorDamageFeedback")) {
        var_f18669893e89dd0 = getsharedfunc("veh9_techo_rebel_armor", "armorDamageFeedback");
    }
    if (issharedfuncdefined("veh9_techo_rebel_armor", "armorDeathFeedback")) {
        var_44efe20b6ff851cb = getsharedfunc("veh9_techo_rebel_armor", "armorDeathFeedback");
    }
    if (isdefined(var_f18669893e89dd0) || isdefined(var_44efe20b6ff851cb)) {
        foreach (var_151b23f6c7d09cf8, data in function_870cbf6ca47076b6("veh9_techo_rebel_armor")) {
            if (issubstr(var_151b23f6c7d09cf8, "tag_armor")) {
                function_bc320cf9a1b27cb5("veh9_techo_rebel_armor", var_151b23f6c7d09cf8, var_44efe20b6ff851cb, var_f18669893e89dd0);
            }
        }
    }
}

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37b
// Size: 0x5c
function private function_c1b385596f29457e(spawndata, var_ee8da5624236dc89) {
    vehicle = function_bba34cf920370ff4("veh9_techo_rebel_armor", spawndata, var_ee8da5624236dc89);
    if (issharedfuncdefined("veh9_techo_rebel_armor", "armorDamageMitigation")) {
        vehicle.var_7a646ff827387ac0 = getsharedfunc("veh9_techo_rebel_armor", "armorDamageMitigation");
    }
    return vehicle;
}

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3df
// Size: 0x2cf
function private function_96939d4c4815b891(partname, meansofdeath, damagelocation, objweapon) {
    if (isdefined(partname) && partname != "tag_origin" && partname != "" && partname != "none") {
        return 1;
    } else if (isexplosivedamagemod(meansofdeath)) {
        dir = vectornormalize((damagelocation - self.origin) * (1, 1, 0));
        fwd = anglestoright(self.angles);
        dot = vectordot(dir, fwd);
        pos = [];
        if (dot > 0) {
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_15");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_12");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_07");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_14");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_08");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_17");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
        } else if (dot < 0) {
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_05");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_11");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_19");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_18");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_13");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
            var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_16");
            if (isdefined(var_b6919fdd59526f63)) {
                pos[pos.size] = var_b6919fdd59526f63;
            }
        }
        var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_01");
        if (isdefined(var_b6919fdd59526f63)) {
            pos[pos.size] = var_b6919fdd59526f63;
        }
        var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_02");
        if (isdefined(var_b6919fdd59526f63)) {
            pos[pos.size] = var_b6919fdd59526f63;
        }
        var_b6919fdd59526f63 = function_8a52a8aab7e2b441("tag_armor_06");
        if (isdefined(var_b6919fdd59526f63)) {
            pos[pos.size] = var_b6919fdd59526f63;
        }
        var_f60270b9450be387 = get_array_of_closest(damagelocation, pos, undefined, undefined, 250, 0);
        if (var_f60270b9450be387.size) {
            if (distancesquared(damagelocation, var_f60270b9450be387[0].origin) < 10000) {
                if (isdefined(self.var_aab9695c92b0ed96) && isdefined(self.var_aab9695c92b0ed96[var_f60270b9450be387[0].tagname]) && self.var_aab9695c92b0ed96[var_f60270b9450be387[0].tagname].var_a776f097eb36e500 < 1) {
                    return 0;
                }
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_2a0940ff51ea0cff/namespace_405c71940c7ec9ea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0x49
function private function_8a52a8aab7e2b441(tagname) {
    if (self tagexists(tagname)) {
        info = spawnstruct();
        info.origin = self gettagorigin(tagname);
        info.tagname = tagname;
        return info;
    }
    return undefined;
}

