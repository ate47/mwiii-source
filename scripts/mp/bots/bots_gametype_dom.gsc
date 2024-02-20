// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_26508f2de04c7a52;
#using scripts\mp\gametypes\dom.gsc;
#using scripts\mp\gamescore.gsc;

#namespace namespace_b5042c57fbe87369;

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x394
// Size: 0x54
function main() {
    level.var_e6628286205f2ea7 = 1;
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        namespace_afbc0aa1b551667a::function_9acf99e8c077e74d();
        return;
    }
    level.bot_ignore_precalc_paths = 0;
    setup_callbacks();
    setup_bot_dom(3, 5);
    level thread bot_monitor_enemy_camp_spots(&bot_valid_camp_assassin);
    /#
        thread function_f0399eb73eb290b1();
    #/
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ef
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc
// Size: 0x78
function setup_callbacks() {
    level.bot_funcs["crate_can_use"] = &crate_can_use;
    level.bot_funcs["gametype_think"] = &bot_dom_think;
    level.bot_funcs["should_start_cautious_approach"] = &should_start_cautious_approach_dom;
    level.bot_funcs["leader_dialog"] = &bot_dom_leader_dialog;
    if (!level.bot_ignore_precalc_paths) {
        level.bot_funcs["get_watch_node_chance"] = &bot_dom_get_node_chance;
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47b
// Size: 0x3a
function crate_can_use(crate) {
    if (isagent(self) && !isdefined(crate.boxtype)) {
        return 0;
    }
    if (!isteamparticipant(self)) {
        return 1;
    }
    return bot_is_protecting();
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd
// Size: 0x1af
function function_f0399eb73eb290b1() {
    /#
        while (!isdefined(level.bot_gametype_precaching_done)) {
            wait(0.05);
        }
        while (1) {
            if (getdvarint(@"hash_9cac85d6351e1df") == 1) {
                flags = bot_get_all_possible_flags();
                foreach (flag in flags) {
                    if (flag.trigger.classname != "critical") {
                        botdebugdrawtrigger(1, flag.trigger, (0, 1, 0), 1);
                    } else {
                        bot_draw_cylinder(flag.trigger.origin, flag.trigger.radius, flag.trigger.height, 0.05, undefined, (0, 1, 0), 1);
                    }
                    foreach (node in flag.nodes) {
                        bot_draw_cylinder(node.origin, 10, 10, 0.05, undefined, (0, 1, 0), 1, 4);
                    }
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x673
// Size: 0x71
function monitor_flag_control() {
    self notify("monitor_flag_control");
    self endon("monitor_flag_control");
    self endon("death");
    level endon("game_ended");
    for (;;) {
        wait(1);
        team = namespace_6b4b8b8421d203ba::getflagteam();
        if (team != "neutral") {
            zone = getzonenearest(self.trigger.origin);
            if (isdefined(zone)) {
                botzonesetteam(zone, team);
            }
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6eb
// Size: 0x5c
function monitor_flag_ownership() {
    self notify("monitor_flag_ownership");
    self endon("monitor_flag_ownership");
    self endon("death");
    level endon("game_ended");
    var_d0c86817ad6633c8 = namespace_6b4b8b8421d203ba::getflagteam();
    for (;;) {
        var_5a0fc1d304e970ea = namespace_6b4b8b8421d203ba::getflagteam();
        if (var_5a0fc1d304e970ea != var_d0c86817ad6633c8) {
            level notify("flag_changed_ownership");
        }
        var_d0c86817ad6633c8 = var_5a0fc1d304e970ea;
        wait(0.05);
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0x308
function setup_bot_dom(var_c09effe906c04618, var_c9d880ac3d2f2d31) {
    /#
        setdevdvarifuninitialized(@"hash_d19b61818b442235", 0);
        setdevdvarifuninitialized(@"hash_e1e41766847222dc", 0);
    #/
    bot_waittill_bots_enabled();
    flags = bot_get_all_possible_flags();
    if (flags.size > 3) {
        while (!isdefined(level.teleport_dom_finished_initializing)) {
            wait(0.05);
        }
        /#
            assert(flags.size % 3 == 0);
        #/
        var_80d5d34a941564e9 = [];
        foreach (flag in flags) {
            /#
                assert(isdefined(flag.teleport_zone));
            #/
            if (!isdefined(var_80d5d34a941564e9[flag.teleport_zone])) {
                var_80d5d34a941564e9[flag.teleport_zone] = [];
            }
            var_80d5d34a941564e9[flag.teleport_zone] = array_add(var_80d5d34a941564e9[flag.teleport_zone], flag);
        }
        foreach (teleport_zone, var_efe554850e96b933 in var_80d5d34a941564e9) {
            level.entrance_points_finished_caching = 0;
            bot_cache_flag_distances(var_efe554850e96b933);
            bot_cache_entrances_to_gametype_array(var_efe554850e96b933, teleport_zone + "_flag", level.bot_ignore_precalc_paths);
        }
    } else {
        /#
            assert(flags.size == var_c09effe906c04618);
        #/
        bot_cache_entrances_to_gametype_array(flags, "flag", level.bot_ignore_precalc_paths);
        bot_cache_flag_distances(flags);
        thread bot_wait_for_event_flag_swap(flags);
    }
    foreach (flag in flags) {
        flag thread monitor_flag_control();
        flag thread monitor_flag_ownership();
        if (flag.objectivekey != "_a" && flag.objectivekey != "_b" && flag.objectivekey != "_c") {
            /#
                assertmsg("Domination flag at location " + flag.trigger.origin + " needs a script_label of  '_a'  '_b'  or  '_c'");
            #/
        }
        flag.nodes = bot_get_valid_nodes_in_trigger(flag.trigger);
        flag.last_time_secured["allies"] = 0;
        flag.last_time_secured["axis"] = 0;
    }
    level.bot_dom_override_flag_targets = [];
    level.bot_dom_override_flag_targets["axis"] = [];
    level.bot_dom_override_flag_targets["allies"] = [];
    level.bot_gametype_precaching_done = 1;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5d
// Size: 0xfb
function bot_wait_for_event_flag_swap(flags) {
    level endon("game_ended");
    level waittill("dom_flags_moved");
    bot_cache_entrances_to_gametype_array(flags, "flag", level.bot_ignore_precalc_paths, 1);
    bot_cache_flag_distances(flags);
    foreach (dom_flag in flags) {
        dom_flag.nodes = bot_get_valid_nodes_in_trigger(dom_flag);
    }
    foreach (player in level.participants) {
        if (isaiteamparticipant(player)) {
            player.force_new_goal = 1;
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5f
// Size: 0x27
function bot_get_all_possible_flags() {
    if (isdefined(level.all_dom_flags)) {
        return level.all_dom_flags;
    } else {
        return level.objectives;
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8d
// Size: 0x144
function bot_cache_flag_distances(flags) {
    if (!isdefined(level.flag_distances)) {
        level.flag_distances = [];
    }
    var_dea51d2a009ac6e7 = [];
    i = 0;
    foreach (flag in flags) {
        var_dea51d2a009ac6e7[i] = flag;
        i++;
    }
    for (i = 0; i < var_dea51d2a009ac6e7.size - 1; i++) {
        for (j = i + 1; j < var_dea51d2a009ac6e7.size; j++) {
            var_a5b88c96222e6a1b = distance(var_dea51d2a009ac6e7[i].trigger.origin, var_dea51d2a009ac6e7[j].trigger.origin);
            var_cc343fc5c37710ed = get_flag_label(var_dea51d2a009ac6e7[i]);
            var_e141e4de30bd4300 = get_flag_label(var_dea51d2a009ac6e7[j]);
            level.flag_distances[var_cc343fc5c37710ed][var_e141e4de30bd4300] = var_a5b88c96222e6a1b;
            level.flag_distances[var_e141e4de30bd4300][var_cc343fc5c37710ed] = var_a5b88c96222e6a1b;
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd8
// Size: 0x120
function should_start_cautious_approach_dom(var_44770b14726e7a47) {
    if (var_44770b14726e7a47) {
        if (self.current_flag namespace_6b4b8b8421d203ba::getflagteam() == "neutral" && flag_has_never_been_captured(self.current_flag)) {
            var_75ee0b273dd2ec6a = get_closest_flag(self.lastspawnpoint.origin);
            if (var_75ee0b273dd2ec6a == self.current_flag) {
                return 0;
            } else {
                var_7d6c59551603a4f2 = get_other_flag(var_75ee0b273dd2ec6a, self.current_flag);
                var_146177c4671f2f2d = distancesquared(var_75ee0b273dd2ec6a.trigger.origin, self.current_flag.trigger.origin);
                var_d886e066e440ed6f = distancesquared(var_7d6c59551603a4f2.trigger.origin, self.current_flag.trigger.origin);
                if (var_146177c4671f2f2d < var_d886e066e440ed6f) {
                    return 0;
                }
            }
        }
    }
    return should_start_cautious_approach_default(var_44770b14726e7a47);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe00
// Size: 0x21
function bot_dom_debug_should_capture_all() {
    /#
        if (getdvar(@"hash_d19b61818b442235") == "monitor_flag_status") {
            return 1;
        }
    #/
    return 0;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe29
// Size: 0x21
function bot_dom_debug_should_protect_all() {
    /#
        if (getdvar(@"hash_e1e41766847222dc") == "monitor_flag_status") {
            return 1;
        }
    #/
    return 0;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe52
// Size: 0x155
function bot_dom_think() {
    self notify("bot_dom_think");
    self endon("bot_dom_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self.force_new_goal = 0;
    self.new_goal_time = 0;
    self.next_strat_level_check = 0;
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    self botsetflag("use_obj_path_style", 1);
    for (;;) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        bot_update_camp_assassin();
        cur_time = gettime();
        if (cur_time > self.next_strat_level_check) {
            self.next_strat_level_check = gettime() + 10000;
            self.strategy_level = self botgetdifficultysetting("strategyLevel");
        }
        if (cur_time > self.new_goal_time || self.force_new_goal) {
            if (should_delay_flag_decision()) {
                self.new_goal_time = cur_time + 5000;
            } else {
                self.force_new_goal = 0;
                bot_choose_flag();
                self.new_goal_time = cur_time + randomintrange(30000, 45000);
            }
        }
        waittill_notify_or_timeout("needs_new_flag_goal", 1);
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfae
// Size: 0xc9
function should_delay_flag_decision() {
    if (self.force_new_goal) {
        return 0;
    }
    if (!bot_is_capturing()) {
        return 0;
    }
    if (self.current_flag namespace_6b4b8b8421d203ba::getflagteam() == self.team) {
        return 0;
    }
    var_3498229c5a4f8731 = get_flag_capture_radius();
    if (distancesquared(self.origin, self.current_flag.trigger.origin) < var_3498229c5a4f8731 * 2 * var_3498229c5a4f8731 * 2) {
        var_f54364c67cfabc7 = get_ally_flags(self.team);
        if (var_f54364c67cfabc7.size == 2 && !array_contains(var_f54364c67cfabc7, self.current_flag) && !bot_allowed_to_3_cap()) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107f
// Size: 0x16
function get_override_flag_targets() {
    return level.bot_dom_override_flag_targets[self.team];
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109d
// Size: 0x18
function has_override_flag_targets() {
    var_88619ebfa03b1898 = get_override_flag_targets();
    return var_88619ebfa03b1898.size > 0;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10bd
// Size: 0x14
function flag_has_been_captured_before(flag) {
    return !flag_has_never_been_captured(flag);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d9
// Size: 0x17
function flag_has_never_been_captured(flag) {
    return flag.firstcapture;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f8
// Size: 0xbf6
function bot_choose_flag() {
    flag = undefined;
    var_7ba2208479205cf2 = [];
    var_23b9e499d084cad = [];
    var_39c262926ffa6a00 = !istrue(level.precappoints);
    var_88619ebfa03b1898 = get_override_flag_targets();
    if (var_88619ebfa03b1898.size > 0) {
        var_a9ddbdf62ea00196 = var_88619ebfa03b1898;
    } else {
        var_a9ddbdf62ea00196 = level.objectives;
    }
    foreach (flag in var_a9ddbdf62ea00196) {
        team = flag namespace_6b4b8b8421d203ba::getflagteam();
        if (var_39c262926ffa6a00) {
            if (flag_has_been_captured_before(flag)) {
                var_39c262926ffa6a00 = 0;
            } else {
                /#
                    assert(team == "neutral");
                #/
            }
        }
        if (team != self.team) {
            var_7ba2208479205cf2[var_7ba2208479205cf2.size] = flag;
        } else {
            var_23b9e499d084cad[var_23b9e499d084cad.size] = flag;
        }
    }
    /#
        assert(has_override_flag_targets() || var_7ba2208479205cf2.size + var_23b9e499d084cad.size == 3);
    #/
    attacking = undefined;
    if (var_7ba2208479205cf2.size == 3) {
        /#
            assert(var_23b9e499d084cad.size == 0);
        #/
        attacking = 1;
    } else if (var_7ba2208479205cf2.size == 2) {
        /#
            assert(var_23b9e499d084cad.size <= 1);
        #/
        if (var_23b9e499d084cad.size == 1) {
            if (!bot_should_defend_flag(var_23b9e499d084cad[0], 1)) {
                attacking = 1;
            } else {
                attacking = !bot_should_defend(0.34);
            }
            if (bot_get_max_players_on_team(self.team) == 1) {
                attacking = 1;
            }
        } else if (var_23b9e499d084cad.size == 0) {
            attacking = 1;
        }
    } else if (var_7ba2208479205cf2.size == 1) {
        /#
            assert(var_23b9e499d084cad.size <= 2);
        #/
        if (var_23b9e499d084cad.size == 2) {
            if (bot_allowed_to_3_cap()) {
                if (!bot_should_defend_flag(var_23b9e499d084cad[0], 2) && !bot_should_defend_flag(var_23b9e499d084cad[1], 2)) {
                    attacking = 1;
                } else if (self.strategy_level == 0) {
                    attacking = !bot_should_defend(0.34);
                } else {
                    attacking = !bot_should_defend(0.5);
                }
            } else {
                attacking = 0;
            }
        } else if (var_23b9e499d084cad.size == 1) {
            if (!bot_should_defend_flag(var_23b9e499d084cad[0], 1)) {
                attacking = 1;
            } else {
                attacking = !bot_should_defend(0.34);
            }
        } else if (var_23b9e499d084cad.size == 0) {
            attacking = 1;
        }
    } else if (var_7ba2208479205cf2.size == 0) {
        /#
            assert(var_23b9e499d084cad.size <= 3);
        #/
        attacking = 0;
    }
    /#
        assert(isdefined(attacking));
    #/
    if (attacking) {
        /#
            assert(var_7ba2208479205cf2.size >= 1 && var_7ba2208479205cf2.size <= 3);
        #/
        if (var_7ba2208479205cf2.size > 1) {
            triggers = [];
            foreach (var_38a5994c0cec51cd in var_7ba2208479205cf2) {
                triggers[triggers.size] = var_38a5994c0cec51cd.trigger;
            }
            var_7727a8a4f4a2e7fe = get_array_of_closest(self.origin, triggers);
            var_4a204ffc32301ef9 = [];
            foreach (var_8000a8c17c21d1de in var_7727a8a4f4a2e7fe) {
                foreach (objective in level.objectives) {
                    if (objective.trigger == var_8000a8c17c21d1de) {
                        var_4a204ffc32301ef9[var_4a204ffc32301ef9.size] = objective;
                    }
                }
            }
            var_7727a8a4f4a2e7fe = var_4a204ffc32301ef9;
        } else {
            var_7727a8a4f4a2e7fe = var_7ba2208479205cf2;
        }
        if (var_39c262926ffa6a00 && !has_override_flag_targets()) {
            /#
                assert(var_7727a8a4f4a2e7fe.size == 3);
            #/
            var_9685536ce2ceda1 = get_num_allies_capturing_flag(var_7727a8a4f4a2e7fe[0], 1);
            if (var_9685536ce2ceda1 < min_num_bots_assaulting_first_flag()) {
                var_1912d561a938bfc = 0;
            } else {
                var_be069de8ad079303 = 20;
                var_49628d88fda56715 = 65;
                var_c21ff692c3731f37 = 15;
                if (self.strategy_level == 0) {
                    var_be069de8ad079303 = 50;
                    var_49628d88fda56715 = 25;
                    var_c21ff692c3731f37 = 25;
                } else if (self.strategy_level == 1) {
                    var_be069de8ad079303 = 40;
                    var_49628d88fda56715 = 40;
                    var_c21ff692c3731f37 = 20;
                }
                var_be27baff78d0797c = randomint(100);
                if (var_be27baff78d0797c < var_be069de8ad079303) {
                    var_1912d561a938bfc = 0;
                } else if (var_be27baff78d0797c < var_be069de8ad079303 + var_49628d88fda56715) {
                    var_1912d561a938bfc = 1;
                } else {
                    var_1912d561a938bfc = 2;
                }
            }
            goal_type = undefined;
            if (var_1912d561a938bfc == 0) {
                goal_type = "critical";
            }
            capture_flag(var_7727a8a4f4a2e7fe[var_1912d561a938bfc], goal_type);
            return;
        }
        if (var_7727a8a4f4a2e7fe.size == 1) {
            flag = var_7727a8a4f4a2e7fe[0];
        } else if (distancesquared(var_7727a8a4f4a2e7fe[0].trigger.origin, self.origin) < 102400) {
            flag = var_7727a8a4f4a2e7fe[0];
        } else {
            /#
                assert(var_7727a8a4f4a2e7fe.size >= 2 && var_7727a8a4f4a2e7fe.size <= 3);
            #/
            var_51eed82f15a0c64c = [];
            var_5eb2d3db89e5673b = [];
            for (i = 0; i < var_7727a8a4f4a2e7fe.size; i++) {
                dist = distance(var_7727a8a4f4a2e7fe[i].trigger.origin, self.origin);
                var_5eb2d3db89e5673b[i] = dist;
                var_51eed82f15a0c64c[i] = dist;
            }
            if (var_23b9e499d084cad.size == 1) {
                var_8b12e8f5719a1c61 = 1.5;
                for (i = 0; i < var_51eed82f15a0c64c.size; i++) {
                    var_51eed82f15a0c64c[i] = var_51eed82f15a0c64c[i] + level.flag_distances[get_flag_label(var_7727a8a4f4a2e7fe[i])][get_flag_label(var_23b9e499d084cad[0])] * var_8b12e8f5719a1c61;
                }
            }
            if (self.strategy_level == 0) {
                var_be27baff78d0797c = randomint(100);
                if (var_be27baff78d0797c < 50) {
                    flag = var_7727a8a4f4a2e7fe[0];
                } else if (var_be27baff78d0797c < 50 + 50 / (var_7727a8a4f4a2e7fe.size - 1)) {
                    flag = var_7727a8a4f4a2e7fe[1];
                } else {
                    flag = var_7727a8a4f4a2e7fe[2];
                }
            } else if (var_51eed82f15a0c64c.size == 2) {
                var_168860c6fed89ec2[0] = 50;
                var_168860c6fed89ec2[1] = 50;
                for (i = 0; i < var_7727a8a4f4a2e7fe.size; i++) {
                    if (var_51eed82f15a0c64c[i] < var_51eed82f15a0c64c[1 - i]) {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 20;
                        var_168860c6fed89ec2[1 - i] = var_168860c6fed89ec2[1 - i] - 20;
                    }
                    if (var_5eb2d3db89e5673b[i] < 640) {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 15;
                        var_168860c6fed89ec2[1 - i] = var_168860c6fed89ec2[1 - i] - 15;
                    }
                    if (var_7727a8a4f4a2e7fe[i] namespace_6b4b8b8421d203ba::getflagteam() == "neutral") {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 15;
                        var_168860c6fed89ec2[1 - i] = var_168860c6fed89ec2[1 - i] - 15;
                    }
                }
                var_be27baff78d0797c = randomint(100);
                if (var_be27baff78d0797c < var_168860c6fed89ec2[0]) {
                    flag = var_7727a8a4f4a2e7fe[0];
                } else {
                    flag = var_7727a8a4f4a2e7fe[1];
                }
            } else if (var_51eed82f15a0c64c.size == 3) {
                var_168860c6fed89ec2[0] = 34;
                var_168860c6fed89ec2[1] = 33;
                var_168860c6fed89ec2[2] = 33;
                for (i = 0; i < var_7727a8a4f4a2e7fe.size; i++) {
                    var_226e0424f3cc40a6 = (i + 1) % 3;
                    var_226e0324f3cc3e73 = (i + 2) % 3;
                    if (var_51eed82f15a0c64c[i] < var_51eed82f15a0c64c[var_226e0424f3cc40a6] && var_51eed82f15a0c64c[i] < var_51eed82f15a0c64c[var_226e0324f3cc3e73]) {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 36;
                        var_168860c6fed89ec2[var_226e0424f3cc40a6] = var_168860c6fed89ec2[var_226e0424f3cc40a6] - 18;
                        var_168860c6fed89ec2[var_226e0324f3cc3e73] = var_168860c6fed89ec2[var_226e0324f3cc3e73] - 18;
                    }
                    if (var_5eb2d3db89e5673b[i] < 640) {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 15;
                        var_168860c6fed89ec2[var_226e0424f3cc40a6] = var_168860c6fed89ec2[var_226e0424f3cc40a6] - 7;
                        var_168860c6fed89ec2[var_226e0324f3cc3e73] = var_168860c6fed89ec2[var_226e0324f3cc3e73] - 8;
                    }
                    if (var_7727a8a4f4a2e7fe[i] namespace_6b4b8b8421d203ba::getflagteam() == "neutral") {
                        var_168860c6fed89ec2[i] = var_168860c6fed89ec2[i] + 15;
                        var_168860c6fed89ec2[var_226e0424f3cc40a6] = var_168860c6fed89ec2[var_226e0424f3cc40a6] - 7;
                        var_168860c6fed89ec2[var_226e0324f3cc3e73] = var_168860c6fed89ec2[var_226e0324f3cc3e73] - 8;
                    }
                }
                var_be27baff78d0797c = randomint(100);
                if (var_be27baff78d0797c < var_168860c6fed89ec2[0]) {
                    flag = var_7727a8a4f4a2e7fe[0];
                } else if (var_be27baff78d0797c < var_168860c6fed89ec2[0] + var_168860c6fed89ec2[1]) {
                    flag = var_7727a8a4f4a2e7fe[1];
                } else {
                    flag = var_7727a8a4f4a2e7fe[2];
                }
            }
        }
    } else {
        /#
            assert(var_23b9e499d084cad.size > 0);
        #/
        if (var_23b9e499d084cad.size > 1) {
            triggers = [];
            foreach (var_8fed5911f92e3192 in var_23b9e499d084cad) {
                triggers[triggers.size] = var_8fed5911f92e3192.trigger;
            }
            var_f9e86f3c87ab9f97 = get_array_of_closest(self.origin, triggers);
            var_4a204ffc32301ef9 = [];
            foreach (var_8000a8c17c21d1de in var_f9e86f3c87ab9f97) {
                foreach (objective in level.objectives) {
                    if (objective.trigger == var_8000a8c17c21d1de) {
                        var_4a204ffc32301ef9[var_4a204ffc32301ef9.size] = objective;
                    }
                }
            }
            var_f9e86f3c87ab9f97 = var_4a204ffc32301ef9;
        } else {
            var_f9e86f3c87ab9f97 = var_23b9e499d084cad;
        }
        foreach (var_d0076018172f593c in var_f9e86f3c87ab9f97) {
            if (bot_should_defend_flag(var_d0076018172f593c, var_23b9e499d084cad.size)) {
                flag = var_d0076018172f593c;
                break;
            }
        }
        if (!isdefined(flag)) {
            /#
                assert(var_f9e86f3c87ab9f97.size > 0);
            #/
            if (self.strategy_level == 0) {
                flag = var_23b9e499d084cad[0];
            } else if (var_f9e86f3c87ab9f97.size == 2) {
                var_8cb7cd2c3c2f7779 = get_other_flag(var_f9e86f3c87ab9f97[0], var_f9e86f3c87ab9f97[1]);
                triggers = [];
                foreach (entry in var_f9e86f3c87ab9f97) {
                    triggers[triggers.size] = entry.trigger;
                }
                var_aef4149e235bfbe6 = get_array_of_closest(var_8cb7cd2c3c2f7779.trigger.origin, triggers);
                var_4a204ffc32301ef9 = [];
                foreach (var_8000a8c17c21d1de in var_aef4149e235bfbe6) {
                    foreach (objective in level.objectives) {
                        if (objective.trigger == var_8000a8c17c21d1de) {
                            var_4a204ffc32301ef9[var_4a204ffc32301ef9.size] = objective;
                        }
                    }
                }
                var_aef4149e235bfbe6 = var_4a204ffc32301ef9;
                var_be27baff78d0797c = randomint(100);
                if (var_be27baff78d0797c < 70) {
                    flag = var_aef4149e235bfbe6[0];
                } else {
                    flag = var_aef4149e235bfbe6[1];
                }
            } else {
                /#
                    assert(var_f9e86f3c87ab9f97.size == 1 || var_f9e86f3c87ab9f97.size == 3);
                #/
                flag = var_f9e86f3c87ab9f97[0];
            }
        }
    }
    if (attacking) {
        capture_flag(flag);
    } else {
        defend_flag(flag);
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf5
// Size: 0x26
function min_num_bots_assaulting_first_flag() {
    var_6ace8681f94cdc7c = bot_get_max_players_on_team(self.team);
    return ceil(var_6ace8681f94cdc7c / 3);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d23
// Size: 0x9d
function bot_allowed_to_3_cap() {
    if (self.strategy_level == 0) {
        return 1;
    }
    var_88619ebfa03b1898 = get_override_flag_targets();
    if (var_88619ebfa03b1898.size == 3) {
        return 1;
    }
    var_5a293d5e08a8b462 = namespace_e8a49b70d0769b66::_getteamscore(get_enemy_team(self.team));
    var_cd5052914e11eb6a = namespace_e8a49b70d0769b66::_getteamscore(self.team);
    var_8f891cbcd9fa1dd1 = 200 - var_5a293d5e08a8b462;
    var_30a11ea937e7f319 = 200 - var_cd5052914e11eb6a;
    var_d8a3aa3a65a5b213 = var_30a11ea937e7f319 * 0.5 > var_8f891cbcd9fa1dd1;
    return var_d8a3aa3a65a5b213;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc8
// Size: 0x77
function bot_should_defend(var_e8d030a9fa5114ee) {
    /#
        assert(var_e8d030a9fa5114ee >= 0 && var_e8d030a9fa5114ee <= 1);
    #/
    if (randomfloat(1) < var_e8d030a9fa5114ee) {
        return 1;
    }
    var_30f9ca2fa8449648 = level.bot_personality_type[self.personality];
    if (var_30f9ca2fa8449648 == "stationary") {
        return 1;
    } else if (var_30f9ca2fa8449648 == "active") {
        return 0;
    }
    /#
        assertmsg("unreachable");
    #/
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e46
// Size: 0xe0
function capture_flag(var_f0b1a2262b2f7dfc, override_goal_type, var_119041cda5e9adf2) {
    /#
        assert(isdefined(var_f0b1a2262b2f7dfc));
    #/
    self.current_flag = var_f0b1a2262b2f7dfc;
    if (bot_dom_debug_should_protect_all()) {
        optional_params["override_goal_type"] = override_goal_type;
        optional_params["entrance_points_index"] = get_flag_label(var_f0b1a2262b2f7dfc);
        bot_protect_point(var_f0b1a2262b2f7dfc.trigger.origin, get_flag_protect_radius(), optional_params);
    } else {
        optional_params["override_goal_type"] = override_goal_type;
        optional_params["entrance_points_index"] = get_flag_label(var_f0b1a2262b2f7dfc);
        bot_capture_zone(var_f0b1a2262b2f7dfc.trigger.origin, var_f0b1a2262b2f7dfc.nodes, var_f0b1a2262b2f7dfc.trigger, optional_params);
    }
    if (!isdefined(var_119041cda5e9adf2) || !var_119041cda5e9adf2) {
        thread monitor_flag_status(var_f0b1a2262b2f7dfc);
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f2d
// Size: 0xc6
function defend_flag(var_3e376080e8dc9e3a) {
    /#
        assert(isdefined(var_3e376080e8dc9e3a));
    #/
    self.current_flag = var_3e376080e8dc9e3a;
    if (bot_dom_debug_should_capture_all()) {
        optional_params["entrance_points_index"] = get_flag_label(var_3e376080e8dc9e3a);
        bot_capture_zone(var_3e376080e8dc9e3a.trigger.origin, var_3e376080e8dc9e3a.nodes, var_3e376080e8dc9e3a.trigger, optional_params);
    } else {
        optional_params["entrance_points_index"] = get_flag_label(var_3e376080e8dc9e3a);
        optional_params["nearest_node_to_center"] = var_3e376080e8dc9e3a.nearest_node;
        bot_protect_point(var_3e376080e8dc9e3a.trigger.origin, get_flag_protect_radius(), optional_params);
    }
    thread monitor_flag_status(var_3e376080e8dc9e3a);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ffa
// Size: 0x24
function get_flag_capture_radius() {
    if (!isdefined(level.capture_radius)) {
        level.capture_radius = 158;
    }
    return level.capture_radius;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2026
// Size: 0x58
function get_flag_protect_radius() {
    if (!isdefined(level.protect_radius)) {
        var_fa52693cf4679c62 = self botgetworldsize();
        var_dd6786927bde6332 = (var_fa52693cf4679c62[0] + var_fa52693cf4679c62[1]) / 2;
        level.protect_radius = min(1000, var_dd6786927bde6332 / 3.5);
    }
    return level.protect_radius;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2086
// Size: 0x1b2
function bot_dom_leader_dialog(dialog, location) {
    if (issubstr(dialog, "losing") && dialog != "losing_score" && dialog != "losing_time" && dialog != "gamestate_domlosing") {
        var_f666be4a2abc34f6 = getsubstr(dialog, dialog.size - 2);
        flag_losing = get_specific_flag_by_label(var_f666be4a2abc34f6);
        /#
            assertex(isdefined(flag_losing), "Flag not found for string '" + dialog + "'");
        #/
        if (isdefined(flag_losing) && bot_allow_to_capture_flag(flag_losing)) {
            self botmemoryevent("known_enemy", undefined, flag_losing.trigger.origin);
            if (!isdefined(self.last_losing_flag_react) || gettime() - self.last_losing_flag_react > 10000) {
                if (bot_is_protecting()) {
                    var_d493bd9f5a8adf45 = distancesquared(self.origin, flag_losing.trigger.origin) < 490000;
                    var_cba76c2fa6170699 = bot_is_protecting_flag(flag_losing);
                    if (var_d493bd9f5a8adf45 || var_cba76c2fa6170699) {
                        capture_flag(flag_losing);
                        self.last_losing_flag_react = gettime();
                    }
                }
            }
        }
    } else if (issubstr(dialog, "secured")) {
        var_f666be4a2abc34f6 = getsubstr(dialog, dialog.size - 2);
        flag_taken = get_specific_flag_by_label(var_f666be4a2abc34f6);
        /#
            assert(isdefined(flag_taken));
        #/
        flag_taken.last_time_secured[self.team] = gettime();
    }
    bot_leader_dialog(dialog, location);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x223f
// Size: 0x36
function bot_allow_to_capture_flag(flag) {
    var_88619ebfa03b1898 = get_override_flag_targets();
    if (var_88619ebfa03b1898.size == 0) {
        return 1;
    }
    if (array_contains(var_88619ebfa03b1898, flag)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x227d
// Size: 0x3eb
function monitor_flag_status(flag) {
    self notify("monitor_flag_status");
    self endon("monitor_flag_status");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_f2b47e412166c272 = get_num_ally_flags(self.team);
    var_82fe1c44f0e59dd5 = get_flag_capture_radius() * get_flag_capture_radius();
    var_9a86288b6e984514 = get_flag_capture_radius() * 3 * get_flag_capture_radius() * 3;
    var_278595174c3b888b = 1;
    while (var_278595174c3b888b) {
        var_6e24445ac4c031bf = 0;
        var_a78b2b0ebf2f977f = flag namespace_6b4b8b8421d203ba::getflagteam();
        var_877f0c734271995 = get_num_ally_flags(self.team);
        var_eb9bb8aceeda2da3 = get_enemy_flags(self.team);
        if (bot_is_capturing()) {
            if (var_a78b2b0ebf2f977f == self.team && flag.claimteam == "none") {
                if (!bot_dom_debug_should_capture_all()) {
                    var_6e24445ac4c031bf = 1;
                }
            }
            if (var_877f0c734271995 == 2 && var_a78b2b0ebf2f977f != self.team && !bot_allowed_to_3_cap()) {
                if (distancesquared(self.origin, flag.trigger.origin) > var_82fe1c44f0e59dd5) {
                    var_6e24445ac4c031bf = 1;
                }
            }
            foreach (var_5607f7513eb816a2 in var_eb9bb8aceeda2da3) {
                if (var_5607f7513eb816a2 != flag && bot_allow_to_capture_flag(var_5607f7513eb816a2)) {
                    if (distancesquared(self.origin, var_5607f7513eb816a2.trigger.origin) < var_9a86288b6e984514) {
                        var_6e24445ac4c031bf = 1;
                    }
                }
            }
            if (self istouching(flag.trigger) && flag.userate <= 0) {
                if (self bothasscriptgoal()) {
                    var_4cbd8ae83804749c = self botgetscriptgoal();
                    script_goal_radius = self botgetscriptgoalradius();
                    if (distancesquared(self.origin, var_4cbd8ae83804749c) < squared(script_goal_radius)) {
                        var_b6f1deb8e946e67c = self getnearestnode();
                        if (isdefined(var_b6f1deb8e946e67c)) {
                            var_1aaf2917e47371a3 = undefined;
                            foreach (var_72f9a5ca05bb7422 in flag.nodes) {
                                if (!nodesvisible(var_72f9a5ca05bb7422, var_b6f1deb8e946e67c, 1)) {
                                    var_1aaf2917e47371a3 = var_72f9a5ca05bb7422.origin;
                                    break;
                                }
                            }
                            if (isdefined(var_1aaf2917e47371a3)) {
                                self.defense_investigate_specific_point = var_1aaf2917e47371a3;
                                self notify("defend_force_node_recalculation");
                            }
                        }
                    }
                }
            }
        }
        if (bot_is_protecting()) {
            if (var_a78b2b0ebf2f977f != self.team) {
                if (!bot_dom_debug_should_protect_all()) {
                    var_6e24445ac4c031bf = 1;
                }
            } else if (var_877f0c734271995 == 1 && var_f2b47e412166c272 > 1) {
                var_6e24445ac4c031bf = 1;
            }
        }
        var_f2b47e412166c272 = var_877f0c734271995;
        if (var_6e24445ac4c031bf) {
            self.force_new_goal = 1;
            var_278595174c3b888b = 0;
            self notify("needs_new_flag_goal");
        } else {
            result = level waittill_notify_or_timeout_return("flag_changed_ownership", 1 + randomfloatrange(0, 2));
            var_a862627b64e75a21 = isdefined(result) && result == "timeout";
            if (!var_a862627b64e75a21) {
                /#
                    assert(self.strategy_level <= 3);
                #/
                wait_time = max((3 - self.strategy_level) * 1 + randomfloatrange(-0.5, 0.5), 0);
                wait(wait_time);
            }
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x266f
// Size: 0x141
function bot_dom_get_node_chance(node) {
    if (node == self.node_closest_to_defend_center) {
        return 1;
    }
    if (!isdefined(self.current_flag)) {
        return 1;
    }
    var_f43fb0e14ccfb9e1 = 0;
    var_a7ff1fe77b4291e1 = get_flag_label(self.current_flag);
    var_f54364c67cfabc7 = get_ally_flags(self.team);
    foreach (var_61733d6e2cbee46e in var_f54364c67cfabc7) {
        if (var_61733d6e2cbee46e != self.current_flag) {
            var_f43fb0e14ccfb9e1 = node node_is_on_path_from_labels(var_a7ff1fe77b4291e1, get_flag_label(var_61733d6e2cbee46e));
            if (var_f43fb0e14ccfb9e1) {
                var_8cb7cd2c3c2f7779 = get_other_flag(self.current_flag, var_61733d6e2cbee46e);
                var_8eb11236ac48ce3 = var_8cb7cd2c3c2f7779 namespace_6b4b8b8421d203ba::getflagteam();
                if (var_8eb11236ac48ce3 != self.team) {
                    if (node node_is_on_path_from_labels(var_a7ff1fe77b4291e1, get_flag_label(var_8cb7cd2c3c2f7779))) {
                        var_f43fb0e14ccfb9e1 = 0;
                    }
                }
            }
        }
    }
    if (var_f43fb0e14ccfb9e1) {
        return 0.2;
    }
    return 1;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27b8
// Size: 0x56
function get_flag_label(flag) {
    var_43ef966deaad58a = "";
    if (isdefined(flag.teleport_zone)) {
        var_43ef966deaad58a = var_43ef966deaad58a + flag.teleport_zone + "_";
    }
    var_43ef966deaad58a = var_43ef966deaad58a + "flag" + flag.objectivekey;
    return var_43ef966deaad58a;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2816
// Size: 0x86
function get_other_flag(flag1, var_5228090a1cf6f05b) {
    /#
        assert(level.objectives.size == 3);
    #/
    foreach (objective in level.objectives) {
        if (objective != flag1 && objective != var_5228090a1cf6f05b) {
            return objective;
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28a3
// Size: 0x50
function get_specific_flag_by_letter(var_607390fda882b564) {
    /#
        assert(var_607390fda882b564 == "A" || var_607390fda882b564 == "B" || var_607390fda882b564 == "C");
    #/
    var_43ef966deaad58a = "_" + tolower(var_607390fda882b564);
    return get_specific_flag_by_label(var_43ef966deaad58a);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28fb
// Size: 0x6b
function get_specific_flag_by_label(var_43ef966deaad58a) {
    foreach (objective in level.objectives) {
        if (objective.objectivekey == var_43ef966deaad58a) {
            return objective;
        }
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x296d
// Size: 0xac
function get_closest_flag(origin) {
    var_345442a441f6669f = undefined;
    var_d7e79a673c0d8d21 = undefined;
    foreach (objective in level.objectives) {
        var_4ea84b05d2e463a4 = distancesquared(objective.trigger.origin, origin);
        if (!isdefined(var_d7e79a673c0d8d21) || var_4ea84b05d2e463a4 < var_d7e79a673c0d8d21) {
            var_345442a441f6669f = objective;
            var_d7e79a673c0d8d21 = var_4ea84b05d2e463a4;
        }
    }
    return var_345442a441f6669f;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2a21
// Size: 0xef
function get_num_allies_capturing_flag(flag, var_38c7da45d31e930e) {
    var_6fd52c0a557b6a40 = 0;
    var_3498229c5a4f8731 = get_flag_capture_radius();
    foreach (other_player in level.participants) {
        if (!isdefined(other_player.team)) {
            continue;
        }
        if (other_player.team == self.team && other_player != self && isteamparticipant(other_player)) {
            if (isai(other_player)) {
                if (other_player bot_is_capturing_flag(flag)) {
                    var_6fd52c0a557b6a40++;
                }
            } else if (!isdefined(var_38c7da45d31e930e) || !var_38c7da45d31e930e) {
                if (other_player istouching(flag)) {
                    var_6fd52c0a557b6a40++;
                }
            }
        }
    }
    return var_6fd52c0a557b6a40;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b18
// Size: 0x1e
function bot_is_capturing_flag(flag) {
    if (!bot_is_capturing()) {
        return 0;
    }
    return bot_target_is_flag(flag);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b3e
// Size: 0x1e
function bot_is_protecting_flag(flag) {
    if (!bot_is_protecting()) {
        return 0;
    }
    return bot_target_is_flag(flag);
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b64
// Size: 0x17
function bot_target_is_flag(flag) {
    return self.current_flag == flag;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b83
// Size: 0x81
function get_num_ally_flags(team) {
    count = 0;
    foreach (objective in level.objectives) {
        flag_team = objective namespace_6b4b8b8421d203ba::getflagteam();
        if (flag_team == team) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0c
// Size: 0x8e
function get_enemy_flags(team) {
    flags = [];
    foreach (objective in level.objectives) {
        flag_team = objective namespace_6b4b8b8421d203ba::getflagteam();
        if (flag_team == get_enemy_team(team)) {
            flags = array_add(flags, objective);
        }
    }
    return flags;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca2
// Size: 0x88
function get_ally_flags(team) {
    flags = [];
    foreach (objective in level.objectives) {
        flag_team = objective namespace_6b4b8b8421d203ba::getflagteam();
        if (flag_team == team) {
            flags = array_add(flags, objective);
        }
    }
    return flags;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d32
// Size: 0x3c
function bot_should_defend_flag(var_4a39da8bbb554c2c, var_2d7337cdf8f706c0) {
    var_26d0fe30296086c4 = get_max_num_defenders_wanted_per_flag(var_2d7337cdf8f706c0);
    var_89d5717bf18a21ed = get_players_defending_flag(var_4a39da8bbb554c2c);
    return var_89d5717bf18a21ed.size < var_26d0fe30296086c4;
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d76
// Size: 0x44
function get_max_num_defenders_wanted_per_flag(var_2d7337cdf8f706c0) {
    var_6ace8681f94cdc7c = bot_get_max_players_on_team(self.team);
    if (var_2d7337cdf8f706c0 == 1) {
        return ceil(var_6ace8681f94cdc7c / 6);
    } else {
        return ceil(var_6ace8681f94cdc7c / 3);
    }
}

// Namespace namespace_b5042c57fbe87369/namespace_96b5471135b52661
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc1
// Size: 0x155
function get_players_defending_flag(var_4a39da8bbb554c2c) {
    var_20b890e2dd5949fa = get_flag_protect_radius();
    var_17c8f3bcda25f80 = [];
    foreach (other_player in level.participants) {
        if (!isdefined(other_player.team)) {
            continue;
        }
        if (other_player.team == self.team && other_player != self && isteamparticipant(other_player)) {
            if (isai(other_player)) {
                if (other_player bot_is_protecting_flag(var_4a39da8bbb554c2c)) {
                    var_17c8f3bcda25f80 = array_add(var_17c8f3bcda25f80, other_player);
                }
            } else {
                var_c3d8550ca7e24e40 = gettime() - var_4a39da8bbb554c2c.last_time_secured[self.team];
                if (var_c3d8550ca7e24e40 < 10000) {
                    continue;
                }
                /#
                    if (other_player isufo() || other_player isnoclip()) {
                        goto LOC_00000140;
                    }
                #/
                if (distancesquared(var_4a39da8bbb554c2c.trigger.origin, other_player.origin) < var_20b890e2dd5949fa * var_20b890e2dd5949fa) {
                    var_17c8f3bcda25f80 = array_add(var_17c8f3bcda25f80, other_player);
                LOC_00000140:
                }
            LOC_00000140:
            }
        LOC_00000140:
        }
    LOC_00000140:
    }
    return var_17c8f3bcda25f80;
}
