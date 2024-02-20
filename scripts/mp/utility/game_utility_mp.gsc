// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_777f15a00eb29dd4;

// Namespace namespace_777f15a00eb29dd4/namespace_de5151d68164781a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde
// Size: 0x19
function game_utility_mp_init() {
    registersharedfunc("game_utility", "getTimeSinceGameStart", &game_utility_mp_gettimesincegamestart);
}

// Namespace namespace_777f15a00eb29dd4/namespace_de5151d68164781a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe
// Size: 0xe
function game_utility_mp_gettimesincegamestart() {
    return namespace_eb72aa155b5e14e7::gettimefrommatchstart(gettime());
}

// Namespace namespace_777f15a00eb29dd4/namespace_de5151d68164781a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114
// Size: 0x77
function function_9a2fd0d19774edde() {
    switch (namespace_cd0b2d039510b38d::getgametype()) {
    case #"hash_1e4846dca3ccf38":
    case #"hash_ca6516c10db2c95":
    case #"hash_5e78ea9021845d4a":
    case #"hash_7f9c384a34cc392f":
    case #"hash_9a6f07d0214a87db":
    case #"hash_c065cef60f38490a":
    case #"hash_c7f4420f385eeb3d":
        return 1;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_777f15a00eb29dd4/namespace_de5151d68164781a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0x90
function modeusesgroundwarteamoobtriggers(trigger) {
    if (isdefined(trigger.script_team)) {
        switch (namespace_cd0b2d039510b38d::getgametype()) {
        case #"hash_1e4846dca3ccf38":
        case #"hash_ca6516c10db2c95":
        case #"hash_5e78ea9021845d4a":
        case #"hash_7f9c384a34cc392f":
        case #"hash_9a6f07d0214a87db":
        case #"hash_c065cef60f38490a":
        case #"hash_c7f4420f385eeb3d":
            return 1;
        default:
            return 0;
            break;
        }
    }
    return 1;
}
