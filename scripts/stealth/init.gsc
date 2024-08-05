#using scripts\stealth\manager.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\player.gsc;

#namespace init;

// Namespace init / scripts\stealth\init
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x9
function main() {
    scripts\stealth\manager::main();
}

// Namespace init / scripts\stealth\init
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x99
// Size: 0xda
function set_stealth_mode(enabled, musichidden, musicspotted) {
    if (enabled) {
        if (isdefined(musichidden) && isdefined(musicspotted)) {
            level thread scripts\stealth\utility::stealth_music(musichidden, musicspotted);
        }
        level thread scripts\stealth\threat_sight::threat_sight_set_enabled(1);
        foreach (player in level.players) {
            player thread scripts\stealth\player::main();
        }
    } else {
        level thread scripts\stealth\utility::stealth_music_stop();
        level thread scripts\stealth\threat_sight::threat_sight_set_enabled(0);
    }
    if (isdefined(level.stealth.fnsetstealthmode)) {
        level thread [[ level.stealth.fnsetstealthmode ]](enabled, musichidden, musicspotted);
    }
}

