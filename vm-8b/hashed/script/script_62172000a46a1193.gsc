#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_10ad6174c8938599;

#namespace namespace_d43d1f9fd65a2d2c;

// Namespace namespace_d43d1f9fd65a2d2c / namespace_c6f145eb7c1cd71f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x138
// Size: 0x29
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("cluster_spike", &namespace_39febbb7a6990e45::function_4d4dfa5c57455df0);
    scripts\engine\utility::registersharedfunc("cluster_spike", "attachXRays", &function_d0f5e3c6e6080d5d);
}

// Namespace namespace_d43d1f9fd65a2d2c / namespace_c6f145eb7c1cd71f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169
// Size: 0x20
function function_d0f5e3c6e6080d5d(clusterspike) {
    clusterspike function_5226227bce83ebe9(3, clusterspike.team);
    return clusterspike;
}

