#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp\coop_personal_ents.gsc;
#using script_71332a5b74214116;
#using script_74502a9e0ef1f19c;
#using scripts\cp\perks\cp_prestige.gsc;
#using script_3bcaa2cbaf54abdd;
#using scripts\engine\trace.gsc;

#namespace namespace_f9c64c25bc77fb95;

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13bd
// Size: 0xb
function coop_interaction_pregame() {
    level thread assign_trigger_on_player_spawned();
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13d0
// Size: 0x57f
function init() {
    level thread assign_trigger_on_player_spawned();
    flag_init("init_interaction_done");
    if (flag_exist("init_spawn_volumes_done")) {
        flag_wait("init_spawn_volumes_done");
    }
    if (flag_exist("strike_init_done")) {
        flag_wait("strike_init_done");
    }
    level.interactions = [];
    level.interaction_hintstrings = [];
    level.all_interaction_structs = getstructarray("interaction", "targetname");
    level.current_interaction_structs = level.all_interaction_structs;
    level.weapon_hint_func = &default_weapon_hint_func;
    level thread interaction_sound_monitor();
    if (isdefined(level.gametype_interaction_func)) {
        [[ level.gametype_interaction_func ]]();
    }
    if (isdefined(level.deployable_box_interaction)) {
        [[ level.deployable_box_interaction ]]();
    }
    if (isdefined(level.map_interaction_func)) {
        [[ level.map_interaction_func ]]();
    }
    if (isdefined(level.weapon_upgrade_interaction)) {
        [[ level.weapon_upgrade_interaction ]]();
    }
    if (isdefined(level.init_personal_ent_zones)) {
        level [[ level.init_personal_ent_zones ]]();
    }
    foreach (var_df071553d0996ff9 in level.current_interaction_structs) {
        var_df071553d0996ff9.in_array = 1;
        if (!isdefined(var_df071553d0996ff9.angles)) {
            var_df071553d0996ff9.angles = (0, 0, 0);
        }
        var_df071553d0996ff9.targetmodels = [];
        if (!isdefined(var_df071553d0996ff9.script_parameters)) {
            var_df071553d0996ff9.script_parameters = "default";
        }
        if (var_df071553d0996ff9.script_parameters == "requires_power") {
            var_df071553d0996ff9.requires_power = 1;
            var_df071553d0996ff9.powered_on = 0;
            var_df071553d0996ff9.power_area = get_area_for_power(var_df071553d0996ff9);
        } else {
            var_df071553d0996ff9.requires_power = 0;
            var_df071553d0996ff9.powered_on = 0;
        }
        if (isdefined(level.interactions[var_df071553d0996ff9.script_noteworthy]) && istrue(level.interactions[var_df071553d0996ff9.script_noteworthy].is_p_ent)) {
            scripts\cp\coop_personal_ents::addtopersonalinteractionlist(var_df071553d0996ff9);
        }
    }
    if (getdvarint(@"hash_ca862f7c198bc459", 0) == 0) {
        level thread drop_interaction_structs_to_ground();
    }
    keys = getarraykeys(level.interactions);
    for (i = 0; i < keys.size; i++) {
        if (isdefined(level.interactions[keys[i]].init_func)) {
            structarray = getstructarray(keys[i], "script_noteworthy");
            level thread [[ level.interactions[keys[i]].init_func ]](structarray);
        }
    }
    foreach (var_df071553d0996ff9 in level.current_interaction_structs) {
        if (isdefined(level.interactions[var_df071553d0996ff9.script_noteworthy]) && isdefined(level.interactions[var_df071553d0996ff9.script_noteworthy].useduration)) {
            var_df071553d0996ff9.useduration = level.interactions[var_df071553d0996ff9.script_noteworthy].useduration;
        } else {
            var_df071553d0996ff9.useduration = "duration_short";
        }
        if (isdefined(var_df071553d0996ff9.script_modelname)) {
            if (isdefined(var_df071553d0996ff9.target)) {
                var_2632cf7dfde3c0a5 = getstructarray(var_df071553d0996ff9.target, "targetname");
                foreach (target_struct in var_2632cf7dfde3c0a5) {
                    if (!isdefined(target_struct.script_noteworthy) || tolower(target_struct.script_noteworthy) != "scenenode" && tolower(target_struct.script_noteworthy) != "manual_script_model") {
                        thread spawninteractionmodel(var_df071553d0996ff9, target_struct);
                    }
                }
                continue;
            }
            if (isdefined(var_df071553d0996ff9.script_noteworthy) && tolower(var_df071553d0996ff9.script_noteworthy) != "scenenode") {
                thread spawninteractionmodel(var_df071553d0996ff9, var_df071553d0996ff9);
            }
        }
    }
    flag_set("init_interaction_done");
    foreach (player in level.players) {
        curweapon = player getcurrentweapon();
        if (isdefined(level.wave_num) && isdefined(curweapon)) {
            self.waveswithweapons = [level.wave_num][getcompleteweaponname(curweapon)];
        }
    }
    /#
        level thread function_985a0cba8e1c90e1();
    #/
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1957
// Size: 0xe1
function drop_interaction_structs_to_ground() {
    if (!flag_exist("wall_buy_setup_done")) {
        flag_init("wall_buy_setup_done");
    }
    if (!flag("wall_buy_setup_done")) {
        flag_wait("wall_buy_setup_done");
    }
    foreach (var_df071553d0996ff9 in level.all_interaction_structs) {
        if (isdefined(var_df071553d0996ff9.groupname) && var_df071553d0996ff9.groupname == "locOverride") {
            continue;
        }
        ground_pos = drop_to_ground(var_df071553d0996ff9.origin, 10, -200);
        var_df071553d0996ff9.origin = ground_pos + (0, 0, 1);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a40
// Size: 0x96
function get_area_for_power(var_df071553d0996ff9) {
    volumes = getentarray("spawn_volume", "targetname");
    foreach (volume in volumes) {
        if (ispointinvolume(var_df071553d0996ff9.origin, volume)) {
            if (isdefined(volume.basename)) {
                return volume.basename;
            }
        }
    }
    return undefined;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1adf
// Size: 0x8b
function get_adjacent_volumes_from_volume() {
    if (isdefined(level.adjacent_volumes[self.basename])) {
        new_array = [];
        foreach (var_34950a0ead955410 in level.adjacent_volumes[self.basename]) {
            new_array[new_array.size] = level.spawn_volume_names[var_34950a0ead955410];
        }
        return new_array;
    }
    return [];
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b73
// Size: 0x8d
function is_in_adjacent_volume(volume) {
    if (!isdefined(volume)) {
        return false;
    }
    if (!isdefined(volume.adjacent_volumes)) {
        return false;
    }
    foreach (vol in volume.adjacent_volumes) {
        if (!vol.active) {
            continue;
        }
        if (self istouching(vol)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c09
// Size: 0x25
function release_interaction_ent(player) {
    player waittill("disconnect");
    self.in_use = 0;
    self notify("interaction_ent_released");
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c36
// Size: 0x8f
function assign_trigger_on_player_spawned() {
    level endon("game_ended");
    while (true) {
        level waittill("player_spawned", player);
        player.interaction_trigger = player get_player_interaction_trigger();
        if (!isdefined(player.interaction_trigger)) {
            iprintlnbold("NO TRIGGER FOUND!");
        }
        reset_interaction_triggers();
        player.last_interaction_point = undefined;
        player.interaction_trigger makeunusable();
        player thread release_player_interaction_trigger();
        player thread player_interaction_monitor();
        player thread player_interaction_weapon_switch_monitor();
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ccd
// Size: 0x4b
function player_interaction_weapon_switch_monitor() {
    self endon("disconnect");
    self endon("death");
    while (true) {
        waittill_any_3("weapon_switch_started", "weapon_change", "weaponchange");
        self.last_interaction_point = undefined;
        self.resetguidedinteraction = 1;
        self notify("stop_interaction_logic");
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d20
// Size: 0x64
function get_player_interaction_trigger() {
    if (isdefined(self.interaction_trigger)) {
        return self.interaction_trigger;
    }
    interaction_trigger = spawn("script_model", (0, 0, 0));
    interaction_trigger setmodel("tag_origin");
    interaction_trigger.in_use = 1;
    interaction_trigger thread deleteonplayerdeathdisconnect(self);
    return interaction_trigger;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8c
// Size: 0x34
function release_player_interaction_trigger() {
    trigger = self.interaction_trigger;
    waittill_any_2("death", "disconnect");
    trigger.in_use = 0;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc8
// Size: 0x4a
function registerinteraction(script_noteworthy, hint_func, activation_func, init_func, var_ad96ac0ec299e386, suseduration, var_5a9d289a0e9ac2d8) {
    namespace_a3902e911697e714::registerinteraction(script_noteworthy, hint_func, activation_func, init_func, var_ad96ac0ec299e386, suseduration, var_5a9d289a0e9ac2d8);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1a
// Size: 0x3c
function add_interaction_structs_to_interaction_arrays(structarray) {
    level.current_interaction_structs = array_combine(level.current_interaction_structs, structarray);
    level.current_interaction_structs = array_remove_duplicates(level.current_interaction_structs);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x2b
function interactionhasactivation(var_df071553d0996ff9) {
    return istrue(level.interactions[var_df071553d0996ff9.script_noteworthy].noactivation);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x1e92
// Size: 0x6b
function register_interaction(script_noteworthy, spend_type, tutorial, hint_func, activation_func, var_ca8cdb622a3bcecb, requires_power, init_func, can_use_override_func, var_ad96ac0ec299e386, suseduration) {
    namespace_a3902e911697e714::registerinteraction(script_noteworthy, hint_func, activation_func, init_func, var_ad96ac0ec299e386, suseduration);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f05
// Size: 0x62
function reset_interaction_triggers() {
    foreach (player in level.players) {
        if (isdefined(player.interaction_trigger)) {
            hide_interaction_trigger_from_others(player);
        }
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f6f
// Size: 0x81
function hide_interaction_trigger_from_others(var_59805ff5786c34ad) {
    foreach (player in level.players) {
        if (player == var_59805ff5786c34ad) {
            var_59805ff5786c34ad.interaction_trigger enableplayeruse(var_59805ff5786c34ad);
            continue;
        }
        var_59805ff5786c34ad.interaction_trigger disableplayeruse(player);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff8
// Size: 0x53
function wherethehellami(player, trigger) {
    while (true) {
        thread draw_capsule(trigger.origin, 12, 12, trigger.angles, (1, 1, 0), 0, 1);
        wait 0.05;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2053
// Size: 0xc
function no_previous_interaction_point() {
    return isdefined(self.last_interaction_point);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2068
// Size: 0x16
function interaction_point_has_changed(var_ac3dc6cf8564e576) {
    return self.last_interaction_point != var_ac3dc6cf8564e576;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2087
// Size: 0x9d
function player_interaction_monitor() {
    self notify("player_interaction_monitor");
    self endon("player_interaction_monitor");
    self endon("disconnect");
    self endon("death");
    if (flag_exist("init_interaction_done")) {
        flag_wait("init_interaction_done");
    } else {
        while (!isdefined(level.current_interaction_structs)) {
            wait 1;
        }
    }
    /#
        if (getdvarint(@"hash_ea23b78eb72018ca", 0) == 1) {
            self.interaction_trigger thread wherethehellami(self, self.interaction_trigger);
        }
    #/
    if (isdefined(level.player_interaction_monitor)) {
        self thread [[ level.player_interaction_monitor ]]();
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x212c
// Size: 0x5d
function flash_inventory() {
    self endon("window_trap_placed");
    self endon("death");
    if (!isdefined(self.next_inventory_flash)) {
        self.next_inventory_flash = gettime() + 2500;
    } else if (gettime() < self.next_inventory_flash) {
        return;
    }
    self.next_inventory_flash = gettime() + 2500;
    wait 1.5;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2191
// Size: 0xf7
function can_use_interaction(var_ac3dc6cf8564e576) {
    if (!isdefined(var_ac3dc6cf8564e576)) {
        return false;
    }
    if (istrue(self.iscarrying)) {
        return false;
    }
    if (istrue(var_ac3dc6cf8564e576.disabled) || !areinteractionsenabled()) {
        return false;
    }
    if (istrue(var_ac3dc6cf8564e576.awaitingpent)) {
        return false;
    }
    if (self secondaryoffhandbuttonpressed() || self isthrowinggrenade() || self fragbuttonpressed()) {
        return false;
    }
    if (!self isonground()) {
        return false;
    }
    if (!isdefined(var_ac3dc6cf8564e576.script_noteworthy)) {
        thread debugremoveinteractionandsendmessage(var_ac3dc6cf8564e576, "interaction_struct Struct at: " + var_ac3dc6cf8564e576.origin + " does not have a .script_noteworthy defined.");
        return false;
    }
    if (!isdefined(level.interactions[var_ac3dc6cf8564e576.script_noteworthy])) {
        thread debugremoveinteractionandsendmessage(var_ac3dc6cf8564e576, "interaction_struct Struct at: " + var_ac3dc6cf8564e576.origin + " with .script_noteworthy: " + var_ac3dc6cf8564e576.script_noteworthy + " has not been registered as an interaction_struct");
        return false;
    }
    return true;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2291
// Size: 0x7b
function debugremoveinteractionandsendmessage(var_df071553d0996ff9, message) {
    /#
        println("<dev string:x1c>");
        println("<dev string:x95>");
        println(message);
        println("<dev string:xa2>");
        println("<dev string:xe3>" + level.script);
        println("<dev string:xeb>" + level.gametype);
        println("<dev string:x1c>");
        remove_from_current_interaction_list(var_df071553d0996ff9);
    #/
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2314
// Size: 0x28
function reset_interaction() {
    self endon("disconnect");
    wait 0.2;
    self.interaction_trigger makeunusable();
    self.last_interaction_point = undefined;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2344
// Size: 0x3d3
function set_interaction_point(var_ac3dc6cf8564e576, var_9883d93111fd5ab9) {
    if (istrue(self.interaction_trigger.disableinteraction)) {
        return;
    }
    self notify("set_interaction_point");
    self.interaction_trigger dontinterpolate();
    self.last_interaction_point = var_ac3dc6cf8564e576;
    eye = self geteye();
    self.interaction_trigger.origin = (var_ac3dc6cf8564e576.origin[0], var_ac3dc6cf8564e576.origin[1], eye[2]);
    if (interactionhasactivation(var_ac3dc6cf8564e576)) {
        level thread [[ level.interactions[var_ac3dc6cf8564e576.script_noteworthy].activation_func ]](var_ac3dc6cf8564e576, self);
        return;
    }
    if (!isdefined(level.interactions[var_ac3dc6cf8564e576.script_noteworthy].spend_type)) {
        level.interactions[var_ac3dc6cf8564e576.script_noteworthy].spend_type = "null";
    }
    spend_type = level.interactions[var_ac3dc6cf8564e576.script_noteworthy].spend_type;
    var_8f8b25936fae5c37 = undefined;
    self.interaction_trigger makeusable();
    if (interaction_is_weapon_buy(var_ac3dc6cf8564e576)) {
        if (!namespace_a0628d6954815ef8::has_weapon_variation(var_ac3dc6cf8564e576.script_noteworthy)) {
            var_8881dc0ed6701cdf = getweaponnamestring(var_ac3dc6cf8564e576.script_noteworthy);
            var_4ab7947cf9474481 = getweaponcostint(var_ac3dc6cf8564e576.script_noteworthy);
            self.interaction_trigger sethintstringparams(var_8881dc0ed6701cdf, var_4ab7947cf9474481);
        }
    } else if (interaction_is_floor_is_lava_client(var_ac3dc6cf8564e576)) {
        var_dc4f149f969d05af = strtok(var_ac3dc6cf8564e576.name, "_");
        num = int(var_dc4f149f969d05af[1]);
        self.interaction_trigger sethintstringparams(num);
    } else if (interaction_is_jugg_maze_button(var_ac3dc6cf8564e576)) {
        a = getjuggmazebutton(var_ac3dc6cf8564e576.script_label);
        switch (var_ac3dc6cf8564e576.script_noteworthy) {
        case #"hash_ee9888957c53cd6d":
            self.interaction_trigger sethintstringparams(a);
            break;
        }
    } else if (interaction_is_chess_piece(var_ac3dc6cf8564e576)) {
        a = getalphabetstring(level.currentalphanumericcode[0]);
        b = getalphabetstring(level.currentalphanumericcode[1]);
        c = getnumberstring(level.currentalphanumericcode[2]);
        switch (var_ac3dc6cf8564e576.script_noteworthy) {
        case #"hash_cea00219c45f45b":
            self.interaction_trigger sethintstringparams(a);
            break;
        case #"hash_9eafc3040785fe7e":
            self.interaction_trigger sethintstringparams(b);
            break;
        case #"hash_db37e69d86c806dc":
            self.interaction_trigger sethintstringparams(c);
            break;
        }
    } else if (interaction_is_weapon_pickup(var_ac3dc6cf8564e576)) {
        set_weapon_interaction_string(var_ac3dc6cf8564e576, self);
    } else if (interaction_is_trap(var_ac3dc6cf8564e576)) {
        self.interaction_trigger.origin = (var_ac3dc6cf8564e576.origin[0], var_ac3dc6cf8564e576.origin[1], eye[2] - 15);
    }
    set_interaction_trigger_properties(self.interaction_trigger, var_ac3dc6cf8564e576);
    if (!isdefined(var_ac3dc6cf8564e576.suseduration)) {
        var_ac3dc6cf8564e576.suseduration = "duration_none";
    }
    if (!isdefined(var_9883d93111fd5ab9)) {
        thread wait_for_interaction_triggered(var_ac3dc6cf8564e576);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x271f
// Size: 0x26a
function getjuggmazebutton(var_8a4fc1dc1fd4995e) {
    if (getdvarint(@"hash_176fa03e6da10955", 0) != 0) {
        switch (var_8a4fc1dc1fd4995e) {
        case #"hash_31105fbc01bdb66c":
            return %CP_RAID_COMPLEX_JUGG_MAZE/STABILIZE_PRESSURE_X1;
        case #"hash_311062bc01bdbb25":
            return %CP_RAID_COMPLEX_JUGG_MAZE/STABILIZE_PRESSURE_X2;
        case #"hash_311061bc01bdb992":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X1;
        case #"hash_31105cbc01bdb1b3":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X2;
        case #"hash_31105bbc01bdb020":
            return %CP_RAID_COMPLEX_JUGG_MAZE/MIX_GAUGE_X2_TO_X1;
        case #"hash_31105ebc01bdb4d9":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_X1;
        case #"hash_31105dbc01bdb346":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_X2;
        case #"hash_311068bc01bdc497":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DEPLOY_READINGS;
        case #"hash_311067bc01bdc304":
            return %CP_RAID_COMPLEX_JUGG_MAZE/MIX_GAUGE_X1_TO_X2;
        case #"hash_31106abc01bdc7bd":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DISPLAY_READINGS;
        }
    }
    if (getdvarint(@"hash_da6b87817db1cba0", 0) != 0) {
        switch (var_8a4fc1dc1fd4995e) {
        case #"hash_31105fbc01bdb66c":
            return %CP_RAID_COMPLEX_JUGG_MAZE/SW_POLE_X1;
        case #"hash_311062bc01bdbb25":
            return %CP_RAID_COMPLEX_JUGG_MAZE/SW_POLE_X2;
        case #"hash_311061bc01bdb992":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X1;
        case #"hash_31105cbc01bdb1b3":
            return %CP_RAID_COMPLEX_JUGG_MAZE/INCREMENT_X2;
        case #"hash_31105bbc01bdb020":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RESET_GAUGES;
        case #"hash_31105ebc01bdb4d9":
            return %CP_RAID_COMPLEX_JUGG_MAZE/ADJUST_INCR_X1;
        case #"hash_31105dbc01bdb346":
            return %CP_RAID_COMPLEX_JUGG_MAZE/ADJUST_INCR_X2;
        case #"hash_311068bc01bdc497":
            return %CP_RAID_COMPLEX_JUGG_MAZE/LOCK_FUEL_VALS;
        case #"hash_311067bc01bdc304":
            return %CP_RAID_COMPLEX_JUGG_MAZE/RANDOMIZE;
        case #"hash_31106abc01bdc7bd":
            return %CP_RAID_COMPLEX_JUGG_MAZE/DISPLAY_READINGS;
        }
    }
    switch (var_8a4fc1dc1fd4995e) {
    case #"hash_31105fbc01bdb66c":
        return %CP_RAID_COMPLEX_JUGG_MAZE/A;
    case #"hash_311062bc01bdbb25":
        return %CP_RAID_COMPLEX_JUGG_MAZE/B;
    case #"hash_311061bc01bdb992":
        return %CP_RAID_COMPLEX_JUGG_MAZE/C;
    case #"hash_31105cbc01bdb1b3":
        return %CP_RAID_COMPLEX_JUGG_MAZE/D;
    case #"hash_31105bbc01bdb020":
        return %CP_RAID_COMPLEX_JUGG_MAZE/E;
    case #"hash_31105ebc01bdb4d9":
        return %CP_RAID_COMPLEX_JUGG_MAZE/F;
    case #"hash_31105dbc01bdb346":
        return %CP_RAID_COMPLEX_JUGG_MAZE/G;
    case #"hash_311068bc01bdc497":
        return %CP_RAID_COMPLEX_JUGG_MAZE/H;
    case #"hash_311067bc01bdc304":
        return %CP_RAID_COMPLEX_JUGG_MAZE/I;
    case #"hash_31106abc01bdc7bd":
        return %CP_RAID_COMPLEX_JUGG_MAZE/J;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2991
// Size: 0xfe
function getalphabetstring(var_8a4fc1dc1fd4995e) {
    switch (var_8a4fc1dc1fd4995e) {
    case #"hash_31105fbc01bdb66c":
        return %CP_LAB/A;
    case #"hash_311062bc01bdbb25":
        return %CP_LAB/B;
    case #"hash_311061bc01bdb992":
        return %CP_LAB/C;
    case #"hash_31105cbc01bdb1b3":
        return %CP_LAB/D;
    case #"hash_31105bbc01bdb020":
        return %CP_LAB/E;
    case #"hash_31105ebc01bdb4d9":
        return %CP_LAB/F;
    case #"hash_31105dbc01bdb346":
        return %CP_LAB/G;
    case #"hash_311068bc01bdc497":
        return %CP_LAB/H;
    case #"hash_311072bc01bdd455":
        return %CP_LAB/ROOK;
    case #"hash_311066bc01bdc171":
        return %CP_LAB/KNIGHT;
    case #"hash_31106fbc01bdcf9c":
        return %CP_LAB/QUEEN;
    case #"hash_311069bc01bdc62a":
        return %CP_LAB/KING;
    case #"hash_311070bc01bdd12f":
        return %CP_LAB/PAWN;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a97
// Size: 0xa4
function getnumberstring(number) {
    switch (number) {
    case #"hash_31100fbc01bd387c":
        return %CP_LAB/1;
    case #"hash_311012bc01bd3d35":
        return %CP_LAB/2;
    case #"hash_311011bc01bd3ba2":
        return %CP_LAB/3;
    case #"hash_31100cbc01bd33c3":
        return %CP_LAB/4;
    case #"hash_31100bbc01bd3230":
        return %CP_LAB/5;
    case #"hash_31100ebc01bd36e9":
        return %CP_LAB/6;
    case #"hash_31100dbc01bd3556":
        return %CP_LAB/7;
    case #"hash_311018bc01bd46a7":
        return %CP_LAB/8;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b43
// Size: 0x35
function set_weapon_interaction_string(var_ac3dc6cf8564e576, player) {
    var_96f1780c385b8c4f = get_weapon_name_string(var_ac3dc6cf8564e576);
    self.interaction_trigger sethintstringparams(var_96f1780c385b8c4f);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b80
// Size: 0x126
function get_weapon_name_string(var_ac3dc6cf8564e576) {
    switch (var_ac3dc6cf8564e576.name) {
    case #"hash_da6958311b58f75b":
        return %CP_LOOT_WEAPONS/PI_GOLF21;
    case #"hash_cfce2a2737ab1be6":
        return %CP_LOOT_WEAPONS/PI_MAGNUM;
    case #"hash_16a70270ad1be05":
        return %CP_LOOT_WEAPONS/SM_MPAPA5;
    case #"hash_c7149abad793a9b1":
        return %CP_LOOT_WEAPONS/SM_AUGOLF;
    case #"hash_1ca5befa8dd4212c":
    case #"hash_6e395906bcf5969a":
        return %CP_LOOT_WEAPONS/SM_PAPA90;
    case #"hash_1a3a5f8a962ed552":
        return %CP_LOOT_WEAPONS/AR_MIKE4;
    case #"hash_4da38b8f68dd24e9":
        return %CP_LOOT_WEAPONS/AR_AKILO47;
    case #"hash_7332dd92c8f8e421":
        return %CP_LOOT_WEAPONS/AR_AKILO47;
    case #"hash_b1d476fe8b4f829a":
        return %CP_LOOT_WEAPONS/AR_FALPHA;
    case #"hash_e1a2fa29b8332d53":
        return %CP_LOOT_WEAPONS/LM_KILO121;
    case #"hash_373244181c39a617":
        return %CP_LOOT_WEAPONS/LM_PKILO;
    case #"hash_b9e0da8080aefc13":
        return %CP_LOOT_WEAPONS/SN_MIKE14;
    case #"hash_720415103e03ae2":
        return %CP_LOOT_WEAPONS/SN_KILO98;
    case #"hash_5d0a7e04f70f7955":
        return %CP_LOOT_WEAPONS/SN_ALPHA50;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cae
// Size: 0x4f
function getweaponnamestring(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    base_weapon = getbaseweaponname(weaponname);
    if (!isdefined(base_weapon)) {
        return undefined;
    }
    if (isdefined(level.custom_weaponnamestring_func)) {
        return [[ level.custom_weaponnamestring_func ]](base_weapon, weaponname);
    }
    return %CP_ZMB_WEAPONS/GENERIC;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d05
// Size: 0x25
function getweaponcostint(weaponname) {
    return int(level.interactions[weaponname].cost);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d33
// Size: 0x18b
function set_interaction_trigger_properties(interaction_trigger, var_df071553d0996ff9) {
    hintstring = get_interaction_hintstring(var_df071553d0996ff9, self);
    if (isdefined(hintstring)) {
        self.interaction_trigger sethintstring(hintstring);
    }
    if (interaction_is_weapon_buy(var_df071553d0996ff9)) {
        if (isdefined(hintstring) && !isstring(hintstring) && hintstring == %COOP_INTERACTIONS/PURCHASE_AMMO) {
            var_9211cdaadb7bca55 = getrawbaseweaponname(var_df071553d0996ff9.script_noteworthy);
            weaponlevel = namespace_a0628d6954815ef8::get_weapon_level(var_9211cdaadb7bca55);
            var_8881dc0ed6701cdf = getweaponnamestring(var_df071553d0996ff9.script_noteworthy);
            if (weaponlevel > 1) {
                self.interaction_trigger sethintstringparams(int(4500), var_8881dc0ed6701cdf);
            } else {
                self.interaction_trigger sethintstringparams(int(0.5 * level.interactions[var_df071553d0996ff9.script_noteworthy].cost), var_8881dc0ed6701cdf);
            }
        }
    } else {
        self.interaction_trigger setusefov(160);
    }
    self.interaction_trigger setusepriority(1);
    if (isdefined(level.var_a30bd62e41e58a08) && isdefined(level.var_a30bd62e41e58a08[var_df071553d0996ff9.script_noteworthy])) {
        [[ level.var_a30bd62e41e58a08[var_df071553d0996ff9.script_noteworthy] ]](interaction_trigger, var_df071553d0996ff9, hintstring);
        return;
    }
    if (isdefined(level.interaction_trigger_properties_func)) {
        [[ level.interaction_trigger_properties_func ]](interaction_trigger, var_df071553d0996ff9, hintstring);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec6
// Size: 0xfc
function get_interaction_hintstring(var_df071553d0996ff9, player) {
    if (isdefined(level.interactions[var_df071553d0996ff9.script_noteworthy].hint_func)) {
        return [[ level.interactions[var_df071553d0996ff9.script_noteworthy].hint_func ]](var_df071553d0996ff9, player);
    }
    if (isdefined(var_df071553d0996ff9.cooling_down)) {
        return %COOP_INTERACTIONS/COOLDOWN;
    }
    if (istrue(var_df071553d0996ff9.requires_power) && !istrue(var_df071553d0996ff9.powered_on)) {
        return %COOP_INTERACTIONS/REQUIRES_POWER;
    }
    if (interaction_is_weapon_buy(var_df071553d0996ff9)) {
        if (!coop_mode_has("wall_buys")) {
            return undefined;
        }
    }
    if (!isdefined(level.interaction_hintstrings[var_df071553d0996ff9.script_noteworthy])) {
        println("<dev string:xf6>" + var_df071553d0996ff9.script_noteworthy);
        return "";
    }
    return level.interaction_hintstrings[var_df071553d0996ff9.script_noteworthy];
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fcb
// Size: 0x27
function wait_for_interaction_triggered(var_df071553d0996ff9) {
    if (isdefined(level.wait_for_interaction_func)) {
        self thread [[ level.wait_for_interaction_func ]](var_df071553d0996ff9);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ffa
// Size: 0x3a
function play_weapon_purchase_vo(var_df071553d0996ff9, player) {
    item = var_df071553d0996ff9.script_noteworthy;
    base_weapon = getweaponbasename(item);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x303c
// Size: 0x12d
function can_purchase_ammo(var_d4df17a1168ac8e2) {
    weapons = self getweaponslistall();
    var_c53c17f2d86bca58 = undefined;
    var_9211cdaadb7bca55 = undefined;
    var_fbc51cc04b895926 = getrawbaseweaponname(var_d4df17a1168ac8e2);
    foreach (weapon in weapons) {
        var_9211cdaadb7bca55 = getrawbaseweaponname(weapon);
        if (var_9211cdaadb7bca55 == var_fbc51cc04b895926) {
            var_c53c17f2d86bca58 = weapon;
            break;
        }
    }
    if (isdefined(var_c53c17f2d86bca58)) {
        var_de8a9ead75a0581 = self getweaponammostock(var_c53c17f2d86bca58);
        max_ammo = weaponmaxammo(var_c53c17f2d86bca58);
        var_629f6083f99f1d29 = scripts\cp\perks\cp_prestige::prestige_getminammo();
        var_db6891ee5a14d7aa = int(var_629f6083f99f1d29 * max_ammo);
        if (var_de8a9ead75a0581 < var_db6891ee5a14d7aa) {
            return true;
        } else if (weaponmaxammo(var_c53c17f2d86bca58) == weaponclipsize(var_c53c17f2d86bca58) && self getweaponammoclip(var_c53c17f2d86bca58) < weaponclipsize(var_c53c17f2d86bca58)) {
            return true;
        } else {
            return false;
        }
    }
    return true;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3172
// Size: 0x62
function interaction_post_activate_delay(var_df071553d0996ff9) {
    self endon("disconnect");
    if (interaction_is_button_mash(var_df071553d0996ff9)) {
        return;
    }
    if (interaction_is_door_buy(var_df071553d0996ff9)) {
        return;
    }
    if (interaction_is_atm(var_df071553d0996ff9)) {
        return;
    }
    if (interaction_is_chess_piece(var_df071553d0996ff9)) {
        return;
    }
    val::set("post_activate_delay", "interactions", 0);
    wait 1.5;
    val::reset_all("post_activate_delay");
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31dc
// Size: 0x12
function delayed_trigger_unset() {
    wait 0.25;
    self.triggered = undefined;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31f6
// Size: 0x6b
function addtointeractionslistbynoteworthy(noteworthy) {
    var_a28cb3eb323db0ae = getstructarray(noteworthy, "script_noteworthy");
    foreach (var_df071553d0996ff9 in var_a28cb3eb323db0ae) {
        add_to_current_interaction_list(var_df071553d0996ff9);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x6b
function removefrominteractionslistbynoteworthy(noteworthy) {
    var_a28cb3eb323db0ae = getstructarray(noteworthy, "script_noteworthy");
    foreach (var_df071553d0996ff9 in var_a28cb3eb323db0ae) {
        remove_from_current_interaction_list(var_df071553d0996ff9);
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32dc
// Size: 0x53
function remove_from_current_interaction_list(var_df071553d0996ff9) {
    var_df071553d0996ff9 notify("remove_from_current_interaction_list");
    var_df071553d0996ff9.in_array = 0;
    if (array_contains(level.current_interaction_structs, var_df071553d0996ff9)) {
        level.current_interaction_structs = array_remove(level.current_interaction_structs, var_df071553d0996ff9);
    }
    scripts\cp\coop_personal_ents::update_special_mode_for_all_players();
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3337
// Size: 0x54
function add_to_current_interaction_list(var_df071553d0996ff9) {
    var_df071553d0996ff9 notify("add_to_current_interaction_list");
    var_df071553d0996ff9.in_array = 1;
    if (!array_contains(level.current_interaction_structs, var_df071553d0996ff9)) {
        level.current_interaction_structs = array_add(level.current_interaction_structs, var_df071553d0996ff9);
    }
    scripts\cp\coop_personal_ents::update_special_mode_for_all_players();
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3393
// Size: 0x62
function remove_from_current_interaction_list_for_player(var_df071553d0996ff9, player) {
    var_df071553d0996ff9 notify("remove_from_current_interaction_list_for_player_" + player.name);
    if (!array_contains(player.disabled_interactions, var_df071553d0996ff9)) {
        player.disabled_interactions = array_add(player.disabled_interactions, var_df071553d0996ff9);
    }
    scripts\cp\coop_personal_ents::update_special_mode_for_player(player);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x33fd
// Size: 0x62
function add_to_current_interaction_list_for_player(var_df071553d0996ff9, player) {
    var_df071553d0996ff9 notify("add_to_current_interaction_list_for_player_" + player.name);
    if (array_contains(player.disabled_interactions, var_df071553d0996ff9)) {
        player.disabled_interactions = array_remove(player.disabled_interactions, var_df071553d0996ff9);
    }
    scripts\cp\coop_personal_ents::update_special_mode_for_player(player);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3467
// Size: 0x171
function can_purchase_interaction(var_df071553d0996ff9, amount, spend_type, weapon) {
    if (!array_contains(level.current_interaction_structs, var_df071553d0996ff9)) {
        return false;
    }
    if (isnmlactive()) {
        return true;
    }
    if (isdefined(var_df071553d0996ff9.script_location) && var_df071553d0996ff9.script_location == "afterlife") {
        return true;
    }
    if (isdefined(amount)) {
        cost = amount;
    } else {
        cost = level.interactions[var_df071553d0996ff9.script_noteworthy].cost;
    }
    if (interaction_is_weapon_buy(var_df071553d0996ff9)) {
        var_895fa4b47e915c65 = var_df071553d0996ff9.script_noteworthy;
        if (var_df071553d0996ff9.script_parameters == "tickets") {
            if (self hasweapon(var_895fa4b47e915c65)) {
                return false;
            }
            self.itempicked = var_df071553d0996ff9.script_noteworthy;
            level.transactionid = randomint(100);
        }
        max_ammo = weaponmaxammo(var_df071553d0996ff9.script_noteworthy);
        var_629f6083f99f1d29 = scripts\cp\perks\cp_prestige::prestige_getminammo();
        var_db6891ee5a14d7aa = int(var_629f6083f99f1d29 * max_ammo);
        var_de8a9ead75a0581 = self getweaponammostock(var_895fa4b47e915c65);
        if (var_de8a9ead75a0581 >= var_db6891ee5a14d7aa) {
            return false;
        }
    }
    if (namespace_6c67e93a4c487d83::player_has_enough_currency(cost, spend_type)) {
        return true;
    }
    return false;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35e1
// Size: 0x23
function interaction_get_cost() {
    if (isdefined(self.cost)) {
        return int(self.cost);
    }
    return 0;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x360c
// Size: 0x28
function take_player_money(cost, var_e42f7eb456b932f2) {
    if (isnmlactive()) {
        return;
    }
    namespace_6c67e93a4c487d83::take_player_currency(cost, 1, var_e42f7eb456b932f2);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x363c
// Size: 0x5c
function should_interaction_fill_consumable_meter(var_e42f7eb456b932f2) {
    if (!isdefined(var_e42f7eb456b932f2)) {
        assertmsg("Spending type is not defined.");
    }
    switch (var_e42f7eb456b932f2) {
    case #"hash_c932d6c10cbe95f":
    case #"hash_94d89c28c481dde6":
    case #"hash_c6b8c582ba70471e":
        return 0;
    default:
        return 1;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36a0
// Size: 0x1ea
function getammopurchasestring(var_df071553d0996ff9, player) {
    cost = level.interactions[var_df071553d0996ff9.script_noteworthy].cost;
    base_weapon = getrawbaseweaponname(var_df071553d0996ff9.script_noteworthy);
    currentweapon = player getcurrentweapon();
    max_ammo = weaponmaxammo(currentweapon);
    var_629f6083f99f1d29 = player scripts\cp\perks\cp_prestige::prestige_getminammo();
    var_db6891ee5a14d7aa = int(var_629f6083f99f1d29 * max_ammo);
    var_de8a9ead75a0581 = player getweaponammostock(currentweapon);
    weapons = self getweaponslistall();
    foreach (weapon in weapons) {
        var_9211cdaadb7bca55 = getrawbaseweaponname(weapon);
        if (var_9211cdaadb7bca55 == getrawbaseweaponname(var_df071553d0996ff9.script_noteworthy)) {
            var_3626ccbdf1758532 = weapon;
            var_de8a9ead75a0581 = self getweaponammostock(var_3626ccbdf1758532);
            max_ammo = weaponmaxammo(var_3626ccbdf1758532);
            var_db6891ee5a14d7aa = int(var_629f6083f99f1d29 * max_ammo);
        }
    }
    if (var_df071553d0996ff9.script_parameters == "tickets") {
        return level.interaction_hintstrings[var_df071553d0996ff9.script_noteworthy];
    }
    switch (cost) {
    case 250:
        return %CP_ZMB_INTERACTIONS/TICKETS_AMMO;
    case 500:
    case 1000:
    case 1250:
    case 1500:
        return %COOP_INTERACTIONS/PURCHASE_AMMO;
    default:
        return %COOP_INTERACTIONS/PURCHASE_AMMO;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3892
// Size: 0x32
function default_weapon_hint_func(var_df071553d0996ff9, player) {
    if (player namespace_a0628d6954815ef8::has_weapon_variation(var_df071553d0996ff9.script_noteworthy)) {
        return getammopurchasestring(var_df071553d0996ff9, player);
    }
    return undefined;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38cd
// Size: 0xee
function interaction_sound_monitor() {
    level endon("game_ended");
    while (true) {
        level waittill("interaction", interaction_type, var_df071553d0996ff9, player);
        switch (interaction_type) {
        case #"hash_52dba21b7b0431e":
            if (isdefined(player.purchasing_ammo)) {
                if (soundexists("purchase_ammo")) {
                    player playlocalsound_safe("purchase_ammo");
                }
            } else if (soundexists("purchase_weapon")) {
                player playlocalsound_safe("purchase_weapon");
            }
            break;
        case #"hash_5f4247cbd74f75c2":
            sound = get_interaction_sound(var_df071553d0996ff9, player);
            if (isdefined(sound) && soundexists(sound)) {
                player playlocalsound_safe(sound);
            }
            break;
        case #"hash_8a373ba44407fd2c":
            player playlocalsound_safe("cp_computer_fail");
            break;
        }
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39c3
// Size: 0x1fb
function get_interaction_sound(var_df071553d0996ff9, player) {
    var_f6f217ea2aa761f9 = [];
    switch (var_df071553d0996ff9.script_noteworthy) {
    case #"hash_8ded6fdf599c8405":
        return undefined;
    case #"hash_c373b5c1c961382":
        var_f6f217ea2aa761f9 = ["lost_and_found_purchase"];
        break;
    case #"hash_17705e021d413644":
    case #"hash_5176ea8ac5ebd6d2":
    case #"hash_79aacf81624606a1":
    case #"hash_ad9fd60c8d16f5c4":
    case #"hash_ee5629fbd73d7dec":
        var_f6f217ea2aa761f9 = ["trap_control_panel_purchase"];
        break;
    case #"hash_43c3b099403349e6":
    case #"hash_74d7342ec02bc5ba":
        var_f6f217ea2aa761f9 = ["purchase_door"];
        break;
    case #"hash_d33dd55dbc3e9e86":
        var_f6f217ea2aa761f9 = ["purchase_door"];
        break;
    case #"hash_338a7935f889f966":
        var_f6f217ea2aa761f9 = ["atm_deposit"];
        break;
    case #"hash_7111b6336bce51b7":
        var_f6f217ea2aa761f9 = ["atm_withdrawal"];
        break;
    case #"hash_540029e95443eff9":
    case #"hash_6b74d503b2df6dde":
    case #"hash_ecd90e4994d7d04c":
    case #"hash_f9208728ecc14a4d":
        var_f6f217ea2aa761f9 = ["zmb_item_pickup"];
        break;
    case #"hash_37ad8039ea91a8a5":
    case #"hash_a3d81e14ec5a5b24":
    case #"hash_c588128f7226d6cf":
    case #"hash_dc336228a1085866":
        var_f6f217ea2aa761f9 = ["purchase_ticket"];
        break;
    case #"hash_1e249caad9c87d9e":
        var_f6f217ea2aa761f9 = ["ark_purchase"];
        break;
    case #"hash_e66a57d8aeebc251":
        var_f6f217ea2aa761f9 = ["ark_turn_in"];
        break;
    default:
        var_f6f217ea2aa761f9 = ["ark_turn_in"];
        break;
    }
    if (!var_f6f217ea2aa761f9.size) {
        return undefined;
    }
    return random(var_f6f217ea2aa761f9);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc7
// Size: 0x39
function interaction_post_activate_update(var_df071553d0996ff9) {
    if (!isdefined(var_df071553d0996ff9.post_activate_update)) {
        return;
    }
    if (isdefined(level.interaction_post_activate_update_func)) {
        level thread [[ level.interaction_post_activate_update_func ]](var_df071553d0996ff9, self);
        return;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c08
// Size: 0x31
function interaction_is_trap(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "trap_electric" || var_df071553d0996ff9.script_noteworthy == "trap_firebarrel";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c42
// Size: 0x31
function interaction_is_atm(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "atm_withdrawal" || var_df071553d0996ff9.script_noteworthy == "atm_deposit";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7c
// Size: 0x1c
function interaction_is_window_entrance(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "secure_window";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ca1
// Size: 0x1c
function interaction_is_crafting_station(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "crafting_station";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cc6
// Size: 0x31
function interaction_is_grenade_wall_buy(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "power_bioSpike" || var_df071553d0996ff9.script_noteworthy == "power_c4";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d00
// Size: 0x1c
function interaction_is_weapon_pickup(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "weaponPickup";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d25
// Size: 0x1c
function interaction_is_fortune_teller(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "jaroslav_machine";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4a
// Size: 0x17
function interaction_is_perk(var_df071553d0996ff9) {
    return isdefined(var_df071553d0996ff9.perk_type);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6a
// Size: 0x26
function interaction_waiting_on_power(var_df071553d0996ff9) {
    return istrue(var_df071553d0996ff9.requires_power) && !var_df071553d0996ff9.powered_on;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d99
// Size: 0xe4
function interaction_is_valid(var_df071553d0996ff9, player) {
    if (isdefined(var_df071553d0996ff9.triggered)) {
        return false;
    }
    if (!array_contains(level.current_interaction_structs, var_df071553d0996ff9)) {
        return false;
    }
    if (istrue(var_df071553d0996ff9.out_of_order)) {
        level notify("player_accessed_interaction_on_cooldown", player);
        return false;
    }
    if (istrue(var_df071553d0996ff9.in_use)) {
        return false;
    }
    if (interaction_waiting_on_power(var_df071553d0996ff9)) {
        level notify("player_accessed_nonpowered_interaction", player);
        if (isdefined(var_df071553d0996ff9.perk_type) && soundexists("perk_machine_deny")) {
            player playlocalsound("perk_machine_deny");
        } else {
            player playlocalsound("purchase_deny");
        }
        return false;
    }
    if (isdefined(var_df071553d0996ff9.cooling_down)) {
        level notify("player_accessed_interaction_on_cooldown", player);
        return false;
    }
    if (array_contains(player.disabled_interactions, var_df071553d0996ff9)) {
        return false;
    }
    return true;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e86
// Size: 0x1c
function interaction_is_floor_is_lava_client(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "sequence_interaction";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3eab
// Size: 0x1c
function interaction_is_jugg_maze_button(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "seq_button";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed0
// Size: 0x46
function interaction_is_chess_piece(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "chess_piece_selection" || var_df071553d0996ff9.script_noteworthy == "chess_puzzle_alphabet" || var_df071553d0996ff9.script_noteworthy == "chess_puzzle_number";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f1f
// Size: 0x1c
function interaction_is_weapon_upgrade(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "weapon_upgrade";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f44
// Size: 0x31
function interaction_is_weapon_buy(var_df071553d0996ff9) {
    if (isdefined(var_df071553d0996ff9.name)) {
        return (var_df071553d0996ff9.name == "wall_buy");
    }
    return 0;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f7d
// Size: 0x26
function interaction_is_button_mash(var_df071553d0996ff9) {
    return isdefined(var_df071553d0996ff9.isbuttonmash) && var_df071553d0996ff9.isbuttonmash;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fac
// Size: 0xd9
function interaction_is_door_buy(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "debris_350" || var_df071553d0996ff9.script_noteworthy == "debris_750" || var_df071553d0996ff9.script_noteworthy == "debris_1000" || var_df071553d0996ff9.script_noteworthy == "debris_1250" || var_df071553d0996ff9.script_noteworthy == "debris_1500" || var_df071553d0996ff9.script_noteworthy == "debris_2000" || var_df071553d0996ff9.script_noteworthy == "1v1_stairway_door" || var_df071553d0996ff9.script_noteworthy == "1v1_exit_door" || var_df071553d0996ff9.script_noteworthy == "team_door_switch" || var_df071553d0996ff9.script_noteworthy == "team_door";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x408e
// Size: 0x70
function interaction_is_special_door_buy(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "power_door_sliding" || var_df071553d0996ff9.script_noteworthy == "team_door_switch" || var_df071553d0996ff9.script_noteworthy == "1v1_stairway_door" || var_df071553d0996ff9.script_noteworthy == "1v1_exit_door" || var_df071553d0996ff9.script_noteworthy == "team_door";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4107
// Size: 0x46
function interaction_is_chi_door(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "chi_0" || var_df071553d0996ff9.script_noteworthy == "chi_1" || var_df071553d0996ff9.script_noteworthy == "chi_2";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4156
// Size: 0xaf
function interaction_is_ticket_buy(var_df071553d0996ff9) {
    return var_df071553d0996ff9.script_noteworthy == "small_ticket_prize" || var_df071553d0996ff9.script_noteworthy == "medium_ticket_prize" || var_df071553d0996ff9.script_noteworthy == "arcade_counter_grenade" || var_df071553d0996ff9.script_noteworthy == "arcade_counter_ammo" || var_df071553d0996ff9.script_noteworthy == "large_ticket_prize" || var_df071553d0996ff9.script_noteworthy == "zfreeze_semtex_mp" || var_df071553d0996ff9.script_noteworthy == "iw7_forgefreeze_zm+forgefreezealtfire" || var_df071553d0996ff9.script_noteworthy == "gold_teeth";
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x420e
// Size: 0x76
function can_use_perk(var_df071553d0996ff9) {
    if (has_zombie_perk(var_df071553d0996ff9.perk_type)) {
        return false;
    } else if (self.self_revives_purchased >= self.max_self_revive_machine_use && var_df071553d0996ff9.perk_type == "perk_machine_revive") {
        return false;
    } else if (isdefined(self.zombies_perks) && self.zombies_perks.size > 4) {
        return false;
    }
    return true;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x428d
// Size: 0x2f
function interaction_show_fail_reason(var_df071553d0996ff9, stringname, var_edfe2fddcb8449a1, var_1e59f2dcd3b86d22) {
    thread interaction_fail_internal(var_df071553d0996ff9, stringname, var_edfe2fddcb8449a1, var_1e59f2dcd3b86d22);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x42c4
// Size: 0x86
function interaction_fail_internal(var_df071553d0996ff9, stringname, var_edfe2fddcb8449a1, var_1e59f2dcd3b86d22) {
    self endon("disconnect");
    level notify("interaction", "purchase_denied", level.interactions[var_df071553d0996ff9.script_noteworthy], self);
    self.delay_hint = 1;
    self.interaction_trigger sethintstring(stringname);
    wait 1;
    self.delay_hint = undefined;
    set_interaction_trigger_properties(self.interaction_trigger, var_df071553d0996ff9);
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4352
// Size: 0x1d9
function interaction_cooldown(var_df071553d0996ff9, time) {
    interactions = getstructarray(var_df071553d0996ff9.script_noteworthy, "script_noteworthy");
    foreach (struct in interactions) {
        if (struct.target == var_df071553d0996ff9.target) {
            struct.cooling_down = 1;
        }
    }
    if (istrue(level.cooldown_override)) {
        wait 1;
    } else {
        level waittill_any_timeout_1(time, "override_cooldowns");
    }
    foreach (struct in interactions) {
        if (struct.target == var_df071553d0996ff9.target) {
            struct.cooling_down = undefined;
        }
    }
    distcheck = 5184;
    foreach (player in level.players) {
        foreach (struct in interactions) {
            if (distancesquared(player.origin, struct.origin) >= distcheck) {
                continue;
            }
            player refresh_interaction();
        }
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4533
// Size: 0x35
function refresh_interaction() {
    self notify("stop_interaction_logic");
    self.last_interaction_point = undefined;
    if (isdefined(self.interaction_trigger)) {
        self.interaction_trigger sethintstring("");
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4570
// Size: 0xb4
function disable_wall_buy_interactions() {
    structs = getstructarray("interaction", "targetname");
    foreach (struct in structs) {
        if (interaction_is_weapon_buy(struct) || interaction_is_grenade_wall_buy(struct) || interaction_is_ticket_buy(struct) || isdefined(struct.script_parameters) && struct.script_parameters == "tickets") {
            struct.disabled = 1;
        }
    }
}

/#

    // Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x462c
    // Size: 0xac
    function function_985a0cba8e1c90e1() {
        flag_init("<dev string:x112>");
        level endon("<dev string:x132>");
        level.var_375b54a9c54da547 = [];
        while (true) {
            flag_wait("<dev string:x112>");
            var_602b797d1505f4be = getdvar(@"hash_f3287037720f9cac", "<dev string:x13d>");
            var_d7792c2745050aa0 = getdvar(@"hash_700b2c240fd3492a", "<dev string:x13d>");
            var_9a4914e120057019 = getstructarray("<dev string:x13e>", "<dev string:x14a>");
            function_1ddb68f2137782b(var_602b797d1505f4be, var_d7792c2745050aa0);
            flag_clear("<dev string:x112>");
            level.var_375b54a9c54da547 = [];
        }
    }

    // Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x46e0
    // Size: 0xbf
    function function_1ddb68f2137782b(var_602b797d1505f4be, var_d7792c2745050aa0) {
        level endon("<dev string:x132>");
        level endon("<dev string:x155>");
        var_17f783daa20df724 = getstructarray(var_d7792c2745050aa0, var_602b797d1505f4be);
        level.var_375b54a9c54da547 = var_17f783daa20df724;
        while (true) {
            foreach (var_df071553d0996ff9 in var_17f783daa20df724) {
                thread draw_line_for_time(var_df071553d0996ff9.origin, var_df071553d0996ff9.origin + (0, 0, 256), 1, 0, 0, 1);
            }
            wait 1;
        }
    }

#/

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x47a7
// Size: 0xb6
function spawninteractionmodel(var_df071553d0996ff9, target_struct) {
    level endon("game_ended");
    flag_wait("interactions_initialized");
    if (isdefined(var_df071553d0996ff9.script_modelname)) {
        model = spawn("script_model", target_struct.origin);
        if (isdefined(target_struct.angles)) {
            model.angles = target_struct.angles;
        }
        model setmodel(var_df071553d0996ff9.script_modelname);
        if (isdefined(var_df071553d0996ff9.targetmodels)) {
            var_df071553d0996ff9.targetmodels[var_df071553d0996ff9.targetmodels.size] = model;
        }
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4865
// Size: 0x331
function move_to_closest_interaction(player) {
    level endon("game_ended");
    player endon("disconnect");
    currentstruct = undefined;
    entorigin = undefined;
    var_5c9ddcf56d36f133 = -1;
    var_3414e5c0a9919716 = 0;
    tooclosedist = squared(75);
    while (true) {
        if (istrue(player.inlaststand) || istrue(player.siege_activated) || istrue(player.flung)) {
            currentstruct = undefined;
            update_struct_information(player, -1, undefined, undefined);
        } else if (!player areinteractionsenabled()) {
            currentstruct = undefined;
            update_struct_information(player, -1, undefined, undefined);
        } else {
            var_936a8cb7ab047d5f = [];
            level.current_interaction_structs = array_removeundefined(level.current_interaction_structs);
            var_d5b8724607c37b52 = get_array_of_closest(player.origin, level.current_interaction_structs, undefined, 10, 750, 1);
            foreach (item in player.disabled_interactions) {
                var_d5b8724607c37b52 = array_remove(var_d5b8724607c37b52, item);
            }
            foreach (item in var_d5b8724607c37b52) {
                if (is_permitted_guided_interaction(player, item, currentstruct)) {
                    var_936a8cb7ab047d5f[var_936a8cb7ab047d5f.size] = item;
                }
            }
            if (istrue(player.resetguidedinteraction)) {
                currentstruct = undefined;
                update_struct_information(player, -1, undefined, undefined);
                player.resetguidedinteraction = undefined;
                wait 0.05;
                continue;
            }
            var_936a8cb7ab047d5f = array_removeundefined(var_936a8cb7ab047d5f);
            var_936a8cb7ab047d5f = array_remove_duplicates(var_936a8cb7ab047d5f);
            if (var_936a8cb7ab047d5f.size < 1) {
                currentstruct = undefined;
                update_struct_information(player, -1, undefined, undefined);
                wait 0.05;
                continue;
            }
            var_936a8cb7ab047d5f = sortbydistance(var_936a8cb7ab047d5f, player.origin);
            foreach (struct in var_936a8cb7ab047d5f) {
                var_3414e5c0a9919716 = 0;
                if (player adsbuttonpressed()) {
                    update_struct_information(player, -1, undefined, undefined);
                    currentstruct = undefined;
                    while (player adsbuttonpressed()) {
                        wait 0.05;
                    }
                }
                if (distancesquared(player.origin, struct.origin) <= tooclosedist) {
                    update_struct_information(player, -1, undefined, undefined);
                    currentstruct = undefined;
                    continue;
                }
                if (isdefined(currentstruct) && struct == currentstruct) {
                    break;
                }
                entorigin = get_interaction_origin(struct, player);
                var_5c9ddcf56d36f133 = get_interaction_cost(struct, player);
                currentstruct = struct;
                var_3414e5c0a9919716 = 1;
                break;
            }
            if (var_3414e5c0a9919716) {
                update_struct_information(player, var_5c9ddcf56d36f133, entorigin, currentstruct);
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9e
// Size: 0x215
function get_interaction_origin(struct, player) {
    offset = (0, 0, 68);
    pos = struct.origin;
    if (interaction_is_weapon_buy(struct)) {
        if (isdefined(struct.target)) {
            targetstruct = getstruct(struct.target, "targetname");
            if (isdefined(targetstruct)) {
                pos = targetstruct.origin;
            } else {
                pos = struct.origin;
            }
        }
    } else if (!isdefined(pos)) {
        pos = struct.origin;
    }
    if (isdefined(level.guided_interaction_offset_func)) {
        offset = [[ level.guided_interaction_offset_func ]](struct, player);
    } else {
        var_28eb544eca57f217 = get_area_for_power(struct);
        if (isdefined(struct.script_noteworthy)) {
            structname = struct.script_noteworthy;
            switch (structname) {
            case #"hash_33a1e53dbf58c00e":
            case #"hash_7ea424151841c4eb":
            case #"hash_c83dceded64d47dd":
                offset = (0, 0, 12);
                break;
            case #"hash_4cd897d490012f2e":
            case #"hash_fa26459eb1dd64e6":
                if (var_28eb544eca57f217 == "swamp_stage") {
                    offset = (0, 0, 12);
                }
                break;
            case #"hash_37ad8039ea91a8a5":
                offset = (0, 0, 20);
                break;
            case #"hash_c36284ec9d5582db":
            case #"hash_e999e97bad9cb00b":
                if (var_28eb544eca57f217 == "moon") {
                    offset = (0, 0, 30);
                } else {
                    offset = (0, 0, 56);
                }
                break;
            default:
                offset = (0, 0, 56);
                break;
            }
        }
    }
    neworigin = drop_to_ground(pos, 12) + offset;
    return neworigin;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4dbc
// Size: 0x241
function get_interaction_cost(struct, player) {
    modifier = 1;
    var_5c9ddcf56d36f133 = 0;
    if (isdefined(level.interactions[struct.script_noteworthy])) {
        if (isdefined(level.interactions[struct.script_noteworthy].cost)) {
            var_5c9ddcf56d36f133 = int(level.interactions[struct.script_noteworthy].cost);
        } else {
            return 0;
        }
    }
    if (interaction_is_weapon_buy(struct)) {
        if (player namespace_a0628d6954815ef8::has_weapon_variation(struct.script_noteworthy)) {
            var_9211cdaadb7bca55 = getrawbaseweaponname(struct.script_noteworthy);
            weaponlevel = player namespace_a0628d6954815ef8::get_weapon_level(var_9211cdaadb7bca55);
            if (weaponlevel > 1) {
                var_5c9ddcf56d36f133 = 4500;
            } else {
                modifier = 0.5;
                var_5c9ddcf56d36f133 = int(var_5c9ddcf56d36f133 * modifier);
            }
        } else {
            var_5c9ddcf56d36f133 = int(var_5c9ddcf56d36f133 * modifier);
        }
    } else if (interaction_is_weapon_upgrade(struct)) {
        curweapon = player getcurrentweapon();
        if (player namespace_a0628d6954815ef8::can_upgrade(curweapon)) {
            weaponlevel = player namespace_a0628d6954815ef8::get_weapon_level(curweapon);
            var_5c9ddcf56d36f133 = ter_op(weaponlevel > 1, 10000, 5000);
        } else {
            var_5c9ddcf56d36f133 = 0;
        }
        if (istrue(level.has_picked_up_fuses) && !isdefined(level.placed_alien_fuses)) {
            var_5c9ddcf56d36f133 = 0;
        }
    } else if (is_struct_perk_machine(struct)) {
        if (isdefined(struct.script_noteworthy) && !player can_use_perk(struct)) {
            var_5c9ddcf56d36f133 = 0;
        } else if ((isplayingsolo() || level.only_one_player) && isdefined(struct.script_noteworthy) && struct.script_noteworthy == "perk_machine_revive") {
            var_5c9ddcf56d36f133 = 500;
        } else {
            var_5c9ddcf56d36f133 = get_perk_machine_cost(struct);
        }
    } else if (interaction_is_fortune_teller(struct)) {
        if (player.card_refills == 1) {
            var_5c9ddcf56d36f133 = level.fortune_visit_cost_2;
        } else {
            var_5c9ddcf56d36f133 = level.fortune_visit_cost_1;
        }
    }
    if (player is_consumable_active("next_purchase_free")) {
        var_5c9ddcf56d36f133 = 0;
    }
    return var_5c9ddcf56d36f133;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5006
// Size: 0x11b
function is_struct_perk_machine(struct) {
    if (!isdefined(struct.script_noteworthy)) {
        return false;
    }
    if (struct.script_noteworthy == "perk_machine_more" || struct.script_noteworthy == "perk_machine_rat_a_tat" || struct.script_noteworthy == "perk_machine_revive" || struct.script_noteworthy == "perk_machine_run" || struct.script_noteworthy == "perk_machine_smack" || struct.script_noteworthy == "perk_machine_tough" || struct.script_noteworthy == "perk_machine_flash" || struct.script_noteworthy == "perk_machine_boom" || struct.script_noteworthy == "perk_machine_fwoosh" || struct.script_noteworthy == "perk_machine_deadeye" || struct.script_noteworthy == "perk_machine_change" || struct.script_noteworthy == "perk_machine_zap") {
        return true;
    }
    return false;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x512a
// Size: 0xbe
function get_perk_machine_cost(struct) {
    switch (struct.perk_type) {
    case #"hash_3777b0d50b80d951":
    case #"hash_46904519b2213853":
    case #"hash_8baf700e5db691d8":
    case #"hash_aa2341f864220fe7":
    case #"hash_e87d2f5be60558f7":
    case #"hash_f79672486bfae476":
        return 1500;
    case #"hash_a9530646732cbfda":
        return 3000;
    case #"hash_dc25c11d04255e93":
        return 2500;
    case #"hash_27fd715b45bd7d11":
    case #"hash_acdb572603152d89":
    case #"hash_ad8ded5bc73cdeb5":
    case #"hash_c1a8e38b57dc5875":
        return 2000;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x51f0
// Size: 0x538
function is_permitted_guided_interaction(player, struct, currentstruct) {
    level endon("game_ended");
    player endon("disconnect");
    if (!isdefined(struct)) {
        return 0;
    }
    structname = undefined;
    if (isdefined(struct.script_noteworthy)) {
        structname = struct.script_noteworthy;
    } else {
        return 0;
    }
    if (istrue(struct.out_of_order) || isdefined(struct.cooling_down)) {
        return 0;
    }
    if (istrue(struct.disabledguidedinteractions)) {
        return 0;
    }
    if (isdefined(struct.perk_type) && struct.perk_type == "perk_machine_revive" && player.self_revives_purchased >= player.max_self_revive_machine_use) {
        return 0;
    }
    if (!coop_mode_has("wall_buys")) {
        if (interaction_is_weapon_buy(struct) || interaction_is_grenade_wall_buy(struct) || interaction_is_ticket_buy(struct) || interaction_is_chi_door(struct) || isdefined(struct.script_parameters) && struct.script_parameters == "tickets") {
            return 0;
        }
    }
    if (interaction_is_fortune_teller(struct)) {
        if (player.card_refills == 2) {
            return 0;
        }
    }
    if (structname == "secure_window" || structname == "white_ark" || structname == "wor_standee" || structname == "generator" || structname == "center_speaker_locs" || structname == "fourth_speaker" || structname == "ark_quest_station" || structname == "dj_quest_part_1" || structname == "dj_quest_part_2" || structname == "dj_quest_part_3" || structname == "dj_quest_door" || structname == "dj_quest_speaker" || structname == "lost_and_found" || structname == "fast_travel" || structname == "crafting_pickup" || structname == "pap_upgrade" || structname == "team_door" || structname == "neil_head" || structname == "neil_battery" || structname == "neil_repair" || structname == "neil_firmware" || structname == "barnstorming_group" || structname == "demon_group" || structname == "starmaster_group" || structname == "group_cosmicarc" || structname == "group_pitfall" || structname == "group_riverraid" || structname == "spider_arcade_group" || structname == "robottank_group" || structname == "gator_teeth_placement" || structname == "atm_withdrawal" && isdefined(level.atm_amount_deposited) && level.atm_amount_deposited < 1000 || structname == "crafting_station" && !isdefined(player.current_crafting_struct)) {
        return 0;
    }
    if (isdefined(level.guidedinteractionexclusion)) {
        if (![[ level.guidedinteractionexclusion ]](struct, player, structname)) {
            return 0;
        }
    }
    if (istrue(struct.requires_power) && !istrue(struct.powered_on)) {
        return 0;
    }
    if (isdefined(level.active_volume_check)) {
        if (structname == "pap_upgrade" || structname == "weapon_upgrade") {
            return 1;
        } else if (!self [[ level.active_volume_check ]](struct.origin)) {
            return 0;
        }
    }
    end_pos = struct.origin;
    if (isdefined(level.guidedinteractionendposoverride)) {
        end_pos = [[ level.guidedinteractionendposoverride ]](player, struct);
    }
    if (!within_fov(player.origin, player.angles, end_pos, cos(25))) {
        return 0;
    }
    if (interaction_is_door_buy(struct) || interaction_is_chi_door(struct)) {
        var_ee46ba4828993237 = get_spawn_volumes_player_is_in(0, undefined, player);
        foreach (var_27dfbfcbd63d339e in var_ee46ba4828993237) {
            var_eb6e6263d4667983 = var_27dfbfcbd63d339e get_adjacent_volumes_from_volume();
            foreach (volume in var_eb6e6263d4667983) {
                if (ispointinvolume(struct.origin, volume)) {
                    return 0;
                }
            }
        }
    }
    contents = physics_createcontents(["physicscontents_clipshot", "physicscontents_missileclip"]);
    if (struct.script_noteworthy == "trap_hydrant") {
        end_pos = struct.origin + (0, 0, 50);
    }
    if (scripts\engine\trace::ray_trace_passed(player geteye(), end_pos, [player], contents)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5730
// Size: 0x7b
function update_struct_information(player, cost, origin, currentstruct) {
    if (!isdefined(cost)) {
        cost = -1;
    }
    if (isdefined(origin) && origin != self.origin) {
        wait 0.1;
        self dontinterpolate();
        self.origin = origin;
        wait 0.1;
    }
    if (isdefined(currentstruct) && currentstruct.script_parameters == "tickets") {
        cost = 2;
    }
}

// Namespace namespace_f9c64c25bc77fb95 / scripts\cp\cp_interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57b3
// Size: 0xfb
function get_spawn_volumes_player_is_in(var_62e2246e21a8b5ea, var_ce0a3f24a858d58b, player) {
    if (isdefined(level.get_spawn_volume_func)) {
        return [[ level.get_spawn_volume_func ]]();
    }
    spawn_volume_array = [];
    var_62cb1ab5dfed14c1 = level.spawn_volume_array;
    foreach (volume in var_62cb1ab5dfed14c1) {
        if (!volume.active) {
            continue;
        }
        var_d836141a923f5093 = 0;
        if (isdefined(var_ce0a3f24a858d58b) && !player is_valid_player()) {
            continue;
        }
        if (player istouching(volume)) {
            var_d836141a923f5093 = 1;
        } else if (istrue(var_62e2246e21a8b5ea) && player is_in_adjacent_volume(volume)) {
            var_d836141a923f5093 = 1;
        }
        if (var_d836141a923f5093) {
            spawn_volume_array[spawn_volume_array.size] = volume;
        }
    }
    return spawn_volume_array;
}
