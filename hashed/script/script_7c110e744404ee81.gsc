// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5af9038262d22c96;
#using scripts\stealth\player.gsc;

#namespace stealth_music;

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0xb
function main() {
    childthread stealth_combat_music_init();
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224
// Size: 0xba
function stealth_combat_music_init() {
    flag_wait("level_stealth_initialized");
    setdvar(@"hash_4a4de8b30c5647a8", 1);
    level.music_array[0] = "a";
    level.music_array[1] = "b";
    level.music_array[2] = "c";
    if (getdvarint(@"hash_f5740209893cdf46", 0) == 0) {
        level.stealth.fnthreatsightplayersightaudio = &threat_sight_player_sight_audio;
        level notify("threat_sight_audio_enabled");
    }
    level.hvts_identified = 0;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("stealth_music", "init")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("stealth_music", "init") ]]();
    }
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x122
function function_9ff225017ef5ce19() {
    if (!isdefined(self.stealth)) {
        return;
    }
    player = self;
    if (istrue(player.var_72aba1e496402ebf)) {
        return;
    }
    if (getdvarint(@"hash_f5740209893cdf46", 0)) {
        player thread function_f17fb237c7e883b2();
    }
    player.fnstealthmusictransition = &stealth_music_transition_cp;
    player.stealth.fnthreatsightplayersightaudio = &threat_sight_player_sight_audio;
    player ent_flag_init("player_in_combat");
    player thread namespace_975f381a5813b0fd::combatstate_thread();
    player.var_72aba1e496402ebf = 1;
    player.stealth.combatstate.maxcombatdist = 2000;
    player.stealth_combat_music_state = player.stealth.combatstate.name;
    player.stealth_combat_music_state_type = player.stealth.combatstate.type;
    player.music_last_stealth_cue = "";
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40e
// Size: 0x21
function function_9d95291bb222ad5f(message, delay) {
    self endon(message);
    wait(delay);
    ent_flag_clear(message);
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436
// Size: 0x128
function stealth_music_transition_cp(var_a675f64a80383d1e) {
    self notify("stealth_music_transition_cp");
    self endon("stealth_music_transition_cp");
    self endon("disconnect");
    /#
        assert(isplayer(self));
    #/
    if (!isdefined(self.stealth)) {
        thread namespace_975f381a5813b0fd::main();
    }
    if (istrue(level.var_c04ee29c854b01b8)) {
        level.var_c04ee29c854b01b8 = undefined;
        return;
    }
    if (!isdefined(self.var_bd670c1e0f4290da)) {
        self.var_bd670c1e0f4290da = "init";
    }
    transitiontime = 1;
    frametime = 0.05;
    if (!isdefined(self.stealth.music_ent)) {
        self.stealth.music_ent = [];
    }
    alias = var_a675f64a80383d1e;
    if (!isdefined(var_a675f64a80383d1e)) {
        self setplayermusicstate("");
        self.var_bd670c1e0f4290da = "";
        return;
    } else if (var_a675f64a80383d1e != self.var_bd670c1e0f4290da) {
        thread player_music_loop(alias);
    } else {
        self setplayermusicstate("");
        self.var_bd670c1e0f4290da = "";
    }
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x565
// Size: 0xa2
function player_music_loop(var_f1e5dd9037c67cd6) {
    self notify("player_music_loop");
    self endon("player_music_loop");
    self endon("disconnect");
    if (self.var_bd670c1e0f4290da != "init" && var_f1e5dd9037c67cd6 == "") {
        self setplayermusicstate("");
    }
    self.var_bd670c1e0f4290da = var_f1e5dd9037c67cd6;
    if (isdefined(var_f1e5dd9037c67cd6) && var_f1e5dd9037c67cd6 != "" && var_f1e5dd9037c67cd6 != "init") {
        self setplayermusicstate(var_f1e5dd9037c67cd6);
        if (!istrue(level.var_4f2ab335ef95e1e3)) {
            wait(60);
            self setplayermusicstate("");
            self.var_bd670c1e0f4290da = "";
        }
    }
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60e
// Size: 0x80a
function threat_sight_player_sight_audio(var_5a80aeb955d466dc, maxthreat, var_67e8151f4dfc690b) {
    var_1d73b1caa088a858 = 180;
    var_732bd773132e7010 = 0.01;
    var_37b64319146d2f02 = 0.05;
    var_bdd51df6b28827ee = 0.125;
    self endon("disconnect");
    self endon("death");
    self notify("threat_sight_player_sight_audio");
    self endon("threat_sight_player_sight_audio");
    level endon("threat_sight_audio_disabled");
    /#
        if (!isdefined(var_67e8151f4dfc690b)) {
            var_67e8151f4dfc690b = 0;
        }
    #/
    aliases = [0:"cp_stealth_threat_low", 1:"cp_stealth_threat_med", 2:"cp_stealth_threat_high"];
    rumble = "damage_light";
    if (!getdvarint(@"hash_21b72d8c9ff7a1b3", 0)) {
        maxthreat = 0;
    }
    if (!isdefined(self.stealth.threat_sight_snd_ent) && var_5a80aeb955d466dc && maxthreat > 0) {
        self.stealth.threat_sight_snd_ent = [];
        self.stealth.threat_sight_snd_vol = 0;
        self.stealth.threat_sight_snd_threat = 0;
        foreach (index, alias in aliases) {
            snd_ent = spawn("script_origin", self.origin);
            if (!isplayer(self)) {
                thread namespace_3c37cb17ade254d::delete_on_death(snd_ent);
            } else {
                snd_ent showonlytoplayer(self);
            }
            snd_ent linkto(self);
            if (isplayer(self)) {
                self setsoundsubmix(alias, 0, 1);
            }
            snd_ent.isplaying = 0;
            self.stealth.threat_sight_snd_ent[alias] = snd_ent;
        }
    }
    /#
        if (var_67e8151f4dfc690b) {
            printtoscreen2d(32, 492, "<unknown string>" + maxthreat + "<unknown string>" + var_5a80aeb955d466dc + "<unknown string>", (1, 1, 1), 1.5);
        }
    #/
    if (isdefined(self.stealth.threat_sight_snd_ent)) {
        self.stealth.threat_sight_snd_threat = self.stealth.threat_sight_snd_threat - self.stealth.threat_sight_snd_threat * var_bdd51df6b28827ee;
        self.stealth.threat_sight_snd_threat = self.stealth.threat_sight_snd_threat + maxthreat * var_bdd51df6b28827ee;
        if (self.stealth.threat_sight_snd_threat < 0.0001) {
            self.stealth.threat_sight_snd_threat = 0;
        }
        maxthreat = self.stealth.threat_sight_snd_threat;
    }
    while (isdefined(self.stealth.threat_sight_snd_ent)) {
        index = 0;
        var_cfaeeea72851152d = 0;
        if (maxthreat > 0) {
            var_1cda86eccb821ec6 = function_8ba164c5a84fbb48(self);
            if (maxthreat < var_37b64319146d2f02) {
                var_2df1b1f3e5b6238c = clamp(maxthreat, 0, var_37b64319146d2f02);
                var_ce432c78f5984633 = var_2df1b1f3e5b6238c / var_37b64319146d2f02;
                var_97463e5fae955eab = 1 - var_732bd773132e7010;
                var_11af093d4b19eab2 = var_732bd773132e7010 + var_97463e5fae955eab * var_ce432c78f5984633;
                self.stealth.threat_sight_snd_vol = var_11af093d4b19eab2;
            } else {
                self.stealth.threat_sight_snd_vol = 1;
            }
        } else {
            self.stealth.threat_sight_snd_vol = 0;
            self.stealth.threat_sight_snd_threat = 0;
        }
        self.stealth.threat_sight_snd_vol = clamp(self.stealth.threat_sight_snd_vol, 0, 1);
        /#
            if (var_67e8151f4dfc690b) {
                printtoscreen2d(32, 508, "<unknown string>" + self.stealth.threat_sight_snd_threat, (1, 1, 1), 1.5);
            }
            if (var_67e8151f4dfc690b) {
                printtoscreen2d(32, 524, "<unknown string>" + self.stealth.threat_sight_snd_vol, (1, 1, 1), 1.5);
            }
        #/
        foreach (alias, snd_ent in self.stealth.threat_sight_snd_ent) {
            coef = 1;
            switch (index) {
            case 0:
                if (maxthreat < 0.75) {
                    coef = cos(var_1d73b1caa088a858 * maxthreat * 0.666);
                } else {
                    coef = 0;
                }
                break;
            case 1:
                if (maxthreat < 0.75) {
                    coef = sin(var_1d73b1caa088a858 * maxthreat * 0.666);
                } else if (maxthreat < 1) {
                    coef = sin(var_1d73b1caa088a858 * (1 - maxthreat) * 2);
                } else {
                    coef = 0;
                }
                break;
            case 2:
                if (maxthreat < 0.75) {
                    coef = 0;
                } else {
                    coef = cos(var_1d73b1caa088a858 * (1 - maxthreat) * 2);
                }
                break;
            }
            vol = clamp(self.stealth.threat_sight_snd_vol * coef, 0, 1);
            if (var_5a80aeb955d466dc) {
                var_cfaeeea72851152d = 1;
                if (snd_ent.isplaying == 0) {
                    if (isplayer(self)) {
                        self setsoundsubmix(alias, 0, 1);
                    }
                    snd_ent namespace_3c37cb17ade254d::delaycall(0.1, &playloopsound, alias);
                    snd_ent.isplaying = 1;
                    self playrumblelooponentity(rumble);
                }
                var_89c3e14196949443 = (vol - 1) * -1;
                if (isplayer(self)) {
                    self scalesoundsubmix(alias, var_89c3e14196949443);
                }
            } else if (snd_ent.isplaying == 1) {
                if (isplayer(self)) {
                    self setsoundsubmix(alias, 1, 1);
                }
                snd_ent namespace_3c37cb17ade254d::delaycall(1, &stoploopsound);
                snd_ent.isplaying = 0;
                self stoprumble(rumble);
            }
            /#
                if (var_67e8151f4dfc690b) {
                    printtoscreen2d(32, 540 + index * 16, "<unknown string>" + index + "<unknown string>" + vol, (1, 1, 1), 1.5);
                }
                if (var_67e8151f4dfc690b) {
                    printtoscreen2d(384, 540 + index * 16, "<unknown string>" + coef, (1, 1, 1), 1.5);
                }
            #/
            index++;
        }
        if (!var_cfaeeea72851152d) {
            foreach (alias, snd_ent in self.stealth.threat_sight_snd_ent) {
                if (isplayer(self)) {
                    self setsoundsubmix(alias, 1, 1);
                }
                snd_ent namespace_3c37cb17ade254d::delaycall(0.9, &stoploopsound);
                snd_ent namespace_3c37cb17ade254d::delaycall(1, &delete);
            }
            self.stealth.threat_sight_snd_ent = undefined;
            self.stealth.threat_sight_snd_vol = undefined;
            self.stealth.threat_sight_snd_threat = undefined;
        }
        wait(0.25);
    }
}

// Namespace stealth_music/namespace_d6e7a6955029e9b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1f
// Size: 0x5a
function function_f17fb237c7e883b2() {
    level endon("kill_spotted_sound_thread");
    while (1) {
        self waittill("stealth_hud_updated");
        if (!istrue(self.var_27c032d9c1b0d6a2)) {
            self setplayermusicstate("mx_cp_hydro_stealth_hidden");
            self.var_27c032d9c1b0d6a2 = 1;
            while (flag("stealth_spotted")) {
                waitframe();
            }
            self.var_27c032d9c1b0d6a2 = undefined;
        }
    }
}

