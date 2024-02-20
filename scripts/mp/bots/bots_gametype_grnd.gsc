// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;

#namespace namespace_345c03315f647a48;

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_grnd();
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x105
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_grnd_think;
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131
// Size: 0x22
function setup_bot_grnd() {
    bot_waittill_bots_enabled(1);
    level.protect_radius = 128;
    level.bot_gametype_precaching_done = 1;
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a
// Size: 0xde
function bot_grnd_think() {
    self notify("bot_grnd_think");
    self endon("bot_grnd_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botclearscriptgoal();
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    thread clear_defend();
    while (1) {
        wait(0.05);
        if (bot_has_tactical_goal()) {
            continue;
        }
        if (!self bothasscriptgoal()) {
            position = getnodeinzone();
            if (isdefined(position)) {
                self botsetscriptgoal(position.origin, 0, "objective");
            }
        } else if (!bot_is_defending()) {
            self botclearscriptgoal();
            position = getnodeinzone();
            if (isdefined(position)) {
                bot_protect_point(position.origin, level.protect_radius);
            }
        }
    }
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x23
function clear_defend() {
    while (1) {
        level waittill("zone_reset");
        if (bot_is_defending()) {
            bot_defend_stop();
        }
    }
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x269
// Size: 0x57
function getnodeinzone() {
    nodes = getnodesintrigger(level.zone.trigger);
    if (nodes.size == 0 || !isdefined(nodes)) {
        return undefined;
    }
    var_caac702d63510a96 = randomintrange(0, nodes.size);
    position = nodes[var_caac702d63510a96];
    return position;
}

// Namespace namespace_345c03315f647a48/namespace_27f6f09425d5aa60
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x3
function temp() {
    
}
