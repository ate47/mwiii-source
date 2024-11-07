#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace warrior_turrettime;

// Namespace warrior_turrettime / namespace_77e23975771add92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0x28
function function_f1e15d6ce495e904() {
    thread onplayerspawned();
    setdvar(@"hash_b9422777c9947030", 1);
    thread function_492b4dec632917ec("warrior_turrettime");
}

// Namespace warrior_turrettime / namespace_77e23975771add92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x195
// Size: 0x66
function function_6e36432069ac5ccc() {
    setdvar(@"hash_b9422777c9947030", 0);
    foreach (player in level.players) {
        player scripts\mp\killstreaks\killstreaks::clearkillstreaks();
    }
}

// Namespace warrior_turrettime / namespace_77e23975771add92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x203
// Size: 0x7b
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        level waittill("player_spawned", player);
        player takeallweapons();
        var_d5bbd9c34e6334c5 = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_jp22_la_dromeo_mp");
        player giveweapon(var_d5bbd9c34e6334c5);
        player setspawnweapon(var_d5bbd9c34e6334c5);
        player.primaryweaponobj = var_d5bbd9c34e6334c5;
        player scripts\mp\killstreaks\killstreaks::awardkillstreak("remote_turret");
        player thread function_3464ff6a11549a11();
    }
}

// Namespace warrior_turrettime / namespace_77e23975771add92
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286
// Size: 0x44
function function_3464ff6a11549a11() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        self waittill("remote_turret_active");
        self.placedsentries["remote_turret"][0] waittill("remote_turret_death");
        scripts\mp\killstreaks\killstreaks::awardkillstreak("remote_turret");
    }
}
