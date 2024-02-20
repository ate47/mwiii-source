// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_43971bbeefd98f05;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3ab210ea917601e7;
#using script_6617e2f2bb62b52b;
#using script_4c770a9a4ad7659c;
#using script_46c7c73b1a7e4773;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hud_message.gsc;
#using script_9880b9dc28bc25e;
#using script_4e6e58ab5d96c2b0;
#using script_4fa7e9e11630166c;
#using scripts\mp\gameobjects.gsc;
#using script_22f1701e151b9d12;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;

#namespace namespace_c2d2e8531012bf72;

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae9
// Size: 0x1ed
function function_480a44aafd55f27e() {
    level.var_caba91eecf74c36c = spawnstruct();
    level.var_caba91eecf74c36c.capturetime = getdvarint(@"hash_1e13e72eb1d0857", 120);
    level.var_caba91eecf74c36c.var_29a79d378c70e0b = getdvarint(@"hash_fc64481991b4ba4c", 800);
    level.var_caba91eecf74c36c.var_fd85adf0f7d8f37b = level.var_caba91eecf74c36c.var_29a79d378c70e0b * level.var_caba91eecf74c36c.var_29a79d378c70e0b;
    level.var_caba91eecf74c36c.var_dfe92bb3a3b6a89a = getdvarint(@"hash_a77a268ce7f2b5f5", 800);
    level.var_caba91eecf74c36c.var_5e7a8e300a12b235 = getdvarint(@"hash_dcd4a9ee37ee2172", 1);
    level.var_caba91eecf74c36c.var_ad82f4cd58962ce1 = getdvarint(@"hash_4c6bfdd85e09150a", 1);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_secret_stash", &function_626179fa845fc04d);
    function_8116ad1e179d91be();
    game["dialog"]["weaponstash_marked"] = "dx_br_dmzo_cost_ovld_tras";
    game["dialog"]["weaponstash_near"] = "dx_br_dmzo_cost_ovld_trne";
    game["dialog"]["weaponstash_enemies"] = "dx_br_dmzo_cost_ovld_trsu";
    game["dialog"]["weaponstash_unlocked"] = "dx_br_dmzo_cost_ovld_trun";
    game["dialog"]["weaponstash_other_squad"] = "dx_br_dmzo_cost_ovld_tsuo";
    function_89384091f7a2dbd("REV_OB_WEAPON_STASH", 0, &function_7794956942b5db04);
    function_89384091f7a2dbd("REV_OB_WEAPON_STASH", 1, &function_9e3d5d8870156844);
    function_89384091f7a2dbd("REV_OB_WEAPON_STASH", 2, &function_1813a3a4d9f2b830);
    function_89384091f7a2dbd("REV_OB_WEAPON_STASH", 3, &function_698f6262da0444db);
    function_89384091f7a2dbd("REV_OB_WEAPON_STASH", 5, &function_e6180bf27c299ba3);
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_d726e56dacf73235, "REV_OB_WEAPON_STASH");
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdd
// Size: 0x3da
function function_7794956942b5db04() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    var_52262832127326a7 = getstructarray(self.var_626b45032e1892da, "target");
    self.var_da2e58464627b802 = [];
    foreach (struct in var_52262832127326a7) {
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "weaponstash_safe") {
            self.var_cdde8e8fc33af4 = struct;
        }
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "weaponstash_spawn") {
            self.var_da2e58464627b802[self.var_da2e58464627b802.size] = struct;
        }
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "weaponstash_rift") {
            self.var_b56a0b41720db766 = struct;
        }
    }
    self.origin = self.var_cdde8e8fc33af4.origin;
    self.angles = self.var_cdde8e8fc33af4.angles;
    self.poi = self.var_cdde8e8fc33af4.poi;
    if (isdefined(level.var_fac39a693f085779)) {
        self.difficulty_region = [[ level.var_fac39a693f085779 ]](self.origin);
        if (self.difficulty_region == "difficulty_undefined") {
            self.difficulty_region = "difficulty_easy";
        }
    } else {
        self.difficulty_region = "difficulty_easy";
    }
    switch (self.difficulty_region) {
    case #"hash_651f76c0ad6741ec":
        self.var_6314e68d57b3349b = "ob_jup_items_contract_weaponstash_red";
        self.numitems = 4;
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_6314e68d57b3349b = "ob_jup_items_contract_weaponstash_orange";
        self.numitems = 4;
        break;
    case #"hash_af83e47edfa8900a":
        self.var_6314e68d57b3349b = "ob_jup_items_contract_weaponstash_yellow";
        self.numitems = 4;
        break;
    case #"hash_7bb2cd766703d463":
    default:
        self.var_6314e68d57b3349b = "ob_jup_items_contract_weaponstash_green";
        self.numitems = 4;
        break;
    }
    safe = spawnscriptable("dmz_secret_stash", self.var_cdde8e8fc33af4.origin, self.var_cdde8e8fc33af4.angles);
    safe.struct = self.var_cdde8e8fc33af4;
    safe.activity = self;
    safe.var_6314e68d57b3349b = self.var_6314e68d57b3349b;
    safe.numitems = self.numitems;
    self.safe = safe;
    safe.poi = self.poi;
    safe.var_55bb3585d29af1be = &function_2ed4dc6531007de3;
    foreach (player in level.players) {
        self.safe disablescriptableplayeruse(player);
    }
    self.capturetime = level.var_caba91eecf74c36c.capturetime;
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10be
// Size: 0xd2
function function_b479115b8fc652d0() {
    safe = self.safe;
    safe setscriptablepartstate("dmz_secret_stash", "usable");
    safe.capturetime = level.var_caba91eecf74c36c.capturetime;
    safe.trigger = spawn("trigger_radius", safe.origin, 0, int(level.var_caba91eecf74c36c.var_29a79d378c70e0b), int(level.var_caba91eecf74c36c.var_dfe92bb3a3b6a89a));
    safe.trigger trigger_off();
    safe thread function_ad0115b28e7b12e(safe.trigger, level.var_caba91eecf74c36c.var_29a79d378c70e0b);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1197
// Size: 0x1e0
function function_9e3d5d8870156844() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    callback::callback("weapon_stash_started");
    function_b479115b8fc652d0();
    function_3075c891e48a5474(self.var_6c29f2fdb0054bbe[0], 1);
    thread function_f8594b26184f2bd1();
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player.var_65513ad5397a67ef = self.var_65513ad5397a67ef;
        self.safe enablescriptableplayeruse(player);
    }
    self.var_d781ff762095c86d = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16635, "quest_s0a2t2_safecrack_start", self.var_6c29f2fdb0054bbe);
    if (!self.var_d781ff762095c86d) {
        thread function_1281c7fff9456e18("contract_weaponstash_accept_conv");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("weapon_stash_started");
    }
    if (issharedfuncdefined("ob_quest_missions", "OnWeaponStashActive")) {
        [[ getsharedfunc("ob_quest_missions", "OnWeaponStashActive") ]](self, player);
    }
    self.safe waittill("safe_unlocked");
    callback::callback("safe_opened");
    waitframe();
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player callback::callback("weapon_stash_completed");
    }
    function_612d18fdbc979c0b(self, 1);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137e
