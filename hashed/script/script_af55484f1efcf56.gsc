// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\math.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\common\create_script_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\spawnscoring.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_38eb8f4be20d54f4;

#namespace training_course;

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x722
// Size: 0x1ee
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    namespace_a0229183a28ffd3::initialize_create_script();
    namespace_85d036cb78063c4a::function_22bff45fcf920417(0);
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 1200);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    flag_init("next_event");
    level.onplayerconnect = &function_f04d88d61bafc69a;
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &function_7c2ee16bc35afc97;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.ontimelimit = &ontimelimit;
    level.weapondropfunction = &dropweaponfordeath;
    game["dialog"]["gametype"] = "iw9_mtdm_mode_uktl_name";
    game["dialog"]["boost"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["offense_obj"] = "iw9_mtdm_mode_uktl_bost";
    game["dialog"]["defense_obj"] = "iw9_mtdm_mode_uktl_bost";
    level.tdmanywhere_dropheight = getdvarfloat(@"hash_c692d2a11dd6615", 1000);
    level.tdmanywhere_perpenoffset = getdvarfloat(@"hash_631c58033f43c2dc", 2048);
    level.tdmanywhere_distoffset = getdvarfloat(@"hash_f314048c87ae28aa", 4092);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x917
// Size: 0x153
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
    level.gametype = "training_course";
    setdvar(@"hash_c11db9baa9e5bc9b", 1);
    setdvar(@"hash_c55dc89ef275cdaa", 1);
    setdvar(@"hash_c653d32c30815d2b", 15);
    setdvar(@"hash_704afe6f6c582ee0", 6);
    setdvar(@"hash_94af58bec500b3b9", 1);
    setdvar(@"hash_b773758221a0c100", 5);
    setdvar(@"hash_e4187d1543c7477e", 0);
    setdvar(@"hash_a2e7d8fdf5d91dd9", 1);
    setdvar(@"hash_e94e38873c94b670", 1);
    level.disablescoreevents = 1;
    level.var_92b187a00d3dd091 = 1;
    level.var_f20fe98bf14887b6 = 1;
    level.forcedend = 1;
    level.var_10a1699461d4ad08 = 1;
    level.var_c94add55a8ad5938 = 1;
    level.roundenddelay = 0.5;
    if (getdvarint(@"hash_19bfa9cf3a838b8") != 1) {
        setdvar(@"hash_19bfa9cf3a838b8", 1);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa71
// Size: 0x141
function function_77548e38e7c405c8() {
    var_b5c4c97d744e491e = getentarray("tutorialOOB", "targetname");
    var_4d5cf33d9458b576 = getentarray("movingOOB", "targetname");
    var_1278addc4f398690 = level.outofboundstriggers;
    if (isdefined(var_b5c4c97d744e491e)) {
        foreach (var_70e9548d1e3ea919 in var_b5c4c97d744e491e) {
            var_70e9548d1e3ea919.var_f27477df9087e23d = var_1278addc4f398690.size;
            var_1278addc4f398690[var_1278addc4f398690.size] = var_70e9548d1e3ea919;
        }
    }
    level.var_4d5cf33d9458b576 = [];
    if (isdefined(var_4d5cf33d9458b576)) {
        foreach (var_70e9548d1e3ea919 in var_4d5cf33d9458b576) {
            index = int(var_70e9548d1e3ea919.script_noteworthy);
            var_70e9548d1e3ea919.var_f27477df9087e23d = index;
            level.var_4d5cf33d9458b576[index] = var_70e9548d1e3ea919;
            var_1278addc4f398690[var_1278addc4f398690.size] = var_70e9548d1e3ea919;
        }
    }
    level.outofboundstriggers = var_1278addc4f398690;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb9
// Size: 0x68
function function_7c390d67d182a2b6() {
    if (isdefined(level.var_4d5cf33d9458b576)) {
        foreach (trigger in level.var_4d5cf33d9458b576) {
            trigger.isdisabled = undefined;
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc28
// Size: 0x64
function function_4f223e0dd031befb(index) {
    if (isdefined(level.var_4d5cf33d9458b576)) {
        var_70e9548d1e3ea919 = level.var_4d5cf33d9458b576[index];
        if (isdefined(var_70e9548d1e3ea919)) {
            var_70e9548d1e3ea919.isdisabled = 1;
            if (level.player istouching(var_70e9548d1e3ea919)) {
                namespace_d9c77dc2a6fe29c6::disableoob(level.player);
            }
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc93
// Size: 0x1af
function function_e39f8bc855ee1d4e(var_f50f3f9183c1ad36, var_c4fdcc6d846becc4) {
    level.targets = [];
    foreach (targetindex, target in var_f50f3f9183c1ad36) {
        target.health = 50;
        target.targetindex = targetindex;
        target.team = "axis";
        script_noteworthy = target.script_noteworthy;
        if (isdefined(script_noteworthy)) {
            if (!isdefined(level.targets[script_noteworthy])) {
                level.targets[script_noteworthy] = [];
            }
            level.targets[script_noteworthy] = array_add(level.targets[script_noteworthy], target);
            target function_7776a47aa86745dc();
        }
    }
    function_c82d1e4871e952c();
    var_bb4de8520fe416a1 = [];
    foreach (trigger in var_c4fdcc6d846becc4["triggers"]) {
        index = int(trigger.script_noteworthy);
        trigger.index = index;
        var_bb4de8520fe416a1[index] = trigger;
    }
    level.var_228fe94899ab86fa = var_bb4de8520fe416a1;
    level.var_74bbab6520042559 = var_c4fdcc6d846becc4["weapon"];
    level.var_5372f0b80988f4e5 = var_c4fdcc6d846becc4["care_package"];
    level.var_accc9cb5c57f8687 = [];
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe49
// Size: 0x8f
function function_c82d1e4871e952c() {
    level.var_df54b7c8e446178f = 1;
    level.var_9317edc858b1ea66 = [];
    for (i = 1; i <= 6; i++) {
        spawnstruct = getstruct("tut_spawn" + i, "targetname");
        spawnstruct.index = i;
        level.var_9317edc858b1ea66[i] = spawnstruct;
    }
    level.var_9317edc858b1ea66[0] = level.var_9317edc858b1ea66[1];
    level.getspawnpoint = &function_e2bf46c0f241711e;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xedf
// Size: 0x8a
function function_590ce6148cbe52c4() {
    self setorigin(level.var_74bbab6520042559.origin);
    _giveweapon(self.primaryweapon, undefined, undefined, 0);
    level.var_e121c8daae441150 = self dropitem(self.primaryweapon);
    level.var_e121c8daae441150.objweapon = self.primaryweaponobj;
    level.var_e121c8daae441150 itemweaponsetammo(0, weaponmaxammo(level.var_e121c8daae441150));
    self disableweaponpickup();
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf70
// Size: 0x5a
function function_ae929b8901ac0db(var_5372f0b80988f4e5) {
    level.carepackage = namespace_6c578d6ef48f10ef::placekillstreakcrate(level.player, "allies", "cruise_predator", var_5372f0b80988f4e5.origin, var_5372f0b80988f4e5.angles);
    level.carepackage.nevertimeout = 1;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfd1
// Size: 0x8a
function function_e2bf46c0f241711e() {
    if (isdefined(level.var_df54b7c8e446178f) && isdefined(level.var_9317edc858b1ea66)) {
        return level.var_9317edc858b1ea66[level.var_df54b7c8e446178f];
    }
    spawnarray = getspawnarray("mp_tdm_spawn_allies_start");
    spawnpoint = spawnarray[0];
    spawnpoint.origin = getgroundposition(spawnpoint.origin, 15);
    spawnangles = spawnpoint.angles;
    return spawnpoint;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1063
// Size: 0xcf
function function_4dc27f9df0ba179f(origin) {
    if (!isdefined(self.objidnum)) {
        self.offset3d = (0, 0, 0);
        self.curorigin = self.origin;
        namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
    }
    objective_add_objective(self.objidnum, "current", self.origin);
    update_objective_icon(self.objidnum, "icon_waypoint_sp_generic");
    objective_setbackground(self.objidnum, 1);
    function_11cbcb8303075da(self.objidnum, 224, 224, 224, 1);
    function_f21e9b2e78de984b(self.objidnum, 150, 75);
    objective_set_play_intro(self.objidnum, 0);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1139
// Size: 0x42
function function_d2da945656356633() {
    objective_set_play_outro(self.objidnum, 0);
    objective_teammask_removefrommask(self.objidnum, "allies");
    objective_unpin_player(self.objidnum, level.player);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1182
// Size: 0x67
function function_b85b74a17beba1aa() {
    foreach (trigger in level.var_228fe94899ab86fa) {
        if (isdefined(trigger.objidnum)) {
            trigger function_d2da945656356633();
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11f0
// Size: 0x15
function private function_520a19b833f9ea69() {
    return getdvarint(@"hash_25e41dd3f2801f8d", 0) == 1;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x120d
// Size: 0x30
function private function_f04d88d61bafc69a(player) {
    player waittill("spawned");
    if (isbot(player)) {
        return;
    }
    level.player = player;
    function_e5b1655917227a82(player);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1244
// Size: 0x186
function private function_e5b1655917227a82(player) {
    player.team = "allies";
    player.pers["team"] = "allies";
    player.sessionteam = "allies";
    level.teamdata[player.team]["aliveCount"] = 1;
    player function_590ce6148cbe52c4();
    player allowreload(0);
    player disableautoreload();
    player _takeweapon(player.primaryweaponobj);
    player domonitoredweaponswitch(player.secondaryweaponobj, 1, 0);
    player setweaponammostock(player.secondaryweaponobj, weaponmaxammo(player.secondaryweaponobj));
    player setweaponammoclip(player.secondaryweaponobj, 0);
    slot = namespace_1a507865f681850e::getdefaultslot("equip_frag");
    if (isdefined(slot)) {
        player namespace_1a507865f681850e::giveequipment("equip_frag", slot);
        player setequipmentslotammo("primary", 0);
    }
    slot = namespace_1a507865f681850e::getdefaultslot("equip_concussion");
    if (isdefined(slot)) {
        player namespace_1a507865f681850e::giveequipment("equip_concussion", slot);
        player setequipmentslotammo("secondary", 0);
    }
    player namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_tac_cover", undefined, undefined, undefined, 0);
    player setorigin(level.var_9317edc858b1ea66[0].origin);
    player setplayerangles(level.var_9317edc858b1ea66[0].angles);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13d1
// Size: 0x171
function private function_f3d8585a10979d82() {
    self endon("death_or_disconnect");
    self waittill("giveLoadout");
    if (level.var_35d8c4fb1aeb5cb8 <= 3) {
        _takeweapon(self.primaryweaponobj);
        domonitoredweaponswitch(self.secondaryweaponobj, 1, 0);
        if (level.var_35d8c4fb1aeb5cb8 < 2) {
            self disableweaponpickup();
        }
    }
    if (level.var_35d8c4fb1aeb5cb8 <= 6) {
        if (level.var_35d8c4fb1aeb5cb8 < 6) {
            self allowreload(0);
        }
        self disableautoreload();
        self setweaponammostock(self.secondaryweaponobj, weaponmaxammo(self.secondaryweaponobj));
        self setweaponammoclip(self.secondaryweaponobj, 0);
        self setweaponammostock(self.primaryweaponobj, weaponmaxammo(self.primaryweaponobj));
        self setweaponammoclip(self.primaryweaponobj, 0);
    }
    takeequipment("secondary");
    if (level.var_35d8c4fb1aeb5cb8 == 11) {
        slot = namespace_1a507865f681850e::getdefaultslot("equip_concussion");
        if (isdefined(slot)) {
            namespace_1a507865f681850e::giveequipment("equip_concussion", slot);
        }
    }
    if (level.var_35d8c4fb1aeb5cb8 != 20) {
        takeequipment("primary");
    }
    if (level.var_35d8c4fb1aeb5cb8 != 24) {
        namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_tac_cover", undefined, undefined, undefined, 0);
    } else {
        namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_tac_cover");
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1549
// Size: 0x156
function private function_ff44c6d5799b3f47(var_e0ea2c8df06f13eb, var_d7198ceb7d51db5b, headshot, var_c4f1516c772b1c2d, icontype) {
    if (!isdefined(var_d7198ceb7d51db5b)) {
        var_d7198ceb7d51db5b = 0;
    }
    if (!isdefined(var_e0ea2c8df06f13eb)) {
        return;
    }
    if (!isdefined(headshot)) {
        headshot = 0;
    }
    if (!isdefined(var_c4f1516c772b1c2d)) {
        var_c4f1516c772b1c2d = 0;
    }
    priority = function_9e26c58a6edd4ac8(var_e0ea2c8df06f13eb);
    if (isdefined(self.lasthitmarkertime) && self.lasthitmarkertime == gettime() && priority <= self.lasthitmarkerpriority && !var_d7198ceb7d51db5b) {
        return;
    }
    self.lasthitmarkertime = gettime();
    self.lasthitmarkerpriority = priority;
    if (isdefined(icontype) && !istrue(var_d7198ceb7d51db5b)) {
        self setclientomnvar("damage_feedback_icon", icontype);
        self setclientomnvar("damage_feedback_icon_notify", gettime());
    }
    self setclientomnvar("damage_feedback", var_e0ea2c8df06f13eb);
    self setclientomnvar("damage_feedback_notify", gettime());
    if (var_d7198ceb7d51db5b) {
        self setclientomnvar("damage_feedback_kill", 1);
    } else {
        self setclientomnvar("damage_feedback_kill", 0);
    }
    if (headshot) {
        self setclientomnvar("damage_feedback_headshot", 1);
    } else {
        self setclientomnvar("damage_feedback_headshot", 0);
    }
    if (var_c4f1516c772b1c2d) {
        self setclientomnvar("damage_feedback_nonplayer", 1);
    } else {
        self setclientomnvar("damage_feedback_nonplayer", 0);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16a6
// Size: 0x28
function private function_9e26c58a6edd4ac8(var_b98146816886d3c4) {
    if (!isdefined(level.hitmarkerpriorities[var_b98146816886d3c4])) {
        return 0;
    }
    return level.hitmarkerpriorities[var_b98146816886d3c4];
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16d6
// Size: 0x8d
function private function_321be506fe49028b() {
    level endon("game_ended");
    level endon("training_course_interrupted");
    self endon("disconnect");
    while (1) {
        weapons = self getweaponslistprimaries();
        foreach (weapon in weapons) {
            self givemaxammo(weapon);
            self setweaponammostock(weapon, weaponmaxammo(weapon));
        }
        waitframe();
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x176a
// Size: 0xa6
function private function_d591cb24cfb9e613() {
    forward = anglestoforward(self getplayerangles());
    var_67f2d5f225a3f921 = anglebetweenvectors(forward, (0, 0, 1));
    left = anglestoleft(self getplayerangles());
    var_8d28631407d834bb = anglebetweenvectors(left, (1, 0, 0));
    var_f36628a4d70d4a6b = var_67f2d5f225a3f921 <= 70;
    var_c16a2ec0653c4e1e = var_67f2d5f225a3f921 >= 115;
    var_6351aa4d4956cf0 = var_8d28631407d834bb >= 25;
    return var_f36628a4d70d4a6b || var_c16a2ec0653c4e1e || var_6351aa4d4956cf0;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1818
// Size: 0x39
function private function_ab39011be023b94() {
    level endon("target_death");
    while (1) {
        grenade = self waittill("grenade_fire");
        wait(1.5);
        setequipmentslotammo("secondary", 1);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1858
// Size: 0x39
function private function_d21af14f709b4e9() {
    level endon("target_death");
    while (1) {
        grenade = self waittill("grenade_fire");
        wait(3.5);
        setequipmentslotammo("primary", 1);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1898
// Size: 0x3b
function private function_e15b215e4fc00932(trigger) {
    self endon("stop_trigger_check");
    while (1) {
        player = trigger waittill("trigger");
        player.var_c74e2a2f7c14d917 = 0;
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18da
// Size: 0x3c
function private function_4e2fe44c3cbe6b24(trigger) {
    self endon("stop_trigger_check");
    while (1) {
        player = trigger waittill("trigger_exit");
        player.var_c74e2a2f7c14d917 = 1;
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x191d
// Size: 0x93
function private function_ea6a9ec867a82c1() {
    self endon("stop_killstreak_check");
    while (1) {
        streakname = self waittill("streak_activated");
        self setclientomnvar("lui_training_course_state", -1);
        waittill_any_2("killstreak_use_finished", "death");
        wait(1);
        namespace_58a74e7d54b56e8d::awardkillstreak(streakname, self);
        if (self getclientomnvar("lui_training_course_state") != level.var_1064eb0974861b0a.size) {
            self setclientomnvar("lui_training_course_state", -1);
            wait(1);
            self setclientomnvar("lui_training_course_state", level.var_1064eb0974861b0a.size);
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b7
// Size: 0x12e
function function_fb4b8c8dec4c8495() {
    level.var_35d8c4fb1aeb5cb8 = 0;
    level.var_1064eb0974861b0a = [0:&function_e0f8d1d915cb681b, 1:&function_6cf90f12033c1f1d, 2:&function_e2bbf555c17be641, 3:&function_2f2b7340eced2d89, 4:&function_359bd4b9eca48636, 5:&function_bac1fa083cbe583e, 6:&function_3c1235da36973cb8, 7:&function_249c0b8a2dcb60cc, 8:&function_c546f0a53b1b9975, 9:&function_2e308a2fe4c912e1, 10:&function_284061e8190319c6, 11:&function_dc0f31a23dd05cb8, 12:&function_1773e8decf0f2f6c, 13:&function_8ce66a93e6be27b8, 14:&function_cd9e90285761f4fe, 15:&function_c6892ce5f3e88669, 16:&function_e4edec51c1e3239c, 17:&function_8a6c94d7fd48dc64, 18:&function_45d68507c5ae7072, 19:&function_bf56d16e55747d09, 20:&function_dc70aaa8d8f87297, 21:&function_83a3fb61c8b255a1, 22:&function_e41e02ec0865fb08, 23:&function_aa65e8881adabf98, 24:&function_578c96daacc20f48, 25:&function_a1eb5feb655153e7, 26:&function_2de15530c52467a8, 27:&function_939598706be41c51, 28:&function_f4ec7a2a6a9ee2c0, 29:&function_4ce43f1cc5edb5cf, 30:&function_8aa67e2c556382dc];
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aec
// Size: 0x109
function function_3e4edf7034db8b19() {
    foreach (var_f50f3f9183c1ad36 in level.targets) {
        foreach (target in var_f50f3f9183c1ad36) {
            if (target function_53580c5eeccb98ab()) {
                target.health = 50;
            } else {
                target rotatepitch(-90, 0.1);
            }
        }
    }
    level.var_9d998250bdb9bcb9 = 0.5;
    level.player thread function_321be506fe49028b();
    level.player dlog_recordplayerevent("dlog_event_training_course_end", [0:"is_completed", 1:0]);
    level thread function_1ee6762a88ec543c();
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bfc
// Size: 0xc6
function function_1ee6762a88ec543c() {
    level endon("game_ended");
    level endon("training_course_interrupted");
    level.player endon("disconnect");
    wait(6);
    while (level.var_35d8c4fb1aeb5cb8 < level.var_1064eb0974861b0a.size) {
        thread function_92945bd32781da76(level.player, level.var_35d8c4fb1aeb5cb8);
        level.player childthread [[ level.var_1064eb0974861b0a[level.var_35d8c4fb1aeb5cb8] ]]();
        level.var_35d8c4fb1aeb5cb8 = level.var_35d8c4fb1aeb5cb8 + 1;
        flag_wait("next_event");
        level.player setclientomnvar("lui_training_course_state", -1);
        wait(level.var_9d998250bdb9bcb9);
        level.var_9d998250bdb9bcb9 = 0.5;
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc9
// Size: 0x42
function function_92945bd32781da76(player, eventindex) {
    if (isdefined(level.var_35e511272af146e5)) {
        wait(level.var_35e511272af146e5);
    }
    player setclientomnvar("lui_training_course_state", eventindex);
    level.var_35e511272af146e5 = undefined;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d12
// Size: 0x52
function function_e0f8d1d915cb681b() {
    flag_clear("next_event");
    /#
        self iprintln("secondary");
    #/
    while (!function_d591cb24cfb9e613()) {
        waitframe();
    }
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("mp_jup_training_objective_success");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6c
// Size: 0xfd
function function_6cf90f12033c1f1d() {
    flag_clear("next_event");
    /#
        self iprintln("attackers");
    #/
    self enableweaponpickup();
    trigger = level.var_228fe94899ab86fa[1];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (183.5, 210.5, 190.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    level.var_e121c8daae441150.outline = outlineenableforplayer(level.var_e121c8daae441150, self, "outline_nodepth_red", "level_script");
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e71
// Size: 0xc2
function function_e2bbf555c17be641() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    if (isdefined(level.var_e121c8daae441150)) {
        level.var_e121c8daae441150 makeusable();
        level.var_e121c8daae441150 sethintdisplayrange(128);
        level.var_e121c8daae441150 setuserange(128);
        level.var_e121c8daae441150 childthread namespace_3bbb5a98b932c46f::watchpickup(self);
        droppeditem = weaponobj = self waittill("weapon_pickup");
        outlinedisable(level.var_e121c8daae441150.outline, self);
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3b
// Size: 0x66
function function_2f2b7340eced2d89() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    while (1) {
        self waittill("weapon_change");
        if (istrue(self.var_d7b7b32fa4c77d0e)) {
            self.var_d7b7b32fa4c77d0e = 0;
        } else {
            break;
        }
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa9
// Size: 0x72
function function_359bd4b9eca48636() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    while (1) {
        self waittill("weapon_change");
        if (istrue(self.var_d7b7b32fa4c77d0e)) {
            self.var_d7b7b32fa4c77d0e = 0;
        } else {
            break;
        }
    }
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2023
// Size: 0x7e
function function_bac1fa083cbe583e() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    self allowreload(1);
    while (1) {
        self waittill("reload");
        var_b27047c65737f75b = self getcurrentweapon();
        if (isdefined(var_b27047c65737f75b)) {
            break;
        }
    }
    self enableautoreload();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20a9
// Size: 0xc8
function function_3c1235da36973cb8() {
    flag_clear("next_event");
    /#
        self iprintln("attackers");
    #/
    trigger = level.var_228fe94899ab86fa[20];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (183.5, 210.5, 190.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2179
// Size: 0xe3
function function_249c0b8a2dcb60cc() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["Hipfire"]) {
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_fdb937421f2f2731;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["Hipfire"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2264
// Size: 0xf7
function function_c546f0a53b1b9975() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["ADS"]) {
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_e537f5a00f54b91e;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["ADS"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    /#
        self iprintln("<unknown string>");
    #/
    level.var_df54b7c8e446178f = 2;
    function_4f223e0dd031befb(1);
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2363
// Size: 0xc8
function function_2e308a2fe4c912e1() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[2];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (186.5, 623.5, 190.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2433
// Size: 0x121
function function_284061e8190319c6() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    slot = namespace_1a507865f681850e::getdefaultslot("equip_concussion");
    if (isdefined(slot)) {
        namespace_1a507865f681850e::giveequipment("equip_concussion", slot);
        childthread function_ab39011be023b94();
    }
    foreach (target in level.targets["Tactical"]) {
        target.health = 1;
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_a3c9f518ed376a4a;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["Tactical"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x255c
// Size: 0xc8
function function_dc0f31a23dd05cb8() {
    flag_clear("next_event");
    /#
        self iprintln("attackers");
    #/
    trigger = level.var_228fe94899ab86fa[13];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (183.5, 210.5, 190.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262c
// Size: 0xe3
function function_1773e8decf0f2f6c() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["TacticalADS"]) {
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_94d7abe1e5cc3a94;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["TacticalADS"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2717
// Size: 0xd1
function function_8ce66a93e6be27b8() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    var_3c2d5756e9151a63 = level.var_228fe94899ab86fa[3];
    var_3c2d5756e9151a63 function_4dc27f9df0ba179f(var_3c2d5756e9151a63.origin);
    /#
        orientedbox(var_3c2d5756e9151a63.origin, (32, 32, 32), var_3c2d5756e9151a63.angles, (1, 0, 0), 1, 400);
    #/
    player = var_3c2d5756e9151a63 waittill("trigger");
    var_3c2d5756e9151a63 function_d2da945656356633();
    function_4f223e0dd031befb(2);
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f0
// Size: 0x104
function function_cd9e90285761f4fe() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[4];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (129, 68.5, 20.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    while (1) {
        player = trigger waittill("trigger");
        playerstance = player getstance();
        if (playerstance == "crouch" || playerstance == "prone") {
            break;
        }
    }
    trigger function_d2da945656356633();
    level.var_df54b7c8e446178f = 3;
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28fc
// Size: 0xdf
function function_c6892ce5f3e88669() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[5];
    var_226b4faab1b621d = level.var_228fe94899ab86fa[12];
    var_226b4faab1b621d function_4dc27f9df0ba179f(var_226b4faab1b621d.origin);
    /#
        orientedbox(trigger.origin, (553.5, 107, 188), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    var_226b4faab1b621d function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29e3
// Size: 0xd2
function function_e4edec51c1e3239c() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["Mount"]) {
        target function_697e01c482ca4c72();
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["Mount"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2abd
// Size: 0xe4
function function_8a6c94d7fd48dc64() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["Penetration"]) {
        target function_697e01c482ca4c72();
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["Penetration"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    function_4f223e0dd031befb(3);
    function_4f223e0dd031befb(4);
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba9
// Size: 0xc8
function function_45d68507c5ae7072() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[10];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (186.5, 623.5, 190.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c79
// Size: 0x157
function function_bf56d16e55747d09() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    slot = namespace_1a507865f681850e::getdefaultslot("equip_frag");
    if (isdefined(slot)) {
        namespace_1a507865f681850e::giveequipment("equip_frag", slot);
        childthread function_d21af14f709b4e9();
    }
    targets = level.targets["Lethal"];
    foreach (target in targets) {
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_448aa67e9fe96de6;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    level waittill("target_death");
    foreach (target in targets) {
        target setcandamage(0);
        target function_985e1298e8b97a33();
    }
    self notify("lethal_check_end");
    function_4f223e0dd031befb(5);
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd8
// Size: 0xd3
function function_dc70aaa8d8f87297() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[6];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (121, 108.5, 124.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    level.var_df54b7c8e446178f = 4;
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb3
// Size: 0xec
function function_83a3fb61c8b255a1() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["Prone"]) {
        target function_697e01c482ca4c72();
        target.var_ef356f8bcde74a2d = &function_aea735653060f9b1;
        target childthread function_2e8e7982711d50f2();
        wait(0.15);
    }
    for (targets = level.targets["Prone"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    function_4f223e0dd031befb(6);
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa7
// Size: 0xc8
function function_e41e02ec0865fb08() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[11];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (119.884, 462.425, 205.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3077
// Size: 0x158
function function_aa65e8881adabf98() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    self.var_c74e2a2f7c14d917 = 1;
    namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_tac_cover");
    foreach (target in level.targets["Field"]) {
        target function_697e01c482ca4c72();
        wait(0.15);
    }
    var_89ce5b5fb6963c30 = level.var_228fe94899ab86fa[11];
    var_89ce5b5fb6963c30 function_4dc27f9df0ba179f(var_89ce5b5fb6963c30.origin);
    /#
        orientedbox(var_89ce5b5fb6963c30.origin, (462.449, 121.103, 205.5), var_89ce5b5fb6963c30.angles, (1, 0, 0), 1, 400);
    #/
    childthread function_e15b215e4fc00932(var_89ce5b5fb6963c30);
    childthread function_4e2fe44c3cbe6b24(var_89ce5b5fb6963c30);
    self waittill("tac_cover_spawned");
    self notify("stop_trigger_check");
    self.var_c74e2a2f7c14d917 = undefined;
    var_89ce5b5fb6963c30 function_d2da945656356633();
    level.var_df54b7c8e446178f = 5;
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31d7
// Size: 0xcd
function function_578c96daacc20f48() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    foreach (target in level.targets["Field"]) {
        target childthread function_2e8e7982711d50f2();
    }
    for (targets = level.targets["Field"].size; targets > 0; targets--) {
        level waittill("target_death");
    }
    function_4f223e0dd031befb(7);
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32ac
// Size: 0xda
function function_a1eb5feb655153e7() {
    flag_clear("next_event");
    /#
        self iprintln("attackers");
    #/
    trigger = level.var_228fe94899ab86fa[21];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (131.5, 74.5, 134.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    level thread function_ae929b8901ac0db(level.var_5372f0b80988f4e5);
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x338e
// Size: 0xf8
function function_2de15530c52467a8() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[8];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (119.34, 111.5, 38.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    while (1) {
        player = trigger waittill("trigger");
        velocity = player getentityvelocity();
        if (velocity[2] < 0) {
            break;
        }
    }
    trigger function_d2da945656356633();
    level.var_df54b7c8e446178f = 6;
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x348e
// Size: 0xc8
function function_939598706be41c51() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    trigger = level.var_228fe94899ab86fa[9];
    trigger function_4dc27f9df0ba179f(trigger.origin);
    /#
        orientedbox(trigger.origin, (463.534, 173.09, 171.5), trigger.angles, (1, 0, 0), 1, 400);
    #/
    player = trigger waittill("trigger");
    trigger function_d2da945656356633();
    self playsound("mp_jup_training_objective_success");
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355e
// Size: 0x87
function function_f4ec7a2a6a9ee2c0() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    level.var_9d998250bdb9bcb9 = 0;
    level.var_35e511272af146e5 = 2.5;
    while (!isdefined(level.carepackage)) {
        waitframe();
    }
    if (!isdefined(level.carepackage.useobject)) {
        wait(2);
    } else {
        self waittill("received_earned_killstreak");
    }
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35ed
// Size: 0x15c
function function_4ce43f1cc5edb5cf() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    level.killstreak_additional_targets = [];
    foreach (target in level.targets["Killstreak"]) {
        target function_697e01c482ca4c72(1);
        target.var_ef356f8bcde74a2d = &function_22b1cabc5ee0e001;
        target childthread function_2e8e7982711d50f2();
        object = spawn("script_model", target.origin + (0, 0, 85));
        object.team = "axis";
        level.killstreak_additional_targets[level.killstreak_additional_targets.size] = object;
        wait(0.15);
    }
    childthread function_ea6a9ec867a82c1();
    targets = level.targets["Killstreak"].size;
    while (targets > 0) {
        target = level waittill("target_death");
        targets--;
        self notify("stop_killstreak_check");
        break;
    }
    /#
        self iprintln("<unknown string>");
    #/
    wait(1);
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3751
// Size: 0x43
function function_8aa67e2c556382dc() {
    flag_clear("next_event");
    /#
        self iprintln("<unknown string>");
    #/
    wait(3);
    function_7c82d04922ac1bba();
    /#
        self iprintln("<unknown string>");
    #/
    flag_set("next_event");
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x379c
// Size: 0x115
function function_7c2ee16bc35afc97() {
    setclientnamemode("auto_change");
    function_fb4b8c8dec4c8495();
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    namespace_662734e7fa8a8b94::inittankspawns();
    level thread function_4c53424afe3c0b01();
    /#
        level thread function_13f93acfa5b5c378();
    #/
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38b8
// Size: 0x40
function function_4c53424afe3c0b01() {
    level endon("match_start");
    level endon("disconnect");
    while (1) {
        level waittill("matchStartTimer_done");
        if (isdefined(level.player)) {
            function_3e4edf7034db8b19();
            level notify("match_start");
            break;
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ff
// Size: 0x5e
function function_7c82d04922ac1bba() {
    game["winner"] = level.player.team;
    thread namespace_d576b6dc7cef9c62::endgame(game["winner"], game["end_reason"]["time_limit_reached"]);
    level.player dlog_recordplayerevent("dlog_event_training_course_end", [0:"is_completed", 1:1]);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3964
// Size: 0xa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3975
// Size: 0x48
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    if (self.deaths > 0) {
        if (level.var_35d8c4fb1aeb5cb8 > 3) {
            self.var_d7b7b32fa4c77d0e = 1;
        }
        thread function_f3d8585a10979d82();
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39c4
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("<unknown string>" + var_965ef52941de8769.index + "<unknown string>" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3b47
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8f
// Size: 0x24
function dropweaponfordeath(attacker, smeansofdeath, weaponoverride, damage) {
    
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bbb
// Size: 0x5a
function ontimelimit() {
    if (!isdefined(level.var_3d06de480d9ef9c4)) {
        game["winner"] = getotherteam(level.player.team)[0];
        thread namespace_d576b6dc7cef9c62::endgame(game["winner"], game["end_reason"]["time_limit_reached"]);
        level.var_3d06de480d9ef9c4 = 1;
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1c
// Size: 0xaf
function function_7776a47aa86745dc() {
    self.parts = getentarray(self.script_linkname, "script_linkto");
    self.parts = array_remove(self.parts, self);
    foreach (part in self.parts) {
        part linkto(self);
        part.target = "null";
        part.targetname = "null";
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd2
// Size: 0x19e
function function_2e8e7982711d50f2() {
    self endon("target_death");
    self setcandamage(1);
    data = spawnstruct();
    data.damage = 0;
    while (1) {
        var_13ea67fc910045ad = normal = angles = origin = weapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        hitloc = "torso_upper";
        data.attacker = attacker;
        data.victim = self;
        data.origin = self.origin;
        data.attacker = attacker;
        data.meansofdeath = meansofdeath;
        data.weapon = weapon;
        data.hitloc = hitloc;
        data.idflags = idflags;
        var_24df708f286b0562 = int(floor(damage * function_77011f86063f18b4(data.weapon, hitloc)));
        data.damage = var_24df708f286b0562;
        function_396516aef4db32c0(data);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e77
// Size: 0x143
function function_396516aef4db32c0(var_caf1c9236bfa0831) {
    var_ef356f8bcde74a2d = self.var_ef356f8bcde74a2d;
    cantakedamage = 1;
    if (isdefined(var_ef356f8bcde74a2d)) {
        cantakedamage = self [[ var_ef356f8bcde74a2d ]](var_caf1c9236bfa0831);
    }
    if (cantakedamage) {
        self.health = self.health - var_caf1c9236bfa0831.damage;
        var_caf1c9236bfa0831.attacker function_ff44c6d5799b3f47("standard", self.health <= 0, var_caf1c9236bfa0831.hitloc == "head", 1, undefined);
        if (self.health <= 0) {
            self setcandamage(0);
            function_985e1298e8b97a33();
            /#
                level.player iprintln("<unknown string>");
            #/
            self playsound("mp_jup_training_target_success");
            level notify("target_death", self);
            self notify("target_death", self);
        }
    } else {
        if (!isdefined(self.var_dc21ee08c415125e)) {
            self.var_dc21ee08c415125e = 0;
        }
        self.var_dc21ee08c415125e++;
        if (self.var_dc21ee08c415125e >= 3) {
            /#
                level.player iprintln("<unknown string>");
            #/
            self playsound("mp_jup_training_target_fail");
            self.var_dc21ee08c415125e = 0;
        }
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc1
// Size: 0xe
function function_53580c5eeccb98ab() {
    return self.health <= 0;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd7
// Size: 0x60
function function_697e01c482ca4c72(var_214c3c4d1029d7e8) {
    self rotatepitch(90, 0.25, 0.1);
    self playsound("mp_jup_training_target_up");
    if (istrue(var_214c3c4d1029d7e8)) {
        return;
    }
    outline = outlineenableforplayer(self, level.player, "outline_nodepth_red", "level_script");
    self.targetoutline = outline;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x403e
// Size: 0x40
function function_985e1298e8b97a33() {
    self rotatepitch(-90, 0.5, 0.15);
    self playsound("mp_jup_training_target_down");
    if (isdefined(self.targetoutline)) {
        outlinedisable(self.targetoutline, self);
    }
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4085
// Size: 0x23
function function_94d7abe1e5cc3a94(var_caf1c9236bfa0831) {
    return namespace_448ccf1ca136fbbe::getdamagetype(var_caf1c9236bfa0831.meansofdeath) == "bullet";
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40b0
// Size: 0x1d
function function_dd62dbdc963c6673(var_caf1c9236bfa0831) {
    return namespace_4887422e77f3514e::function_9ca01a02f4efc7f6(var_caf1c9236bfa0831.meansofdeath);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40d5
// Size: 0x29
function function_fdb937421f2f2731(var_caf1c9236bfa0831) {
    return !var_caf1c9236bfa0831.attacker isplayerads() && function_94d7abe1e5cc3a94(var_caf1c9236bfa0831);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4106
// Size: 0x35
function function_e537f5a00f54b91e(var_caf1c9236bfa0831) {
    player = var_caf1c9236bfa0831.attacker;
    return player isplayerads() && !player function_e7b413144d6cf1cd(var_caf1c9236bfa0831);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4143
// Size: 0x42
function function_a3c9f518ed376a4a(var_caf1c9236bfa0831) {
    return function_dd62dbdc963c6673(var_caf1c9236bfa0831) && isdefined(var_caf1c9236bfa0831.weapon) && var_caf1c9236bfa0831.weapon.basename == "concussion_grenade_mp";
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x418d
// Size: 0x36
function function_e7b413144d6cf1cd(var_caf1c9236bfa0831) {
    player = var_caf1c9236bfa0831.attacker;
    return player function_c603bed3b1c8d11(player.currentprimaryweapon) == 1;
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41cb
// Size: 0x42
function function_448aa67e9fe96de6(var_caf1c9236bfa0831) {
    return isdefined(var_caf1c9236bfa0831.weapon) && var_caf1c9236bfa0831.weapon.basename == "jup_frag_grenade_mp" && function_dd62dbdc963c6673(var_caf1c9236bfa0831);
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4215
// Size: 0x22
function function_aea735653060f9b1(var_caf1c9236bfa0831) {
    return var_caf1c9236bfa0831.attacker getstance() == "prone";
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x423f
// Size: 0x37
function function_22b1cabc5ee0e001(var_caf1c9236bfa0831) {
    return isdefined(var_caf1c9236bfa0831.weapon) && var_caf1c9236bfa0831.weapon.basename == "cruise_proj_mp";
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x427e
// Size: 0x12
function function_c7926861b25a8d49() {
    /#
        flag_set("<unknown string>");
    #/
}

// Namespace training_course/namespace_4ee0bc5b4cf0be4c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4297
// Size: 0x2f
function function_13f93acfa5b5c378() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_c7926861b25a8d49);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}
