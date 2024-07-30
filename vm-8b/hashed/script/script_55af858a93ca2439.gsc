#using scripts\mp\utility\game.gsc;
#using script_38b3797023002a4a;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_7ef95bba57dc4b82;

#namespace warrior_fragged;

// Namespace warrior_fragged / namespace_36f22ae5d548509b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x17
function function_46e09220a05bae5f() {
    thread onplayerspawned();
    thread function_492b4dec632917ec("warrior_fragged");
}

// Namespace warrior_fragged / namespace_36f22ae5d548509b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17f
// Size: 0x9d
function onplayerspawned() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        player = level waittill("player_spawned");
        player takeallweapons();
        riotshieldweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("iw9_me_riotshield_mp");
        player giveweapon(riotshieldweapon);
        player setspawnweapon(riotshieldweapon);
        player namespace_4fb9dddfb8c1a67a::giveequipment("equip_frag", "primary");
        if (player _hasperk("specialty_eod_vest")) {
            player.var_1c4d4c562c1d1866 = 1;
            player removeperk("specialty_eod_vest");
        }
        player thread waittill_grenade_fire();
    }
}

// Namespace warrior_fragged / namespace_36f22ae5d548509b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0x31
function waittill_grenade_fire() {
    level endon("game_ended");
    level endon("round_end_finished");
    while (true) {
        self waittill("grenade_fire");
        namespace_4fb9dddfb8c1a67a::giveequipment("equip_frag", "primary");
    }
}

// Namespace warrior_fragged / namespace_36f22ae5d548509b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x6a
function function_afa6a2ae298ee59f() {
    foreach (player in level.players) {
        if (istrue(player.var_1c4d4c562c1d1866)) {
            player giveperk("specialty_eod_vest");
        }
    }
}