// Size: 0xc9
function function_1813a3a4d9f2b830(activity_succeeded) {
    self endon("instance_destroyed");
    thread function_a26e39e03a0d6739();
    foreach (player in level.players) {
        self.safe enablescriptableplayeruse(player);
    }
    if (!self.var_d781ff762095c86d) {
        if (isdefined(self.var_6c29f2fdb0054bbe[0])) {
            self.var_d781ff762095c86d = function_5acc35fc66331385(self.var_6c29f2fdb0054bbe[0], 16140);
        }
        if (!self.var_d781ff762095c86d) {
            thread function_1281c7fff9456e18("contract_weaponstash_success_conv");
        }
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144e
// Size: 0x2e
function function_698f6262da0444db() {
    self endon("instance_destroyed");
    thread function_a26e39e03a0d6739();
    if (isdefined(self.safe)) {
        self.safe freescriptable();
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x137
function function_e6180bf27c299ba3() {
    self endon("instance_destroyed");
    if (isdefined(self.var_b56a0b41720db766)) {
        return self.var_b56a0b41720db766;
    }
    var_443540b4f24329c2 = 0;
    counter = 0;
    while (!istrue(var_443540b4f24329c2) && counter < 10) {
        var_f787a3ea40325b16 = randomintrange(110, 200);
        side_offset = randomintrange(-50, 50);
        var_2ff93cc2154a5ba3 = self.safe.origin + anglestoforward(self.safe.angles) * var_f787a3ea40325b16 + anglestoright(self.safe.angles) * side_offset;
        var_eb4396dfb44e2e16 = getclosestpointonnavmesh(var_2ff93cc2154a5ba3);
        var_443540b4f24329c2 = namespace_2a184fc4902783dc::ray_trace_passed(self.safe.origin, var_eb4396dfb44e2e16);
        counter = counter + 1;
    }
    struct = spawnstruct();
    struct.origin = var_eb4396dfb44e2e16;
    struct.angles = self.safe.angles;
    return struct;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c2
// Size: 0xec
function function_d726e56dacf73235(params) {
    if (self.var_6c29f2fdb0054bbe.size == 0) {
        self notify("abandoned");
        waitframe();
        var_110aca939d912394 = self.safe getscriptablepartstate("dmz_secret_stash", 1);
        var_a6d9c6229de1c72e = [0:"opening", 1:"drill_enter", 2:"drill_loop"];
        if (array_contains(var_a6d9c6229de1c72e, var_110aca939d912394)) {
            self.safe setscriptablepartstate("dmz_secret_stash", "unusable");
        }
        wait(0.2);
        foreach (player in params.playerlist) {
            function_4a508fcbbea05afd(player);
        }
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b5
// Size: 0x26
function private function_4a508fcbbea05afd(player) {
    if (function_5acc35fc66331385(player, 16635)) {
        player ent_flag_clear("quest_s0a2t2_safecrack_start");
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e2
// Size: 0xab
function function_f8594b26184f2bd1() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    wait(3);
    while (1) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            dist = distance2dsquared(player.origin, self.safe.origin);
            if (dist < 9000000) {
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1794
// Size: 0x1af
function function_626179fa845fc04d(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/DENY_USE_CARRY");
        return;
    }
    if (state == "usable") {
        thread function_a2e344606314374b(instance, part, state, player);
    } else if (state == "closed_usable" || state == "opening" || state == "partially_open_usable") {
        if ((state == "closed_usable" || state == "closed_usable_no_collision") && !isdefined(instance.entity)) {
            if (instance getscriptableparthasstate(part, "fully_opening_unusable")) {
                instance setscriptablepartstate(part, "fully_opening_unusable");
            }
            params = spawnstruct();
            params.var_beeb487603b69a3e = instance;
            player callback::callback("lootcache_looted", params);
            if (isdefined(instance.var_534e0cf170a981b7)) {
                [[ instance.var_534e0cf170a981b7 ]](instance, player);
            }
            if (!isdefined(instance.contents)) {
                instance.var_46a3a8565ac0c17c = 4;
                instance.var_6a4915c949e9e77e = 1;
                namespace_9b83895815d12835::function_d71a41afca697376(instance, instance.var_6314e68d57b3349b, instance.numitems);
            }
        } else if (isdefined(instance.contents) && state == "partially_open_usable") {
            if (instance getscriptableparthasstate(part, "fully_opening_unusable")) {
                instance setscriptablepartstate(part, "fully_opening_unusable");
            }
        }
        namespace_3883e3399f2870b5::function_30f5ea60517f9e06(instance, player);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194a
// Size: 0x14
function function_2ed4dc6531007de3(instance, player) {
    
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1965
// Size: 0x19d
function function_a2e344606314374b(safe, part, state, player) {
    safe setscriptablepartstate(part, "unusable");
    safe.var_b14a331ba425c286 = 0;
    safe thread function_29d903a8de1ffd34(player);
    safe function_f05bfb2a652d7625(player);
    if (!istrue(safe.var_b14a331ba425c286)) {
        wait(3);
    }
    if (istrue(safe.var_b14a331ba425c286)) {
        safe.teams = [0:player.team];
        safe.trigger trigger_on();
        function_bbdcd857d0c2a65e(safe.activity, player, "PlayerJoinedInteract");
        if (level.var_caba91eecf74c36c.var_ad82f4cd58962ce1) {
            safe.zombie_attractor = namespace_5381a59d140f4df8::function_c7a50ec2829c70b3(safe.struct, 1, 750, 0, undefined, &function_3bef41fcdc0a4427, 0);
            safe.var_9562506b1c88abc2 = namespace_5381a59d140f4df8::function_c7a50ec2829c70b3(safe.struct, 1, 750, 0, undefined, &function_3bef41fcdc0a4427, 1);
        }
        safe notify("safe_unlocking");
        safe.var_208c5333afcd7102 = 1;
        safe.activity thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
        safe.activity namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_WEAPON_STASH_DEFEND_PHASE");
        safe.activity thread function_430be47b55b52576(player.team);
        safe thread function_a0ee2bb161327c83();
    } else {
        safe setscriptablepartstate(part, "usable");
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b09
// Size: 0x2e9
function function_a0ee2bb161327c83() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.activity endon("abandoned");
    self.progress = 0;
    var_a81135442ee1a731 = 0;
    var_306804c6c85c36b0 = undefined;
    var_94947ef251bf06d8 = 0;
    self.var_f7d8df490bd332c3 = 512;
    var_90fb369a18926018 = [];
    self.var_8808a5f5c406a534 = 0;
    self.var_1ffb466273023a62 = 0;
    self.var_4864afbc9d83ea7d = 1;
    self.activity namespace_262d6474998a2356::function_f0361294db9d74a7(0, 1);
    self.activity namespace_262d6474998a2356::function_c661dba3e304266b(0);
    if (!istrue(getdvarint(@"hash_408f0c3af174e92d", 0))) {
        thread function_f72294f967de9d73();
    }
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            var_626a5cebca990863 = 0;
            if (!isdefined(var_306804c6c85c36b0)) {
                var_306804c6c85c36b0 = [0:0, 1:self.capturetime / 4, 2:self.capturetime / 2, 3:self.capturetime / 100 * 75];
            }
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(self.capturetime, self.progress + level.framedurationseconds * self.var_4864afbc9d83ea7d);
            } else {
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
                var_626a5cebca990863 = 1;
            }
            progress = int(100 * self.progress / self.capturetime);
            self.activity namespace_262d6474998a2356::function_f0361294db9d74a7(progress);
            self.activity namespace_262d6474998a2356::function_c661dba3e304266b(progress);
            if (self.progress >= self.capturetime) {
                if (var_626a5cebca990863 == 0) {
                    foreach (team in self.teams) {
                        foreach (player in getteamdata(team, "players")) {
                            player callback::callback("ob_weaponstash_drill_notPaused");
                        }
                    }
                }
                thread function_392e3b295e1175de();
            }
        }
        waitframe();
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1df9
// Size: 0x24f
function private function_f72294f967de9d73() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.activity endon("abandoned");
    self.activity endon("activity_ended");
    self.activity endon("instance_destroyed");
    var_9f62bb4e06fd3af4 = 0.08 * self.capturetime;
    var_7701afd44ab83628 = 24000;
    var_76f6e45eb846b44e = 0.055 * self.capturetime;
    var_d62c726509b30367 = 0.03 * self.capturetime;
    var_e417eb1a61ac3d4c = -1;
    var_a3e324804f7ab247 = -1;
    var_658b424303eaf747 = -1;
    while (1) {
        if (self.progress > self.var_8808a5f5c406a534) {
            self.var_8808a5f5c406a534 = self.progress;
            self.var_4864afbc9d83ea7d = 1;
        } else {
            self.var_4864afbc9d83ea7d = 1.5;
        }
        if (istrue(self.var_1ffb466273023a62)) {
            function_4b7d420e1bad897f(self.activity.var_d2347688fc2e2c69, 0);
            var_711a1c048ff07480 = ter_op(var_658b424303eaf747 / self.capturetime < 0.8, var_658b424303eaf747 + var_76f6e45eb846b44e, var_658b424303eaf747 + var_d62c726509b30367);
            if (self.progress >= var_711a1c048ff07480) {
                self.var_1ffb466273023a62 = 0;
                var_e417eb1a61ac3d4c = -1;
                var_a3e324804f7ab247 = -1;
                var_658b424303eaf747 = -1;
                self.activity notify("safe_progress_unstalled");
                function_4b7d420e1bad897f(self.activity.var_d2347688fc2e2c69, 5);
            }
        } else {
            if (var_e417eb1a61ac3d4c < 0) {
                var_e417eb1a61ac3d4c = gettime();
                var_a3e324804f7ab247 = self.var_8808a5f5c406a534;
            }
            if (self.progress < self.var_8808a5f5c406a534 - var_9f62bb4e06fd3af4) {
                self.var_1ffb466273023a62 = 1;
                var_658b424303eaf747 = self.var_8808a5f5c406a534;
            } else if (self.progress > var_a3e324804f7ab247 - var_9f62bb4e06fd3af4 && self.progress < var_a3e324804f7ab247 + var_9f62bb4e06fd3af4) {
                if (gettime() > var_e417eb1a61ac3d4c + var_7701afd44ab83628) {
                    self.var_1ffb466273023a62 = 1;
                    var_658b424303eaf747 = self.var_8808a5f5c406a534;
                }
            } else {
                var_e417eb1a61ac3d4c = -1;
                var_a3e324804f7ab247 = -1;
            }
        }
        wait(1);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x204f
// Size: 0x39
function private function_f96e7c37c158cb9c(location, teamname) {
    wait(randomintrange(2, 4));
    playsoundatpos(location, "mp_dmz_alrm_trap");
    wait(3);
    function_1281c7fff9456e18("weaponstash_wave1_zomb");
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x208f
// Size: 0xd6
function function_c1db0d79087b2228(nearbyplayers, var_90fb369a18926018, progress) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216d
// Size: 0x135
function function_392e3b295e1175de() {
    if (!istrue(self.unlocked)) {
        self.unlocked = 1;
    }
    foreach (team in self.teams) {
        foreach (player in getteamdata(team, "players")) {
            if (!isdefined(player.var_6b41d67653e80c4b)) {
                player.var_6b41d67653e80c4b = 0;
            }
            player.var_6b41d67653e80c4b++;
        }
    }
    self setscriptablepartstate("dmz_secret_stash", "opening");
    if (level.var_caba91eecf74c36c.var_ad82f4cd58962ce1) {
        namespace_5381a59d140f4df8::function_349b67890a05c376(self.zombie_attractor);
    }
    self.trigger delete();
    namespace_19b4203b51d56488::releaseid();
    self notify("safe_unlocked");
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a9
// Size: 0xe7
function function_ad0115b28e7b12e(trigger, radius) {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.nearbyplayers = [];
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player) || !array_contains(self.activity.var_6c29f2fdb0054bbe, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        thread function_1cc5ba0bf9073e7f(trigger, player, radius);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2397
// Size: 0x82
function function_1cc5ba0bf9073e7f(trigger, player, radius) {
    while (isdefined(player) && isalive(player) && isdefined(self.trigger) && distance(trigger.origin, player.origin) < radius * 1.2) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2420
// Size: 0x7d
function private function_dad91f5cfff957c4(var_ba59654337afec73) {
    locations = [];
    foreach (node in var_ba59654337afec73.var_bd59a95fc824e0f9) {
        if (!istrue(node.var_3d9512b73bdc1514)) {
            locations[locations.size] = node;
        }
    }
    return locations;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x24a5
// Size: 0x7a
function private function_b864f99a920e0846(nodes) {
    wait(45);
    for (i = 0; i < 2; i++) {
        foreach (node in nodes) {
            thread function_65095d5eda84ccd1(node);
            waitframe();
        }
        wait(30);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2526
// Size: 0x5c
function private function_65095d5eda84ccd1(node) {
    wait(randomfloatrange(0, 2));
    magicgrenademanual("smoke_grenade_mp", node.var_f87ce576cbf4518a, (0, 0, -10), 0.5);
    thread play_sound_in_space("smoke_grenade_expl_trans", node.var_f87ce576cbf4518a);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2589
// Size: 0x58
function private function_b9e25692448324a0(doors) {
    foreach (door in doors) {
        door function_80902296b05be00a();
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25e8
// Size: 0x22b
function private function_430be47b55b52576(teamname) {
    self.var_69b705b3551a18c0 = getteamdata(teamname, "players").size;
    self.safe.trigger trigger_on();
    if (!istrue(self.safe.var_9aef22e3cd04e1dd)) {
        self.agents = [];
        self.var_138a16b93547993 = 0;
        function_24b55c1a13b9a63a("ai_flood_fill_encounter:enc_ob_weapon_stash_floodfill_zombie");
        thread function_f508002ab4826c4c(2, 0, "wave_med", 0, undefined);
        thread function_f508002ab4826c4c(22, 3, "wave_small", 0, undefined);
        thread function_f508002ab4826c4c(26, 0, "wave_large", 1, undefined);
        thread function_f508002ab4826c4c(45, 3, "wave_large", 0, undefined);
        thread function_f508002ab4826c4c(68, 2, "wave_small", 0, undefined);
        thread function_f508002ab4826c4c(71, 0, "wave_small", 1, undefined);
        thread function_f508002ab4826c4c(95, 2, "wave_large", 0, undefined);
        thread function_f508002ab4826c4c(97, 0, "wave_small", 1, undefined);
        thread function_f508002ab4826c4c(107, 0, "wave_small", 1, undefined);
        thread function_f508002ab4826c4c(124, 2, "wave_med", 0, undefined);
        thread function_f508002ab4826c4c(127, 0, "wave_small", 1, undefined);
        thread function_f508002ab4826c4c(150, 6, "wave_small", 0, undefined);
        thread function_f508002ab4826c4c(153, 0, "wave_large", 1, undefined);
        thread function_f508002ab4826c4c(175, 4, "wave_large", 0, undefined);
        thread function_f508002ab4826c4c(198, 6, "wave_med", 0, undefined);
        thread function_f508002ab4826c4c(205, 0, "wave_small", 1, undefined);
    }
    foreach (player in level.players) {
        if (isdefined(player)) {
            self.safe enablescriptableplayeruse(player);
        }
    }
    self.var_b0b10c60924b7f5f = 1;
    thread function_f96e7c37c158cb9c(self.safe.origin, teamname);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281a
// Size: 0x26
function function_9ede655e5f354b82(var_4d3a0f20a612d8a) {
    if (randomfloat(1) < var_4d3a0f20a612d8a) {
        return "ai_encounter:enc_ob_weapon_stash_reinforce_merc";
    }
    return "ai_encounter:enc_ob_weapon_stash_reinforce_zombie";
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2848
// Size: 0x21b
function function_f508002ab4826c4c(wait_sec, var_467e71e37a4d1e60, var_6300d91870cc53fc, var_732e6b28366b3d99, var_25640ba9fbd074be) {
    self endon("abandoned");
    self endon("activity_ended");
    self endon("instance_destroyed");
    for (sec = 0; sec < wait_sec; sec++) {
        if (istrue(self.safe.var_1ffb466273023a62)) {
            self waittill("safe_progress_unstalled");
        }
        wait(1);
    }
    wait(wait_sec);
    counter = 0;
    while (self.agents.size > 4 && counter < var_467e71e37a4d1e60) {
        counter = counter + 1;
        wait(1);
    }
    bundle = function_9ede655e5f354b82(0);
    self.encounterid = function_f8ccadcd850da124(bundle, self.safe.origin, 7000, 1, 0, 1, 2);
    if (!istrue(self.var_138a16b93547993) && isdefined(self.progress) && self.progress > 90) {
        function_1281c7fff9456e18("weaponstash_wavelast_zomb");
        self.var_138a16b93547993 = 1;
    }
    if (isdefined(self.encounterid)) {
        if (istrue(var_732e6b28366b3d99)) {
            function_d37068aac7785c04(self.encounterid, "wave_hellhound", 1);
            function_d37068aac7785c04(self.encounterid, var_6300d91870cc53fc + "_hellhound", 1);
        } else {
            function_d37068aac7785c04(self.encounterid, self.difficulty_region, 1);
            function_d37068aac7785c04(self.encounterid, var_6300d91870cc53fc, 1);
        }
        spawn_area = function_7a2aaa4a09a4d250(self.var_da2e58464627b802);
        var_139b059f5ddea817 = ter_op(isdefined(spawn_area.radius), spawn_area.radius, 200);
        function_df930eed75d4f74f(self.encounterid, spawn_area.origin, var_139b059f5ddea817);
        function_ce9c21523336cdbc(self.encounterid, &function_d73576cca74f82d, self);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6a
// Size: 0xa9
function function_24b55c1a13b9a63a(bundle) {
    var_46ec08045bb6e6e9 = 1000;
    self.var_d2347688fc2e2c69 = function_f8ccadcd850da124(bundle, self.var_cdde8e8fc33af4.origin, var_46ec08045bb6e6e9, 1, 0, 1, 2);
    if (isdefined(self.var_d2347688fc2e2c69)) {
        function_d37068aac7785c04(self.var_d2347688fc2e2c69, self.difficulty_region, 1);
        function_ce9c21523336cdbc(self.var_d2347688fc2e2c69, &function_a097afc443e2bf76, self);
        namespace_614554f86e52695c::function_73147cdf5c28d10c(self.var_d2347688fc2e2c69, &function_c6d1ce0bfc8bb2c4, self);
        function_4b7d420e1bad897f(self.var_d2347688fc2e2c69, 5);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b1a
// Size: 0x67
function function_c6d1ce0bfc8bb2c4(requestid, userdata) {
    if (!isdefined(userdata)) {
        return 1;
    }
    if (!isarray(userdata.var_e9c1fd52868a6722)) {
        return 1;
    }
    if (!isdefined(userdata.var_e9c1fd52868a6722["ambient"].var_be8ebaf932e93656)) {
        return 1;
    }
    if (istrue(userdata.contract_complete)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b89
// Size: 0xc2
function function_d73576cca74f82d(requestid, userdata, agent, data) {
    agent endon("death");
    safe = userdata.safe;
    var_e6013eac45290cab = userdata;
    agent ent_flag_init("activity_safe_attracted");
    if (isalive(agent)) {
        var_e6013eac45290cab.agents[var_e6013eac45290cab.agents.size] = agent;
        agent namespace_5381a59d140f4df8::function_c0d3ba0eab1acba0(safe.struct, 1, 750, 0, undefined, &function_3bef41fcdc0a4427, 0);
        agent function_65cdab0fc78aba8f(safe.origin, level.var_caba91eecf74c36c.var_29a79d378c70e0b);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c52
// Size: 0xa8
function function_a097afc443e2bf76(requestid, userdata, agent, data) {
    agent endon("death");
    safe = userdata.safe;
    var_e6013eac45290cab = userdata;
    agent ent_flag_init("activity_safe_attracted");
    if (isalive(agent)) {
        agent namespace_5381a59d140f4df8::function_c0d3ba0eab1acba0(safe.struct, 1, 750, 0, undefined, &function_3bef41fcdc0a4427, 0);
        agent function_65cdab0fc78aba8f(safe.origin, level.var_caba91eecf74c36c.var_29a79d378c70e0b);
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d01
// Size: 0x5c
function function_5e0e53fdf854778e(requestid, userdata, var_dcff5961635938a9) {
    safe = userdata[0];
    if (!istrue(safe.var_d062a6468e65034e) && istrue(safe.ShouldReinforce)) {
        safe.var_d062a6468e65034e = 1;
        return 1;
    }
    return 0;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d65
// Size: 0xc4
function function_3bef41fcdc0a4427(attractor, zombie) {
    if (isdefined(zombie.enemy)) {
        return 0;
    }
    player = getclosest(zombie.origin, level.players, 200);
    if (isdefined(player) && distance2dsquared(zombie.origin, player.origin) < distance2dsquared(zombie.origin, attractor.source.origin)) {
        return 0;
    }
    if (is_equal(zombie.aicategory, "normal")) {
        return (zombie.team == "team_two_hundred");
    }
    return 0;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e31
// Size: 0x6e
function function_8116ad1e179d91be() {
    level.scr_animtree["gun_safe_drill_player"] = %script_model;
    level.scr_anim["gun_safe_drill_player"]["gun_safe_enter"] = script_model%iw9_dmz_stashdrill_enter_stand_sdr;
    level.scr_eventanim["gun_safe_drill_player"]["gun_safe_enter"] = %"gun_safe_enter";
    level.scr_viewmodelanim["gun_safe_drill_player"]["gun_safe_enter"] = "iw9_dmz_stashdrill_enter_stand_sdr";
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ea6
// Size: 0x383
function function_f05bfb2a652d7625(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    logstring("OB RWS -- Player in drilling anim: " + player.name);
    logstring("OB RWS -- Drilling anim started");
    player function_b2451d0fac313fbe(0);
    var_a66fd1b124c32f51 = player getplayerangles();
    player.linktoent = player spawn_tag_origin(player.origin, player.var_a66fd1b124c32f51);
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
    logstring("OB RWS -- Linked to ent");
    goalpos = self.origin + rotatevector((50.586, -6.262, 0), self.angles);
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
    var_57c87883ae437750 = 0.5;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    player setstance("stand");
    logstring("OB RWS -- Player stance and moveto set");
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait(waittime);
    logstring("OB RWS -- Player givegunless wait over");
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    logstring("OB RWS -- Pre-infil_player_rig_updated");
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("gun_safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    logstring("OB RWS -- Post-infil_player_rig_updated");
    animstruct = spawnstruct();
    animstruct.origin = self.origin;
    animstruct.angles = self.angles + (0, 90, 0);
    self setscriptablepartstate("dmz_secret_stash", "drill_enter");
    logstring("OB RWS -- Pre-anim_player_solo");
    animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "gun_safe_enter");
    logstring("OB RWS -- Post-anim_player_solo");
    if (isdefined(player) && isreallyalive(player)) {
        player notify("interact_finished");
        logstring("OB RWS -- Interact finished notified");
    }
    logstring("OB RWS -- Post-interact finished");
    waitframe();
    if (isdefined(player)) {
        player notify("remove_rig");
        logstring("OB RWS -- Remove rig notified");
        if (isreallyalive(player)) {
            player function_b2451d0fac313fbe(1);
            logstring("OB RWS -- Player movement reenabled");
        }
    }
    self.var_b14a331ba425c286 = 1;
    logstring("OB RWS -- Successful use set to true");
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3230
// Size: 0x87
function function_b7ba1061f0c2d5fa(safe) {
    waittill_any_timeout_2(4, "interact_finished", "remove_rig");
    logstring("OB RWS -- Timeout reached");
    self stopanimscriptsceneevent();
    self stopviewmodelanim();
    if (isdefined(self.linktoent)) {
        self unlink();
        self.linktoent delete();
        self.linktoent = undefined;
    }
    self notify("remove_rig");
    function_b2451d0fac313fbe(1);
    safe.var_b14a331ba425c286 = 1;
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32be
// Size: 0x129
function function_b2451d0fac313fbe(isallowed) {
    if (!isallowed) {
        val::set("drilling", "allow_jump", 0);
        val::set("drilling", "gesture", 0);
        val::set("drilling", "melee", 0);
        val::set("drilling", "mantle", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "allow_movement", 0);
        val::set("drilling", "sprint", 0);
        val::set("drilling", "fire", 0);
        val::set("drilling", "reload", 0);
        val::set("drilling", "weapon_pickup", 0);
        val::set("drilling", "weapon_switch", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "execution_victim", 0);
        val::set("drilling", "vehicle_use", 0);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00("drilling");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ee
// Size: 0x7d
function function_29d903a8de1ffd34(player) {
    player endon("interact_finished");
    player namespace_3c37cb17ade254d::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    player notify("interact_interrupt");
    player stopanimscriptsceneevent();
    if (isdefined(player.linktoent)) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    player notify("remove_rig");
    player function_b2451d0fac313fbe(1);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3472
// Size: 0xdb
function function_1931531a97158d1f() {
    self.var_6b9eefeff825604b = function_36a95c9de2ace25a("ob_weapon_stash_marker", 0, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_6b9eefeff825604b, self.safe.origin + (0, 0, 85));
    waitframe();
    self.var_2a2f4483763847a0 = "current";
    function_6f02ac608d44fdbf(self.var_6b9eefeff825604b, 0);
    self.var_7039add3ed488111 = self.var_6c29f2fdb0054bbe[0];
    self.var_40112e1aa5936dd2 = self.var_7039add3ed488111 namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.safe.origin + (0, 0, 85), self.var_6b9eefeff825604b);
    self waittill("activity_ended");
    function_765b706dc170e214(self.var_6b9eefeff825604b);
}

// Namespace namespace_c2d2e8531012bf72/namespace_8cc61b17b84105a5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3554
// Size: 0x6e
function function_3075c891e48a5474(var_27e49251bb3376ea, var_8064f574a628c5ee) {
    waitframe();
    thread function_1931531a97158d1f();
    if (isdefined(var_27e49251bb3376ea) && istrue(var_8064f574a628c5ee)) {
        waitframe();
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.var_6b9eefeff825604b, 0);
        var_27e49251bb3376ea namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.safe.origin + (0, 0, 85), self.var_6b9eefeff825604b);
    }
}
