#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\rat.gsc;
#using script_7ef95bba57dc4b82;

#namespace rat_mp;

// Namespace rat_mp / scripts\mp\rat_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x5f
function init() {
    level.var_6392befa93ae3cc6 = undefined;
    level.var_91ca776f27d516c0 = undefined;
    scripts\common\rat::init();
    scripts\common\rat::function_7a2df9055cb22721("RatGetPlayerTeam", &RatGetPlayerTeam, "string");
    scripts\common\rat::function_7a2df9055cb22721("RatGetTeamCount", &RatGetTeamCount, "int64_t");
    scripts\common\rat::function_7a2df9055cb22721("RatGetPlayerEquipment", &RatGetPlayerEquipment, "string");
}

// Namespace rat_mp / scripts\mp\rat_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7
// Size: 0x29
function RatGetPlayerTeam(params) {
    player = scripts\common\rat::getplayer(params);
    return player.team;
}

// Namespace rat_mp / scripts\mp\rat_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9
// Size: 0x7d
function RatGetTeamCount(params) {
    target_team = default_to(params.team, "player");
    player_team = RatGetPlayerTeam(params);
    if (target_team == "player") {
        target_team = player_team;
    }
    if (target_team == "enemy") {
        if (player_team == "axis") {
            target_team = "allies";
        } else {
            target_team = "axis";
        }
    }
    return getteamdata(target_team, "players").size;
}

// Namespace rat_mp / scripts\mp\rat_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0x51
function RatGetPlayerEquipment(params) {
    target_slot = default_to(params.slot, "primary");
    player = scripts\common\rat::getplayer(params);
    equip = player namespace_4fb9dddfb8c1a67a::getcurrentequipment(target_slot);
    return equip;
}

