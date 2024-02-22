// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_608c50392df8c7d1;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\gamescore.gsc;
#using script_74b851b7aa1ef32d;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace emp_grenade;

// Namespace emp_grenade/namespace_42677e50338056c6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x282
function emp_grenade_used(grenade) {
    self endon("disconnect");
    grenade endon("explode_end");
    grenade thread notifyafterframeend("death", "explode_end");
    if (!isdefined(level.var_ab6f6c9d4337fc0c)) {
        ref = function_7f245729fcb6414d(grenade.weapon_name);
        grenade.var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        bundle = grenade.var_8bf83d28be4c2d4f.bundle;
        damageradius = getgrenadedamageradius("t10_emp_grenade_mp");
        level.var_ab6f6c9d4337fc0c = spawnstruct();
        level.var_ab6f6c9d4337fc0c.var_fb20e79efa369047 = damageradius;
        level.var_ab6f6c9d4337fc0c.var_41621f8c94cfd912 = bundle.var_aff232b5f0f11c3e;
        level.var_ab6f6c9d4337fc0c.var_909c6082a847d955 = bundle.var_d0a989cb2841fa49;
    }
    position = grenade waittill("explode");
    ents = empdebuff_get_emp_ents(position, level.var_ab6f6c9d4337fc0c.var_fb20e79efa369047);
    objweapon = makeweapon("t10_emp_grenade_mp");
    foreach (ent in ents) {
        entowner = ent.owner;
        if (isdefined(entowner)) {
            jumpiftrue(playersareenemies(self, entowner)) LOC_000001da;
        } else {
        LOC_000001da:
            data = packdamagedata(self, ent, 1, objweapon, "MOD_EXPLOSIVE", grenade, position);
            thread function_9be39ebfae2ac6be(data);
        }
    }
    players = getplayersinradius(position, level.var_ab6f6c9d4337fc0c.var_fb20e79efa369047);
    foreach (player in players) {
        if (!player can_be_empd()) {
            continue;
        }
        data = packdamagedata(self, player, 1, objweapon, "MOD_EXPLOSIVE", grenade, position);
        thread _emp_grenade_apply_player(data);
    }
}

// Namespace emp_grenade/namespace_42677e50338056c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3db
// Size: 0x77
function private function_9be39ebfae2ac6be(data) {
    if (data.attacker != data.victim) {
        doonactionscoreevent(0, "emp_grenade");
    }
    apply_emp_struct(data);
    _emp_grenade_end_early(data, level.var_ab6f6c9d4337fc0c.var_41621f8c94cfd912);
    if (isdefined(data.victim)) {
        data.victim remove_emp();
    }
}

// Namespace emp_grenade/namespace_42677e50338056c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x459
// Size: 0x158
function private _emp_grenade_apply_player(data) {
    if (data.attacker != data.victim) {
        doonactionscoreevent(0, "emp_grenade");
    }
    apply_emp_struct(data);
    trackdebuffassist(data.attacker, data.victim, data.objweapon.basename);
    data.victim namespace_5a51aa78ea0b1b9f::play_emp_scramble(5);
    data.victim _shellshock("emp", "stun", level.var_ab6f6c9d4337fc0c.var_909c6082a847d955, 1);
    _emp_grenade_end_early(data, level.var_ab6f6c9d4337fc0c.var_909c6082a847d955);
    if (isdefined(data.victim)) {
        data.victim remove_emp();
        data.victim namespace_5a51aa78ea0b1b9f::stop_emp_scramble(5);
        if (isdefined(data.attacker) && isreallyalive(data.attacker)) {
            untrackdebuffassist(data.attacker, data.victim, data.objweapon.basename);
        }
    }
}

// Namespace emp_grenade/namespace_42677e50338056c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b8
// Size: 0x2e
function private _emp_grenade_end_early(data, duration) {
    data.victim endon("death_or_disconnect");
    level endon("game_ended");
    wait(duration);
}

