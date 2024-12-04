#using scripts\anim\face;
#using scripts\anim\notetracks;
#using scripts\anim\notetracks_mp;
#using scripts\asm\shared\mp\utility;
#using scripts\common\anim;
#using scripts\common\notetrack;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\flags;

#namespace cp_anim;

// Namespace cp_anim / scripts\cp\cp_anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x133
function init() {
    initanim();
    if (!isdefined(level.scr_viewmodelanim)) {
        level.scr_viewmodelanim = [];
    }
    if (!isdefined(level.scr_eventanim)) {
        level.scr_eventanim = [];
    }
    anim.callbacks["PlaySoundAtViewHeight"] = &play_sound_at_viewheight;
    anim.callbacks["TeleportEnt"] = &teleport_entity;
    anim.callbacks["ShouldDoAnim"] = &should_do_anim;
    anim.callbacks["DoAnimation"] = &do_animation;
    anim.callbacks["DoFacialAnim"] = &do_facial_anim;
    anim.callbacks["reach_with_standard_adjustments_begin"] = &function_f7abc6758c6fa304;
    anim.callbacks["reach_with_standard_adjustments_end"] = &function_fa9f14f0cbd676f0;
    anim.callbacks["AnimHandleNotetrack"] = &mp_anim_handle_notetrack;
    anim.callbacks["EntityHandleNotetrack"] = &mp_entity_handle_notetrack;
    anim.callbacks["EntityHandleNotetrackAnimEnd"] = &scripts\anim\notetracks::function_8b5c774e7238fec5;
    anim.callbacks["AIAnimFirstFrame"] = &scripts\asm\shared\mp\utility::ai_anim_first_frame;
    anim.callbacks["playXcam"] = &play_xcam;
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x360
// Size: 0x25
function play_sound_at_viewheight(aliasname, notification_string, var_a68adbd3eefe9282) {
    self playsound(aliasname, notification_string, var_a68adbd3eefe9282);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38d
// Size: 0x4
function should_do_anim() {
    return true;
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39a
// Size: 0x6f
function teleport_entity(origin, angles) {
    if (self.code_classname == "script_vehicle") {
        self vehicle_teleport(origin, angles);
        self dontinterpolate();
        return;
    }
    if (isplayer(self)) {
        self setorigin(origin);
        self setplayerangles(angles);
        return;
    }
    self.origin = origin;
    self.angles = angles;
    self dontinterpolate();
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0x34
function do_facial_anim(DoFacialAnim, var_9ac73a1996d2dae, DoAnimation, anime, animname, dialogue) {
    return false;
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x44e
// Size: 0x238
function do_animation(org, angles, animname, anime, anim_string, idleanim, scripted_node_ent) {
    var_173bdb8ba434651d = 0;
    animation = undefined;
    if (isdefined(idleanim) && !isagent(self)) {
        animation = level.scr_anim[animname][anime][idleanim];
    } else if (isdefined(idleanim) && isagent(self)) {
        animation = level.scr_anim[animname][anime][0];
    } else {
        animation = level.scr_anim[animname][anime];
    }
    goaltime = anim_get_goal_time(animname, anime);
    last_anim_time_check();
    if (!isdefined(idleanim)) {
        self._lastanime = anime;
    }
    if (self.code_classname == "misc_turret" && !isdefined(idleanim)) {
        self setflaggedanim(anim_string, animation, 1, goaltime);
    } else {
        if (self.code_classname == "script_vehicle") {
            self vehicleplayanim(animation);
        }
        root = undefined;
        if (isdefined(self.anim_getrootfunc)) {
            root = [[ self.anim_getrootfunc ]]();
        }
        var_8c94765ca587f86c = ter_op(isdefined(angles), angles, (0, 0, 0));
        if (isagent(self)) {
            var_173bdb8ba434651d = 1;
            level_archetype = "agent_scripted_" + getdvar(@"g_mapname");
            if (archetypeassetloaded(level_archetype)) {
                scripted_node = spawnstruct();
                if (isdefined(org)) {
                    scripted_node.origin = org;
                    scripted_node.angles = angles;
                }
                var_5a0a7dfb51da0682 = getanimname(animation);
                thread scripts\asm\shared\mp\utility::animscriptmp(level_archetype, "animscripted", var_5a0a7dfb51da0682, undefined, undefined, undefined, scripted_node);
            } else {
                thread scripts\asm\shared\mp\utility::function_577d8abff6067c23(anime, anim_string, org, var_8c94765ca587f86c);
            }
        } else {
            self animscripted(anim_string, org, var_8c94765ca587f86c, animation, undefined, root, goaltime);
        }
    }
    thread start_notetrack_wait(self, anim_string, anime, animname, animation, var_173bdb8ba434651d);
    return getanimlength(animation);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x68f
// Size: 0xb7
function mp_anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner) {
    anim_handle_notetrack(scr_notetrack, guy, var_966821fc90c3ca9d, tag_owner);
    if (isdefined(scr_notetrack["flag"])) {
        scripts\mp\flags::gameflagset(scr_notetrack["flag"]);
    }
    if (isdefined(scr_notetrack["flag_clear"])) {
        scripts\mp\flags::gameflagclear(scr_notetrack["flag_clear"]);
    }
    if (isdefined(scr_notetrack["sound"])) {
        var_a38dc1947e93b08d = undefined;
        if (!isdefined(scr_notetrack["sound_stays_death"])) {
            var_a38dc1947e93b08d = 1;
        }
        tag = undefined;
        if (isdefined(scr_notetrack["sound_on_tag"])) {
            tag = scr_notetrack["sound_on_tag"];
        }
        guy thread play_snd_on_tag(scr_notetrack["sound"], tag);
    }
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74e
// Size: 0x1f
function mp_entity_handle_notetrack(guy, notetrack) {
    if (guy scripts\anim\notetracks_mp::function_6d9ff7d18e45dc9c(notetrack)) {
        return;
    }
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x775
// Size: 0x6d
function anim_player_solo(player, player_rig, anime, tag, var_9e8a16d47a03007a, animname_override) {
    self endon("death");
    players[0] = player;
    player_rigs[0] = player_rig;
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x7ea
// Size: 0x48
function anim_player(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override) {
    if (!isdefined(var_9e8a16d47a03007a)) {
        var_9e8a16d47a03007a = 0;
    }
    anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x83a
// Size: 0x13f
function anim_player_internal(players, player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override) {
    duration = 0;
    foreach (player in players) {
        animname = undefined;
        if (isdefined(animname_override)) {
            animname = animname_override;
        } else {
            animname = player.animname;
        }
        if (isdefined(level.scr_eventanim[animname]) && isdefined(level.scr_eventanim[animname][anime])) {
            duration = player playanimscriptsceneevent("scripted_scene", level.scr_eventanim[animname][anime]);
        }
        if (isdefined(level.scr_viewmodelanim[animname]) && isdefined(level.scr_viewmodelanim[animname][anime]) && !istrue(player.blockviewmodelanim)) {
            player playviewmodelanim(level.scr_viewmodelanim[animname][anime]);
        }
    }
    if (isdefined(player_rigs)) {
        anim_single(player_rigs, anime, tag, var_9e8a16d47a03007a, animname_override);
    }
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x981
// Size: 0x39
function play_snd_on_tag(alias, tag) {
    if (isdefined(tag)) {
        playsoundatpos(self gettagorigin(tag), alias);
        return;
    }
    playsoundatpos(self.origin, alias);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9c2
// Size: 0x4b
function play_xcam(xcamasset, origin, angles) {
    camnum = undefined;
    camnum = default_to(camnum, 0);
    level.player playxcam(xcamasset, camnum, origin, angles);
    wait getxcamlength(xcamasset);
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa15
// Size: 0x121
function function_f7abc6758c6fa304(startorg, startangles) {
    self.oldgoalradius = self.goalradius;
    self.oldpathenemyfightdist = self.pathenemyfightdist;
    self.oldpathenemylookahead = self.pathenemylookahead;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 128;
    self pushplayer(1);
    self.nododgemove = 1;
    self.doavoidanceblocking = 0;
    self.fixednodewason = self.fixednode;
    self.fixednode = 0;
    self.var_a4700673c6ef6c4 = self.var_b29c3655b12e292d;
    self.var_b29c3655b12e292d = 0;
    self.ignoreall = 1;
    if (!isdefined(self.scriptedarrivalent)) {
        self.old_disablearrivals = self.disablearrivals;
        self.disablearrivals = 1;
    } else {
        self.scriptedarrivalent.angles = startangles;
        self.scriptedarrivalent.origin = startorg;
    }
    self.reach_goal_pos = undefined;
    return startorg;
}

// Namespace cp_anim / scripts\cp\cp_anim
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3f
// Size: 0xa4
function function_fa9f14f0cbd676f0() {
    self pushplayer(0);
    self.nododgemove = 0;
    self.doavoidanceblocking = 1;
    self.fixednode = self.fixednodewason;
    self.fixednodewason = undefined;
    self.var_b29c3655b12e292d = self.var_a4700673c6ef6c4;
    self.var_a4700673c6ef6c4 = undefined;
    self.pathenemyfightdist = self.oldpathenemyfightdist;
    self.pathenemylookahead = self.oldpathenemylookahead;
    self.ignoreall = 0;
    if (isdefined(self.old_disablearrivals)) {
        self.disablearrivals = self.old_disablearrivals;
    }
}

