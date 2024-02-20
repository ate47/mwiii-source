// mwiii decomp prototype
#using scripts\common\anim.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\rank.gsc;
#using scripts\common\rockable_vehicles.gsc;

#namespace destructible;

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x465
// Size: 0x3
function init() {
    
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0x3
function script_model_anims() {
    
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479
// Size: 0xe9
function create_player_rig(player, animname, var_486db5fa512a3b6b) {
    if (!isdefined(player) || isdefined(player.player_rig)) {
        return;
    }
    player.animname = animname;
    if (!isdefined(var_486db5fa512a3b6b)) {
        var_486db5fa512a3b6b = "viewhands_base_iw8";
    }
    player.player_rig = spawn("script_model", player.origin);
    player.player_rig setmodel(var_486db5fa512a3b6b);
    player.player_rig hide();
    player.player_rig.animname = animname;
    player.player_rig useanimtree(%script_model);
    player playerlinktodelta(player.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 0);
    player watch_remove_rig();
    remove_player_rig(player);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x569
// Size: 0x92
function remove_player_rig(player) {
    if (!isdefined(player) || !isdefined(player.player_rig)) {
        return;
    }
    player unlink();
    droppos = player getdroptofloorposition(player.origin);
    if (isdefined(droppos)) {
        player setorigin(droppos);
    } else {
        player setorigin(player.origin + (0, 0, 100));
    }
    player.player_rig delete();
    player.player_rig = undefined;
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x602
// Size: 0x1d
function watch_remove_rig(struct) {
    waittill_any_2("remove_rig", "death_or_disconnect");
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x626
// Size: 0xdd
function add_destructible_array(value, type) {
    array = getentarray(value, type);
    foreach (ent in array) {
        destructible = spawnstruct();
        add_destructible(destructible, ent);
        destructible assigninteractteam(level.teamnamelist);
        if (!isdefined(level.destructibles[value])) {
            level.destructibles[value] = [];
        }
        level.destructibles[value][level.destructibles[value].size] = destructible;
        destructible process_action("init");
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70a
// Size: 0xf3
function add_destructible(struct, ent) {
    if (!isdefined(struct.ents)) {
        struct.ents = [];
    }
    struct read_properties(ent);
    struct read_actions(ent);
    struct.ents[struct.ents.size] = ent;
    ent.parent = struct;
    if (isdefined(ent.target)) {
        targets = getentarray(ent.target, "targetname");
        if (isdefined(targets) && targets.size > 0) {
            foreach (target in targets) {
                add_destructible(struct, target);
            }
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x804
// Size: 0x1c4
function read_properties(ent) {
    if (!isdefined(ent)) {
        return;
    }
    switch (ent.classname) {
    case #"hash_5e80cefd309127e7":
        self.use_trigger = ent;
        break;
    case #"hash_34386070076b3ec1":
        label = ent.script_label;
        if (isdefined(label)) {
            switch (label) {
            case #"hash_bab519a8c9a664ee":
                if (!isdefined(self.useobjects)) {
                    self.useobjects = [];
                }
                self.useobjects["front"] = setup_bomb_object(ent.origin);
                self.useobjects["front"].scenenodekey = "front";
                break;
            case #"hash_e1339489d1059713":
                if (!isdefined(self.scenenodes)) {
                    self.scenenodes = [];
                }
                self.scenenodes["front"] = ent;
                break;
            case #"hash_5ca8db6dafc678d0":
                if (!isdefined(self.useobjects)) {
                    self.useobjects = [];
                }
                self.useobjects["back"] = setup_bomb_object(ent.origin);
                self.useobjects["back"].scenenodekey = "back";
                break;
            case #"hash_383a7c211337491f":
                if (!isdefined(self.scenenodes)) {
                    self.scenenodes = [];
                }
                self.scenenodes["back"] = ent;
                break;
            }
        }
        break;
    case #"hash_efad986c2d96044e":
        self.scriptable = ent;
        break;
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x121
function read_actions(ent) {
    if (!isdefined(ent.script_noteworthy)) {
        return;
    }
    types = strtok(ent.script_noteworthy, ",");
    foreach (type in types) {
        actions = strtok(type, "|");
        if (!isdefined(actions)) {
            return;
        }
        if (actions.size < 2) {
            return;
        }
        type = actions[0];
        if (!isdefined(ent.actions)) {
            ent.actions = [];
        }
        if (!isdefined(ent.actions[type])) {
            ent.actions[type] = [];
        }
        for (index = 1; index < actions.size; index++) {
            ent.actions[type][ent.actions[type].size] = actions[index];
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf7
// Size: 0x25
function waittime_process_action(type, time) {
    level endon("game_ended");
    wait(time);
    process_action(type);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb23
// Size: 0x1f
function waitmsg_process_action(waitmsg) {
    level endon("game_ended");
    self waittill(waitmsg);
    process_action(waitmsg);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb49
// Size: 0xef
function process_action(type) {
    if (!isdefined(self.ents)) {
        return;
    }
    foreach (ent in self.ents) {
        if (isdefined(ent.actions) && isdefined(ent.actions[type])) {
            foreach (action in ent.actions[type]) {
                ent actionmap(action);
            }
        }
    }
    self.state = type;
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3f
// Size: 0x160
function actionmap(action) {
    switch (action) {
    case #"hash_ca51c18a00a0a89c":
        self show();
        break;
    case #"hash_7ebb454a971d80d":
        self hide();
        break;
    case #"hash_b669df4fb84dddd4":
        self solid();
        break;
    case #"hash_814a3d48452ddccd":
        self notsolid();
        break;
    case #"hash_47ef848af9047e3d":
        self disconnectpaths();
        break;
    case #"hash_491ccd849f5f0b23":
        self connectpaths();
        break;
    case #"hash_9fc8c71433fa319d":
        explosionorigin = self.origin;
        rot = self.angles;
        explosioneffect = spawnfx(level._effect["breach_explode"], explosionorigin, anglestoforward(rot) * -1, (0, 0, 1));
        triggerfx(explosioneffect);
        physicsexplosionsphere(explosionorigin, 200, 100, 3);
        playrumbleonposition("grenade_rumble", explosionorigin);
        earthquake(0.5, 1, explosionorigin, 1500);
        self.parent.plantedbomb setscriptablepartstate("bomb", "destroy");
        break;
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x7a
function setup_bomb_object(position) {
    useobject = namespace_19b4203b51d56488::createhintobject(position, "HINT_BUTTON", "hud_icon_c4_plant", "MP/BREACH", undefined, undefined, undefined, 800, 120, 72, 120);
    if (!isdefined(level.breachusetriggers)) {
        level.breachusetriggers = [];
    }
    level.breachusetriggers[level.breachusetriggers.size] = useobject;
    self.defused = 0;
    thread usetriggerthink(useobject);
    return useobject;
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0x389
function bomb_planted_think(scenenodekey, player) {
    var_9d423f29a3f3ffe = player.team;
    self.defused = 0;
    if (!isdefined(self.breachindex)) {
        if (!isdefined(level.breachindex)) {
            level.breachindex = 0;
        } else {
            level.breachindex++;
        }
        self.breachindex = level.breachindex;
    }
    bomb_fuse_think(var_9d423f29a3f3ffe);
    if (!self.defused) {
        process_action("destroyed");
        explosionorigin = self.useobjects[scenenodekey].origin;
        if (isdefined(self.scriptable)) {
            if (scenenodekey == "front") {
                self.scriptable setscriptablepartstate("base", "destroyFront");
            } else {
                self.scriptable setscriptablepartstate("base", "destroyBack");
            }
        } else {
            rot = self.useobjects[scenenodekey].angles;
            explosioneffect = spawnfx(level._effect["breach_explode"], explosionorigin, anglestoforward(rot) * -1, (0, 0, 1));
            triggerfx(explosioneffect);
            self.plantedbomb setscriptablepartstate("bomb", "destroy");
        }
        physicsexplosionsphere(explosionorigin, 200, 100, 3);
        playrumbleonposition("grenade_rumble", explosionorigin);
        earthquake(0.5, 1, explosionorigin, 1500);
        foreach (entry in self.useobjects) {
            entry delete();
            level.breachusetriggers = array_remove(level.breachusetriggers, entry);
        }
        wait(0.1);
        if (isdefined(player)) {
            self.plantedbomb radiusdamage(self.plantedbomb.origin, 300, 120, 10, player, "MOD_EXPLOSIVE", "bomb_site_mp");
        } else {
            self.plantedbomb radiusdamage(self.plantedbomb.origin, 300, 120, 10, undefined, "MOD_EXPLOSIVE", "bomb_site_mp");
        }
        if (isdefined(level.hostages)) {
            thread playhostagehelp(self.plantedbomb.origin);
        }
    }
    self.plantedbomb delete();
    self.plantedbomb = undefined;
    self.plantedkey = undefined;
    setomnvar("ui_ingame_timer_" + self.breachindex, 0);
    setomnvar("ui_ingame_timer_ent_" + self.breachindex, undefined);
    if (self.defused) {
        foreach (entry in self.useobjects) {
            entry sethintstring("MP/BREACH");
        }
        assigninteractteam(level.teamnamelist);
        process_action("init");
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b8
// Size: 0x47
function playhostagehelp(origin) {
    wait(1);
    if (distance2d(level.hostages[0].origin, origin) < 500) {
        level.hostages[0] playsound("dx_mpb_us3_hvt_up");
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1206
// Size: 0x203
function bomb_fuse_think(team) {
    self endon("defused");
    foreach (entry in self.useobjects) {
        entry sethintstring("MP/BREACH_DEFUSE");
    }
    self.timerobject = spawn("script_model", self.plantedbomb.origin);
    self.timerobject makeusable();
    assigninteractteam(getenemyteams(team));
    currenttime = gettime();
    var_f28399727742eb23 = int(currenttime + 5000);
    setomnvar("ui_ingame_timer_" + self.breachindex, var_f28399727742eb23);
    setomnvar("ui_ingame_timer_ent_" + self.breachindex, self.timerobject);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (!self.defused && var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 1500) {
            if (var_c301d652d9a73075 <= 250) {
                self.plantedbomb playsound("breach_warning_beep_05");
            } else if (var_c301d652d9a73075 < 500) {
                self.plantedbomb playsound("breach_warning_beep_04");
            } else if (var_c301d652d9a73075 < 1500) {
                self.plantedbomb playsound("breach_warning_beep_03");
            } else {
                self.plantedbomb playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 < 3500) {
            self.plantedbomb playsound("breach_warning_beep_02");
            wait(0.5);
        } else {
            self.plantedbomb playsound("breach_warning_beep_01");
            wait(1);
        }
        if (var_c301d652d9a73075 < 0) {
            break;
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1410
// Size: 0x8c
function usetriggerthink(trigger) {
    while (1) {
        player = trigger waittill("trigger");
        if (!array_contains(self.interactteams, player.team)) {
            continue;
        }
        if (player namespace_68e641469fde3fa7::grenadeinpullback()) {
            return 0;
        }
        if (player meleebuttonpressed()) {
            return 0;
        }
        if (player isusingremote()) {
            continue;
        }
        if (!isdefined(self.plantedbomb)) {
            plantbreachc4(trigger, player);
        } else {
            defusec4(player);
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a3
// Size: 0x3bd
function plantbreachc4(trigger, player) {
    thread watchplayerdeath(player);
    player.linktoent = player spawn_tag_origin();
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 0, 0, 0);
    player.linktoent moveto(self.scenenodes[trigger.scenenodekey].origin, 0.25, 0.1, 0.1);
    player.linktoent rotateto(self.scenenodes[trigger.scenenodekey].angles, 0.25, 0.1, 0.1);
    player setstance("stand");
    if (!player givegunless()) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
        return 0;
    }
    if (istrue(self.cancelplant)) {
        return 0;
    }
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(self.scenenodes[trigger.scenenodekey].origin);
    player setplayerangles(self.scenenodes[trigger.scenenodekey].angles);
    foreach (entry in self.useobjects) {
        entry hide();
    }
    faction = ter_op(player.team == "allies", "usp1", "afp1");
    if (level.mapname == "mp_hackney_yard") {
        faction = ter_op(player.team == "allies", "ukp1", "abp1");
    }
    player queuedialogforplayer("dx_mpp_" + faction + "_breach_plant", "cop_breach_plant", 2);
    thread create_player_rig(player, "planter");
    player thread namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "plant");
    var_f9faefd9721cae01 = spawn("script_model", self.scenenodes[trigger.scenenodekey].origin);
    var_f9faefd9721cae01 setmodel("offhand_wm_c4");
    var_f9faefd9721cae01.animname = "c4";
    var_f9faefd9721cae01 useanimtree(%script_model);
    self.plantedbomb = var_f9faefd9721cae01;
    self.plantedkey = trigger.scenenodekey;
    self.scenenodes[trigger.scenenodekey] thread anim_single_solo(var_f9faefd9721cae01, "plant");
    animlength = getanimlength(level.scr_anim["planter"]["plant"]);
    var_84d825d7e4a24fde = 0.5;
    wait(animlength - var_84d825d7e4a24fde);
    if (istrue(self.cancelplant)) {
        return 0;
    }
    thread bomb_planted_think(trigger.scenenodekey, player);
    givebreachscore(player);
    wait(var_84d825d7e4a24fde - 0.1);
    player thread takegunless();
    remove_player_rig(player);
    process_action("onuse");
    self notify("breach_complete");
    return 1;
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0xc9
function watchplayerdeath(player) {
    self endon("breach_complete");
    self.cancelplant = 0;
    while (1) {
        if (!isdefined(player) || !isreallyalive(player)) {
            foreach (entry in self.useobjects) {
                entry show();
            }
            if (isdefined(self.plantedbomb)) {
                self.plantedbomb delete();
                self.plantedbomb = undefined;
                self.plantedkey = undefined;
            }
            self.cancelplant = 1;
            break;
        }
        waitframe();
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1938
// Size: 0x6e
function allowplayertobreach(player) {
    if (isdefined(level.breachusetriggers)) {
        foreach (trigger in level.breachusetriggers) {
            trigger enableplayeruse(player);
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19ad
// Size: 0x6e
function disallowplayertobreach(player) {
    if (isdefined(level.breachusetriggers)) {
        foreach (trigger in level.breachusetriggers) {
            trigger disableplayeruse(player);
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a22
// Size: 0x27
function defusec4(player) {
    self.defused = 1;
    self notify("defused");
    givedefusescore(player);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a50
// Size: 0xa8
function onplayerjoinedteam(player) {
    foreach (array in level.destructibles) {
        foreach (d in array) {
            d applyinteractteam(player);
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aff
// Size: 0x6b
function assigninteractteam(teams) {
    self.interactteams = teams;
    foreach (player in level.players) {
        applyinteractteam(player);
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b71
// Size: 0x1c9
function applyinteractteam(player) {
    if (self.state == "destroyed") {
        return;
    }
    if (!isdefined(self.useobjects)) {
        return;
    }
    if (array_contains(self.interactteams, player.team)) {
        if (isdefined(self.plantedbomb)) {
            self.timerobject hidefromplayer(player);
            foreach (key, entry in self.useobjects) {
                if (key == self.plantedkey) {
                    entry setuseholdduration("duration_medium");
                    entry enableplayeruse(player);
                    entry showtoplayer(player);
                } else {
                    entry disableplayeruse(player);
                    entry hidefromplayer(player);
                }
            }
        } else {
            foreach (key, entry in self.useobjects) {
                entry setuseholdduration("duration_short");
                entry enableplayeruse(player);
                entry showtoplayer(player);
            }
        }
    } else {
        if (isdefined(self.plantedbomb)) {
            self.timerobject showtoplayer(player);
        }
        foreach (entry in self.useobjects) {
            entry disableplayeruse(player);
            entry hidefromplayer(player);
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d41
// Size: 0x47
function givebreachscore(player) {
    event = #"breach";
    points = namespace_62c556437da28f50::getscoreinfovalue(event);
    player thread namespace_62c556437da28f50::giverankxp(event, points);
    player thread namespace_62c556437da28f50::scoreeventpopup(event);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8f
// Size: 0x47
function givedefusescore(player) {
    event = #"hash_44f52653c35f1c07";
    points = namespace_62c556437da28f50::getscoreinfovalue(event);
    player thread namespace_62c556437da28f50::giverankxp(event, points);
    player thread namespace_62c556437da28f50::scoreeventpopup(event);
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddd
// Size: 0x95
function givegunless() {
    self endon("death_or_disconnect");
    gunless = makeweapon("iw8_gunless");
    _giveweapon(gunless, undefined, undefined, 1);
    success = domonitoredweaponswitch(gunless, 0);
    if (success) {
        self.gunnlessweapon = gunless;
        val::set("gunless", "weapon_switch", 0);
        val::set("gunless", "offhand_weapons", 0);
        val::set("gunless", "melee", 0);
    } else {
        _takeweapon(gunless);
        forcevalidweapon();
    }
    return success;
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7a
// Size: 0xa9
function takegunless() {
    self endon("death_or_disconnect");
    if (!isdefined(self.gunnlessweapon) || !self hasweapon(self.gunnlessweapon)) {
        return;
    }
    self.takinggunless = 1;
    while (self hasweapon(self.gunnlessweapon)) {
        if (!iscurrentweapon(self.gunnlessweapon)) {
            abortmonitoredweaponswitch(self.gunnlessweapon);
        } else {
            _takeweapon(self.gunnlessweapon);
            forcevalidweapon();
        }
        waitframe();
    }
    self.takinggunless = 0;
    self.gunnlessweapon = undefined;
    val::function_c9d0b43701bdba00("gunless");
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2a
// Size: 0x14
function rockable_cars_init() {
    waitframe();
    namespace_eae38e0288c268e1::rockable_cars_init();
    level thread rockable_cars_watch_players();
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f45
// Size: 0x4a2
function rockable_cars_watch_players() {
    if (!isdefined(level.rockablecars) || !isdefined(level.rockablecars.cars) || level.rockablecars.cars.size == 0) {
        return;
    }
    level endon("game_ended");
    while (1) {
        foreach (player in level.players) {
            if (!isreallyalive(player)) {
                continue;
            }
            if (player ismantling() || !player isonground()) {
                continue;
            }
            car = player getmovingplatformparent();
            if (!isdefined(car) || !istrue(car.var_743ebab8013b6cde)) {
                continue;
            }
            var_340d59422336e85a = player.origin - car.toppoint;
            if (vectordot(var_340d59422336e85a, car.up) < 0) {
                continue;
            }
            forwarddot = vectordot(var_340d59422336e85a, car.forward);
            var_4261b9974dee3bdb = abs(forwarddot);
            var_60bc4ce4bc1694b7 = var_4261b9974dee3bdb / car.halflength;
            if (var_60bc4ce4bc1694b7 > 1) {
                continue;
            }
            var_6b16895685c64534 = vectordot(var_340d59422336e85a, car.right);
            var_92bfbb64d47dfeec = abs(var_6b16895685c64534);
            var_1d2f8dbf170357c7 = var_92bfbb64d47dfeec / car.halfwidth;
            if (var_1d2f8dbf170357c7 > 1) {
                continue;
            }
            var_4d5c2819cbf3d194 = ter_op(forwarddot >= 0, "front", "back");
            var_8169b248be4d2462 = ter_op(var_6b16895685c64534 >= 0, "right", "left");
            var_b6b4451b4fd94b27 = var_4d5c2819cbf3d194 + "_" + var_8169b248be4d2462;
            if (isdefined(player.var_4005d3c144acd854) && player.var_4005d3c144acd854 == var_b6b4451b4fd94b27) {
                continue;
            }
            id = player getentitynumber();
            if (!isdefined(car.players[id])) {
                car rockable_car_add_player(player);
            }
            car rockable_car_rock(player, var_60bc4ce4bc1694b7, var_1d2f8dbf170357c7, forwarddot, var_6b16895685c64534, var_b6b4451b4fd94b27);
        }
        foreach (car in level.rockablecars.cars) {
            if (!isdefined(car)) {
                continue;
            }
            foreach (id, player in car.players) {
                var_d360b01d9a8ca0c3 = gettime() - car.touchtimes[id];
                if (!isdefined(player) || !isreallyalive(player)) {
                    car rockable_car_remove_player(player, id, undefined, 0);
                } else if (player ismantling() || !player isonground()) {
                    car rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, 1);
                } else {
                    var_88cce618c00d03c = player getmovingplatformparent();
                    if (!isdefined(var_88cce618c00d03c) || var_88cce618c00d03c != car) {
                        car rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, 1);
                    } else {
                        var_340d59422336e85a = player.origin - car.toppoint;
                        if (vectordot(var_340d59422336e85a, car.up) < 0) {
                            car rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, 1);
                        } else {
                            forwarddot = vectordot(var_340d59422336e85a, car.forward);
                            var_4261b9974dee3bdb = abs(forwarddot);
                            var_60bc4ce4bc1694b7 = var_4261b9974dee3bdb / car.halflength;
                            if (var_60bc4ce4bc1694b7 > 1) {
                                car rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, 1);
                            } else {
                                var_6b16895685c64534 = vectordot(var_340d59422336e85a, car.right);
                                var_92bfbb64d47dfeec = abs(var_6b16895685c64534);
                                var_1d2f8dbf170357c7 = var_92bfbb64d47dfeec / car.halfwidth;
                                if (var_1d2f8dbf170357c7 > 1) {
                                    car rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, 1);
                                } else {
                                    car.touchtimes[id] = gettime();
                                }
                            }
                        }
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ee
// Size: 0x3b
function rockable_car_add_player(player) {
    id = player getentitynumber();
    self.players[id] = player;
    self.touchtimes[id] = gettime();
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2430
// Size: 0x9a
function rockable_car_remove_player(player, id, var_d360b01d9a8ca0c3, var_bd8dbaf4dd9ca95d) {
    if (var_bd8dbaf4dd9ca95d) {
        if (isdefined(var_d360b01d9a8ca0c3) && var_d360b01d9a8ca0c3 >= 200) {
            self.players[id] = undefined;
            self.touchtimes[id] = undefined;
            self.rocktimes[id] = undefined;
            if (isdefined(player)) {
                player.var_4005d3c144acd854 = undefined;
            }
        }
    } else {
        self.players[id] = undefined;
        self.touchtimes[id] = undefined;
        self.rocktimes[id] = undefined;
        if (isdefined(player)) {
            player.var_4005d3c144acd854 = undefined;
        }
    }
}

// Namespace destructible/namespace_f35854735f789d3c
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d1
// Size: 0x83
function rockable_car_rock(player, var_60bc4ce4bc1694b7, var_1d2f8dbf170357c7, forwarddot, var_6b16895685c64534, var_b6b4451b4fd94b27) {
    if (var_60bc4ce4bc1694b7 > 0.4 && var_1d2f8dbf170357c7 > 0) {
        self setscriptablepartstate("Anim_PlayerStandRock", var_b6b4451b4fd94b27, 0);
        id = player getentitynumber();
        self.rocktimes[id] = gettime();
        player.var_4005d3c144acd854 = var_b6b4451b4fd94b27;
    }
}
