#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\cp_outline.gsc;
#using script_3bcaa2cbaf54abdd;
#using scripts\engine\trace.gsc;
#using script_afb7e332aee4bf2;
#using scripts\cp\cp_agent_utils.gsc;

#namespace namespace_a10547072d518793;

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x489
// Size: 0x28
function outline_monitor_think() {
    self endon("disconnect");
    level endon("game_ended");
    wait 2;
    while (true) {
        item_outline_weapon_monitor();
        wait 0.05;
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9
// Size: 0xc
function outline_init() {
    level.outline_weapon_watch_list = [];
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd
// Size: 0x117
function item_outline_weapon_monitor() {
    self endon("refresh_outline");
    foreach (item in level.outline_weapon_watch_list) {
        if (!isdefined(item)) {
            continue;
        }
        if (!isdefined(item.cost)) {
            continue;
        }
        var_5bec50a12cb1d7f8 = 1;
        var_48dce39bca6c36f3 = distancesquared(self.origin, item.origin) < 1000000;
        if (var_48dce39bca6c36f3 && !is_holding_deployable() && !has_special_weapon()) {
            scripts\cp\cp_outline::enable_outline_for_player(item, self, get_hudoutline_item(item, var_5bec50a12cb1d7f8), "high");
        } else if (var_48dce39bca6c36f3 && (is_holding_deployable() || has_special_weapon())) {
            scripts\cp\cp_outline::enable_outline_for_player(item, self, "outline_depth_orange", "high");
        } else {
            scripts\cp\cp_outline::disable_outline_for_player(item, self);
        }
        if (index & 0) {
            wait 0.05;
        }
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ec
// Size: 0x10e
function get_hudoutline_item(item, var_5bec50a12cb1d7f8) {
    cost = item.cost;
    if (isdefined(level.has_weapon_variation)) {
        if (isdefined(item.struct.weapon) && self [[ level.has_weapon_variation ]](item.struct.weapon)) {
            if (isdefined(level.get_weapon_level_func)) {
                var_ceb40e0d9504f27a = self [[ level.get_weapon_level_func ]](item.struct.weapon);
                if (var_ceb40e0d9504f27a > 1) {
                    cost = 4500;
                } else {
                    cost = item.cost * 0.5;
                }
            } else {
                cost = item.cost * 0.5;
            }
        }
    }
    if (namespace_6c67e93a4c487d83::player_has_enough_currency(cost) || istrue(item.enabled)) {
        return "outline_depth_cyan";
    }
    return "outline_depth_red";
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x702
// Size: 0x94
function playeroutlinemonitor() {
    self endon("disconnect");
    while (true) {
        foreach (player in level.players) {
            if (self == player) {
                continue;
            }
            if (should_put_player_outline_on(player)) {
                enable_outline_for_player(player, self, get_hudoutline_for_player_health(player), "high");
                continue;
            }
            disable_outline_for_player(player, self);
        }
        wait 0.2;
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79e
// Size: 0xa6
function should_put_player_outline_on(player) {
    if (istrue(self.no_team_outlines)) {
        return 0;
    }
    if (!isalive(player) || !isdefined(player.maxhealth) || !player.maxhealth || player.no_outline) {
        return 0;
    }
    var_a23e3656c612a7a7 = distancesquared(self.origin, player.origin) > 2250000;
    if (var_a23e3656c612a7a7) {
        return 1;
    }
    var_c3579bdec26ccb2d = !scripts\engine\trace::_bullet_trace_passed(self geteye(), player geteye(), 0, self);
    return var_c3579bdec26ccb2d;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84d
// Size: 0x6e
function get_hudoutline_for_player_health(player) {
    var_9e6ee1f61a6e0cbf = player.health / 100;
    if (var_9e6ee1f61a6e0cbf <= 0.33 || namespace_d4aab8c9cb8ecb14::player_in_laststand(player)) {
        return "outline_nodepth_red";
    }
    if (var_9e6ee1f61a6e0cbf <= 0.66) {
        return "outline_nodepth_orange";
    }
    if (var_9e6ee1f61a6e0cbf <= 1) {
        return "outline_nodepth_cyan";
    }
    return "outline_nodepth_white";
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8c3
// Size: 0x2c
function enable_outline_for_players(item, players, hudoutlineassetname, priority) {
    item hudoutlineenableforclients(players, hudoutlineassetname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8f7
// Size: 0x2c
function enable_outline_for_player(item, player, hudoutlineassetname, priority) {
    item hudoutlineenableforclient(player, hudoutlineassetname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x92b
// Size: 0x1b
function disable_outline_for_players(item, players) {
    item hudoutlinedisableforclients(players);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x94e
// Size: 0x1b
function disable_outline_for_player(item, player) {
    item hudoutlinedisableforclient(player);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x971
// Size: 0x12
function disable_outline(item) {
    item hudoutlinedisable();
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x98b
// Size: 0x1b
function enable_outline(item, hudoutlineassetname) {
    item hudoutlineenable(hudoutlineassetname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ae
// Size: 0x12d
function set_outline(hudoutlineassetname) {
    level endon("game_ended");
    level endon("outline_disabled");
    if (!isdefined(hudoutlineassetname)) {
        hudoutlineassetname = "outline_nodepth_orange";
    }
    while (true) {
        ai_array = array_combine(level.agentarray, level.vehicle_ai_script_models);
        for (i = 0; i < ai_array.size; i++) {
            ai = ai_array[i];
            /#
                if (isdefined(ai.var_91a6849f0ee39fe7)) {
                    continue;
                }
            #/
            if (!isdefined(ai)) {
                continue;
            }
            if (isagent(ai) && !isalive(ai)) {
                continue;
            }
            if (isdefined(ai.damaged_by_players)) {
                continue;
            }
            if (isdefined(ai.marked_for_challenge)) {
                continue;
            }
            if (isdefined(ai.team) && ai.team == "allies") {
                enable_outline_for_players(ai, level.players, "outline_nodepth_green", "high");
                continue;
            }
            enable_outline_for_players(ai, level.players, hudoutlineassetname, "high");
        }
        wait 0.5;
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae3
// Size: 0xbd
function unset_outline() {
    ai_array = scripts\cp\cp_agent_utils::getactiveenemyagents("allies");
    ai_array = array_combine(ai_array, level.vehicle_ai_script_models);
    foreach (enemy in ai_array) {
        /#
            if (isdefined(enemy.var_91a6849f0ee39fe7)) {
                continue;
            }
        #/
        if (isdefined(enemy.damaged_by_players)) {
            continue;
        }
        if (isdefined(enemy.marked_for_challenge)) {
            continue;
        }
        scripts\cp\cp_outline::disable_outline_for_players(enemy, level.players);
        level notify("outline_disabled");
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba8
// Size: 0x12e
function save_outline_settings() {
    var_90a7b8c1c3d338d2 = [@"r_hudoutlineFillColor0", @"r_hudoutlineFillColor1", @"hash_3bb847d049003050", @"r_hudoutlineOccludedOutlineColor", @"r_hudoutlineOccludedInlineColor", @"r_hudoutlineOccludedInteriorColor", @"r_hudOutlineOccludedColorFromFill", @"hash_79a0c60ce3306d67", @"hash_79a0c50ce3306b34", @"hash_79a0c80ce33071cd", @"hash_79a0c70ce3306f9a", @"hash_79a0c20ce330649b", @"hash_79a0c10ce3306268", @"hash_79a0c40ce3306901"];
    if (!isdefined(level.hudoutlinesettings)) {
        level.hudoutlinesettings = [];
    }
    foreach (var_885448f843aa6aa3 in var_90a7b8c1c3d338d2) {
        level.hudoutlinesettings[var_885448f843aa6aa3] = getdvar(var_885448f843aa6aa3);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcde
// Size: 0x125
function restore_outline_settings() {
    var_90a7b8c1c3d338d2 = [@"r_hudoutlineFillColor0", @"r_hudoutlineFillColor1", @"hash_3bb847d049003050", @"r_hudoutlineOccludedOutlineColor", @"r_hudoutlineOccludedInlineColor", @"r_hudoutlineOccludedInteriorColor", @"r_hudOutlineOccludedColorFromFill", @"hash_79a0c60ce3306d67", @"hash_79a0c50ce3306b34", @"hash_79a0c80ce33071cd", @"hash_79a0c70ce3306f9a", @"hash_79a0c20ce330649b", @"hash_79a0c10ce3306268", @"hash_79a0c40ce3306901"];
    if (!isdefined(level.hudoutlinesettings)) {
        return;
    }
    foreach (var_885448f843aa6aa3 in var_90a7b8c1c3d338d2) {
        setdvar(var_885448f843aa6aa3, level.hudoutlinesettings[var_885448f843aa6aa3]);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe0b
// Size: 0x1c
function hudoutline_enable(hudoutlineassetname, channelname) {
    hudoutline_enable_internal(channelname, hudoutlineassetname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe2f
// Size: 0x13
function hudoutline_disable(channelname) {
    hudoutline_disable_internal(channelname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe4a
// Size: 0xa1
function hudoutline_channels_init() {
    if (!isdefined(level.fnhudoutlinedefaultsettings)) {
        level.fnhudoutlinedefaultsettings = &hudoutline_default_settings;
    }
    level.hudoutlinechannels = [];
    hudoutline_add_channel_internal("default", 0, level.fnhudoutlinedefaultsettings);
    setsaveddvar(@"hash_5f5c12c95c44f093", 1);
    var_2fbecf4cb1adff1a = [[ level.fnhudoutlinedefaultsettings ]]();
    for (i = 0; i < 8; i++) {
        dvarstr = hashcat(@"hash_1429c8e20321bbcd", i);
        setsaveddvar(dvarstr, var_2fbecf4cb1adff1a[dvarstr]);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xef3
// Size: 0x200
function hudoutline_enable_internal(channelname, hudoutlineassetname) {
    if (!isdefined(channelname)) {
        channelname = "default";
    }
    if (!isdefined(level.hudoutlinechannels)) {
        hudoutline_channels_init();
    }
    if (hudoutline_is_ent_in_channel(channelname, self)) {
        hudoutline_update_entinfo(channelname, self, hudoutlineassetname);
    } else {
        size = level.hudoutlinechannels[channelname].entinfos.size;
        level.hudoutlinechannels[channelname].entinfos[size] = hudoutline_create_entinfo(self, hudoutlineassetname);
        thread hudoutline_disable_on_death(channelname);
    }
    if (!isdefined(level.hudoutlinechannels[channelname].parentchannel)) {
        if (!isdefined(level.hudoutlinecurchannel)) {
            hudoutline_activate_channel(channelname);
        }
        var_a948959983e82f10 = level.hudoutlinechannels[level.hudoutlinecurchannel].priority;
        var_c8446d6318008d2c = level.hudoutlinechannels[channelname].priority;
        if (level.hudoutlinecurchannel != channelname && var_a948959983e82f10 < var_c8446d6318008d2c) {
            hudoutline_activate_channel(channelname);
        } else if (level.hudoutlinecurchannel == channelname) {
            _enable_hudoutline_on_ent(self, hudoutlineassetname, channelname);
        }
        return;
    }
    var_f264487ee10b8afb = level.hudoutlinechannels[channelname].parentchannel;
    if (!isdefined(level.hudoutlinecurchannel)) {
        hudoutline_activate_channel(var_f264487ee10b8afb);
    }
    var_a948959983e82f10 = level.hudoutlinechannels[level.hudoutlinecurchannel].priority;
    var_6e14ef69641c92f0 = level.hudoutlinechannels[var_f264487ee10b8afb].priority;
    if (level.hudoutlinecurchannel != var_f264487ee10b8afb && var_a948959983e82f10 < var_6e14ef69641c92f0) {
        hudoutline_activate_channel(var_f264487ee10b8afb);
        return;
    }
    if (level.hudoutlinecurchannel == var_f264487ee10b8afb) {
        _enable_hudoutline_on_ent(self, hudoutlineassetname, var_f264487ee10b8afb);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10fb
// Size: 0x319
function hudoutline_disable_internal(channelname) {
    if (!isdefined(channelname)) {
        channelname = "default";
    }
    if (!isdefined(level.hudoutlinechannels)) {
        return;
    }
    if (isdefined(self)) {
        self notify(channelname + "hudoutline_disable");
    }
    index = undefined;
    foreach (i, entinfo in level.hudoutlinechannels[channelname].entinfos) {
        if (!isdefined(entinfo.ent)) {
            level.hudoutlinechannels[channelname].entinfos[i] = undefined;
            continue;
        }
        if (entinfo.ent == self) {
            index = i;
            level.hudoutlinechannels[channelname].entinfos[index] = undefined;
            break;
        }
    }
    newarray = [];
    foreach (item in level.hudoutlinechannels[channelname].entinfos) {
        if (!isdefined(item)) {
            continue;
        }
        newarray[newarray.size] = item;
    }
    level.hudoutlinechannels[channelname].entinfos = newarray;
    if (!isdefined(level.hudoutlinecurchannel)) {
        return;
    }
    if (level.hudoutlinecurchannel == channelname) {
        if (isdefined(index)) {
            _disable_hudoutline_on_ent(self, channelname);
        }
        if (level.hudoutlinechannels[channelname].entinfos.size == 0) {
            var_cc5203b08eca3491 = 0;
            if (isdefined(level.hudoutlinechannels[channelname].childchannels) && level.hudoutlinechannels[channelname].childchannels.size > 0) {
                foreach (var_60df37833e14382b in level.hudoutlinechannels[channelname].childchannels) {
                    if (level.hudoutlinechannels[var_60df37833e14382b].entinfos.size > 0) {
                        var_cc5203b08eca3491 = 1;
                        break;
                    }
                }
            }
            if (!var_cc5203b08eca3491) {
                hudoutline_activate_best_channel();
            }
        }
        return;
    }
    if (isdefined(level.hudoutlinechannels[channelname].parentchannel) && level.hudoutlinecurchannel == level.hudoutlinechannels[channelname].parentchannel) {
        var_f264487ee10b8afb = level.hudoutlinechannels[channelname].parentchannel;
        if (isdefined(index)) {
            _disable_hudoutline_on_ent(self, var_f264487ee10b8afb);
        }
        if (level.hudoutlinechannels[channelname].entinfos.size == 0) {
            hudoutline_activate_best_channel();
        }
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141c
// Size: 0x22f
function hudoutline_activate_best_channel() {
    bestpriority = undefined;
    var_d5b1a99d32c8445a = undefined;
    if (isdefined(level.hudoutlineforcedchannels) && level.hudoutlineforcedchannels.size > 0) {
        foreach (channel in level.hudoutlineforcedchannels) {
            if (!isdefined(bestpriority) || level.hudoutlinechannels[channel].priority > bestpriority) {
                bestpriority = level.hudoutlinechannels[channel].priority;
                var_d5b1a99d32c8445a = channel;
            }
        }
    } else {
        foreach (channel in level.hudoutlinechannels) {
            if (isdefined(channel.parentchannel)) {
                continue;
            }
            if (!isdefined(channel.childchannels) || channel.childchannels.size == 0) {
                if (channel.entinfos.size == 0) {
                    continue;
                }
            } else {
                var_cc5203b08eca3491 = 0;
                if (channel.entinfos.size > 0) {
                    var_cc5203b08eca3491 = 1;
                }
                foreach (var_60df37833e14382b in channel.childchannels) {
                    if (level.hudoutlinechannels[var_60df37833e14382b].entinfos.size > 0) {
                        var_cc5203b08eca3491 = 1;
                    }
                }
                if (!var_cc5203b08eca3491) {
                    continue;
                }
            }
            if (!isdefined(bestpriority) || channel.priority > bestpriority) {
                bestpriority = channel.priority;
                var_d5b1a99d32c8445a = channel.channelname;
            }
        }
    }
    if (isdefined(var_d5b1a99d32c8445a)) {
        hudoutline_activate_channel(var_d5b1a99d32c8445a);
        return;
    }
    level.hudoutlinecurchannel = undefined;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1653
// Size: 0x3e
function hudoutline_create_entinfo(ent, hudoutlineassetname) {
    entinfo = spawnstruct();
    entinfo.ent = ent;
    entinfo.hudoutlineassetname = hudoutlineassetname;
    return entinfo;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x169a
// Size: 0x8d
function hudoutline_update_entinfo(channelname, ent, hudoutlineassetname) {
    foreach (entinfo in level.hudoutlinechannels[channelname].entinfos) {
        if (entinfo.ent == ent) {
            entinfo.hudoutlineassetname = hudoutlineassetname;
        }
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172f
// Size: 0xfc
function hudoutline_activate_channel(channelname) {
    if (isdefined(level.hudoutlinecurchannel) && level.hudoutlinecurchannel != channelname) {
        hudoutline_deactivate_channel(level.hudoutlinecurchannel);
        if (isdefined(level.hudoutlinechannels[level.hudoutlinecurchannel].childchannels) && level.hudoutlinechannels[level.hudoutlinecurchannel].childchannels.size > 0) {
            foreach (var_7a7097ccd9821dc8 in level.hudoutlinechannels[level.hudoutlinecurchannel].childchannels) {
                hudoutline_deactivate_channel(var_7a7097ccd9821dc8);
            }
        }
    }
    level.hudoutlinecurchannel = channelname;
    thread hudoutline_set_channel_settings_delayed(channelname);
    _enable_hudoutline_on_channel_ents(channelname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1833
// Size: 0xb6
function _enable_hudoutline_on_channel_ents(channelname) {
    var_bf39ce08d38cf891 = _get_sorted_list_of_channel_plus_child_channels(channelname);
    for (i = 0; i < var_bf39ce08d38cf891.size; i++) {
        foreach (entinfo in level.hudoutlinechannels[var_bf39ce08d38cf891[i]].entinfos) {
            ent = entinfo.ent;
            ent hudoutlineenable(entinfo.hudoutlineassetname);
        }
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18f1
// Size: 0x123
function _enable_hudoutline_on_ent(ent, hudoutlineassetname, var_f264487ee10b8afb) {
    if (!isdefined(level.hudoutlinechannels[var_f264487ee10b8afb].childchannels) || level.hudoutlinechannels[var_f264487ee10b8afb].childchannels.size == 0) {
        ent hudoutlineenable(hudoutlineassetname);
        return;
    }
    var_85db4751771acfdf = _get_sorted_list_of_channel_plus_child_channels(var_f264487ee10b8afb, 1);
    outlinedent = 0;
    for (i = 0; i < var_85db4751771acfdf.size; i++) {
        foreach (entinfo in level.hudoutlinechannels[var_85db4751771acfdf[i]].entinfos) {
            if (entinfo.ent == ent) {
                ent hudoutlineenable(entinfo.hudoutlineassetname);
                outlinedent = 1;
                break;
            }
        }
        if (outlinedent) {
            break;
        }
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x123
function _disable_hudoutline_on_ent(ent, var_f264487ee10b8afb) {
    if (!isdefined(level.hudoutlinechannels[var_f264487ee10b8afb].childchannels) || level.hudoutlinechannels[var_f264487ee10b8afb].childchannels.size == 0) {
        self hudoutlinedisable();
        return;
    }
    var_85db4751771acfdf = _get_sorted_list_of_channel_plus_child_channels(var_f264487ee10b8afb, 1);
    outlinedent = 0;
    for (i = 0; i < var_85db4751771acfdf.size; i++) {
        foreach (entinfo in level.hudoutlinechannels[var_85db4751771acfdf[i]].entinfos) {
            if (entinfo.ent == ent) {
                ent hudoutlineenable(entinfo.hudoutlineassetname);
                outlinedent = 1;
                break;
            }
        }
        if (outlinedent) {
            break;
        }
    }
    if (!outlinedent) {
        self hudoutlinedisable();
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b47
// Size: 0x103
function hudoutline_set_channel_settings_delayed(channelname) {
    level notify("hudoutline_new_channel_settings");
    level endon("hudoutline_new_channel_settings");
    wait 0.05;
    var_7d9521dcc3a9727 = [[ level.fnhudoutlinedefaultsettings ]]();
    var_790824f4cf462560 = [[ level.hudoutlinechannels[channelname].settingsfunc ]]();
    assertex(isdefined(var_790824f4cf462560), "hudoutline channel '" + channelname + "' does not have a proper settings function! See scripts/sp/outline::hudoutline_default_settings() for an example.");
    foreach (key, value in var_7d9521dcc3a9727) {
        if (isdefined(var_790824f4cf462560[key])) {
            setsaveddvar(key, var_790824f4cf462560[key]);
            continue;
        }
        setsaveddvar(key, value);
    }
    if (isdefined(level.hudoutlinechannels[channelname].loopingsettingsanimationfunc)) {
        play_animation_on_channel(channelname, level.hudoutlinechannels[channelname].loopingsettingsanimationfunc);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c52
// Size: 0x7d
function hudoutline_deactivate_channel(channelname) {
    foreach (entinfo in level.hudoutlinechannels[channelname].entinfos) {
        ent = entinfo.ent;
        ent hudoutlinedisable();
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd7
// Size: 0xbb
function hudoutline_add_channel_internal(channelname, priority, settingsfunc) {
    if (!isdefined(settingsfunc)) {
        settingsfunc = level.fnhudoutlinedefaultsettings;
    }
    if (!isdefined(level.hudoutlinechannels)) {
        hudoutline_channels_init();
    }
    if (!isdefined(level.hudoutlinechannels[channelname])) {
        level.hudoutlinechannels[channelname] = spawnstruct();
        level.hudoutlinechannels[channelname].channelname = channelname;
        level.hudoutlinechannels[channelname].priority = priority;
        level.hudoutlinechannels[channelname].settingsfunc = settingsfunc;
        level.hudoutlinechannels[channelname].entinfos = [];
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9a
// Size: 0x142
function hudoutline_add_child_channel_internal(channelname, priority, var_f264487ee10b8afb) {
    assertex(isdefined(level.hudoutlinechannels), "Tried to create a child hudoutline channel before any other channels were created!");
    assertex(isdefined(level.hudoutlinechannels[var_f264487ee10b8afb]), "Tried to create a child hudoutline channel of a parent channel that doesn't exist!");
    assertex(!isdefined(level.hudoutlinechannels[channelname]), "Tried to create a child hudoutline channel with a name that is already a channel!");
    if (!isdefined(level.hudoutlinechannels[channelname])) {
        level.hudoutlinechannels[channelname] = spawnstruct();
        level.hudoutlinechannels[channelname].channelname = channelname;
        level.hudoutlinechannels[channelname].priority = priority;
        level.hudoutlinechannels[channelname].entinfos = [];
        level.hudoutlinechannels[channelname].parentchannel = var_f264487ee10b8afb;
    }
    if (!isdefined(level.hudoutlinechannels[var_f264487ee10b8afb].childchannels)) {
        level.hudoutlinechannels[var_f264487ee10b8afb].childchannels = [];
    }
    level.hudoutlinechannels[var_f264487ee10b8afb].childchannels[level.hudoutlinechannels[var_f264487ee10b8afb].childchannels.size] = channelname;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee4
// Size: 0x4f
function hudoutline_override_channel_settingsfunc(channelname, settingsfunc) {
    level.hudoutlinechannels[channelname].settingsfunc = settingsfunc;
    if (isdefined(level.hudoutlinecurchannel) && level.hudoutlinecurchannel == channelname) {
        thread hudoutline_set_channel_settings_delayed(channelname);
    }
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3b
// Size: 0x7c
function hudoutline_is_ent_in_channel(channelname, ent) {
    foreach (entinfo in level.hudoutlinechannels[channelname].entinfos) {
        if (entinfo.ent == ent) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc0
// Size: 0x10b
function hudoutline_force_channel_internal(channelname, var_c3f2838383281c9d) {
    if (!isdefined(level.hudoutlineforcedchannels)) {
        level.hudoutlineforcedchannels = [];
    }
    if (var_c3f2838383281c9d) {
        foreach (channel in level.hudoutlineforcedchannels) {
            if (channel == channelname) {
                return;
            }
        }
        level.hudoutlineforcedchannels[level.hudoutlineforcedchannels.size] = channelname;
        hudoutline_activate_best_channel();
        return;
    }
    var_371d23793a6fc9ed = [];
    foreach (channel in level.hudoutlineforcedchannels) {
        if (channel != channelname) {
            var_371d23793a6fc9ed[var_371d23793a6fc9ed.size] = channel;
        }
    }
    level.hudoutlineforcedchannels = var_371d23793a6fc9ed;
    hudoutline_activate_best_channel();
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20d3
// Size: 0x42
function hudoutline_disable_on_death(channelname, endonmsg) {
    if (isdefined(endonmsg)) {
        self endon("endonMsg");
    }
    self endon(channelname + "hudoutline_disable");
    scripts\engine\utility::waittill_any_2("death", "entitydeleted");
    thread hudoutline_disable_internal(channelname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x211d
// Size: 0x59
function play_animation_on_channel(channelname, var_4706652761de8d03) {
    if (!isdefined(level.hudoutlinecurchannel) || level.hudoutlinecurchannel != channelname) {
        return;
    }
    level notify("hudoutline_new_anim_on_channel_" + channelname);
    level endon("hudoutline_new_channel_settings");
    level endon("hudoutline_new_anim_on_channel_" + channelname);
    level [[ var_4706652761de8d03 ]]();
    thread hudoutline_set_channel_settings_delayed(channelname);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x217e
// Size: 0x51
function play_animation_on_channel_loop(channelname, var_4706652761de8d03) {
    level.hudoutlinechannels[channelname].loopingsettingsanimationfunc = var_4706652761de8d03;
    if (!isdefined(level.hudoutlinecurchannel) || level.hudoutlinecurchannel != channelname) {
        return;
    }
    play_animation_on_channel(channelname, var_4706652761de8d03);
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d7
// Size: 0x189
function hudoutline_default_settings() {
    hudoutlinesettings = [];
    if (isdefined(level.player.ar_callout_ent)) {
        var_5b660a4c678bd6af = length2d(level.player.origin - level.player.ar_callout_ent.origin);
        var_7803cce2b397156d = clamp(var_5b660a4c678bd6af / 1000, 1, 2);
        hudoutlinesettings[@"hash_3bb847d049003050"] = var_7803cce2b397156d;
    } else {
        hudoutlinesettings[@"hash_3bb847d049003050"] = 1;
    }
    hudoutlinesettings[@"r_hudoutlineFillColor0"] = "0.9 0.9 0.9 0.5";
    hudoutlinesettings[@"r_hudoutlineFillColor1"] = "0.3 0.3 0.3 0.5";
    hudoutlinesettings[@"r_hudoutlineOccludedOutlineColor"] = "1 1 1 1";
    hudoutlinesettings[@"r_hudoutlineOccludedInlineColor"] = "1 1 1 0.45";
    hudoutlinesettings[@"r_hudoutlineOccludedInteriorColor"] = ".7 .7 .7 0.25";
    hudoutlinesettings[@"r_hudOutlineOccludedColorFromFill"] = 1;
    hudoutlinesettings[@"hash_79a0c60ce3306d67"] = "0.000 0.000 0.000 0.000";
    hudoutlinesettings[@"hash_79a0c50ce3306b34"] = "0.882 0.882 0.882 1.000";
    hudoutlinesettings[@"hash_79a0c80ce33071cd"] = "0.945 0.384 0.247 1.000";
    hudoutlinesettings[@"hash_79a0c70ce3306f9a"] = "0.431 0.745 0.235 1.000";
    hudoutlinesettings[@"hash_79a0c20ce330649b"] = "0.157 0.784 0.784 1.000";
    hudoutlinesettings[@"hash_79a0c10ce3306268"] = "0.886 0.600 0.000 1.000";
    hudoutlinesettings[@"hash_79a0c40ce3306901"] = "0.000 0.000 0.000 1.000";
    hudoutlinesettings[@"hash_79a0c30ce33066ce"] = "1.000 0.300 0.300 1.000";
    return hudoutlinesettings;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2369
// Size: 0x1a2
function _get_sorted_list_of_channel_plus_child_channels(channelname, var_3193fe90fa9f2e6f) {
    if (!isdefined(var_3193fe90fa9f2e6f)) {
        var_3193fe90fa9f2e6f = 0;
    }
    var_778d8e547335493f = [];
    var_778d8e547335493f[0] = channelname;
    if (isdefined(level.hudoutlinechannels[channelname].childchannels) && level.hudoutlinechannels[channelname].childchannels.size > 0) {
        foreach (var_7a7097ccd9821dc8 in level.hudoutlinechannels[channelname].childchannels) {
            if (level.hudoutlinechannels[var_7a7097ccd9821dc8].entinfos.size > 0) {
                for (i = 0; i < var_778d8e547335493f.size; i++) {
                    if (!var_3193fe90fa9f2e6f) {
                        if (level.hudoutlinechannels[var_778d8e547335493f[i]].priority >= level.hudoutlinechannels[var_7a7097ccd9821dc8].priority) {
                            var_778d8e547335493f = outline_array_insert(var_778d8e547335493f, var_7a7097ccd9821dc8, i);
                            break;
                        } else if (i + 1 == var_778d8e547335493f.size) {
                            var_778d8e547335493f[i + 1] = var_7a7097ccd9821dc8;
                            break;
                        }
                        continue;
                    }
                    if (level.hudoutlinechannels[var_778d8e547335493f[i]].priority < level.hudoutlinechannels[var_7a7097ccd9821dc8].priority) {
                        var_778d8e547335493f = outline_array_insert(var_778d8e547335493f, var_7a7097ccd9821dc8, i);
                        break;
                    }
                    if (i + 1 == var_778d8e547335493f.size) {
                        var_778d8e547335493f[i + 1] = var_7a7097ccd9821dc8;
                        break;
                    }
                }
            }
        }
    }
    return var_778d8e547335493f;
}

// Namespace namespace_a10547072d518793 / scripts\cp\cp_outline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2514
// Size: 0x77
function outline_array_insert(array, object, index) {
    if (index == array.size) {
        temp = array;
        temp[temp.size] = object;
        return temp;
    }
    temp = [];
    offset = 0;
    for (i = 0; i < array.size; i++) {
        if (i == index) {
            temp[i] = object;
            offset = 1;
        }
        temp[i + offset] = array[i];
    }
    return temp;
}
