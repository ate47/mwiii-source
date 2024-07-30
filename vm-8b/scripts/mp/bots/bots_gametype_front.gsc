#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace bots_gametype_front;

// Namespace bots_gametype_front / scripts\mp\bots\bots_gametype_front
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe9
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_front();
}

/#

    // Namespace bots_gametype_front / scripts\mp\bots\bots_gametype_front
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x101
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_front / scripts\mp\bots\bots_gametype_front
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_front_think;
}

// Namespace bots_gametype_front / scripts\mp\bots\bots_gametype_front
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x2
function setup_bot_front() {
    
}

// Namespace bots_gametype_front / scripts\mp\bots\bots_gametype_front
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x57
function bot_front_think() {
    self notify("bot_front_think");
    self endon("bot_front_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait 0.05;
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}

