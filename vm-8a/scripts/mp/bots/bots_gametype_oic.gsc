#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\bots\bots_util.gsc;

#namespace bots_gametype_oic;

// Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d
// Size: 0x10
function main() {
    setup_callbacks();
    function_48b5faf91fc74726();
}

/#

    // Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x125
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_gun_think;
}

// Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x151
// Size: 0xd
function function_48b5faf91fc74726() {
    level.bots_gametype_handles_class_choice = 1;
}

// Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x166
// Size: 0x7e
function function_81ff256686f12d6d(weaponname, preferredpersonality) {
    if (isdefined(weaponname) && weaponname != "none") {
        var_6f94db6d48b3fd6d = namespace_e0ee43ef2dddadaa::function_309bcc0c19de2d18(weaponname);
        if (isdefined(var_6f94db6d48b3fd6d) && var_6f94db6d48b3fd6d.size > 0) {
            choice = undefined;
            if (scripts\engine\utility::array_contains(var_6f94db6d48b3fd6d, preferredpersonality)) {
                choice = preferredpersonality;
            } else {
                choice = random(var_6f94db6d48b3fd6d);
            }
            if (self.personality != choice) {
                scripts\mp\bots\bots_util::bot_set_personality(choice);
            }
        }
    }
}

// Namespace bots_gametype_oic / scripts\mp\bots\bots_gametype_oic
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec
// Size: 0x116
function bot_gun_think() {
    self notify("bot_gun_think");
    self endon("bot_gun_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    last_weapon_name = "";
    original_personality = self.personality;
    wait 0.1;
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait 0.05;
                continue;
            }
        #/
        current_weapon = self getcurrentweapon();
        if (current_weapon.basename != "none" && !iskillstreakweapon(current_weapon) && current_weapon.basename != last_weapon_name && current_weapon.basename != "iw9_knifestab_mp") {
            last_weapon_name = current_weapon.basename;
            if (self botgetdifficultysetting("advancedPersonality") && self botgetdifficultysetting("strategyLevel") > 0) {
                function_81ff256686f12d6d(current_weapon.basename, original_personality);
            }
        }
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}
