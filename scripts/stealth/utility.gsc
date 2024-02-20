// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\stealth\manager.gsc;
#using scripts\stealth\init.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\stealth\friendly.gsc;
#using scripts\stealth\neutral.gsc;
#using scripts\anim\utility_common.gsc;

#namespace utility;

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x335
// Size: 0x5a
function get_group(name) {
    if (!isdefined(level.stealth.groupdata.groups[name])) {
        return undefined;
    }
    return level.stealth.groupdata.groups[name].members;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x397
// Size: 0xe8
function group_flag_clear(f, group) {
    name = get_group_flagname(f, group);
    flag_clear(name);
    array = level.stealth.group.flags[f];
    clear = 1;
    foreach (value in array) {
        if (!issubstr(value, "allies") && flag(value)) {
            return;
        }
    }
    if (flag(name) && self != level) {
        self notify(f);
    }
    flag_clear(f);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x486
// Size: 0x58
function group_flag_set(f) {
    /#
        assertex(issentient(self), "an AI must call this function");
    #/
    name = get_group_flagname(f);
    if (!flag(name) && self != level) {
        self notify(f);
    }
    flag_set(name);
    flag_set(f);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e5
// Size: 0x39
function group_flag(f) {
    /#
        assertex(issentient(self), "an AI must call this function");
    #/
    name = get_group_flagname(f);
    return flag(name);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x526
// Size: 0x4d
function get_group_flagname(f, group) {
    if (!isdefined(group)) {
        /#
            assertex(issentient(self), "an AI must call this function");
        #/
        group = self.script_stealthgroup;
    }
    name = f + "-Group:" + group;
    return name;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0x26
function group_flag_wait(f) {
    name = get_group_flagname(f);
    flag_wait(name);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a8
// Size: 0x26
function group_flag_waitopen(f) {
    name = get_group_flagname(f);
    flag_waitopen(name);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d5
// Size: 0x2f
function group_flag_wait_or_timeout(f, timer) {
    name = get_group_flagname(f);
    flag_wait_or_timeout(name, timer);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x2f
function group_flag_waitopen_or_timeout(f, timer) {
    name = get_group_flagname(f);
    flag_waitopen_or_timeout(name, timer);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x641
// Size: 0x147
function group_flag_init(f) {
    /#
        assertex(issentient(self), "an AI must call this function");
    #/
    if (isdefined(self.script_stealthgroup)) {
        self.script_stealthgroup = string(self.script_stealthgroup);
    } else {
        self.script_stealthgroup = "default";
    }
    if (!ismp() && self.team == "allies") {
        self.script_stealthgroup = self.script_stealthgroup + "allies";
    }
    if (!flag_exist(f)) {
        flag_init(f);
    }
    name = get_group_flagname(f);
    if (!flag_exist(name)) {
        flag_init(name);
        if (!isdefined(level.stealth.group.flags[f])) {
            level.stealth.group.flags[f] = [];
        }
        level.stealth.group.flags[f][level.stealth.group.flags[f].size] = name;
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78f
// Size: 0x6a
function group_setcombatgoalradius(group, goalradius) {
    /#
        assert(isdefined(level.stealth));
    #/
    if (!isdefined(level.stealth.combat_goalradius)) {
        level.stealth.combat_goalradius = [];
    }
    level.stealth.combat_goalradius[group] = goalradius;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x800
// Size: 0xdb
function group_add() {
    /#
        assertex(issentient(self), "an AI must call this function");
    #/
    if (!isdefined(level.stealth.group.groups[self.script_stealthgroup])) {
        level.stealth.group.groups[self.script_stealthgroup] = [];
        level.stealth.group notify(self.script_stealthgroup);
    }
    level.stealth.group.groups[self.script_stealthgroup][level.stealth.group.groups[self.script_stealthgroup].size] = self;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x46
function group_spotted_flag() {
    if (!ismp()) {
        /#
            assert(self.team != "axis", "group flag no longer supported on enemy teams.");
        #/
    }
    name = get_group_flagname("stealth_spotted");
    return flag(name);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x930
// Size: 0x18
function any_groups_in_combat() {
    if (!flag("stealth_enabled")) {
        return 0;
    }
    return function_1bb1470f934a81eb();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x950
// Size: 0x25
function check_stealth() {
    /#
        assertex(isdefined(self.stealth), "stealth is not enabled on this AI at location: " + self.origin);
    #/
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97c
// Size: 0x40
function set_detect_ranges(hidden, spotted, var_8f3f480583606401) {
    if (!isdefined(hidden) && !isdefined(spotted)) {
        /#
            assertmsg("Please define at least one array!");
        #/
    }
    namespace_833595e973766257::set_detect_ranges_internal(hidden, spotted, var_8f3f480583606401);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3
// Size: 0xc2
function set_min_detect_range_darkness(hidden, spotted) {
    if (!isdefined(hidden) && !isdefined(spotted)) {
        /#
            assertmsg("Please define at least one value!");
        #/
    }
    if (isdefined(hidden)) {
        function_f53f47c5e7e21548("hidden", "prone", hidden["prone"]);
        function_f53f47c5e7e21548("hidden", "crouch", hidden["crouch"]);
        function_f53f47c5e7e21548("hidden", "stand", hidden["stand"]);
    }
    if (isdefined(spotted)) {
        function_f53f47c5e7e21548("spotted", "prone", spotted["prone"]);
        function_f53f47c5e7e21548("spotted", "crouch", spotted["crouch"]);
        function_f53f47c5e7e21548("spotted", "stand", spotted["stand"]);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8c
// Size: 0xc2
function function_f3883fe06a11269(hidden, spotted) {
    if (!isdefined(hidden) && !isdefined(spotted)) {
        /#
            assertmsg("Please define at least one value!");
        #/
    }
    if (isdefined(hidden)) {
        function_9c8f4ad66661c757("hidden", "prone", hidden["prone"]);
        function_9c8f4ad66661c757("hidden", "crouch", hidden["crouch"]);
        function_9c8f4ad66661c757("hidden", "stand", hidden["stand"]);
    }
    if (isdefined(spotted)) {
        function_9c8f4ad66661c757("spotted", "prone", spotted["prone"]);
        function_9c8f4ad66661c757("spotted", "crouch", spotted["crouch"]);
        function_9c8f4ad66661c757("spotted", "stand", spotted["stand"]);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb55
// Size: 0x85
function do_stealth() {
    if (!isdefined(level.player.stealth)) {
        namespace_12a61a913ca6f43a::set_stealth_mode(1);
    }
    switch (self.team) {
    case #"hash_24b14065e10b1f8d":
    case #"hash_7c2d091e6337bf54":
        thread namespace_6db9b2dcda758664::main();
        break;
    case #"hash_5f54b9bf7583687f":
        thread namespace_d611598f63dea5a7::main();
        break;
    case #"hash_a571cacc018623b8":
        thread namespace_aa303642163f52a7::main();
        break;
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe1
// Size: 0x10f
function save_last_goal() {
    if (isdefined(self.stealth.last_goal)) {
        return;
    }
    self.saved_script_forcegoal = self.script_forcegoal;
    if (isdefined(self.patharray)) {
        if (self.patharrayindex == self.patharray.size - 1) {
            index = self.patharrayindex;
        } else {
            index = self.patharrayindex + 1;
        }
        self.stealth.last_goal = self.patharray[index];
        self.stealth.var_7fc1729e33311de3 = self.var_a2bac30a03260051;
    } else if (isdefined(self.last_set_goalnode)) {
        self.stealth.last_goal = self.last_set_goalnode;
    } else if (isdefined(self.last_set_goalent)) {
        self.stealth.last_goal = self.last_set_goalent;
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf7
// Size: 0x1a
function set_patrol_move_loop_anim(animoverride) {
    /#
        assertmsg("really?  not currently supported.");
    #/
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd18
// Size: 0x52
function set_patrol_style(style, allowreact, var_cd4ca207cec1b1d3, magnitude) {
    switch (style) {
    case #"hash_186d745a92c317d9":
        self.var_e31ee88092e41cc8 = 1;
        break;
    }
    self function_d00232775a05290e(style, allowreact, var_cd4ca207cec1b1d3, magnitude);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd71
// Size: 0x1c
function get_patrol_style() {
    /#
        assert(isdefined(self.stealth));
    #/
    return asm_getdemeanor();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd95
// Size: 0x1d
function set_patrol_react(position, magnitude) {
    self function_68f50ada6e19d8f4(position, magnitude);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb9
// Size: 0xb1
function function_783cf2a7aaab23c() {
    if (isdefined(self.fnstealthgotonode) && isdefined(self.stealth.last_goal)) {
        if (isdefined(self.saved_script_forcegoal)) {
            self.script_forcegoal = self.saved_script_forcegoal;
        }
        self thread [[ self.fnstealthgotonode ]](self.stealth.last_goal, undefined, undefined, self.stealth.var_7fc1729e33311de3);
        self.saved_script_forcegoal = undefined;
        self.stealth.last_goal = undefined;
        self.stealth.var_7fc1729e33311de3 = undefined;
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe72
// Size: 0x33
function set_path_dist(ent) {
    ent.distsqrd = get_path_dist_sq(self.origin, ent.origin, self);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeac
// Size: 0x7a
function get_path_dist_sq(from, to, var_320b468dc1d97042) {
    path = self findpath(from, to);
    if (isdefined(var_320b468dc1d97042)) {
        var_320b468dc1d97042.path = path;
    }
    distsq = 0;
    for (i = 1; i < path.size; i++) {
        distsq = distsq + distancesquared(path[i - 1], path[i]);
    }
    return distsq;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0x17
function remove_path_dist() {
    self.path = undefined;
    self.distsqrd = undefined;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4c
// Size: 0xae
function is_visible(other) {
    if (isplayer(self)) {
        if (within_fov(self.origin, self.angles, other.origin, 0.766)) {
            if (isdefined(other.tagging_visible) || tagging_shield()) {
                return 1;
            }
            if (namespace_7843e1029b5c80e::player_can_see_ai(self, other, 250)) {
                return 1;
            }
        }
    } else if (isdefined(other.team) && self.team == other.team) {
        return self cansee(other, 300);
    } else {
        return self cansee(other);
    }
    return 0;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1002
// Size: 0x3c
function tagging_shield() {
    return isdefined(self.offhandshield) && isdefined(self.offhandshield.active) && self.offhandshield.active;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1046
// Size: 0x48
function setbattlechatter(state) {
    if (isdefined(level.stealth) && isdefined(level.stealth.fnsetbattlechatter)) {
        return [[ level.stealth.fnsetbattlechatter ]](state);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1095
// Size: 0x75
function addeventplaybcs(eventaction, eventtype, modifier, delay, eventstruct, force) {
    if (isdefined(level.stealth) && isdefined(level.stealth.fnaddeventplaybcs)) {
        return [[ level.stealth.fnaddeventplaybcs ]](eventaction, eventtype, modifier, delay, eventstruct, force);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1111
// Size: 0x75
function animgenericcustomanimmode(guy, var_9481a070a25eb0bd, anime, tag, var_49500266747f0f18, var_212b748f7df888b0) {
    if (isdefined(level.stealth) && isdefined(level.stealth.fnanimgenericcustomanimmode)) {
        return [[ level.stealth.fnanimgenericcustomanimmode ]](guy, var_9481a070a25eb0bd, anime, tag, var_49500266747f0f18, var_212b748f7df888b0);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118d
// Size: 0x123
function stealth_music(var_bd2621a5f467fe6c, var_a1f4d479a8c138cd) {
    self notify("stealth_music");
    self endon("stealth_music");
    thread stealth_music_pause_monitor();
    while (1) {
        flag_wait("stealth_enabled");
        flag_waitopen("stealth_spotted");
        flag_waitopen("stealth_music_pause");
        function_f81d9864f1fc95a6();
        foreach (player in level.players) {
            player thread stealth_music_transition(var_bd2621a5f467fe6c);
        }
        flag_wait("stealth_spotted");
        flag_waitopen("stealth_music_pause");
        function_4efc63abff5f42d3();
        foreach (player in level.players) {
            player thread stealth_music_transition(var_a1f4d479a8c138cd);
        }
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b7
// Size: 0x3e
function function_4efc63abff5f42d3() {
    if (isdefined(level.var_667495cce3974c46)) {
        wait(level.var_667495cce3974c46);
    }
    if (getdvarint(@"hash_5cf56ca298c06c21", 0) != 0) {
        wait(getdvarint(@"hash_5cf56ca298c06c21", 0));
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fc
// Size: 0x3e
function function_f81d9864f1fc95a6() {
    if (isdefined(level.var_e588ee33138024c3)) {
        wait(level.var_e588ee33138024c3);
    }
    if (getdvarint(@"hash_9a92f5b582657d72", 0) != 0) {
        wait(getdvarint(@"hash_9a92f5b582657d72", 0));
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1341
// Size: 0x6a
function stealth_music_stop() {
    self notify("stealth_music");
    self notify("stealth_music_pause_monitor");
    foreach (player in level.players) {
        player thread stealth_music_transition(undefined);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b2
// Size: 0x14c
function stealth_music_pause_monitor(var_bd2621a5f467fe6c, var_a1f4d479a8c138cd) {
    self notify("stealth_music_pause_monitor");
    self endon("stealth_music_pause_monitor");
    while (1) {
        flag_wait("stealth_music_pause");
        foreach (player in level.players) {
            player thread stealth_music_transition(undefined);
        }
        flag_waitopen("stealth_music_pause");
        if (flag("stealth_spotted")) {
            foreach (player in level.players) {
                player thread stealth_music_transition(var_a1f4d479a8c138cd);
            }
        } else {
            foreach (player in level.players) {
                player thread stealth_music_transition(var_bd2621a5f467fe6c);
            }
        }
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1505
// Size: 0x26
function stealth_music_transition(var_a675f64a80383d1e) {
    if (isdefined(self.fnstealthmusictransition)) {
        return [[ self.fnstealthmusictransition ]](var_a675f64a80383d1e);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1532
// Size: 0x1c
function update_light_meter() {
    if (isdefined(self.fnupdatelightmeter)) {
        return [[ self.fnupdatelightmeter ]]();
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1555
// Size: 0x124
function enable_stealth_for_ai(enabled) {
    if (!enabled) {
        self.maxvisibledist = 8192;
        if (ent_flag_exist("stealth_enabled") && ent_flag("stealth_enabled") && self.team == "axis") {
            var_5ef1b5d63a8d28bd = spawnstruct();
            var_5ef1b5d63a8d28bd.origin = level.player.origin;
            var_5ef1b5d63a8d28bd.investigate_point = level.player.origin;
            var_5ef1b5d63a8d28bd.investigate_pos = level.player.origin;
            var_5ef1b5d63a8d28bd.type = "combat";
            var_5ef1b5d63a8d28bd.typeorig = "attack";
            self.dontevershoot = 0;
            self.dontattackme = 0;
            namespace_6db9b2dcda758664::bt_event_combat(var_5ef1b5d63a8d28bd);
        }
    }
    if (ent_flag_exist("stealth_enabled")) {
        if (enabled) {
            ent_flag_set("stealth_enabled");
        } else {
            ent_flag_clear("stealth_enabled");
        }
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1680
// Size: 0x69
function custom_state_functions(array) {
    /#
        assertex(!isdefined(self.stealth), "Stealth system is already active, your custom stealth state functions are not going to be called.");
    #/
    if (isdefined(array["spotted"])) {
        self.stealth_state_func["spotted"] = array["spotted"];
    }
    if (isdefined(array["hidden"])) {
        self.stealth_state_func["hidden"] = array["hidden"];
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f0
// Size: 0x3d
function set_stealth_func(type, func) {
    self.stealth.funcs[type] = func;
    if (isai(self)) {
        self function_a29879bf1276a08a(type, func);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1734
// Size: 0x5c
function set_event_override(eventtype, var_483f43f9665ef7b3) {
    if (isdefined(eventtype) && isdefined(self.stealth) && isdefined(self.stealth.funcs)) {
        self.stealth.funcs["event_" + eventtype] = var_483f43f9665ef7b3;
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1797
// Size: 0x3b
function bcisincombat() {
    self endon("death");
    if (isdefined(self.fnisinstealthcombat) && self [[ self.fnisinstealthcombat ]]()) {
        return 1;
    }
    if (!isdefined(self.stealth)) {
        return 1;
    }
    return 0;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17da
// Size: 0x5
function _autosave_stealthcheck() {
    return 1;
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e7
// Size: 0x31
function get_player_drone() {
    if (isdefined(level.stealth.fngetplayerdrone)) {
        return [[ level.stealth.fngetplayerdrone ]](self);
    }
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181f
// Size: 0x1e
function function_3ee5d99169f2293f() {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthidle ]]();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1845
// Size: 0x1e
function function_c9f8c83eb3de1b32() {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthinvestigate ]]();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x1e
function function_cdca96a984fdb85() {
    if (!isdefined(self.stealth)) {
        return 0;
    }
    return self [[ self.fnisinstealthhunt ]]();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1891
// Size: 0x1f
function function_6a86dd83c01f8faa() {
    if (!isdefined(self.stealth)) {
        return 1;
    }
    return self [[ self.fnisinstealthcombat ]]();
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18b8
// Size: 0x31
function function_c14048638b343b7f(state, event) {
    if (!isdefined(self.stealth)) {
        return;
    }
    self [[ self.fnsetstealthstate ]](state, event);
}

// Namespace utility/namespace_e124d8b75dab4be0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18f0
// Size: 0xbb
function function_6516755416a6584b(var_8e88d47ec56eea22, severity) {
    var_a1d4ca153ffbb0cf = 0;
    if (!isdefined(severity)) {
        severity = [0:"all"];
        var_a1d4ca153ffbb0cf = 1;
    }
    if (!isarray(severity)) {
        severity = [0:severity];
    }
    if (!var_a1d4ca153ffbb0cf) {
        var_a1d4ca153ffbb0cf = array_contains(severity, "all");
    }
    if (var_a1d4ca153ffbb0cf || array_contains(severity, "investigate")) {
        set_stealth_func("event_investigate", var_8e88d47ec56eea22);
    }
    if (var_a1d4ca153ffbb0cf || array_contains(severity, "cover_blown")) {
        set_stealth_func("event_cover_blown", var_8e88d47ec56eea22);
    }
    if (var_a1d4ca153ffbb0cf || array_contains(severity, "combat")) {
        set_stealth_func("event_combat", var_8e88d47ec56eea22);
    }
}
