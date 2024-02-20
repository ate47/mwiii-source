// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_cb2647d669c19c63;

// Namespace namespace_cb2647d669c19c63/namespace_bb7293bd9457c4fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_war();
}

// Namespace namespace_cb2647d669c19c63/namespace_bb7293bd9457c4fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_cb2647d669c19c63/namespace_bb7293bd9457c4fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_war_think;
}

// Namespace namespace_cb2647d669c19c63/namespace_bb7293bd9457c4fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100
// Size: 0x3
function setup_bot_war() {
    
}

// Namespace namespace_cb2647d669c19c63/namespace_bb7293bd9457c4fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10a
// Size: 0x58
function bot_war_think() {
    self notify("bot_war_think");
    self endon("bot_war_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        self [[ self.personality_update_function ]]();
        wait(0.05);
    }
}
