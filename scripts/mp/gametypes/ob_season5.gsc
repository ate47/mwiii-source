#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace ob_season5;

// Namespace ob_season5 / scripts\mp\gametypes\ob_season5
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xb2
// Size: 0x14
function autoexec init() {
    level callback::add("ob_season_main", &main);
}

// Namespace ob_season5 / scripts\mp\gametypes\ob_season5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xce
// Size: 0x1d
function main(params) {
    level callback::remove("ob_season_main", &main);
}
