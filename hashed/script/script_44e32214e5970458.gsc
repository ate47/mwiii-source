// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\points.gsc;
#using script_6a977a0edf312405;

#namespace namespace_ed1cfb3c9d4fe39f;

// Namespace namespace_ed1cfb3c9d4fe39f/namespace_e9cc5762e80bb016
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8
// Size: 0x36
function init() {
    namespace_3c37cb17ade254d::registersharedfunc("fogofwar", "isPlayerInGulag", &namespace_d3d40f75bb4e4c32::isplayeringulag);
    namespace_3c37cb17ade254d::registersharedfunc("fogofwar", "giveXPWithText", &namespace_48a08c5037514e04::givexpwithtext);
    namespace_896381a08e76178f::init();
}
