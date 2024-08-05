#using scripts\asm\asm.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\sp\anim.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\ai.gsc;
#using scripts\sp\interaction_manager.gsc;
#using scripts\asm\gesture\script_funcs.gsc;
#using scripts\common\notetrack.gsc;

#namespace interaction;

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa05
// Size: 0x20
function register_interaction(var_1fbfd9cfd0b3b4f7, struct) {
    level.interactions[var_1fbfd9cfd0b3b4f7] = struct;
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2d
// Size: 0x20
function register_state_interaction(var_1fbfd9cfd0b3b4f7, struct) {
    level.state_interactions[var_1fbfd9cfd0b3b4f7] = struct;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa55
// Size: 0x36
function get_interaction(var_1fbfd9cfd0b3b4f7) {
    if (!isdefined(level.interactions) || !isdefined(level.interactions[var_1fbfd9cfd0b3b4f7])) {
        return undefined;
    }
    return level.interactions[var_1fbfd9cfd0b3b4f7];
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa94
// Size: 0x9f
function get_state_interaction(var_1fbfd9cfd0b3b4f7) {
    if (!issubstr(var_1fbfd9cfd0b3b4f7, "casual") && !issubstr(var_1fbfd9cfd0b3b4f7, "alert")) {
        if (isdefined(self.asm)) {
            demeanor = asm_getdemeanor();
            if (demeanor == "casual") {
                var_1fbfd9cfd0b3b4f7 = var_1fbfd9cfd0b3b4f7 + "_" + demeanor;
            } else {
                var_1fbfd9cfd0b3b4f7 += "_alert";
            }
        } else {
            var_1fbfd9cfd0b3b4f7 += "_casual";
        }
    }
    if (!isdefined(level.state_interactions) || !isdefined(level.state_interactions[var_1fbfd9cfd0b3b4f7])) {
        return undefined;
    }
    return level.state_interactions[var_1fbfd9cfd0b3b4f7];
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb3c
// Size: 0x25
function is_interaction(var_1fbfd9cfd0b3b4f7) {
    return isdefined(level.interactions) && isdefined(level.interactions[var_1fbfd9cfd0b3b4f7]);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb6a
// Size: 0x2b
function is_state_interaction(var_1fbfd9cfd0b3b4f7) {
    return isdefined(level.state_interactions) && isdefined(level.state_interactions[var_1fbfd9cfd0b3b4f7 + "_casual"]);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9e
// Size: 0x33
function is_state_interact_struct(struct) {
    if (isdefined(struct.script_reaction) && is_state_interaction(struct.script_reaction)) {
        return true;
    }
    return false;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbda
// Size: 0x5a
function is_interact_struct(struct) {
    if (isdefined(struct.script_reaction) && is_interaction(struct.script_reaction)) {
        return true;
    }
    if (isdefined(struct.script_noteworthy) && is_interaction(struct.script_noteworthy)) {
        return true;
    }
    return false;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3d
// Size: 0x47
function is_interact_node(node) {
    if (isdefined(node.script_reaction)) {
        if (is_interaction(node.script_reaction) || node.script_reaction == "combat_reaction") {
            return true;
        }
    }
    return false;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8d
// Size: 0x3e
function get_arrivalstate_from_interaction(interaction) {
    demeanor = asm_getdemeanor();
    if (isdefined(interaction.arrivalstates)) {
        return interaction.arrivalstates[demeanor];
    }
    return undefined;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd3
// Size: 0x3e
function get_exitstate_from_interaction(interaction) {
    demeanor = asm_getdemeanor();
    if (isdefined(interaction.exitstates)) {
        return interaction.exitstates[demeanor];
    }
    return undefined;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd19
// Size: 0x27
function get_idlestate_from_interaction(interaction) {
    demeanor = asm_getdemeanor();
    return interaction.idlestate;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd49
// Size: 0x64
function setup_exit_states_for_interaction(interaction_name) {
    if (!isai(self)) {
        return;
    }
    self.asm.customdata.interaction = interaction_name;
    interaction = get_interaction(interaction_name);
    if (!isdefined(interaction)) {
        interaction = get_state_interaction(interaction_name);
    }
    self.var_57e1b0c4ad45db70 = get_exitstate_from_interaction(interaction);
}

// Namespace interaction / scripts\sp\interaction
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xdb5
// Size: 0xaa
function play_interaction_anim(interact, anim_index, weight, time, rate) {
    interact = get_interaction(interact);
    assertex(isdefined(interact), "play_interact_anim() must be sent a registered interact");
    assertex(isdefined(interact.scene[anim_index]), "play_interact_anim() must be sent a valid anim_index");
    if (!isdefined(weight)) {
        weight = 1;
    }
    if (!isdefined(time)) {
        time = 0.05;
    }
    if (!isdefined(rate)) {
        rate = 1;
    }
    start_fakeactor_notetracks(interact.scene[anim_index]);
    self setflaggedanim(anim_index, interact.scene[anim_index], weight, time, rate);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe67
// Size: 0x82
function define_interacton_position(reference) {
    self endon("death");
    self endon("reaction_done");
    self endon("entitydeleted");
    var_6ce5bb7a2a6038f3 = undefined;
    while (true) {
        if (isstruct(reference) || isent(reference)) {
            var_6ce5bb7a2a6038f3 = reference.origin;
        } else if (isvector(reference)) {
            var_6ce5bb7a2a6038f3 = reference;
        }
        if (isdefined(self.lookat_anims)) {
            self.lookat_anims["interaction_position"] = var_6ce5bb7a2a6038f3;
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef1
// Size: 0x4f
function redefine_interaction_radius(new_radius) {
    var_327190e5347a2645 = undefined;
    if (isdefined(self.lookat_anims)) {
        var_327190e5347a2645 = self.lookat_anims["trigger_radius"];
        self.lookat_anims["trigger_radius"] = new_radius;
        thread _redefine_interaction_radius_cleanup(var_327190e5347a2645);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf48
// Size: 0x32
function _redefine_interaction_radius_cleanup(var_327190e5347a2645) {
    self endon("interaction_end");
    self endon("reaction_end");
    self waittill("interaction_done");
    self.lookat_anims["trigger_radius"] = var_327190e5347a2645;
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf82
// Size: 0x3be
function play_interaction(interaction_name, optional_scripted_struct, var_4ec51221f3064070) {
    self endon("death");
    self notify("reaction_end");
    interaction = get_interaction(interaction_name);
    setup_exit_states_for_interaction(interaction_name);
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " but interaction isn't registered");
        return;
    }
    self.lookat_anims = interaction.scene;
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    self.anim_sequential_counter = 0;
    self.scene_sequential_sounter = 0;
    self.sequential_scene = 0;
    self.skip_interaction = 0;
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    self.interaction_name = interaction_name;
    self.reaction_stop_anims = 1;
    if (!isdefined(self.allow_interactions)) {
        self.allow_interactions = 1;
    }
    if (isdefined(level.interaction_manager)) {
        scripts\sp\interaction_manager::add_actor_to_manager();
        level.interaction_manager.data["registered_interactions"][interaction_name] = [];
        if (isdefined(interaction.scene["vo_lines_male"])) {
            level.interaction_manager.data["registered_interactions"][interaction_name]["vo_lines_male"] = interaction.scene["vo_lines_male"];
        }
        if (isdefined(interaction.scene["vo_lines_female"])) {
            level.interaction_manager.data["registered_interactions"][interaction_name]["vo_lines_female"] = interaction.scene["vo_lines_female"];
        }
    }
    if (isdefined(optional_scripted_struct)) {
        optional_struct = undefined;
        if (isarray(self.lookat_anims["idle"])) {
            var_7dadc6aea2eb869d = self.lookat_anims["idle"][0];
        } else {
            var_7dadc6aea2eb869d = self.lookat_anims["idle"];
        }
        if (isstring(optional_scripted_struct)) {
            optional_struct = getstruct(optional_scripted_struct, "targetname");
        } else if (isstruct(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else if (isent(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else {
            assertmsg("Optional struct is not a string or struct or an ent");
            return;
        }
        anime = var_7dadc6aea2eb869d;
        start_origin = getstartorigin(optional_struct.origin, optional_struct.angles, anime);
        start_angles = getstartangles(optional_struct.origin, optional_struct.angles, anime);
        if (!isdefined(self.is_cheap)) {
            self forceteleport(start_origin, start_angles);
        } else {
            self.origin = start_origin;
            self.angles = start_angles;
        }
        if (!isdefined(self.is_cheap)) {
            self animmode("noclip");
        }
        self.optional_struct = optional_struct;
    }
    if (!isdefined(self.anim_info)) {
        self.anim_info = spawnstruct();
    }
    if (isdefined(self.lookat_anims["no_gun"])) {
        if (!isdefined(self.is_cheap)) {
            scripts\common\ai::gun_remove();
        }
    }
    if (isdefined(self.is_cheap)) {
        if (!isdefined(var_4ec51221f3064070)) {
            thread interaction_process();
            thread interaction_end_cheap();
        } else {
            thread interaction_follow_process();
            thread interaction_end_cheap();
        }
    } else if (!isdefined(var_4ec51221f3064070)) {
        asm_animcustom(&interaction_process, &interaction_end);
    } else {
        asm_animcustom(&interaction_follow_process, &interaction_end);
    }
    self waittill("reaction_end");
}

// Namespace interaction / scripts\sp\interaction
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1348
// Size: 0xd4
function play_smart_interaction(interaction_name, reaction_vo, post_reaction_vo, var_42b1f24d780b1894, var_4f86d94cda7ccfed, optional_scripted_struct, var_ae60636acdfadd47, var_a8b8d69bb3f6e8a9) {
    assert(is_interaction(interaction_name));
    self endon("death");
    self endon("stop_smart_reaction");
    setup_interaction_head();
    var_cd56aed546a14150 = get_interaction(interaction_name).scene["trigger_radius"] * 2;
    thread scripts\sp\interaction_manager::reaction_look_distance_based(var_cd56aed546a14150);
    play_interaction_unknowntype(interaction_name, optional_scripted_struct, reaction_vo, var_a8b8d69bb3f6e8a9);
    self waittill("interaction_done");
    thread gesture_stop(0.7);
    self notify("stop_reaction_look");
    waittill_playeroutsideradius(var_ae60636acdfadd47);
    play_looping_acknowlegdements(post_reaction_vo, var_ae60636acdfadd47);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1424
// Size: 0x38
function setup_interaction_head() {
    self.headknob = generic_human%head;
    self.scriptedtalkingknob = generic_human%scripted_talking;
    self.defaulttalk = generic_human%generic_talker_allies;
}

// Namespace interaction / scripts\sp\interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1464
// Size: 0x51
function play_interaction_unknowntype(interaction_name, optional_scripted_struct, reaction_vo, var_a8b8d69bb3f6e8a9) {
    if (issubstr(interaction_name, "blended")) {
        thread play_interaction_blended(interaction_name, optional_scripted_struct);
    } else {
        thread play_interaction(interaction_name, optional_scripted_struct);
    }
    queue_interaction_vo(reaction_vo, var_a8b8d69bb3f6e8a9);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14bd
// Size: 0x3a
function queue_interaction_vo(reaction_vo, var_a8b8d69bb3f6e8a9) {
    if (!isdefined(var_a8b8d69bb3f6e8a9)) {
        thread play_note_anim_vo(reaction_vo);
        return;
    }
    self waittill("playing_interaction_scene");
    delaythread(var_a8b8d69bb3f6e8a9, &scripts\sp\interaction_manager::play_smart_dialog_if_exists, reaction_vo);
}

// Namespace interaction / scripts\sp\interaction
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x14ff
// Size: 0x109
function play_smart_simple_interaction(interaction_name, reaction_vo, post_reaction_vo, var_42b1f24d780b1894, var_4f86d94cda7ccfed, optional_scripted_struct, var_ae60636acdfadd47) {
    self endon("death");
    self endon("stop_smart_reaction");
    assert(is_interaction(interaction_name));
    self.headknob = generic_human%head;
    self.scriptedtalkingknob = generic_human%scripted_talking;
    self.defaulttalk = generic_human%generic_talker_allies;
    thread play_interaction_simple(interaction_name, optional_scripted_struct);
    scripts\sp\interaction_manager::play_gesture_reaction(85, 50, reaction_vo, var_42b1f24d780b1894, var_4f86d94cda7ccfed);
    self notify("first_acknowledgement_done");
    waittill_playeroutsideradius(var_ae60636acdfadd47);
    var_a11fcafcdab17d56 = create_interaction_linebook(post_reaction_vo);
    while (true) {
        var_a0dc29cff035e549 = var_a11fcafcdab17d56 get_interaction_vo_line();
        scripts\sp\interaction_manager::play_gesture_reaction(85, 50, var_a0dc29cff035e549, var_42b1f24d780b1894, var_4f86d94cda7ccfed);
        waittill_playeroutsideradius(var_ae60636acdfadd47);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1610
// Size: 0x90
function play_smart_basic_interaction(var_bff752982ed3d584, post_reaction_vo, var_42b1f24d780b1894, var_4f86d94cda7ccfed, var_ae60636acdfadd47) {
    self endon("death");
    self endon("stop_smart_reaction");
    self.headknob = generic_human%head;
    self.scriptedtalkingknob = generic_human%scripted_talking;
    self.defaulttalk = generic_human%generic_talker_allies;
    play_single_acknowledgement(var_bff752982ed3d584);
    self notify("first_acknowledgement_done");
    waittill_playeroutsideradius(var_ae60636acdfadd47);
    play_looping_acknowlegdements(post_reaction_vo, var_ae60636acdfadd47);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a8
// Size: 0x68
function play_smart_silent_interaction(var_ae60636acdfadd47) {
    self endon("death");
    self endon("stop_smart_reaction");
    self.headknob = generic_human%head;
    self.scriptedtalkingknob = generic_human%scripted_talking;
    self.defaulttalk = generic_human%generic_talker_allies;
    play_single_acknowledgement(undefined);
    waittill_playeroutsideradius(var_ae60636acdfadd47);
    play_looping_acknowlegdements(undefined, var_ae60636acdfadd47);
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1718
// Size: 0xa3
function play_smart_simple_silent_interaction(interaction_name, optional_scripted_struct, var_ae60636acdfadd47) {
    self endon("death");
    self endon("stop_smart_reaction");
    assert(is_interaction(interaction_name));
    self.headknob = generic_human%head;
    self.scriptedtalkingknob = generic_human%scripted_talking;
    self.defaulttalk = generic_human%generic_talker_allies;
    thread play_interaction_simple(interaction_name, optional_scripted_struct);
    scripts\sp\interaction_manager::play_gesture_reaction(85, 50);
    self notify("first_acknowledgement_done");
    waittill_playeroutsideradius(var_ae60636acdfadd47);
    play_looping_acknowlegdements(undefined, var_ae60636acdfadd47);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c3
// Size: 0x36
function play_single_acknowledgement(vo_line) {
    self endon("stop_smart_reaction");
    var_6ea4bfdbc4ecb4ab = 110;
    var_d0def05d989b3be4 = 85;
    scripts\sp\interaction_manager::play_gesture_reaction(var_6ea4bfdbc4ecb4ab, var_d0def05d989b3be4, vo_line);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1801
// Size: 0x86
function play_looping_acknowlegdements(var_efe1c4b2620f108, var_ae60636acdfadd47) {
    self endon("death");
    self endon("stop_smart_reaction");
    if (!isdefined(var_ae60636acdfadd47)) {
        var_ae60636acdfadd47 = 300;
    }
    if (isdefined(var_efe1c4b2620f108)) {
        var_a11fcafcdab17d56 = create_interaction_linebook(var_efe1c4b2620f108);
        while (true) {
            var_a0dc29cff035e549 = var_a11fcafcdab17d56 get_interaction_vo_line();
            play_single_acknowledgement(var_a0dc29cff035e549);
            waittill_playeroutsideradius(var_ae60636acdfadd47);
        }
        return;
    }
    while (true) {
        play_single_acknowledgement();
        waittill_playeroutsideradius(var_ae60636acdfadd47);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x188f
// Size: 0x25
function play_silent_acknowledgement() {
    var_6ea4bfdbc4ecb4ab = 110;
    var_d0def05d989b3be4 = 85;
    scripts\sp\interaction_manager::play_gesture_reaction(var_6ea4bfdbc4ecb4ab, var_d0def05d989b3be4);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18bc
// Size: 0x47
function waittill_playeroutsideradius(dist) {
    if (!isdefined(dist)) {
        dist = 256;
    }
    while (true) {
        if (distance2d(self.origin, level.player.origin) >= dist) {
            break;
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x190b
// Size: 0x82
function create_interaction_linebook(var_efe1c4b2620f108) {
    assertex(isdefined(var_efe1c4b2620f108), "vo_array must be defined to perform a smart_interaction.");
    if (!isarray(var_efe1c4b2620f108) && !isstruct(var_efe1c4b2620f108) && !isstring(var_efe1c4b2620f108) && !isvector(var_efe1c4b2620f108) && !var_efe1c4b2620f108) {
        return undefined;
    }
    var_88318301272d82da = spawnstruct();
    var_88318301272d82da.base = var_efe1c4b2620f108;
    var_88318301272d82da.available = var_efe1c4b2620f108;
    var_88318301272d82da.used = [];
    return var_88318301272d82da;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1996
// Size: 0x1e
function reset_interaction_linebook() {
    self.used = [];
    self.available = self.base;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19bc
// Size: 0x80
function get_interaction_vo_line() {
    var_a0dc29cff035e549 = undefined;
    if (isdefined(self.available)) {
        if (self.available.size <= 0) {
            reset_interaction_linebook();
        }
        var_a0dc29cff035e549 = self.available[randomint(self.available.size)];
        self.used = array_add(self.used, var_a0dc29cff035e549);
        self.available = array_remove(self.available, var_a0dc29cff035e549);
        return var_a0dc29cff035e549;
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a44
// Size: 0x107
function play_smart_basic_group_interaction(var_5f7a2f6ef630c3e8, var_7551dea02427d9cd, var_eee89e98a7ce9526, var_ae60636acdfadd47) {
    foreach (actor in var_5f7a2f6ef630c3e8) {
        actor endon("death");
        actor endon("stop_smart_reaction");
        actor.headknob = generic_human%head;
        actor.scriptedtalkingknob = generic_human%scripted_talking;
        actor.defaulttalk = generic_human%generic_talker_allies;
    }
    if (var_5f7a2f6ef630c3e8.size != var_7551dea02427d9cd.size || var_5f7a2f6ef630c3e8.size != var_eee89e98a7ce9526.size) {
        assertmsg("Basic Group Interaction Input Error: The number of vo_arrays you pass must be equal to the number of actors.");
        return;
    }
    play_group_acknowledgement(var_5f7a2f6ef630c3e8, var_7551dea02427d9cd);
    var_917387ee0fea69ef = scripts\sp\interaction_manager::create_middle_ent(var_5f7a2f6ef630c3e8);
    var_917387ee0fea69ef waittill_playeroutsideradius(var_ae60636acdfadd47);
    play_group_looping_acknowledgements(var_5f7a2f6ef630c3e8, var_eee89e98a7ce9526, var_ae60636acdfadd47);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b53
// Size: 0x38
function play_group_acknowledgement(var_5f7a2f6ef630c3e8, var_41bdbc2d3ac2baba) {
    var_6ea4bfdbc4ecb4ab = 110;
    var_d0def05d989b3be4 = 85;
    scripts\sp\interaction_manager::play_group_gesture_reaction(var_5f7a2f6ef630c3e8, var_6ea4bfdbc4ecb4ab, var_d0def05d989b3be4, var_41bdbc2d3ac2baba);
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b93
// Size: 0xbf
function play_group_looping_acknowledgements(var_5f7a2f6ef630c3e8, var_19c9b444da731181, var_ae60636acdfadd47) {
    foreach (actor in var_5f7a2f6ef630c3e8) {
        actor endon("death");
        actor endon("stop_smart_reaction");
    }
    var_3204046e85aab8c2 = create_group_interaction_linebook(var_19c9b444da731181);
    var_917387ee0fea69ef = scripts\sp\interaction_manager::create_middle_ent(var_5f7a2f6ef630c3e8);
    while (true) {
        var_e73000eabf1cd643 = get_interaction_vo_line_array(var_3204046e85aab8c2);
        play_group_acknowledgement(var_5f7a2f6ef630c3e8, var_e73000eabf1cd643);
        var_917387ee0fea69ef waittill_playeroutsideradius(var_ae60636acdfadd47);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5a
// Size: 0x4e
function create_group_interaction_linebook(var_19c9b444da731181) {
    assertex(isdefined(var_19c9b444da731181), "vo_arrays must be defined to perform a smart_group_interaction.");
    var_3204046e85aab8c2 = [];
    for (i = 0; i < var_19c9b444da731181.size; i++) {
        var_3204046e85aab8c2[i] = create_interaction_linebook(var_19c9b444da731181[i]);
    }
    return var_3204046e85aab8c2;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb1
// Size: 0x3e
function get_interaction_vo_line_array(var_3204046e85aab8c2) {
    var_69cac023b71c8833 = [];
    for (i = 0; i < var_3204046e85aab8c2.size; i++) {
        var_69cac023b71c8833[i] = var_3204046e85aab8c2[i] get_interaction_vo_line();
    }
    return var_69cac023b71c8833;
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf8
// Size: 0x2ba
function play_interaction_with_states(interaction_name, optional_scripted_struct, var_4ec51221f3064070) {
    self endon("death");
    self notify("reaction_end");
    interaction = get_state_interaction(interaction_name);
    setup_exit_states_for_interaction(interaction_name);
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " isn't registered in state based interactions");
        return;
    }
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    self.interaction_name = interaction_name;
    self.reaction_stop_anims = 1;
    if (!isdefined(self.allow_interactions)) {
        self.allow_interactions = 1;
    }
    if (isdefined(level.interaction_manager)) {
        scripts\sp\interaction_manager::add_actor_to_manager();
    }
    if (isdefined(optional_scripted_struct)) {
        optional_struct = undefined;
        if (isarray(interaction.scene["idle"])) {
            var_7dadc6aea2eb869d = interaction.scene["idle"][0];
        } else {
            var_7dadc6aea2eb869d = interaction.scene["idle"];
        }
        if (isstring(optional_scripted_struct)) {
            optional_struct = getstruct(optional_scripted_struct, "targetname");
        } else if (isstruct(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else if (isent(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else {
            assertmsg("Optional struct is not a string or struct or an ent");
            return;
        }
        anime = var_7dadc6aea2eb869d;
        start_origin = getstartorigin(optional_struct.origin, optional_struct.angles, anime);
        start_angles = getstartangles(optional_struct.origin, optional_struct.angles, anime);
        if (!isdefined(self.is_cheap)) {
            self forceteleport(start_origin, start_angles);
        } else {
            self.origin = start_origin;
            self.angles = start_angles;
        }
        if (!isdefined(self.is_cheap)) {
            self animmode("noclip");
        }
        self.optional_struct = optional_struct;
    }
    if (!isdefined(self.anim_info)) {
        self.anim_info = spawnstruct();
    }
    if (isdefined(interaction.scene["no_gun"])) {
        if (!isdefined(self.is_cheap) && !isnullweapon(self.weapon)) {
            scripts\common\ai::gun_remove();
        }
    }
    if (isdefined(self.is_cheap)) {
        thread interaction_process_for_states();
        thread interaction_end_cheap();
    } else {
        asm_animcustom(&interaction_process_for_states, &scripts\sp\interaction_manager::stop_state_based_interaction);
    }
    self waittill("reaction_end");
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fba
// Size: 0x310
function play_interaction_simple(interaction_name, optional_scripted_struct, optional_prop) {
    self endon("death");
    self endon("reaction_end");
    interaction = get_interaction(interaction_name);
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " but interaction isn't registered");
        return;
    }
    self.lookat_anims = interaction.scene;
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    self.anim_sequential_counter = 0;
    self.scene_sequential_sounter = 0;
    self.sequential_scene = 0;
    self.skip_interaction = 0;
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    self.interaction_name = interaction_name;
    self.reaction_stop_anims = 1;
    self.optional_struct = undefined;
    self.optional_prop = undefined;
    if (!isdefined(self.allow_interactions)) {
        self.allow_interactions = 1;
    }
    if (isdefined(level.interaction_manager)) {
        level.interaction_manager.data["actors"] = array_add(level.interaction_manager.data["actors"], self);
    }
    if (isdefined(optional_prop)) {
        self.optional_prop = optional_prop;
    }
    if (isdefined(optional_scripted_struct)) {
        optional_struct = undefined;
        if (isarray(self.lookat_anims["idle"])) {
            var_7dadc6aea2eb869d = self.lookat_anims["idle"][0];
        } else {
            var_7dadc6aea2eb869d = self.lookat_anims["idle"];
        }
        if (isstring(optional_scripted_struct)) {
            optional_struct = getstruct(optional_scripted_struct, "targetname");
        } else if (isstruct(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else if (isent(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else {
            assertmsg("Optional struct is not a string or struct");
            return;
        }
        anime = var_7dadc6aea2eb869d;
        start_origin = getstartorigin(optional_struct.origin, optional_struct.angles, anime);
        start_angles = getstartangles(optional_struct.origin, optional_struct.angles, anime);
        self.optional_struct = optional_scripted_struct;
    }
    if (!isdefined(self.is_cheap)) {
        self animmode("noclip");
    }
    if (!isdefined(self.anim_info)) {
        self.anim_info = spawnstruct();
    }
    if (isdefined(self.lookat_anims["no_gun"])) {
        if (!isdefined(self.is_cheap) && !isnullweapon(self.weapon)) {
            scripts\common\ai::gun_remove();
        }
    }
    if (isdefined(self.is_cheap)) {
        thread simple_interaction_idles();
        thread interaction_end_cheap();
    } else {
        asm_animcustom(&simple_interaction_idles, &interaction_end);
    }
    self waittill("reaction_end");
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22d2
// Size: 0x6f
function play_interaction_blended(interaction_name, optional_scripted_struct) {
    self endon("death");
    self notify("reaction_end");
    interaction = get_interaction(interaction_name);
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " but interaction isn't registered");
        return;
    }
    reset_actor_interaction_values(interaction, interaction_name);
    add_actor_tointeractionmanager();
    move_actor_tointeractionposition(optional_scripted_struct);
    run_blended_interaction();
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2349
// Size: 0x109
function reset_actor_interaction_values(interaction, interaction_name) {
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    self.lookat_anims = interaction.scene;
    self.anim_sequential_counter = 0;
    self.scene_sequential_sounter = 0;
    self.sequential_scene = 0;
    self.skip_interaction = 0;
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    self.interaction_name = interaction_name;
    self.reaction_stop_anims = 1;
    if (!isdefined(self.allow_interactions) || isdefined(self.allow_interactions) && !self.allow_interactions) {
        self.allow_interactions = 1;
    }
    if (!isdefined(self.anim_info)) {
        self.anim_info = spawnstruct();
    }
    if (isdefined(self.lookat_anims["no_gun"])) {
        if (!isdefined(self.is_cheap)) {
            gun_remove();
        }
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x245a
// Size: 0x49
function add_actor_tointeractionmanager() {
    if (isdefined(level.interaction_manager)) {
        level.interaction_manager.data["actors"] = array_add(level.interaction_manager.data["actors"], self);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24ab
// Size: 0x3e
function get_interaction_actor_lookatidle() {
    if (isarray(self.lookat_anims["idle"])) {
        return self.lookat_anims["idle"][0];
    }
    return self.lookat_anims["idle"];
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24f1
// Size: 0x5e
function get_interaction_actor_optionalstruct(optional_scripted_struct) {
    optional_struct = undefined;
    if (isstring(optional_scripted_struct)) {
        optional_struct = getstruct(optional_scripted_struct, "targetname");
    } else if (isstruct(optional_scripted_struct)) {
        optional_struct = optional_scripted_struct;
    } else if (isent(optional_scripted_struct)) {
        optional_struct = optional_scripted_struct;
    } else {
        assertmsg("Optional struct is not a string or struct");
    }
    return optional_struct;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2558
// Size: 0xb3
function move_actor_tointeractionposition(optional_scripted_struct) {
    if (isdefined(optional_scripted_struct)) {
        var_44c623f0eb82b128 = get_interaction_actor_lookatidle();
        optional_struct = get_interaction_actor_optionalstruct(optional_scripted_struct);
        if (!isdefined(optional_struct)) {
            return;
        }
        self.optional_scripted_struct = optional_scripted_struct;
        start_origin = getstartorigin(optional_struct.origin, optional_struct.angles, var_44c623f0eb82b128);
        start_angles = getstartangles(optional_struct.origin, optional_struct.angles, var_44c623f0eb82b128);
        teleport_interaction_actor(start_origin, start_angles);
        if (!isdefined(self.is_cheap)) {
            self animmode("noclip");
        }
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2613
// Size: 0x40
function teleport_interaction_actor(new_origin, new_angles) {
    if (isdefined(self.is_cheap)) {
        self.origin = new_origin;
        self.angles = new_angles;
        return;
    }
    self forceteleport(new_origin, new_angles);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265b
// Size: 0x3b
function run_blended_interaction() {
    if (isdefined(self.is_cheap)) {
        thread interaction_process_blended();
        thread interaction_end_cheap();
    } else {
        asm_animcustom(&interaction_process_blended, &interaction_end);
    }
    self waittill("reaction_end");
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x269e
// Size: 0x1e7
function play_interaction_immediate(interaction_name, optional_scripted_struct) {
    self endon("death");
    interaction = get_interaction(interaction_name);
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " but interaction isn't registered");
        return;
    }
    self.lookat_anims = interaction.scene;
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    self.interaction_name = interaction_name;
    self.anim_sequential_counter = 0;
    self.scene_sequential_sounter = 0;
    self.sequential_scene = 0;
    self.skip_interaction = 0;
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    if (!isdefined(self.allow_interactions)) {
        self.allow_interactions = 1;
    }
    if (isdefined(level.interaction_manager)) {
        level.interaction_manager.data["actors"] = array_add(level.interaction_manager.data["actors"], self);
    }
    if (isdefined(optional_scripted_struct)) {
        optional_struct = undefined;
        starting_anim = self.lookat_anims["lastanim"];
        if (isstring(optional_scripted_struct)) {
            optional_struct = getstruct(optional_scripted_struct, "targetname");
        } else if (isstruct(optional_scripted_struct)) {
            optional_struct = optional_scripted_struct;
        } else {
            assertmsg("Optional struct is not a string or struct");
            return;
        }
        self.lookat_anims["optional_struct"] = optional_struct;
    }
    if (!isdefined(self.anim_info)) {
        self.anim_info = spawnstruct();
    }
    if (isdefined(self.lookat_anims["no_gun"])) {
        if (!isdefined(self.is_cheap)) {
            gun_remove();
        }
    }
    thread asm_animcustom(&interaction_immediate_process);
    self waittill("interaction_done");
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x288d
// Size: 0x17
function clear_root() {
    self clearanim(generic_human%body, 0.2);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28ac
// Size: 0x85
function is_looking_at_range(target_guy, range) {
    player_forward = anglestoforward(level.player.angles);
    var_bac0559feed06173 = vectornormalize(target_guy.origin - level.player.origin);
    dot_vec = vectordot(player_forward, var_bac0559feed06173);
    if (dot_vec >= range) {
        return 1;
    }
    return 0;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2939
// Size: 0x2f5
function interaction_immediate_process() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.followoff = 0;
    clear_root();
    if (!isdefined(self.is_cheap)) {
        self orientmode("face angle", self.angles[1]);
        self animmode("noclip");
    }
    optional_struct = self.lookat_anims["optional_struct"];
    anim_string = "single anim";
    if (!ent_flag_exist("interaction_end")) {
        ent_flag_init("interaction_end");
    }
    ent_flag_clear("interaction_end");
    initial_reaction_blendtime = 0.25;
    lookat_end_blendtime = 0.25;
    if (isdefined(self.lookat_anims["common_name"])) {
        thread scripts\sp\interaction_manager::trigger_interaction_common();
    }
    if (!self.nearby_interaction_running) {
        self.is_playing_reaction = 1;
        self notify("playing_interaction");
        var_837c12743ab916fe = undefined;
        if (isdefined(self.lookat_anims["interaction_position"])) {
            var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
        } else {
            var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
        }
        angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
        var_a5148760d51eb926 = math::normalize_value(0, 360, angle);
        println("<dev string:x1c>" + angle);
        var_5442d92e287bffa2 = self.lookat_anims["lastanim"];
        if (isdefined(self.lookat_anims["angles"])) {
            foreach (var_ad0c4582f262f65a in self.lookat_anims["angles"]) {
                if (angle <= var_ad0c4582f262f65a) {
                    var_5442d92e287bffa2 = self.lookat_anims[var_ad0c4582f262f65a];
                    break;
                }
            }
        }
        if (isdefined(optional_struct)) {
            start_origin = getstartorigin(optional_struct.origin, optional_struct.angles, var_5442d92e287bffa2);
            start_angles = getstartangles(optional_struct.origin, optional_struct.angles, var_5442d92e287bffa2);
            self forceteleport(start_origin, start_angles);
        }
        start_fakeactor_notetracks(var_5442d92e287bffa2);
        self setflaggedanim(anim_string, var_5442d92e287bffa2, 1, initial_reaction_blendtime);
        wait_time = getanimlength(var_5442d92e287bffa2);
        wait wait_time;
        self clearanim(var_5442d92e287bffa2, lookat_end_blendtime);
        level notify("interaction_done");
        self notify("interaction_done");
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c36
// Size: 0x1443
function interaction_follow_process() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.followoff = 0;
    clear_root();
    if (!isdefined(self.is_cheap)) {
        self orientmode("face angle", self.angles[1]);
        self animmode("noclip");
    }
    var_e1f91fe78b76dd48 = undefined;
    self.random_idle_playing = 0;
    if (isarray(self.lookat_anims["idle"])) {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"][0];
        thread random_idle_controller();
    } else {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"];
    }
    start_fakeactor_notetracks(var_e1f91fe78b76dd48);
    self setflaggedanim("idle", var_e1f91fe78b76dd48, 1, 0.5, 1);
    thread interaction_set_anim_movement("stop");
    anim_string = "single anim";
    if (!ent_flag_exist("scene_end")) {
        ent_flag_init("scene_end");
    }
    ent_flag_clear("scene_end");
    if (!ent_flag_exist("playing_interaction")) {
        ent_flag_init("playing_interaction");
    }
    ent_flag_clear("playing_interaction");
    lookat_lerp = 0.11;
    initial_reaction_blendtime = 0.25;
    lookat_follow_blendtime = 0.25;
    lookat_end_distance = 350;
    lookat_end_blendtime = 0.45;
    var_f2aee3c308532d3 = undefined;
    var_86fdc699f8814626 = undefined;
    var_9ef180b6a072474b = undefined;
    if (isdefined(self.lookat_anims["reacquire_left"]) || isdefined(self.lookat_anims["reacquire_right"])) {
        var_f2aee3c308532d3 = 1;
    }
    self.reactiontrigger = spawn("trigger_radius", self.origin, 0, self.lookat_anims["trigger_radius"], self.lookat_anims["trigger_radius"]);
    while (true) {
        if ((level.player istouching(self.reactiontrigger) || is_looking_at_range(self, 0.925)) && !self.random_idle_playing) {
            if (self.sequential_scene) {
                self.skip_interaction = 1;
            } else {
                self.skip_interaction = 0;
            }
        } else {
            self.skip_interaction = 0;
        }
        var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
        trace_end = undefined;
        tracecontents = create_contents(1, 1, 0, 1, 1, 1);
        trace = undefined;
        while (true) {
            if (isdefined(self.lookat_anims["interaction_trigger_override"])) {
                break;
            }
            if (scripts\sp\interaction_manager::can_play_nearby_interaction(self.lookat_anims["trigger_radius"] * 2)) {
                if (isdefined(self.lookat_anims["interaction_position"])) {
                    var_84d1d51d3f40043 = lengthsquared(self.lookat_anims["interaction_position"] - self.origin);
                } else {
                    var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
                }
                if (isdefined(self.lookat_anims["interaction_trigger_override"])) {
                    break;
                } else if (self.lookat_anims["trigger_radius"] > 0 && var_84d1d51d3f40043 < squared(self.lookat_anims["trigger_radius"]) && is_looking_at_range(self, 0.925) && !self.random_idle_playing) {
                    var_1b2a5f2737c5776c = self.origin + anglestoup(self.angles) * 66;
                    trace_end = vectornormalize(level.player geteye() - var_1b2a5f2737c5776c) * self.lookat_anims["trigger_radius"] + var_1b2a5f2737c5776c;
                    trace = ray_trace(var_1b2a5f2737c5776c, trace_end, self, tracecontents);
                    if (isplayer(trace["entity"]) || isdefined(self.lookat_anims["interaction_trigger_override"])) {
                        break;
                    }
                }
            }
            waitframe();
        }
        if (isdefined(self.lookat_anims["common_name"])) {
            thread scripts\sp\interaction_manager::trigger_interaction_common();
        }
        self.is_playing_reaction = 1;
        self notify("playing_interaction_scene");
        level notify("playing_interaction");
        var_837c12743ab916fe = undefined;
        if (isdefined(self.lookat_anims["interaction_position"])) {
            var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
        } else {
            var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
        }
        angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
        var_a5148760d51eb926 = math::normalize_value(0, 360, angle);
        if (isdefined(self.lookat_anims["backseam"])) {
            if (var_a5148760d51eb926 >= 0 && var_a5148760d51eb926 <= 0.5) {
                var_a5148760d51eb926 += 0.5;
            } else {
                var_a5148760d51eb926 -= 0.5;
            }
        }
        println("<dev string:x1c>" + angle);
        var_5442d92e287bffa2 = self.lookat_anims["lastanim"];
        if (isdefined(self.lookat_anims["angles"]) && !self.sequential_scene) {
            foreach (var_ad0c4582f262f65a in self.lookat_anims["angles"]) {
                if (angle <= var_ad0c4582f262f65a) {
                    var_5442d92e287bffa2 = self.lookat_anims[var_ad0c4582f262f65a];
                    break;
                }
            }
        }
        if (isarray(var_5442d92e287bffa2)) {
            if (isarray(var_5442d92e287bffa2[0])) {
                var_1511386e758ef855 = self.anim_sequential_counter;
                var_e88ef0694a45c625 = var_5442d92e287bffa2[0][var_1511386e758ef855][0];
            } else {
                var_e88ef0694a45c625 = var_5442d92e287bffa2[0];
            }
        } else {
            var_e88ef0694a45c625 = var_5442d92e287bffa2;
        }
        if (!self.skip_interaction) {
            start_fakeactor_notetracks(var_e88ef0694a45c625);
            self setflaggedanimknob(anim_string, var_e88ef0694a45c625, 1, initial_reaction_blendtime, 1);
            self.is_playing_reaction = 1;
        }
        if (!self.skip_interaction) {
            if (isarray(var_5442d92e287bffa2)) {
                if (isarray(var_5442d92e287bffa2[0]) && !isarray(self.lookat_anims["diff"])) {
                    var_1511386e758ef855 = self.anim_sequential_counter;
                    var_efe1c4b2620f108 = var_5442d92e287bffa2[0][var_1511386e758ef855];
                    thread set_sequential_wait_time(var_efe1c4b2620f108);
                    thread play_anim_vo_sequential(var_efe1c4b2620f108);
                } else if (var_5442d92e287bffa2.size > 1) {
                    thread play_anim_vo_sequential(var_5442d92e287bffa2);
                }
            }
        }
        if (isdefined(self.lookat_anims["reaction_func"])) {
            self thread [[ self.lookat_anims["reaction_func"] ]]();
        }
        var_2c3d71c250a9405d = getanimlength(var_e88ef0694a45c625);
        var_2c3d71c250a9405d -= lookat_follow_blendtime;
        if (var_2c3d71c250a9405d < 0) {
            var_2c3d71c250a9405d = 0;
        }
        if (!self.skip_interaction) {
            wait var_2c3d71c250a9405d;
        }
        if (!self.skip_interaction) {
            start_fakeactor_notetracks(self.lookat_anims["follow"]);
            self setflaggedanimlimited(anim_string, self.lookat_anims["follow"], 1, 0.25, 1);
            self setanimtime(self.lookat_anims["follow"], var_a5148760d51eb926);
            self setanimknob(self.lookat_anims["ring"], 1, lookat_follow_blendtime, 1);
        }
        var_92778d781991982a = undefined;
        if (isarray(self.lookat_anims["diff"])) {
            var_1511386e758ef855 = self.anim_sequential_counter;
            var_92778d781991982a = self.lookat_anims["diff"][var_1511386e758ef855];
        } else {
            var_92778d781991982a = self.lookat_anims["diff"];
        }
        start_fakeactor_notetracks(var_92778d781991982a);
        self setflaggedanimlimited(anim_string, var_92778d781991982a, 1, 0.25, 1);
        self.is_playing_reaction = 1;
        if (!self.skip_interaction) {
            self setanimlimited(self.lookat_anims["additive"], 1, lookat_follow_blendtime, 1);
        }
        delaythread(getanimlength(var_92778d781991982a), &ent_flag_set, "scene_end");
        ent_flag_set("playing_interaction");
        thread ent_flag_clear_delayed("playing_interaction", getanimlength(var_92778d781991982a));
        var_8bc1a6a78e77c5d1 = var_a5148760d51eb926;
        while (true) {
            var_ac24b8027c653bef = distance2d(level.player.origin, self.origin);
            if ((var_ac24b8027c653bef >= lookat_end_distance || ent_flag("scene_end")) && !isdefined(var_f2aee3c308532d3)) {
                var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
                if (var_84d1d51d3f40043 < squared(self.lookat_anims["trigger_radius"])) {
                    var_1b2a5f2737c5776c = self.origin + anglestoup(self.angles) * 66;
                    trace_end = vectornormalize(level.player geteye() - var_1b2a5f2737c5776c) * self.lookat_anims["trigger_radius"] + var_1b2a5f2737c5776c;
                    trace = ray_trace(var_1b2a5f2737c5776c, trace_end, self, tracecontents);
                    if (isplayer(trace["entity"]) || isdefined(self.lookat_anims["interaction_trigger_override"])) {
                        if (isarray(self.lookat_anims["diff"]) && self.anim_sequential_counter < self.lookat_anims["diff"].size - 1) {
                            self.sequential_scene = 1;
                            ent_flag_clear("scene_end");
                            self.anim_sequential_counter += 1;
                            self clearanim(var_92778d781991982a, 0.15);
                            self.is_playing_reaction = 0;
                            break;
                        }
                    }
                }
                if (isdefined(self.lookat_anims["exitangles"])) {
                    exit_anim = self.lookat_anims["exitangles_anims"]["lastexitanim"];
                    if (isdefined(self.lookat_anims["interaction_position"])) {
                        var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
                    } else {
                        var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
                    }
                    angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
                    println("<dev string:x1c>" + angle);
                    foreach (var_307f20aac7e95ba9 in self.lookat_anims["exitangles"]) {
                        if (angle <= var_307f20aac7e95ba9) {
                            exit_anim = self.lookat_anims["exitangles_anims"][var_307f20aac7e95ba9];
                            break;
                        }
                    }
                    start_fakeactor_notetracks(exit_anim);
                    self setflaggedanimknob(anim_string, exit_anim, 1, lookat_end_blendtime, 1);
                    wait getanimlength(exit_anim);
                    if (isdefined(self.lookat_anims["end_idle"])) {
                        if (isarray(var_5442d92e287bffa2[0])) {
                            if (self.anim_sequential_counter >= var_5442d92e287bffa2[0].size) {
                                start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                                self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                            } else {
                                start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                                self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
                            }
                        } else {
                            start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                            self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                        }
                    } else {
                        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                        self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
                    }
                    self.is_playing_reaction = 0;
                    if (isarray(self.lookat_anims["diff"])) {
                        if (self.anim_sequential_counter < self.lookat_anims["diff"].size) {
                            ent_flag_clear("scene_end");
                            self clearanim(self.lookat_anims["follow"], 0.1);
                            self clearanim(self.lookat_anims["ring"], 0.1);
                            self.anim_sequential_counter += 1;
                            self.is_playing_reaction = 0;
                        }
                        if (self.anim_sequential_counter >= self.lookat_anims["diff"].size) {
                            self.is_playing_reaction = 0;
                            var_9ef180b6a072474b = 1;
                            if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                                self waittill("forever");
                            }
                        }
                    } else {
                        var_9ef180b6a072474b = 1;
                        if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                            self waittill("forever");
                        }
                    }
                    self.is_playing_reaction = 0;
                    break;
                } else {
                    if (isdefined(self.lookat_anims["end_idle"])) {
                        if (isarray(var_5442d92e287bffa2[0])) {
                            if (self.anim_sequential_counter >= var_5442d92e287bffa2[0].size) {
                                start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                                self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                            } else {
                                start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                                self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
                            }
                        } else {
                            start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                            self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                        }
                    } else {
                        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                        self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
                    }
                    self.is_playing_reaction = 0;
                    if (isarray(self.lookat_anims["diff"])) {
                        if (self.anim_sequential_counter < self.lookat_anims["diff"].size) {
                            ent_flag_clear("scene_end");
                            self clearanim(self.lookat_anims["follow"], 0.1);
                            self clearanim(self.lookat_anims["ring"], 0.1);
                            self.anim_sequential_counter += 1;
                            self.is_playing_reaction = 0;
                        }
                        if (self.anim_sequential_counter >= self.lookat_anims["diff"].size) {
                            self.is_playing_reaction = 0;
                            var_9ef180b6a072474b = 1;
                            if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                                self waittill("forever");
                            }
                        }
                    } else {
                        var_9ef180b6a072474b = 1;
                        if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                            self waittill("forever");
                        }
                    }
                    self.is_playing_reaction = 0;
                    break;
                }
            }
            if (isdefined(self.lookat_anims["interaction_position"])) {
                var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
            } else {
                var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
            }
            angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
            var_a5148760d51eb926 = math::normalize_value(0, 360, angle);
            if (self.followoff) {
                var_a5148760d51eb926 = 0;
            }
            if (isdefined(self.lookat_anims["backseam"])) {
                if (var_a5148760d51eb926 >= 0 && var_a5148760d51eb926 <= 0.5) {
                    var_a5148760d51eb926 += 0.5;
                } else {
                    var_a5148760d51eb926 -= 0.5;
                }
                var_8bc1a6a78e77c5d1 += (var_a5148760d51eb926 - var_8bc1a6a78e77c5d1) * lookat_lerp;
            } else {
                var_8bc1a6a78e77c5d1 += (var_a5148760d51eb926 - var_8bc1a6a78e77c5d1) * lookat_lerp;
            }
            if (isdefined(var_f2aee3c308532d3)) {
                vec_to_player = vectornormalize(level.player.origin - self.origin);
                vec_to_player = flatten_vector(vec_to_player, anglestoup(self.angles));
                var_58789c337a81799f = anglestoforward(self.angles);
                var_ee30f96416ffafd4 = vectordot(vec_to_player, var_58789c337a81799f);
                angle = acos(var_ee30f96416ffafd4);
                cross = vectorcross(vec_to_player, var_58789c337a81799f);
                if (vectordot(cross, anglestoup(self.angles)) < 0) {
                    angle *= -1;
                }
                var_633b54f5d37b7d94 = 0;
                if (angle >= 90 && !var_633b54f5d37b7d94 && !ent_flag("playing_interaction")) {
                    var_633b54f5d37b7d94 = 1;
                    start_fakeactor_notetracks(self.lookat_anims["reacquire_right"]);
                    self clearanim(generic_human%body, 0.25);
                    self setflaggedanimrestart(anim_string, self.lookat_anims["reacquire_right"], 1, 0.25);
                    wait clamp(getanimlength(self.lookat_anims["reacquire_right"]) - 0.25, 0, 100);
                    self clearanim(self.lookat_anims["reacquire_right"], 0.25);
                } else if (angle < -90 && !var_633b54f5d37b7d94 && !ent_flag("playing_interaction")) {
                    var_633b54f5d37b7d94 = 1;
                    start_fakeactor_notetracks(self.lookat_anims["reacquire_left"]);
                    self clearanim(generic_human%body, 0.25);
                    self setflaggedanimrestart(anim_string, self.lookat_anims["reacquire_left"], 1, 0.25);
                    wait clamp(getanimlength(self.lookat_anims["reacquire_left"]) - 0.25, 0, 100);
                    self clearanim(self.lookat_anims["reacquire_left"], 0.25);
                } else {
                    set_time_via_rate(self.lookat_anims["follow"], var_8bc1a6a78e77c5d1);
                }
                if (var_633b54f5d37b7d94) {
                    if (isdefined(self.lookat_anims["interaction_position"])) {
                        var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
                    } else {
                        var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
                    }
                    angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
                    var_a5148760d51eb926 = math::normalize_value(0, 360, angle);
                    start_fakeactor_notetracks(self.lookat_anims["follow"]);
                    self setflaggedanimlimited(anim_string, self.lookat_anims["follow"], 1, 0.25, 1);
                    self setanimtime(self.lookat_anims["follow"], 0.5);
                    self setanimknob(self.lookat_anims["ring"], 1, lookat_follow_blendtime, 1);
                    if (!ent_flag("playing_interaction") && !ent_flag("scene_end")) {
                        start_fakeactor_notetracks(self.lookat_anims["diff"]);
                        self setflaggedanimlimited(anim_string, self.lookat_anims["diff"], 1, 0.05, 1);
                    }
                    self setanimlimited(self.lookat_anims["additive"], 1, lookat_follow_blendtime, 1);
                    var_8bc1a6a78e77c5d1 = 0.5;
                }
            } else {
                set_time_via_rate(self.lookat_anims["follow"], var_8bc1a6a78e77c5d1);
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4081
// Size: 0xd4c
function interaction_process() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.followoff = 0;
    clear_root();
    if (!isdefined(self.is_cheap)) {
        self orientmode("face angle", self.angles[1]);
        self animmode("noclip");
    }
    var_e1f91fe78b76dd48 = undefined;
    self.random_idle_playing = 0;
    if (isarray(self.lookat_anims["idle"])) {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"][0];
        thread random_idle_controller();
    } else {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"];
    }
    start_fakeactor_notetracks(var_e1f91fe78b76dd48);
    self setflaggedanim("idle", var_e1f91fe78b76dd48, 1, 0.05, 1);
    thread interaction_set_anim_movement("stop");
    anim_string = "single anim";
    if (!ent_flag_exist("scene_end")) {
        ent_flag_init("scene_end");
    }
    ent_flag_clear("scene_end");
    lookat_lerp = 0.11;
    if (isdefined(self.lookat_anims["lookat_lerp"])) {
        lookat_lerp = self.lookat_anims["lookat_lerp"];
    }
    initial_reaction_blendtime = 0.25;
    if (isdefined(self.lookat_anims["initial_reaction_blendtime"])) {
        initial_reaction_blendtime = self.lookat_anims["initial_reaction_blendtime"];
    }
    lookat_follow_blendtime = 0.25;
    if (isdefined(self.lookat_anims["lookat_follow_blendtime"])) {
        lookat_follow_blendtime = self.lookat_anims["lookat_follow_blendtime"];
    }
    lookat_end_distance = 350;
    if (isdefined(self.lookat_anims["lookat_end_distance"])) {
        lookat_end_distance = self.lookat_anims["lookat_end_distance"];
    }
    lookat_end_blendtime = 0.45;
    if (isdefined(self.lookat_anims["lookat_end_blendtime"])) {
        lookat_end_blendtime = self.lookat_anims["lookat_end_blendtime"];
    }
    self.reactiontrigger = spawn("trigger_radius", self.origin, 0, self.lookat_anims["trigger_radius"], self.lookat_anims["trigger_radius"]);
    while (true) {
        if ((level.player istouching(self.reactiontrigger) || is_looking_at_range(self, 0.925)) && !self.random_idle_playing) {
            if (self.sequential_scene) {
                self.skip_interaction = 1;
            } else {
                self.skip_interaction = 0;
            }
        } else {
            self.skip_interaction = 0;
        }
        var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
        trace_end = undefined;
        tracecontents = create_contents(1, 1, 0, 1, 1, 1);
        trace = undefined;
        while (true) {
            if (isdefined(self.lookat_anims["interaction_trigger_override"])) {
                break;
            }
            if (scripts\sp\interaction_manager::can_play_nearby_interaction(self.lookat_anims["trigger_radius"] * 2)) {
                if (isdefined(self.lookat_anims["interaction_position"])) {
                    var_84d1d51d3f40043 = lengthsquared(self.lookat_anims["interaction_position"] - self.origin);
                } else {
                    var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
                }
                if (isdefined(self.lookat_anims["interaction_trigger_override"])) {
                    break;
                } else if (self.lookat_anims["trigger_radius"] > 0 && var_84d1d51d3f40043 < squared(self.lookat_anims["trigger_radius"]) && is_looking_at_range(self, 0.925) && !self.random_idle_playing) {
                    var_1b2a5f2737c5776c = self.origin + anglestoup(self.angles) * 66;
                    trace_end = vectornormalize(level.player geteye() - var_1b2a5f2737c5776c) * self.lookat_anims["trigger_radius"] + var_1b2a5f2737c5776c;
                    trace = ray_trace(var_1b2a5f2737c5776c, trace_end, self, tracecontents);
                    if (isplayer(trace["entity"]) || isdefined(self.lookat_anims["interaction_trigger_override"])) {
                        break;
                    }
                }
            }
            waitframe();
        }
        if (isdefined(self.lookat_anims["common_name"])) {
            thread scripts\sp\interaction_manager::trigger_interaction_common();
        }
        self.is_playing_reaction = 1;
        self notify("playing_interaction_scene");
        level notify("playing_interaction");
        var_837c12743ab916fe = undefined;
        if (isdefined(self.lookat_anims["interaction_position"])) {
            var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
        } else {
            var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
        }
        angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
        println("<dev string:x1c>" + angle);
        var_5442d92e287bffa2 = self.lookat_anims["lastanim"];
        if (isdefined(self.lookat_anims["angles"])) {
            foreach (var_ad0c4582f262f65a in self.lookat_anims["angles"]) {
                if (angle <= var_ad0c4582f262f65a) {
                    var_5442d92e287bffa2 = self.lookat_anims[var_ad0c4582f262f65a];
                    break;
                }
            }
        }
        if (isarray(var_5442d92e287bffa2)) {
            if (isarray(var_5442d92e287bffa2[0]) && self.anim_sequential_counter < var_5442d92e287bffa2[0].size) {
                var_1511386e758ef855 = self.anim_sequential_counter;
                var_e88ef0694a45c625 = var_5442d92e287bffa2[0][var_1511386e758ef855][0];
            } else {
                var_e88ef0694a45c625 = var_5442d92e287bffa2[0];
            }
        } else {
            var_e88ef0694a45c625 = var_5442d92e287bffa2;
        }
        if (!self.skip_interaction) {
            start_fakeactor_notetracks(var_e88ef0694a45c625);
            self setflaggedanimknob(anim_string, var_e88ef0694a45c625, 1, initial_reaction_blendtime, 1);
            self.is_playing_reaction = 1;
        }
        level thread scripts\sp\interaction_manager::interaction_cooldown_timer(self);
        if (isdefined(self.lookat_anims["scene"])) {
            if (isdefined(self.lookat_anims["interaction_position"])) {
                var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
            } else {
                var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
            }
            angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
            if (self.skip_interaction) {
                wait 0;
            } else {
                wait getanimlength(var_e88ef0694a45c625);
            }
            if (isarray(self.lookat_anims["scene"])) {
                current_index = self.scene_sequential_sounter;
                start_fakeactor_notetracks(self.lookat_anims["scene"][current_index]);
                self setflaggedanimknob(anim_string, self.lookat_anims["scene"][current_index], 1, lookat_follow_blendtime, 1);
                wait getanimlength(self.lookat_anims["scene"][current_index]);
                self.scene_sequential_sounter += 1;
                self.sequential_scene = 1;
            } else {
                start_fakeactor_notetracks(self.lookat_anims["scene"]);
                self setflaggedanimknob(anim_string, self.lookat_anims["scene"], 1, lookat_follow_blendtime, 1);
                wait getanimlength(self.lookat_anims["scene"]);
            }
        }
        if (isdefined(self.lookat_anims["exitangles"])) {
            if (isdefined(self.lookat_anims["interaction_position"])) {
                var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
            } else {
                var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
            }
            angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
            println("<dev string:x1c>" + angle);
            exit_anim = self.lookat_anims["exitangles_anims"]["lastexitanim"];
            foreach (var_307f20aac7e95ba9 in self.lookat_anims["exitangles"]) {
                if (angle <= var_307f20aac7e95ba9) {
                    exit_anim = self.lookat_anims["exitangles_anims"][var_307f20aac7e95ba9];
                    break;
                }
            }
            start_fakeactor_notetracks(exit_anim);
            self setflaggedanimknob(anim_string, exit_anim, 1, lookat_end_blendtime, 1);
            wait getanimlength(exit_anim);
            if (isdefined(self.lookat_anims["end_idle"])) {
                if (isarray(var_5442d92e287bffa2[0])) {
                    if (self.anim_sequential_counter >= var_5442d92e287bffa2[0].size) {
                        start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                        self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                    } else {
                        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                        self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
                    }
                } else {
                    start_fakeactor_notetracks(self.lookat_anims["end_idle"]);
                    self setflaggedanimknob(anim_string, self.lookat_anims["end_idle"], 1, lookat_end_blendtime, 1);
                }
            } else {
                start_fakeactor_notetracks(var_e1f91fe78b76dd48);
                self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
            }
            self.is_playing_reaction = 0;
            if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                self waittill("forever");
            }
        }
        if (!self.skip_interaction) {
            if (isarray(var_5442d92e287bffa2)) {
                if (isarray(var_5442d92e287bffa2[0]) && self.anim_sequential_counter < var_5442d92e287bffa2[0].size) {
                    var_1511386e758ef855 = self.anim_sequential_counter;
                    var_efe1c4b2620f108 = var_5442d92e287bffa2[0][var_1511386e758ef855];
                    thread set_sequential_wait_time(var_efe1c4b2620f108);
                    thread play_anim_vo_sequential(var_efe1c4b2620f108);
                } else if (var_5442d92e287bffa2.size > 1) {
                    thread play_anim_vo_sequential(var_5442d92e287bffa2);
                }
            }
        }
        if (isdefined(self.lookat_anims["reaction_func"])) {
            self [[ self.lookat_anims["reaction_func"] ]]();
        }
        var_2c3d71c250a9405d = getanimlength(var_e88ef0694a45c625);
        wait var_2c3d71c250a9405d;
        if (isdefined(self.lookat_anims["end_idle"])) {
            if (isarray(var_5442d92e287bffa2)) {
                if (isarray(var_5442d92e287bffa2[0])) {
                    start_fakeactor_notetracks();
                    if (self.anim_sequential_counter >= var_5442d92e287bffa2[0].size - 1) {
                        self setflaggedanimknoball(anim_string, self.lookat_anims["end_idle"], generic_human%body, 1, lookat_end_blendtime, 1);
                    } else {
                        self setflaggedanimknoball(anim_string, var_e1f91fe78b76dd48, generic_human%body, 1, lookat_end_blendtime, 1);
                    }
                } else {
                    self setflaggedanimknoball(anim_string, self.lookat_anims["end_idle"], generic_human%body, 1, lookat_end_blendtime, 1);
                }
            } else {
                start_fakeactor_notetracks();
                self setflaggedanimknoball(anim_string, self.lookat_anims["end_idle"], generic_human%body, 1, lookat_end_blendtime, 1);
            }
        } else {
            start_fakeactor_notetracks();
            self setflaggedanimknoball(anim_string, var_e1f91fe78b76dd48, generic_human%body, 1, lookat_end_blendtime, 1);
        }
        self.anim_sequential_counter += 1;
        level notify("interaction_done");
        self notify("interaction_done");
        if (isarray(var_5442d92e287bffa2)) {
            if (isarray(var_5442d92e287bffa2[0]) && self.anim_sequential_counter < var_5442d92e287bffa2[0].size) {
                var_c838814a0c155ab8 = self.sequential_loop_padding + self.sequential_wait_time - getanimlength(var_e88ef0694a45c625);
                max_wait_time = self.sequential_loop_padding + self.sequential_wait_time + getanimlength(var_e88ef0694a45c625);
                var_19c9e7491a3fee8c = clamp(var_c838814a0c155ab8, 0, max_wait_time);
                wait var_19c9e7491a3fee8c;
                self clearanim(var_e88ef0694a45c625, 0.1);
                self.is_playing_reaction = 0;
            } else {
                self.is_playing_reaction = 0;
                if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                    self waittill("forever");
                }
            }
        } else {
            self.is_playing_reaction = 0;
            if (!isdefined(self.lookat_anims["allow_multi_use"])) {
                self waittill("forever");
            }
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd5
// Size: 0x99c
function interaction_process_for_states() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    clear_root();
    if (!isdefined(self.is_cheap)) {
        self orientmode("face angle", self.angles[1]);
        self animmode("noclip");
    }
    var_e1f91fe78b76dd48 = undefined;
    self.random_idle_playing = 0;
    interaction = get_state_interaction(self.interaction_name);
    if (!isdefined(interaction)) {
        return;
    }
    interaction = interaction.scene;
    var_961e7b22dd3c0cdc = undefined;
    if (isarray(interaction["idle"])) {
        if (isdefined(self.gender) && issubstr(self.gender, "female")) {
            var_961e7b22dd3c0cdc = "idle_female";
        } else {
            var_961e7b22dd3c0cdc = "idle";
        }
        var_e1f91fe78b76dd48 = interaction[var_961e7b22dd3c0cdc][0];
        thread random_idle_controller_stateful();
    } else {
        if (isdefined(self.gender) && issubstr(self.gender, "female")) {
            var_961e7b22dd3c0cdc = "idle_female";
        } else {
            var_961e7b22dd3c0cdc = "idle";
        }
        var_e1f91fe78b76dd48 = interaction[var_961e7b22dd3c0cdc];
    }
    anim_string = "single anim";
    start_fakeactor_notetracks(var_e1f91fe78b76dd48);
    self setflaggedanim(anim_string, var_e1f91fe78b76dd48, 1, 0.5, 1);
    self setanimtime(var_e1f91fe78b76dd48, randomfloat(1));
    thread interaction_set_anim_movement("stop");
    thread play_anim_shared_vo();
    if (!ent_flag_exist("scene_end")) {
        ent_flag_init("scene_end");
    }
    ent_flag_clear("scene_end");
    lookat_lerp = 0.11;
    initial_reaction_blendtime = 0.25;
    lookat_follow_blendtime = 0.25;
    lookat_end_distance = 350;
    lookat_end_blendtime = 0.45;
    self.reactiontrigger = spawn("trigger_radius", self.origin, 0, interaction["trigger_radius"], interaction["trigger_radius"]);
    while (true) {
        var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
        trace_end = undefined;
        tracecontents = create_contents(1, 1, 0, 1, 1, 1);
        trace = undefined;
        while (true) {
            if (!isdefined(self.reaction_state) || isdefined(self.reaction_state) && self.reaction_state != "busy" && self.reaction_state != "nag") {
                if (scripts\sp\interaction_manager::can_play_nearby_interaction(interaction["trigger_radius"] * 2)) {
                    if (isdefined(interaction["interaction_position"])) {
                        var_84d1d51d3f40043 = lengthsquared(interaction["interaction_position"] - self.origin);
                    } else {
                        var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
                    }
                    if (isdefined(interaction["interaction_trigger_override"])) {
                        break;
                    } else if (interaction["trigger_radius"] > 0 && var_84d1d51d3f40043 < squared(interaction["trigger_radius"]) && is_looking_at_range(self, 0.925) && !self.random_idle_playing) {
                        var_1b2a5f2737c5776c = self.origin + anglestoup(self.angles) * 66;
                        trace_end = vectornormalize(level.player geteye() - var_1b2a5f2737c5776c) * interaction["trigger_radius"] + var_1b2a5f2737c5776c;
                        trace = ray_trace(var_1b2a5f2737c5776c, trace_end, self, tracecontents);
                        if (isplayer(trace["entity"]) || isdefined(interaction["interaction_trigger_override"])) {
                            break;
                        }
                    }
                }
            }
            waitframe();
        }
        self.is_playing_reaction = 1;
        self notify("playing_interaction_scene");
        level notify("playing_interaction");
        var_837c12743ab916fe = undefined;
        if (isdefined(interaction["interaction_position"])) {
            var_837c12743ab916fe = vectortoangles(interaction["interaction_position"] - self.origin);
        } else {
            var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
        }
        angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
        println("<dev string:x1c>" + angle);
        var_fce383bddc1e68db = "lastanim";
        if (isdefined(interaction["angles"])) {
            foreach (var_ad0c4582f262f65a in interaction["angles"]) {
                if (angle <= var_ad0c4582f262f65a) {
                    var_fce383bddc1e68db = var_ad0c4582f262f65a;
                    break;
                }
            }
        }
        if (level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db].size < 1) {
            level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db] = level.state_interactions[self.interaction_name].scene["angle_" + string(var_fce383bddc1e68db) + "_spent"];
            level.state_interactions[self.interaction_name].scene["angle_" + var_fce383bddc1e68db + "_spent"] = [];
        }
        random_index = randomint(level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db].size);
        var_e88ef0694a45c625 = level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db][random_index];
        start_fakeactor_notetracks(var_e88ef0694a45c625);
        self setflaggedanimknob(anim_string, var_e88ef0694a45c625, 1, initial_reaction_blendtime, 1);
        self.is_playing_reaction = 1;
        thread scripts\sp\interaction_manager::interaction_reboot_timer();
        wait getanimlength(var_e88ef0694a45c625);
        level.state_interactions[self.interaction_name].scene["angle_" + var_fce383bddc1e68db + "_spent"] = array_add(level.state_interactions[self.interaction_name].scene["angle_" + var_fce383bddc1e68db + "_spent"], var_e88ef0694a45c625);
        level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db] = array_remove(level.state_interactions[self.interaction_name].scene[var_fce383bddc1e68db], var_e88ef0694a45c625);
        if (isdefined(interaction["exitangles"])) {
            if (isdefined(interaction["interaction_position"])) {
                var_837c12743ab916fe = vectortoangles(interaction["interaction_position"] - self.origin);
            } else {
                var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
            }
            angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
            println("<dev string:x1c>" + angle);
            var_e2d055545bfcb308 = "lastexitanim";
            foreach (var_307f20aac7e95ba9 in interaction["exitangles"]) {
                if (angle <= var_307f20aac7e95ba9) {
                    var_e2d055545bfcb308 = var_307f20aac7e95ba9;
                    break;
                }
            }
            if (level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308].size < 1) {
                level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308][var_e2d055545bfcb308] = level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308]["exit_angle_" + string(var_e2d055545bfcb308) + "_spent"];
                level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308]["exit_angle_" + string(var_e2d055545bfcb308) + "_spent"] = [];
            }
            random_index = randomint(level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308].size);
            var_d56c071dcfc44b88 = level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308][random_index];
            start_fakeactor_notetracks(var_d56c071dcfc44b88);
            self setflaggedanimknob(anim_string, var_d56c071dcfc44b88, 1, lookat_end_blendtime, 1);
            wait getanimlength(var_d56c071dcfc44b88);
            level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308] = array_remove(level.state_interactions[self.interaction_name].scene[var_e2d055545bfcb308], var_d56c071dcfc44b88);
        }
        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
        self setflaggedanimknob(anim_string, var_e1f91fe78b76dd48, 1, lookat_end_blendtime, 1);
        self.is_playing_reaction = 0;
        if (isdefined(interaction["reaction_func"])) {
            self [[ interaction["reaction_func"] ]]();
        }
        level notify("interaction_done");
        thread scripts\sp\interaction_manager::set_reaction_state("busy");
        waitframe();
        level waittill("forever");
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5779
// Size: 0xd2
function interaction_process_blended() {
    self endon("death");
    self endon("reaction_end");
    initialize_blending_actor();
    lookat_lerp = 0.11;
    initial_reaction_blendtime = 0.25;
    lookat_follow_blendtime = 0.25;
    lookat_end_distance = 350;
    var_e1f91fe78b76dd48 = setup_blend_interaction_idles();
    anim_string = "single anim";
    while (true) {
        self.skip_interaction = is_performing_sequential_scene();
        blended_interaction_tracecheck();
        self.is_playing_reaction = 1;
        self notify("playing_interaction_scene");
        level notify("playing_interaction");
        if (isdefined(self.lookat_anims["common_name"])) {
            thread scripts\sp\interaction_manager::trigger_interaction_common();
        }
        play_blended_interaction_anims();
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5853
// Size: 0xac
function initialize_blending_actor() {
    self stopanimscripted();
    self.followoff = 0;
    clear_root();
    if (!isdefined(self.is_cheap)) {
        self orientmode("face angle", self.angles[1]);
        self animmode("noclip");
    }
    if (!ent_flag_exist("scene_end")) {
        ent_flag_init("scene_end");
    }
    ent_flag_clear("scene_end");
    self.reactiontrigger = spawn("trigger_radius", self.origin, 0, self.lookat_anims["trigger_radius"], self.lookat_anims["trigger_radius"]);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5907
// Size: 0x48
function setup_blend_interaction_idles() {
    var_e1f91fe78b76dd48 = get_interaction_starting_idle();
    self.random_idle_playing = 0;
    start_fakeactor_notetracks(var_e1f91fe78b76dd48);
    self setflaggedanim("single anim", var_e1f91fe78b76dd48, 1, 0.05, 1);
    thread interaction_set_anim_movement("stop");
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5957
// Size: 0x4d
function get_interaction_starting_idle() {
    var_e1f91fe78b76dd48 = undefined;
    if (isarray(self.lookat_anims["idle"])) {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"][0];
    } else {
        var_e1f91fe78b76dd48 = self.lookat_anims["idle"];
    }
    return var_e1f91fe78b76dd48;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59ad
// Size: 0x62
function is_performing_sequential_scene() {
    skip_interaction = undefined;
    if ((level.player istouching(self.reactiontrigger) || is_looking_at_range(self, 0.925)) && !self.random_idle_playing) {
        if (self.sequential_scene) {
            skip_interaction = 1;
        } else {
            skip_interaction = 0;
        }
    } else {
        skip_interaction = 0;
    }
    return skip_interaction;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a18
// Size: 0x1d2
function blended_interaction_tracecheck() {
    var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
    trace_end = undefined;
    tracecontents = create_contents(1, 1, 0, 1, 1, 1);
    trace = undefined;
    while (true) {
        var_365d60e0212d332f = scripts\sp\interaction_manager::can_play_nearby_interaction(self.lookat_anims["trigger_radius"] * 2);
        if (var_365d60e0212d332f) {
            if (isdefined(self.lookat_anims["interaction_position"])) {
                var_84d1d51d3f40043 = lengthsquared(self.lookat_anims["interaction_position"] - self.origin);
            } else {
                var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
            }
            if (isdefined(self.lookat_anims["interaction_trigger_override"])) {
                break;
            } else if (self.lookat_anims["trigger_radius"] > 0 && var_84d1d51d3f40043 < squared(self.lookat_anims["trigger_radius"]) && is_looking_at_range(self, 0.925) && !self.random_idle_playing) {
                var_1b2a5f2737c5776c = self.origin + anglestoup(self.angles) * 66;
                trace_end = vectornormalize(level.player geteye() - var_1b2a5f2737c5776c) * self.lookat_anims["trigger_radius"] + var_1b2a5f2737c5776c;
                trace = ray_trace(var_1b2a5f2737c5776c, trace_end, self, tracecontents);
                if (isplayer(trace["entity"]) || isdefined(self.lookat_anims["interaction_trigger_override"])) {
                    break;
                }
            }
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf2
// Size: 0x2c3
function play_blended_interaction_anims() {
    initialize_blended_interaction_anims();
    var_3a58e25d07fa8963 = 0;
    var_9e41f6b2a5fdfa6c = 0;
    start_time = gettime() / 1000;
    wait_time = getanimlength(self.lookat_anims["fwd_anim"]);
    while (gettime() / 1000 - start_time < wait_time) {
        vec_to_player = vectornormalize(level.player.origin - self.origin);
        forward_vec = anglestoforward(self.angles);
        var_e0e29f268e2b6297 = anglestoforward(self.angles) * -1;
        right_vec = anglestoright(self.angles);
        var_8fc912a946a93a31 = anglestoright(self.angles) * -1;
        up_vec = anglestoup(self.angles);
        var_e32c0e4a71d1793e = clamp(vectordot(vec_to_player, forward_vec), 0.005, 1);
        dot_right = clamp(vectordot(vec_to_player, right_vec), 0.005, 1);
        var_ec8d74cda15d5374 = clamp(vectordot(vec_to_player, var_8fc912a946a93a31), 0.005, 1);
        var_b0b9a45f796b1296 = clamp(vectordot(vec_to_player, var_e0e29f268e2b6297), 0.005, 1);
        self setanimlimited(self.lookat_anims["right_anim"], dot_right, 0.2);
        self setanimlimited(self.lookat_anims["left_anim"], var_ec8d74cda15d5374, 0.2);
        self setflaggedanimlimited("single anim", self.lookat_anims["fwd_anim"], var_e32c0e4a71d1793e + 0.005, 0.2);
        var_d7199cf973e1af07 = 1;
        if (anglebetweenvectorssigned(forward_vec, vec_to_player, up_vec) > 0) {
            var_d7199cf973e1af07 = 0;
        }
        if (var_d7199cf973e1af07) {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, var_b0b9a45f796b1296, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, 0.005, 0.1);
        } else {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, 0.005, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, var_b0b9a45f796b1296, 0.1);
        }
        self setanimlimited(self.lookat_anims["back_right_anim"], var_9e41f6b2a5fdfa6c, 0.2);
        self setanimlimited(self.lookat_anims["back_left_anim"], var_3a58e25d07fa8963, 0.2);
        waitframe();
    }
    var_19c961dff85e05af = 0.45;
    end_blended_interaction_anims(var_19c961dff85e05af);
    play_interaction_endidle(var_19c961dff85e05af);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ebd
// Size: 0x155
function initialize_blended_interaction_anims() {
    var_837c12743ab916fe = undefined;
    var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
    self.is_playing_reaction = 1;
    level thread scripts\sp\interaction_manager::interaction_cooldown_timer(self);
    self setanimlimited(self.lookat_anims["interaction_blend_parent"], 1, 0.2);
    var_e1f91fe78b76dd48 = get_interaction_starting_idle();
    self clearanim(var_e1f91fe78b76dd48, 0.2);
    self clearanim(generic_human%head, 0.2);
    start_fakeactor_notetracks(self.lookat_anims["fwd_anim"]);
    self setflaggedanimlimited("single anim", self.lookat_anims["fwd_anim"], 0.005, 0.05);
    self setanimlimited(self.lookat_anims["right_anim"], 0.005, 0.05);
    self setanimlimited(self.lookat_anims["left_anim"], 0.005, 0.05);
    self setanimlimited(self.lookat_anims["back_right_anim"], 0.005, 0.05);
    self setanimlimited(self.lookat_anims["back_left_anim"], 0.005, 0.05);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x601a
// Size: 0xa2
function end_blended_interaction_anims(blendtime) {
    self.reaction_blend_end = undefined;
    self clearanim(self.lookat_anims["fwd_anim"], blendtime);
    self clearanim(self.lookat_anims["right_anim"], blendtime);
    self clearanim(self.lookat_anims["left_anim"], blendtime);
    self clearanim(self.lookat_anims["back_right_anim"], blendtime);
    self clearanim(self.lookat_anims["back_left_anim"], blendtime);
    level notify("interaction_done");
    self notify("interaction_done");
    self.is_playing_reaction = 0;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60c4
// Size: 0xad
function play_interaction_endidle(blendtime) {
    while (true) {
        animtoplay = undefined;
        if (isdefined(self.lookat_anims["end_idle"])) {
            animtoplay = self.lookat_anims["end_idle"];
            start_fakeactor_notetracks(animtoplay);
            self setanimtime(animtoplay, 0);
            self setflaggedanimknoball("single anim", animtoplay, generic_human%body, 1, blendtime, 1);
        } else {
            animtoplay = get_interaction_starting_idle();
            start_fakeactor_notetracks(animtoplay);
            self setanimtime(animtoplay, 0);
            self setflaggedanimknoball("single anim", animtoplay, generic_human%body, 1, blendtime, 1);
        }
        wait getanimlength(animtoplay);
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6179
// Size: 0x335
function simple_interaction_idles() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    interaction = get_interaction(self.interaction_name);
    if (!ent_flag_exist("hold_simple_idles")) {
        ent_flag_init("hold_simple_idles");
    } else {
        ent_flag_clear("hold_simple_idles");
    }
    if (!isarray(interaction.scene["idle"])) {
        return;
    }
    if (isarray(interaction.scene["idle"]) && interaction.scene["idle"].size <= 1) {
        return;
    }
    var_ad084b6eee8b803d = [];
    anim_array = interaction.scene["idle"];
    var_e1f91fe78b76dd48 = anim_array[0];
    anim_array = array_remove_index(anim_array, 0);
    spent_array_prop = undefined;
    var_69db5a62c886cb68 = undefined;
    var_7a8dcef989dbd61a = undefined;
    var_374762e6ea6a151f = undefined;
    if (isdefined(interaction.scene["idle_prop"]) && isdefined(self.optional_prop)) {
        spent_array_prop = [];
        interaction.scene["spent_array_prop"] = spent_array_prop;
        var_7a8dcef989dbd61a = interaction.scene["idle_prop"];
        var_69db5a62c886cb68 = var_7a8dcef989dbd61a[0];
        var_7a8dcef989dbd61a = array_remove_index(var_7a8dcef989dbd61a, 0);
        var_374762e6ea6a151f = var_7a8dcef989dbd61a;
        var_7a8dcef989dbd61a = undefined;
    }
    var_b1d95cc465858025 = anim_array;
    anim_array = undefined;
    thread clear_root();
    interaction_set_anim_movement("stop");
    while (true) {
        if (isdefined(self.optional_struct)) {
            _set_node_relative_anim_actor(self.optional_struct, var_e1f91fe78b76dd48);
        }
        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
        self setflaggedanimknob("single anim", var_e1f91fe78b76dd48, 1, 0.2, 1);
        thread scripts\asm\gesture\script_funcs::ai_lookat_release();
        if (isdefined(self.optional_prop)) {
            thread _simple_interaction_prop_start(var_69db5a62c886cb68);
        }
        wait getanimlength(var_e1f91fe78b76dd48) * randomintrange(1, 2);
        while (ent_flag("hold_simple_idles")) {
            wait getanimlength(var_e1f91fe78b76dd48);
        }
        if (var_b1d95cc465858025.size <= 0) {
            var_b1d95cc465858025 = var_ad084b6eee8b803d;
            var_ad084b6eee8b803d = [];
        }
        anim_index = randomint(var_b1d95cc465858025.size);
        var_243275a04a5860ca = var_b1d95cc465858025[anim_index];
        var_ad084b6eee8b803d = array_add(var_ad084b6eee8b803d, var_243275a04a5860ca);
        var_b1d95cc465858025 = array_remove_index(var_b1d95cc465858025, anim_index);
        if (isdefined(self.optional_prop)) {
            if (var_374762e6ea6a151f.size <= 0) {
                var_374762e6ea6a151f = spent_array_prop;
                spent_array_prop = [];
            }
            var_bf114bb6b7e12922 = var_374762e6ea6a151f[anim_index];
            spent_array_prop = array_add(spent_array_prop, var_bf114bb6b7e12922);
            var_374762e6ea6a151f = array_remove_index(var_374762e6ea6a151f, anim_index);
            thread _simple_interaction_prop_random_anim(var_bf114bb6b7e12922);
        }
        self clearanim(var_e1f91fe78b76dd48, 0.2);
        if (isdefined(self.optional_struct)) {
            _set_node_relative_anim_actor(self.optional_struct, var_243275a04a5860ca);
        }
        start_fakeactor_notetracks(var_243275a04a5860ca);
        self setflaggedanimknob("single anim", var_243275a04a5860ca, 1, 0.2, 1);
        thread scripts\asm\gesture\script_funcs::ai_lookat_hold();
        wait getanimlength(var_243275a04a5860ca);
        self clearanim(var_243275a04a5860ca, 0.2);
        if (isdefined(self.optional_prop)) {
            thread _simple_interaction_prop_clear();
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x64b6
// Size: 0xa6
function _set_node_relative_anim_actor(scripted_node, animation) {
    pos = getstartorigin(scripted_node.origin, scripted_node.angles, animation);
    ang = getstartangles(scripted_node.origin, scripted_node.angles, animation);
    if (!isdefined(self.is_cheap)) {
        self forceteleport(pos, ang, 100000);
        wait 0.05;
        return;
    }
    self.origin = pos;
    self.angles = ang;
    self dontinterpolate();
    wait 0.05;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6564
// Size: 0x86
function _simple_interaction_prop_random_anim(var_243275a04a5860ca) {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.optional_prop useanimtree(%script_model);
    self.optional_prop clearanim(self.optional_prop.curr_anim, 0.2);
    self.optional_prop setanimknob(var_243275a04a5860ca, 1, 0.2, 1);
    self.optional_prop.curr_anim = var_243275a04a5860ca;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65f2
// Size: 0x5f
function _simple_interaction_prop_start(starting_anim) {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.optional_prop useanimtree(%script_model);
    self.optional_prop setanimknob(starting_anim, 1, 0.2, 1);
    self.optional_prop.curr_anim = starting_anim;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6659
// Size: 0x4f
function _simple_interaction_prop_clear() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.optional_prop useanimtree(%script_model);
    self.optional_prop clearanim(self.optional_prop.curr_anim, 0.2);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66b0
// Size: 0x56
function play_anim_vo(waittime, vo_line) {
    wait waittime;
    var_2b6906f1db0c91b3 = strtok(vo_line, "_");
    if (array_contains(var_2b6906f1db0c91b3, "plr")) {
        level.player play_sound_on_entity(vo_line);
        return;
    }
    smart_dialogue(vo_line);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x670e
// Size: 0x161
function _play_interaction_anim_vo_note() {
    self notify("start_interaction_vo_note");
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    self endon("start_interaction_vo_note");
    while (true) {
        notes = self waittill("single anim");
        if (isarray(notes)) {
            foreach (note in notes) {
                if (issubstr(note, "vo_") && !issubstr(note, "_plr")) {
                    vo_line = getsubstr(note, 3);
                    thread smart_dialogue(vo_line);
                    wait lookupsoundlength(vo_line) / 1000;
                    self notify("single dialogue");
                    if (isdefined(self.scriptedtalkingknob)) {
                        self clearanim(self.scriptedtalkingknob, 0.2);
                    }
                }
            }
            continue;
        }
        if (issubstr(notes, "vo_") && !issubstr(notes, "_plr")) {
            vo_line = getsubstr(notes, 3);
            thread smart_dialogue(vo_line);
            wait lookupsoundlength(vo_line) / 1000;
            self notify("single dialogue");
            if (isdefined(self.scriptedtalkingknob)) {
                self clearanim(self.scriptedtalkingknob, 0.2);
            }
        }
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6877
// Size: 0xbf
function play_note_anim_vo(vo_line) {
    self endon("death");
    self endon("stop_smart_reaction");
    var_a51c1b93ac446341 = 0;
    while (!var_a51c1b93ac446341) {
        notetracks = self waittill("single anim");
        if (isarray(notetracks)) {
            foreach (notetrack in notetracks) {
                if (notetrack == "reaction_vo") {
                    var_a51c1b93ac446341 = 1;
                    break;
                }
            }
        } else if (notetracks == "reaction_vo") {
            var_a51c1b93ac446341 = 1;
            break;
        }
        waitframe();
    }
    self notify("reaction_vo_fired");
    scripts\sp\interaction_manager::play_smart_dialog_if_exists(vo_line);
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x693e
// Size: 0x51e
function play_anim_shared_vo() {
    self endon("death");
    self endon("stop_reaction");
    self endon("reaction_end");
    var_876db5e801f6dfba = undefined;
    var_a0dc29cff035e549 = undefined;
    if (!isdefined(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"])) {
        return;
    }
    if (!isdefined(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"])) {
        return;
    }
    if (!isdefined(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_male_vo"])) {
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_male_vo"] = [];
    }
    if (isdefined(self.gender) && issubstr(self.gender, "male")) {
        if (level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"].size < 1) {
            level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"] = level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_male_vo"];
        }
        lines = level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"];
        var_c1e5762d7ec31d56 = randomint(lines.size);
        var_a0dc29cff035e549 = lines[var_c1e5762d7ec31d56];
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"] = array_remove_index(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_male"], var_c1e5762d7ec31d56);
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_male_vo"] = array_add(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_male_vo"], var_a0dc29cff035e549);
    }
    if (!isdefined(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_female_vo"])) {
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_female_vo"] = [];
    }
    if (isdefined(self.gender) && issubstr(self.gender, "female")) {
        if (level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"].size < 1) {
            level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"] = level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_female_vo"];
        }
        lines = level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"];
        var_c1e5762d7ec31d56 = randomint(lines.size);
        var_a0dc29cff035e549 = lines[var_c1e5762d7ec31d56];
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"] = array_remove_index(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["vo_lines_female"], var_c1e5762d7ec31d56);
        level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_female_vo"] = array_add(level.interaction_manager.data["registered_state_interactions"][self.interaction_name]["used_female_vo"], var_a0dc29cff035e549);
    }
    var_533794d29349e370 = undefined;
    while (true) {
        notetracks = self waittill("single anim");
        if (isarray(notetracks)) {
            foreach (notetrack in notetracks) {
                if (notetrack == "reaction_vo") {
                    var_533794d29349e370 = 1;
                    break;
                }
            }
        } else if (notetracks == "reaction_vo") {
            var_533794d29349e370 = 1;
        }
        if (isdefined(var_533794d29349e370)) {
            break;
        }
        waitframe();
    }
    smart_dialogue(var_a0dc29cff035e549);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e64
// Size: 0x527
function play_anim_vo_sequential(var_bffe0e76de43dbbc) {
    var_876db5e801f6dfba = undefined;
    var_a0dc29cff035e549 = undefined;
    registered_interaction = level.interaction_manager.data["registered_interactions"][self.interaction_name];
    if (isdefined(level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"])) {
        var_876db5e801f6dfba = 1;
        if (!isdefined(level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_male_vo"])) {
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_male_vo"] = [];
        }
        if (isdefined(self.gender) && issubstr(self.gender, "male")) {
            if (level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"].size < 1) {
                level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"] = level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_male_vo"];
            }
            lines = level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"];
            var_c1e5762d7ec31d56 = randomint(lines.size);
            var_a0dc29cff035e549 = lines[var_c1e5762d7ec31d56];
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"] = array_remove_index(level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_male"], var_c1e5762d7ec31d56);
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_male_vo"] = array_add(level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_male_vo"], var_a0dc29cff035e549);
        }
    }
    if (isdefined(level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"])) {
        var_876db5e801f6dfba = 1;
        if (!isdefined(level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_female_vo"])) {
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_female_vo"] = [];
        }
        if (isdefined(self.gender) && issubstr(self.gender, "female")) {
            if (level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"].size < 1) {
                level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"] = level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_female_vo"];
            }
            lines = level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"];
            var_c1e5762d7ec31d56 = randomint(lines.size);
            var_a0dc29cff035e549 = lines[var_c1e5762d7ec31d56];
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"] = array_remove_index(level.interaction_manager.data["registered_interactions"][self.interaction_name]["vo_lines_female"], var_c1e5762d7ec31d56);
            level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_female_vo"] = array_add(level.interaction_manager.data["registered_interactions"][self.interaction_name]["used_female_vo"], var_a0dc29cff035e549);
        }
    }
    last_index = var_bffe0e76de43dbbc.size - 1;
    if (!isdefined(var_876db5e801f6dfba)) {
        if (isstring(var_bffe0e76de43dbbc[last_index])) {
            for (i = 1; i < var_bffe0e76de43dbbc.size; i += 2) {
                play_anim_vo(var_bffe0e76de43dbbc[i], var_bffe0e76de43dbbc[i + 1]);
            }
        } else {
            for (i = 1; i < var_bffe0e76de43dbbc.size - 1; i += 2) {
                play_anim_vo(var_bffe0e76de43dbbc[i], var_bffe0e76de43dbbc[i + 1]);
            }
        }
        return;
    }
    play_anim_vo(var_bffe0e76de43dbbc[1], var_a0dc29cff035e549);
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7393
// Size: 0xbf
function set_sequential_wait_time(var_bffe0e76de43dbbc) {
    self.sequential_wait_time = 0;
    self.sequential_loop_padding = 0;
    last_index = var_bffe0e76de43dbbc.size - 1;
    if (isstring(var_bffe0e76de43dbbc[last_index])) {
        self.sequential_loop_padding = 0;
        for (i = 1; i < var_bffe0e76de43dbbc.size; i += 2) {
            self.sequential_wait_time += var_bffe0e76de43dbbc[i];
        }
        return;
    }
    self.sequential_loop_padding = var_bffe0e76de43dbbc[last_index];
    for (i = 1; i < var_bffe0e76de43dbbc.size - 1; i += 2) {
        self.sequential_wait_time += var_bffe0e76de43dbbc[i];
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x745a
// Size: 0x3ed
function random_idle_controller() {
    self endon("reaction_end");
    self endon("stop_idle_controller");
    self endon("death");
    var_9016cdd15da6e3dc = undefined;
    interaction = get_interaction(self.interaction_name);
    if (!isdefined(interaction)) {
        interaction = get_state_interaction(self.interaction_name);
    }
    self.can_play_random_idle = 1;
    self.is_playing_random_idle = undefined;
    if (!isarray(interaction.scene["idle"])) {
        interaction.scene["idle"] = [interaction.scene["idle"], interaction.scene["idle"]];
    }
    var_ad084b6eee8b803d = [];
    anim_array = interaction.scene["idle"];
    var_e1f91fe78b76dd48 = anim_array[0];
    anim_array = array_remove_index(anim_array, 0);
    var_b1d95cc465858025 = anim_array;
    anim_array = undefined;
    self.starting_random_idle = var_e1f91fe78b76dd48;
    while (true) {
        self.is_playing_random_idle = 1;
        var_6a626ae2a0ecb1e = getanimlength(var_e1f91fe78b76dd48);
        var_5406e6effd6154e8 = randomint(2) + 1;
        wait_time = var_6a626ae2a0ecb1e * float(var_5406e6effd6154e8);
        wait wait_time;
        while (true) {
            if (distance2dsquared(self.origin, level.player.origin) >= squared(150)) {
                break;
            }
            waitframe();
        }
        if (var_b1d95cc465858025.size <= 0) {
            var_b1d95cc465858025 = var_ad084b6eee8b803d;
            var_ad084b6eee8b803d = [];
        }
        var_243275a04a5860ca = var_b1d95cc465858025[randomint(var_b1d95cc465858025.size)];
        var_ad084b6eee8b803d = array_add(var_ad084b6eee8b803d, var_243275a04a5860ca);
        var_b1d95cc465858025 = array_remove(var_b1d95cc465858025, var_243275a04a5860ca);
        pos = undefined;
        ang = undefined;
        if (isdefined(self.optional_struct)) {
            pos = getstartorigin(self.optional_struct.origin, self.optional_struct.angles, var_243275a04a5860ca);
            ang = getstartangles(self.optional_struct.origin, self.optional_struct.angles, var_243275a04a5860ca);
            if (!isdefined(self.is_cheap)) {
                self forceteleport(pos, ang);
            } else {
                self.origin = pos;
                self.angles = ang;
            }
        }
        while (self.is_playing_reaction) {
            waitframe();
        }
        start_fakeactor_notetracks(var_243275a04a5860ca);
        self setflaggedanimknob("single anim", var_243275a04a5860ca, 1, 0.2, 1);
        self.random_idle_playing = 1;
        random_wait_time = getanimlength(var_243275a04a5860ca);
        wait random_wait_time;
        while (self.is_playing_reaction) {
            waitframe();
        }
        if (isdefined(self.optional_struct)) {
            pos = getstartorigin(self.optional_struct.origin, self.optional_struct.angles, var_e1f91fe78b76dd48);
            ang = getstartangles(self.optional_struct.origin, self.optional_struct.angles, var_e1f91fe78b76dd48);
            if (!isdefined(self.is_cheap)) {
                self forceteleport(pos, ang);
            } else {
                self.origin = pos;
                self.angles = ang;
            }
        }
        self.random_idle_playing = 0;
        self clearanim(var_243275a04a5860ca, 0.3);
        self.is_playing_random_idle = undefined;
        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
        self setflaggedanimknob("single anim", var_e1f91fe78b76dd48, 1, 0.2, 1);
        self setanimtime(var_e1f91fe78b76dd48, randomfloat(1));
        while (true) {
            if (isdefined(self.can_play_random_idle)) {
                break;
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x784f
// Size: 0x50f
function random_idle_controller_stateful() {
    self endon("reaction_end");
    self endon("stop_idle_controller");
    self endon("death");
    var_9016cdd15da6e3dc = undefined;
    interaction = get_state_interaction(self.interaction_name);
    self.can_play_random_idle = 1;
    self.is_playing_random_idle = undefined;
    var_961e7b22dd3c0cdc = undefined;
    if (isdefined(self.gender) && issubstr(self.gender, "female")) {
        var_961e7b22dd3c0cdc = "idle_female";
    } else {
        var_961e7b22dd3c0cdc = "idle";
    }
    var_e1f91fe78b76dd48 = interaction.scene[var_961e7b22dd3c0cdc][0];
    self.starting_random_idle = var_e1f91fe78b76dd48;
    while (true) {
        self.is_playing_random_idle = 1;
        var_6a626ae2a0ecb1e = getanimlength(var_e1f91fe78b76dd48);
        var_5406e6effd6154e8 = randomint(2) + 1;
        wait_time = var_6a626ae2a0ecb1e * float(var_5406e6effd6154e8);
        wait wait_time;
        while (true) {
            if (distance2dsquared(self.origin, level.player.origin) >= squared(150)) {
                break;
            }
            waitframe();
        }
        var_eda2de4e93c90579 = undefined;
        var_9c4ca7794f6f0ee6 = undefined;
        if (isdefined(self.gender) && issubstr(self.gender, "female")) {
            var_eda2de4e93c90579 = "random_idles_female";
            var_9c4ca7794f6f0ee6 = "spent_random_idles_female";
        } else {
            var_eda2de4e93c90579 = "random_idles";
            var_9c4ca7794f6f0ee6 = "spent_random_idles";
        }
        if (level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579].size <= 0) {
            level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579] = level.state_interactions[self.interaction_name].scene[var_9c4ca7794f6f0ee6];
            level.state_interactions[self.interaction_name].scene[var_9c4ca7794f6f0ee6] = [];
        }
        var_243275a04a5860ca = level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579][randomint(level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579].size)];
        level.state_interactions[self.interaction_name].scene[var_9c4ca7794f6f0ee6] = array_add(level.state_interactions[self.interaction_name].scene[var_9c4ca7794f6f0ee6], var_243275a04a5860ca);
        level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579] = array_remove(level.state_interactions[self.interaction_name].scene[var_eda2de4e93c90579], var_243275a04a5860ca);
        pos = undefined;
        ang = undefined;
        if (isdefined(self.optional_struct)) {
            pos = getstartorigin(self.optional_struct.origin, self.optional_struct.angles, var_243275a04a5860ca);
            ang = getstartangles(self.optional_struct.origin, self.optional_struct.angles, var_243275a04a5860ca);
            if (!isdefined(self.is_cheap)) {
                self forceteleport(pos, ang);
            } else {
                self.origin = pos;
                self.angles = ang;
            }
        }
        while (self.is_playing_reaction) {
            waitframe();
        }
        start_fakeactor_notetracks(var_243275a04a5860ca);
        self setflaggedanimknob("single anim", var_243275a04a5860ca, 1, 0.2, 1);
        self.random_idle_playing = 1;
        random_wait_time = getanimlength(var_243275a04a5860ca);
        wait random_wait_time;
        while (self.is_playing_reaction) {
            waitframe();
        }
        if (isdefined(self.optional_struct)) {
            pos = getstartorigin(self.optional_struct.origin, self.optional_struct.angles, var_e1f91fe78b76dd48);
            ang = getstartangles(self.optional_struct.origin, self.optional_struct.angles, var_e1f91fe78b76dd48);
            if (!isdefined(self.is_cheap)) {
                self forceteleport(pos, ang);
            } else {
                self.origin = pos;
                self.angles = ang;
            }
        }
        self.random_idle_playing = 0;
        self clearanim(var_243275a04a5860ca, 0.3);
        self.is_playing_random_idle = undefined;
        start_fakeactor_notetracks(var_e1f91fe78b76dd48);
        self setflaggedanimknob("single anim", var_e1f91fe78b76dd48, 1, 0.2, 1);
        self setanimtime(var_e1f91fe78b76dd48, randomfloat(1));
        while (true) {
            if (isdefined(self.can_play_random_idle)) {
                break;
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7d66
// Size: 0x400
function random_idle_group_controller(actors, frequency, var_a1cf7f5ad1c9b75f) {
    self endon("reaction_end");
    self endon("stop_idle_controller");
    level endon("stop_idle_controller");
    self endon("stop_group_idle_controller");
    level endon("stop_group_idle_controller");
    self endon("death");
    if (!flag_exist("hold_group_vignettes")) {
        flag_init("hold_group_vignettes");
    }
    var_ad084b6eee8b803d = [];
    anim_array = var_a1cf7f5ad1c9b75f;
    while (true) {
        wait randomfloatrange(frequency * 0.5, frequency);
        foreach (actor in actors) {
            if (!isdefined(actor)) {
                self notify("stop_group_idle_controller");
                return;
            }
            actor endon("death");
            actor endon("entitydeleted");
            actor.can_play_random_idle = undefined;
        }
        var_f20f14691346ee8 = 0;
        while (true) {
            if (!flag("hold_group_vignettes")) {
                foreach (var_1b3e4a344eda5359 in actors) {
                    if (!isdefined(var_1b3e4a344eda5359.is_playing_random_idle)) {
                        var_f20f14691346ee8++;
                    }
                }
                if (var_f20f14691346ee8 >= actors.size) {
                    break;
                } else {
                    var_f20f14691346ee8 = 0;
                }
            }
            waitframe();
        }
        var_b92972e6e87ed559 = undefined;
        if (isarray(var_a1cf7f5ad1c9b75f)) {
            if (anim_array.size <= 0) {
                anim_array = var_a1cf7f5ad1c9b75f;
                var_ad084b6eee8b803d = [];
            }
            var_b92972e6e87ed559 = anim_array[randomint(anim_array.size)];
        } else {
            var_b92972e6e87ed559 = var_a1cf7f5ad1c9b75f;
        }
        wait_time = 0;
        if (!flag("hold_group_vignettes")) {
            foreach (actor in actors) {
                if (!isdefined(actor)) {
                    self notify("stop_group_idle_controller");
                    return;
                }
                animation = actor getanim(var_b92972e6e87ed559);
                org = getstartorigin(actor.origin, actor.angles, animation);
                ang = getstartangles(actor.origin, actor.angles, animation);
                if (isai(actor)) {
                    actor forceteleport(org, ang);
                } else {
                    actor.origin = org;
                    actor.angles = ang;
                }
                actor thread start_fakeactor_notetracks(animation);
                actor setflaggedanimknob("single anim", animation, 1, 0.2);
                actor.allow_interactions = 0;
                actor.hold_lookat = 1;
                wait_time = getanimlength(animation);
            }
            wait wait_time;
            if (isarray(var_a1cf7f5ad1c9b75f)) {
                var_ad084b6eee8b803d = array_add(var_ad084b6eee8b803d, var_b92972e6e87ed559);
                anim_array = array_remove(anim_array, var_b92972e6e87ed559);
            }
            foreach (guy in actors) {
                if (!isdefined(guy)) {
                    self notify("stop_group_idle_controller");
                    return;
                }
                animation = guy getanim(var_b92972e6e87ed559);
                guy thread start_fakeactor_notetracks(guy.starting_random_idle);
                guy setanimknob(animation, 0, 0.2);
                guy setflaggedanimknob("single anim", guy.starting_random_idle, 1, 0.2, 1);
                guy setanimtime(guy.starting_random_idle, randomfloat(1));
                guy.can_play_random_idle = 1;
                guy.allow_interactions = 1;
                guy.hold_lookat = undefined;
            }
        }
        waitframe();
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x816e
// Size: 0x4b
function interaction_end() {
    if (!isdefined(self.reaction_stop_anims)) {
        asm_stopanimscripted();
        interaction_set_anim_movement("stop");
    }
    scripts\sp\interaction_manager::remove_actor_from_manager();
    self notify("reaction_end");
    thread scripts\sp\interaction_manager::stop_gesture_reaction();
    self notify("stop_smart_reaction");
    self.is_talking = undefined;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81c1
// Size: 0x2b
function interaction_end_cheap() {
    self waittill("reaction_end");
    scripts\sp\interaction_manager::remove_actor_from_manager();
    self notify("interaction_done");
    self notify("stop_reaction");
    self.is_talking = undefined;
}

// Namespace interaction / scripts\sp\interaction
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x81f4
// Size: 0x6c
function set_time_via_rate(anime, time, weight) {
    if (!isdefined(weight)) {
        weight = 1;
    }
    prev_time = self getanimtime(anime);
    duration = getanimlength(anime);
    rate = (time - prev_time) * duration / 0.05;
    self setanimlimited(anime, weight, 0.25, rate);
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8268
// Size: 0x36d
function play_combat_interaction(node, statename) {
    self endon("death");
    self endon("interaction_done");
    self endon("stop_reaction");
    self endon("reaction_end");
    self.anim_sequential_counter = 0;
    self.scene_sequential_sounter = 0;
    self.sequential_scene = 0;
    self.skip_interaction = 0;
    self.is_playing_reaction = 0;
    self.nearby_interaction_running = 0;
    self.combat_reaction_return_state = statename;
    if (isdefined(level.interaction_manager)) {
        level.interaction_manager.data["actors"] = array_add(level.interaction_manager.data["actors"], self);
    }
    while (self.script == "init") {
        waitframe();
    }
    while (true) {
        while (true) {
            var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
            if (var_84d1d51d3f40043 < squared(150) && is_looking_at_range(self, 0.925)) {
                break;
            }
            waitframe();
        }
        asmname = self.asmname;
        var_293af010052e93ca = self asmgetcurrentstate(asmname);
        if (var_293af010052e93ca == self.combat_reaction_return_state && !self.nearby_interaction_running) {
            if (node.script_reaction == "combat_reaction") {
                interactions = [];
                if (isdefined(node.type)) {
                    switch (node.type) {
                    case #"hash_c3b74422dec48736": 
                        interactions = ["combat_crouch_1", "combat_crouch_2"];
                        break;
                    case #"hash_e1d8e1adebed5a61": 
                        switch (self.currentpose) {
                        case #"hash_c6775c88e38f7803": 
                            interactions = ["hm_grnd_org_cover_left_stand_react_01", "hm_grnd_org_cover_left_stand_react_02"];
                            break;
                        case #"hash_3fed0cbd303639eb": 
                            interactions = ["hm_grnd_org_cover_left_crouch_react_01", "hm_grnd_org_cover_left_crouch_react_02"];
                            break;
                        case #"hash_d91940431ed7c605": 
                            break;
                        }
                        break;
                    case #"hash_cd3ffe799551db82": 
                        switch (self.currentpose) {
                        case #"hash_c6775c88e38f7803": 
                            interactions = ["hm_grnd_org_cover_right_stand_react_01", "hm_grnd_org_cover_right_stand_react_02"];
                            break;
                        case #"hash_3fed0cbd303639eb": 
                            interactions = ["hm_grnd_org_cover_right_crouch_react_01", "hm_grnd_org_cover_right_crouch_react_02"];
                            break;
                        case #"hash_d91940431ed7c605": 
                            break;
                        }
                        break;
                    case #"hash_c051a32186a33cae": 
                        break;
                    case #"hash_78b110033ccb68b0": 
                        break;
                    case #"hash_776752872754e5ee": 
                        interactions = ["combat_cover_crouch_1"];
                        break;
                    }
                    if (interactions.size > 0) {
                        var_7176c4302af61196 = randomint(interactions.size);
                        var_29e9b5e69b29c1f9 = interactions[var_7176c4302af61196];
                        combat_interaction_process(var_29e9b5e69b29c1f9, node);
                    } else {
                        println("<dev string:x34>" + node.type);
                        return;
                    }
                }
            } else {
                combat_interaction_process(node.script_reaction, node);
            }
        }
        wait 1.5;
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x85dd
// Size: 0x1d4
function combat_interaction_process(interaction_name, node) {
    self endon("death");
    self endon("interaction_done");
    interaction = get_interaction(interaction_name);
    thread scripts\common\notetrack::start_notetrack_wait(self, "vo");
    thread _play_interaction_anim_vo_note();
    if (!isdefined(interaction)) {
        assertmsg("Interaction by name of " + interaction_name + " but interaction isn't registered");
        return;
    }
    self.lookat_anims = interaction.scene;
    if (!isdefined(self.animname)) {
        self.animname = "generic";
    }
    var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
    trace_end = undefined;
    tracecontents = create_contents(1, 1, 0, 1, 1, 1);
    trace = undefined;
    if (isdefined(self.lookat_anims["interaction_position"])) {
        var_84d1d51d3f40043 = lengthsquared(self.lookat_anims["interaction_position"] - self.origin);
    } else {
        var_84d1d51d3f40043 = lengthsquared(level.player.origin - self.origin);
    }
    if (var_84d1d51d3f40043 < squared(self.lookat_anims["trigger_radius"]) && is_looking_at_range(self, 0.925)) {
        trace_end = vectornormalize(level.player geteye() - self geteye()) * self.lookat_anims["trigger_radius"] + self geteye();
        trace = ray_trace(self geteye(), trace_end, self, tracecontents);
        if (isplayer(trace["entity"])) {
            combat_interaction_run();
        }
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87b9
// Size: 0x255
function combat_interaction_run() {
    self endon("death");
    self endon("interaction_done");
    self.is_playing_reaction = 1;
    self notify("playing_interaction_scene");
    level notify("playing_interaction");
    starting_anim = self.combat_reaction_previous_anim;
    var_837c12743ab916fe = undefined;
    if (isdefined(self.lookat_anims["interaction_position"])) {
        var_837c12743ab916fe = vectortoangles(self.lookat_anims["interaction_position"] - self.origin);
    } else {
        var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
    }
    angle = abs(angleclamp((var_837c12743ab916fe - self.angles)[1]) - 360);
    println("<dev string:x1c>" + angle);
    var_5442d92e287bffa2 = self.lookat_anims["lastanim"];
    if (isdefined(self.lookat_anims["angles"])) {
        foreach (var_ad0c4582f262f65a in self.lookat_anims["angles"]) {
            if (angle <= var_ad0c4582f262f65a) {
                var_5442d92e287bffa2 = self.lookat_anims[var_ad0c4582f262f65a];
                break;
            }
        }
    }
    if (isarray(var_5442d92e287bffa2)) {
        if (isarray(var_5442d92e287bffa2[0])) {
            var_1511386e758ef855 = self.anim_sequential_counter;
            var_e88ef0694a45c625 = var_5442d92e287bffa2[0][var_1511386e758ef855][0];
        } else {
            var_e88ef0694a45c625 = var_5442d92e287bffa2[0];
        }
    } else {
        var_e88ef0694a45c625 = var_5442d92e287bffa2;
    }
    start_fakeactor_notetracks(var_e88ef0694a45c625);
    self setanimlimited(generic_human%body, 0, 0.25, 1);
    self setflaggedanimknoball("vo", var_e88ef0694a45c625, generic_human%body, 1, 0.25, 1);
    wait getanimlength(var_e88ef0694a45c625);
    self clearanim(generic_human%scripted, 0.25);
    self setanimlimited(generic_human%body, 1, 0.25, 1);
    self.is_playing_reaction = 0;
    wait 0.25;
    self notify("interaction_done");
    level notify("interaction_done");
    thread interaction_end();
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a16
// Size: 0x2a
function combat_reaction_wait_buffer(node) {
    node.combat_reaction_wait = 1;
    wait 2;
    node.combat_reaction_wait = undefined;
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a48
// Size: 0x109
function new_goal_listener() {
    self endon("death");
    self endon("reaction_done");
    self endon("entitydeleted");
    var_db33b152656eeed0 = undefined;
    if (isdefined(self.last_set_goalnode)) {
        var_db33b152656eeed0 = self.last_set_goalnode.origin;
        while (isdefined(self.last_set_goalnode) && self.last_set_goalnode.origin == var_db33b152656eeed0) {
            waitframe();
        }
    } else if (isdefined(self.last_set_goalent)) {
        var_db33b152656eeed0 = self.last_set_goalent.origin;
        while (isdefined(self.last_set_goalent) && self.last_set_goalent.origin == var_db33b152656eeed0) {
            waitframe();
        }
    } else if (isdefined(self.last_set_goalpos)) {
        var_db33b152656eeed0 = self.last_set_goalpos;
        while (isdefined(self.last_set_goalpos) && self.last_set_goalpos == var_db33b152656eeed0) {
            waitframe();
        }
    }
    self notify("interaction_done");
    thread interaction_end();
}

// Namespace interaction / scripts\sp\interaction
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b59
// Size: 0x45
function interaction_pain_listener() {
    self endon("death");
    self endon("interaction_done");
    self.interaction_pain = undefined;
    while (true) {
        self.interaction_pain = undefined;
        self waittill("pain");
        self.interaction_pain = 1;
        wait 5;
    }
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ba6
// Size: 0x39
function interaction_set_anim_movement(movement) {
    if (!isdefined(movement)) {
        movement = "stop";
    }
    if (isai(self)) {
        self.a.movement = movement;
        return;
    }
    return;
}

// Namespace interaction / scripts\sp\interaction
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8be7
// Size: 0x4f
function start_fakeactor_notetracks(animation) {
    anime = undefined;
    if (isdefined(self.interaction_name)) {
        anime = self.interaction_name;
    }
    thread scripts\common\notetrack::start_notetrack_wait(self, "single anim", anime, undefined, animation);
    thread scripts\sp\anim::animscriptdonotetracksthread(self, "single anim", anime);
}

