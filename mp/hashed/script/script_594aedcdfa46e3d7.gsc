#using script_509a782dd5b89cf1;
#using scripts\common\utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\utility\killstreak;

#namespace namespace_4661781de8850ae4;

// Namespace namespace_4661781de8850ae4 / namespace_9e7b04da80a97ce9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd
// Size: 0x13
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("uav_bigmap", &namespace_2c99f682179581bf::function_e5931b9f76ed6cda);
}

