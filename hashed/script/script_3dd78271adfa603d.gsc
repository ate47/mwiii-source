// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_22f1701e151b9d12;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2583ee5680cf4736;
#using script_7edf952f8921aa6b;
#using script_6df6604a74a7a9c7;
#using script_220d0eb95a8fab7d;
#using script_3ab210ea917601e7;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using script_638d701d263ee1ed;
#using script_185660037b9236c1;
#using scripts\common\create_script_utility.gsc;
#using script_5753ba9c28794a65;
#using script_4fdefae8b7bcdf73;
#using scripts\engine\scriptable.gsc;
#using script_5d8202968463a21d;
#using script_29b50ff5f1477a5d;
#using scripts\mp\mp_agent_damage.gsc;
#using script_5762ac2f22202ba2;
#using script_2590b7a7de3dfc79;
#using script_7b2517368c79e5bc;
#using script_60dd6e3992c1f29;
#using script_2d400da2610fe542;
#using script_d60e0219a7419e0;
#using script_427ce33ec0c820cf;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;
#using script_43971bbeefd98f05;
#using script_3b64eb40368c1450;
#using script_46c7c73b1a7e4773;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_58be75c518bf0d40;
#using script_4e6e58ab5d96c2b0;
#using script_3e2f8cc477d57433;

#namespace namespace_c63df5a8b7194592;

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0xbd
function function_1cf627178cf6bee() {
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_ZOMBIE_STRONGHOLD", 0, &function_fb6bc8f3ed4781d4);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_ZOMBIE_STRONGHOLD", 1, &function_fbc94dc837737154);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_ZOMBIE_STRONGHOLD", 2, &function_2a6a959fd054e401);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_ZOMBIE_STRONGHOLD", 3, &function_89bdb2d03896122b);
    namespace_4faa6169000e657c::function_89384091f7a2dbd("REV_OB_ZOMBIE_STRONGHOLD", 5, &function_7b8f4f5e1fbe30d5);
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerJoin", &function_c1cb9b8f30cff8c6, "REV_OB_ZOMBIE_STRONGHOLD");
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("PlayerLeave", &function_7208e454d9a1452e, "REV_OB_ZOMBIE_STRONGHOLD");
    callback::add("player_item_pickup", &function_8af75525d37866eb);
    if (!isdefined(level.var_96a2d0c3a5256c2)) {
        namespace_b2b546ada8578eda::function_96a2d0c3a5256c2();
        level.var_96a2d0c3a5256c2 = 1;
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4b
// Size: 0x42a
function function_fb6bc8f3ed4781d4() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_45c17c8bd7095cc4 = namespace_3485b020a23acaae::function_4188e118731a30f4();
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    level._effect["smoke_effect_1"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_area_500.vfx");
    level._effect["smoke_effect_4"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_vent_release.vfx");
    level._effect["camera_vfx"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_area_camera.vfx");
    self.s_center = utility::getstruct(self.var_626b45032e1892da + "_main", "targetname");
    if (!isdefined(self.s_center)) {
        function_4bc22996edea81f1(self);
    }
    self.difficulty_region = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(self.s_center.origin);
    switch (self.difficulty_region) {
    case #"hash_651f76c0ad6741ec":
        self.var_67d58bcaf37c2e2b = 7000;
        self.var_c305d8b37977e9c9 = 12;
        self.var_b775d3fc5973f7ac = 20;
        self.var_c61203960d56682a = 3;
        self.var_cd1f6a0cc4b9d2b6 = 1;
        self.var_d76a378fe188ada0 = 4;
        self.var_91d007152e252433 = 0;
        self.var_34f38a376bb1343f = 0;
        self.spawn_list = "ob_jup_items_activity_aethernest_red";
        self.var_de4d87caa90a9970 = 15;
        self.var_a4aeecf5b922b358 = 3;
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_67d58bcaf37c2e2b = 5125;
        self.var_c305d8b37977e9c9 = 10;
        self.var_b775d3fc5973f7ac = 18;
        self.var_c61203960d56682a = 2;
        self.var_cd1f6a0cc4b9d2b6 = 2;
        self.var_d76a378fe188ada0 = 3;
        self.var_91d007152e252433 = 0;
        self.var_34f38a376bb1343f = 0;
        self.spawn_list = "ob_jup_items_activity_aethernest_orange";
        self.var_de4d87caa90a9970 = 10;
        self.var_a4aeecf5b922b358 = 3;
        break;
    case #"hash_af83e47edfa8900a":
        self.var_67d58bcaf37c2e2b = 3300;
        self.var_c305d8b37977e9c9 = 8;
        self.var_b775d3fc5973f7ac = 15;
        self.var_c61203960d56682a = 2;
        self.var_cd1f6a0cc4b9d2b6 = 2;
        self.var_d76a378fe188ada0 = 2;
        self.var_91d007152e252433 = 0;
        self.var_34f38a376bb1343f = 1;
        self.spawn_list = "ob_jup_items_activity_aethernest_yellow";
        self.var_de4d87caa90a9970 = 10;
        self.var_a4aeecf5b922b358 = 2;
        break;
    case #"hash_7bb2cd766703d463":
    default:
        self.var_67d58bcaf37c2e2b = 2000;
        self.var_c305d8b37977e9c9 = 6;
        self.var_b775d3fc5973f7ac = 12;
        self.var_c61203960d56682a = 1;
        self.var_cd1f6a0cc4b9d2b6 = 2;
        self.var_d76a378fe188ada0 = 1;
        self.var_91d007152e252433 = 1;
        self.var_34f38a376bb1343f = 1;
        self.spawn_list = "ob_jup_items_activity_aethernest_green";
        self.var_de4d87caa90a9970 = 10;
        self.var_a4aeecf5b922b358 = 1;
        break;
    }
    self.var_f683875f2e47f6bc = [];
    self.var_ec031f5af338bc24 = self.var_67d58bcaf37c2e2b;
    self.var_376a304c3c7fe3d9 = self.var_67d58bcaf37c2e2b * 0.666667;
    self.var_407c4d80771903bd = self.var_67d58bcaf37c2e2b * 0.333333;
    self.started = 0;
    self.var_e171f154ea4ec2c8 = 0;
    self.s_center.var_e6013eac45290cab = self;
    function_b3c1392935e10040();
    function_c350f33277c1de1();
    function_eda4e16141cc6490();
    function_afe71f4277675131();
    function_d0d0c2cf7d4c1fc9();
    function_cf65031f2b7139e3();
    namespace_4c2b495b8d79cc2e::function_2dac62aa2032b9b1("SpatialZoneContainerGroup_ActivityInstance_AwarenessZone", &function_c9b0c1c4babe3cb);
    function_425a1df4fd86e188();
    self.var_8d98fb8210ccc891 = 1;
    if (isdefined(self.s_center.script_noteworthy)) {
        self.var_8d98fb8210ccc891 = int(self.s_center.script_noteworthy);
    }
    namespace_4fda5d7358015a06::function_b6fc2c96b463c007(self);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107c
// Size: 0x175
function function_425a1df4fd86e188() {
    var_5c2a54b6e701a80b = function_f159c10d5cf8f0b4("aethernest_interior_trigger", "targetname");
    self.var_83116f41aad4fc96 = var_5c2a54b6e701a80b;
    self.var_1258379e7ea78440 = [];
    foreach (var_9c301ce50ade5aba in var_5c2a54b6e701a80b) {
        if (is_equal(var_9c301ce50ade5aba.target, self.var_626b45032e1892da) || is_equal(var_9c301ce50ade5aba.target, self.var_626b45032e1892da + "_main")) {
            var_9c301ce50ade5aba thread function_ddab80cebff23794(self);
        }
    }
    var_5c2a54b6e701a80b = function_f159c10d5cf8f0b4("zmstronghold_treasure_room_trigger", "targetname");
    self.var_17186c6d528a44d1 = undefined;
    foreach (var_9c301ce50ade5aba in var_5c2a54b6e701a80b) {
        if (is_equal(var_9c301ce50ade5aba.target, self.var_626b45032e1892da) || is_equal(var_9c301ce50ade5aba.target, self.var_626b45032e1892da + "_main")) {
            self.var_17186c6d528a44d1 = var_9c301ce50ade5aba;
            var_9c301ce50ade5aba thread function_d70b7e579a26e875(self);
        }
    }
    thread namespace_b2b546ada8578eda::function_82440f5119dba754();
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f8
// Size: 0x36a
function function_ddab80cebff23794(instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    instance endon("aethergas_cleared");
    while (1) {
        ent = self waittill("trigger");
        is_player = isplayer(ent);
        is_vehicle = ent namespace_dbbb37eb352edf96::isvehicle();
        if (!is_player && !is_vehicle) {
            continue;
        }
        if (is_vehicle) {
            if (isarray(ent.occupants)) {
                foreach (occupant in ent.occupants) {
                    if (isplayer(occupant)) {
                        player = occupant;
                        if (!isalive(player)) {
                            continue;
                        }
                        player.var_ce51e639071849f = gettime();
                        if (!array_contains(instance.var_1258379e7ea78440, player)) {
                            instance.var_1258379e7ea78440 = function_6d6af8144a5131f1(instance.var_1258379e7ea78440, player);
                            player thread function_950d1ee4567388cb(self, instance);
                        }
                    }
                }
            }
        }
        if (is_player) {
            player = ent;
            if (!isalive(player)) {
                continue;
            }
            if (namespace_9c6cddd872ad75f7::hasgasmask(player) == 0) {
                if (!istrue(player.var_c70b8c1206c03437)) {
                    squad = namespace_ca7b90256548aa40::getsquadmembers();
                    if (squad.size == 0) {
                        squad = [0:player];
                    }
                    instance thread function_1281c7fff9456e18("zm_stronghold_no_protection");
                    foreach (var_8f7040e569ec9e98 in squad) {
                        var_8f7040e569ec9e98.var_c70b8c1206c03437 = 1;
                    }
                }
            }
            player.var_ce51e639071849f = gettime();
            if (!array_contains(instance.var_1258379e7ea78440, player)) {
                instance.var_1258379e7ea78440 = function_6d6af8144a5131f1(instance.var_1258379e7ea78440, player);
                player thread function_950d1ee4567388cb(self, instance);
            } else if (array_contains(instance.var_1258379e7ea78440, player) && !istrue(player.var_7bf8710b8f268d67)) {
                player thread function_950d1ee4567388cb(self, instance);
            }
        }
        var_91e59e745cfdf8a5 = namespace_b2b546ada8578eda::function_e1b3ae526db82c88(instance);
        foreach (player in var_91e59e745cfdf8a5) {
            player.var_ce51e639071849f = gettime();
            if (!array_contains(instance.var_1258379e7ea78440, player)) {
                instance.var_1258379e7ea78440 = function_6d6af8144a5131f1(instance.var_1258379e7ea78440, player);
                player thread function_950d1ee4567388cb(self, instance);
            } else if (array_contains(instance.var_1258379e7ea78440, player) && !istrue(player.var_7bf8710b8f268d67)) {
                player thread function_950d1ee4567388cb(self, instance);
            }
        }
        waitframe();
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1569
// Size: 0x185
function function_d70b7e579a26e875(instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    instance endon("aethergas_cleared");
    var_90ed426540e8be37 = [];
    while (1) {
        ent = self waittill("trigger");
        is_player = isplayer(ent);
        if (!is_player) {
            continue;
        }
        if (is_player) {
            player = ent;
            if (array_contains(var_90ed426540e8be37, player)) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (!istrue(player.var_39b049a8b56b7d8d)) {
                squad = namespace_ca7b90256548aa40::getsquadmembers();
                if (squad.size == 0) {
                    squad = [0:player];
                }
                if (randomfloat(1) < 0.3) {
                    instance thread function_1281c7fff9456e18("zm_stronghold_treasure_room");
                    foreach (var_8f7040e569ec9e98 in squad) {
                        var_8f7040e569ec9e98.var_39b049a8b56b7d8d = 1;
                    }
                }
                foreach (var_8f7040e569ec9e98 in squad) {
                    array_add(var_90ed426540e8be37, var_8f7040e569ec9e98);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f5
// Size: 0x2c5
function function_b3c1392935e10040() {
    var_2b1b52aa6a12c599 = utility::getstructarray(self.s_center.targetname, "target");
    self.var_7fe21e160de181f7 = [];
    self.var_eb9f6bfe8a0d4839 = [];
    self.var_d8875e62f764b801 = [];
    self.var_6a12b6a1b2843943 = [];
    self.var_a1dc369621f4b3b = [];
    self.var_82994cf791e27f7d = [];
    self.var_a0fa0c27dc0dbab1 = [];
    foreach (struct in var_2b1b52aa6a12c599) {
        if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "s_locked_door") {
            self.var_7fe21e160de181f7[self.var_7fe21e160de181f7.size] = struct;
        } else if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "s_loot_cache_spawn") {
            self.var_eb9f6bfe8a0d4839[self.var_eb9f6bfe8a0d4839.size] = struct;
        } else if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "stronghold_mimic_spawn") {
            self.var_d8875e62f764b801[self.var_d8875e62f764b801.size] = struct;
        } else if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "essence_spawn_large") {
            self.var_6a12b6a1b2843943[self.var_6a12b6a1b2843943.size] = struct;
        } else if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "essence_spawn_small") {
            self.var_a1dc369621f4b3b[self.var_a1dc369621f4b3b.size] = struct;
        } else if (isdefined(struct.targetname) && struct.targetname == "ceiling_spawner") {
            self.var_82994cf791e27f7d[self.var_82994cf791e27f7d.size] = struct;
        } else if (isdefined(struct.targetname) && struct.targetname == "s_cyst_spawn") {
            self.var_a0fa0c27dc0dbab1[self.var_a0fa0c27dc0dbab1.size] = struct;
        }
    }
    if (isdefined(self.s_center.var_e1dfe0111441e8ca)) {
        var_7b89b04a690a3aec = utility::getstructarray(self.s_center.var_e1dfe0111441e8ca, "targetname");
        self.var_566dc3346c682517 = utility::getclosest(self.s_center.origin, var_7b89b04a690a3aec, 1000);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c1
// Size: 0x1be
function function_c350f33277c1de1() {
    var_504b94de4ebed677 = 3000;
    if (isdefined(self.s_center.var_aa6000e38ce89c1)) {
        var_504b94de4ebed677 = int(self.s_center.var_aa6000e38ce89c1);
    }
    self.var_86ca8e1c112dc232 = getentitylessscriptablearray(self.s_center.targetname, "target", self.s_center.origin, var_504b94de4ebed677);
    if (self.var_86ca8e1c112dc232.size == 0 && isdefined(self.var_566dc3346c682517)) {
        self.var_86ca8e1c112dc232 = getentitylessscriptablearray(self.var_566dc3346c682517.target, "targetname", self.s_center.origin, var_504b94de4ebed677);
    }
    self.var_dcbec0adc5c68ae8 = [];
    foreach (prop in self.var_86ca8e1c112dc232) {
        prop setscriptablepartstate("state", "visible");
        if (issubstr(prop.classname, "gas")) {
            self.var_dcbec0adc5c68ae8[self.var_dcbec0adc5c68ae8.size] = prop;
        }
        if (issubstr(prop.classname, "flag") || issubstr(prop.classname, "banner")) {
            if (prop getscriptableparthasstate("state", "Visible_zm")) {
                prop setscriptablepartstate("state", "visible_zm");
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b86
// Size: 0x307
function function_afe71f4277675131() {
    var_f57c80feb76a8e88 = [0:"ob_loot_cache", 1:"ob_loot_cache_large", 2:"ob_loot_cache_zm", 3:"ob_loot_cache_large_zm"];
    var_6ef9fa4f712aa3d7 = getlootscriptablearrayinradius(var_f57c80feb76a8e88, undefined, self.s_center.origin, 1000);
    foreach (cache in var_6ef9fa4f712aa3d7) {
        cache setscriptablepartstate("body", "hidden", 1);
    }
    var_59e866705eabf0bb = [];
    var_59e866705eabf0bb = function_353a441260e6a09d(var_59e866705eabf0bb, self.var_cd1f6a0cc4b9d2b6, #"hash_d8e996c37357f449");
    var_59e866705eabf0bb = function_353a441260e6a09d(var_59e866705eabf0bb, self.var_d76a378fe188ada0 - 1, #"hash_9f528a48605451");
    var_59e866705eabf0bb = function_353a441260e6a09d(var_59e866705eabf0bb, 1, #"hash_887c5b1de73dd2a4");
    var_59e866705eabf0bb = function_353a441260e6a09d(var_59e866705eabf0bb, self.var_91d007152e252433, #"hash_31848ee41c7d520d");
    var_59e866705eabf0bb = function_353a441260e6a09d(var_59e866705eabf0bb, self.var_34f38a376bb1343f, #"hash_c1d0ea6db3f38ac5");
    var_59e866705eabf0bb = array_randomize(var_59e866705eabf0bb);
    waitframe();
    self.lootcaches = [];
    self.var_cb898eb716da103f = [];
    counter = 0;
    foreach (struct in self.var_eb9f6bfe8a0d4839) {
        cache = namespace_9b83895815d12835::function_71d64108850e7b91(var_59e866705eabf0bb[counter], struct.origin, struct.angles);
        waitframe();
        self.lootcaches[self.lootcaches.size] = cache;
        var_1434038a8e5d25b6 = spawnscriptable("ob_aethernest_toggleable_cover", struct.origin, struct.angles);
        if (isdefined(cache.type) && issubstr(cache.type, "large")) {
            var_1434038a8e5d25b6 setscriptablepartstate("state", "visible_large_hint");
        } else {
            var_1434038a8e5d25b6 setscriptablepartstate("state", "visible_medium_hint");
        }
        var_1434038a8e5d25b6 namespace_5775ad2badedbcaa::function_98fc2e3f04194a50(&function_ea0d2f50c264d5ef);
        self.var_cb898eb716da103f[self.var_cb898eb716da103f.size] = var_1434038a8e5d25b6;
        if (counter + 1 < self.var_eb9f6bfe8a0d4839.size) {
            counter = counter + 1;
        }
        foreach (player in level.players) {
            cache disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e94
// Size: 0x15
function function_ea0d2f50c264d5ef(scriptable, player) {
    return 0;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb1
// Size: 0x3b
function function_353a441260e6a09d(var_59e866705eabf0bb, var_699173c433d3308b, var_91839babd32261f4) {
    for (i = 0; i < var_699173c433d3308b; i++) {
        var_59e866705eabf0bb[var_59e866705eabf0bb.size] = var_91839babd32261f4;
    }
    return var_59e866705eabf0bb;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef4
// Size: 0x144
function function_d0d0c2cf7d4c1fc9() {
    self.var_2319616d73f58983 = namespace_b2b546ada8578eda::function_b25446edb490c05f(self.var_a0fa0c27dc0dbab1, self.var_b775d3fc5973f7ac);
    self.var_84b0d6cec49dc02b = [];
    self.var_5eba52fdc9fb7b54 = [];
    self.scriptable = spawnscriptable("ob_aethernest_activity_scriptable", self.s_center.origin);
    foreach (var_fe06362889e1c0ec in self.var_2319616d73f58983) {
        var_fe06362889e1c0ec.var_c32336dbbd60b8d9 = int(self.var_67d58bcaf37c2e2b / self.var_2319616d73f58983.size);
        foreach (spawner in self.var_82994cf791e27f7d) {
            if (spawner.script_noteworthy == var_fe06362889e1c0ec.script_noteworthy) {
                var_fe06362889e1c0ec.spawner = spawner;
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x203f
// Size: 0x2a4
function function_e9836f11aaedad08(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!utility::is_equal(instance.type, "ob_aethernest_cyst_scriptable") || istrue(instance.destroyed)) {
        return;
    }
    if (isdefined(instance.spawner)) {
        instance.spawner notify("start_spawn");
    }
    if (isdefined(instance.health)) {
        instance.health = instance.health - idamage;
        if (isplayer(eattacker)) {
            instance.var_f49149402765ecae = utility::function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
            if (namespace_329d1a4521cd0e73::function_87c3b43d00319847()) {
                namespace_ac0edc67c1149926::function_c54b2cc2e762c201(eattacker, instance.var_c5e888c83b5caf2f, "none", smeansofdeath, objweapon, int(idamage), undefined, 0, undefined, 0, 0);
            }
            eattacker damagefeedback::updatehitmarker("standard", instance.health <= 0, 0, 0, undefined);
        }
        instance.var_2f5d509d7b71ce9a.last_player_attacker = eattacker;
        if (!instance.var_2f5d509d7b71ce9a.started) {
            instance.var_2f5d509d7b71ce9a notify("aethernest_start");
        }
        instance.var_2f5d509d7b71ce9a function_9ca778648cd6e0c8(idamage);
        if (instance.health <= 0) {
            eattacker points::function_ddee59d6b1a2b9e(#"hash_626189d6229d39b4");
            instance thread namespace_b2b546ada8578eda::function_155971201d58c7dc("aethernest_cyst_gas_burst");
            instance.destroyed = 1;
            if (function_de53ed8e35d0ed7a(instance.var_2f5d509d7b71ce9a) == "REV_OB_ZOMBIE_STRONGHOLD") {
                if (isplayer(eattacker) && !istrue(eattacker.var_d45cc2b767709d2d)) {
                    squad = eattacker namespace_ca7b90256548aa40::getsquadmembers();
                    if (squad.size == 0) {
                        squad = [0:eattacker];
                    }
                    instance.var_2f5d509d7b71ce9a thread function_1281c7fff9456e18("zm_stronghold_destroy_cyst");
                    foreach (var_8f7040e569ec9e98 in squad) {
                        var_8f7040e569ec9e98.var_d45cc2b767709d2d = 1;
                    }
                }
            }
            goto LOC_000002a2;
        }
    LOC_000002a2:
    }
LOC_000002a2:
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ea
// Size: 0x31f
function function_a08bd3ee0d31ebd8() {
    var_fb0df30e19fbacf7 = self.var_de4d87caa90a9970;
    var_8f91b09e06192a8f = self.var_a4aeecf5b922b358;
    var_f35397f89190ced6 = self.var_a1dc369621f4b3b;
    var_ebd6b32ebb14f5e2 = self.var_6a12b6a1b2843943;
    self.var_15b4d0a72da5ccd4 = [];
    self.var_150be27a3d15f800 = [];
    var_524e12dc3d6a1b26 = 0;
    var_e365e58776a8ef9e = 0;
    foreach (point in var_f35397f89190ced6) {
        var_b0e4447b9140a34e = function_3bd08a7c5eba1671(int(max(int(point.var_48ff4b477379fcae) - 4, 1)), point.origin, point.height, point.radius - 50);
        foreach (location in var_b0e4447b9140a34e) {
            key = self.var_15b4d0a72da5ccd4.size;
            self.var_15b4d0a72da5ccd4[key] = function_38e113a4c30f6c0d("obloot_essence_small", location, undefined, undefined, undefined, undefined, 1);
            self.var_15b4d0a72da5ccd4[key].key = key;
            var_524e12dc3d6a1b26 = var_524e12dc3d6a1b26 + 1;
        }
    }
    if (var_fb0df30e19fbacf7 > var_524e12dc3d6a1b26) {
        var_e1d1e1b24b076a64 = var_fb0df30e19fbacf7 - var_524e12dc3d6a1b26;
        index = 0;
        var_f35397f89190ced6 = utility::array_randomize(var_f35397f89190ced6);
        while (var_e1d1e1b24b076a64 > 0) {
            var_4e9a77b673bb669c = index % var_f35397f89190ced6.size;
            point = var_f35397f89190ced6[var_4e9a77b673bb669c];
            var_b0e4447b9140a34e = function_3bd08a7c5eba1671(1, point.origin, point.height, point.radius);
            location = var_b0e4447b9140a34e[0];
            key = self.var_15b4d0a72da5ccd4.size;
            self.var_15b4d0a72da5ccd4[key] = function_38e113a4c30f6c0d("obloot_essence_small", location, undefined, undefined, undefined, undefined, 1);
            self.var_15b4d0a72da5ccd4[key].key = key;
            var_e1d1e1b24b076a64 = var_e1d1e1b24b076a64 - 1;
            index = index + 1;
        }
    }
    var_ebd6b32ebb14f5e2 = utility::array_randomize(var_ebd6b32ebb14f5e2);
    foreach (point in var_ebd6b32ebb14f5e2) {
        key = self.var_150be27a3d15f800.size;
        self.var_150be27a3d15f800[key] = function_38e113a4c30f6c0d("obloot_essence_large", point.origin, undefined, undefined, undefined, undefined, 1);
        self.var_150be27a3d15f800[key].key = key;
        var_e365e58776a8ef9e = var_e365e58776a8ef9e + 1;
        if (var_e365e58776a8ef9e >= var_8f91b09e06192a8f) {
            break;
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2610
// Size: 0x3a
function function_cf65031f2b7139e3() {
    self.var_d8875e62f764b801 = utility::array_randomize(self.var_d8875e62f764b801);
    self.var_b18ef82cae22792d = 0;
    function_678f2d3acbd40b11("ai_encounter:ob_aethernest_mimics", self.var_c61203960d56682a);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2651
// Size: 0x1d8
function function_fd78eacbc58cc6f() {
    self.var_4150fef724dc0a2c = [];
    self.var_bd59a95fc824e0f9 = [];
    if (self.var_7fe21e160de181f7.size == 0 && isdefined(self.var_566dc3346c682517)) {
        var_103e542d98198156 = utility::getstructarray(self.var_566dc3346c682517.target, "targetname");
        foreach (struct in var_103e542d98198156) {
            if (isdefined(struct.script_noteworthy) && struct.script_noteworthy == "s_locked_door") {
                self.var_7fe21e160de181f7[self.var_7fe21e160de181f7.size] = struct;
            }
        }
    }
    foreach (s_locked_door in self.var_7fe21e160de181f7) {
        self.var_bd59a95fc824e0f9 = namespace_9e69d66f68c38a10::function_ad1b6accbaab404e(s_locked_door, self.var_bd59a95fc824e0f9, "fortress", 0);
    }
    foreach (door in self.var_bd59a95fc824e0f9) {
        if (istrue(door.var_3d9512b73bdc1514)) {
            door scriptabledoorfreeze(1);
        } else {
            namespace_9e69d66f68c38a10::function_fbbfe6f05eda5eb1(door);
        }
        door.fortress = self;
        door.var_def557e8fd5c6763 = &function_9f6806e422ce37b3;
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2830
// Size: 0x27
function private function_9f6806e422ce37b3(scriptable, player) {
    scriptable.fortress thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x285e
// Size: 0x5d
function function_ce5af2f09a72177a(offsets, var_996a07fd7388db1c) {
    x_axis = var_996a07fd7388db1c["forward"];
    y_axis = var_996a07fd7388db1c["right"];
    z_axis = var_996a07fd7388db1c["up"];
    return offsets[0] * x_axis + offsets[1] * y_axis + offsets[2] * z_axis;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c3
// Size: 0xda
function function_eda4e16141cc6490() {
    foreach (spawner in self.var_82994cf791e27f7d) {
        spawner.scriptable = spawnscriptable("ob_aethernest_toggleable_spawner", spawner.origin, spawner.angles);
        spawner.scriptable setscriptablepartstate("state", "visible");
        spawner.var_dc227058887f66f4 = randomintrange(1, 3);
        function_e2b7429085d664a("ai_encounter:ob_aethernest_crawlers", spawner.var_dc227058887f66f4, spawner);
        spawner.crawlers = [];
        spawner thread function_fd451ad57dcd0b99();
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29a4
// Size: 0x51
function function_b27f0c7dafeadb3(var_b7e583d90618fed3) {
    backpacksize = namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        var_eeeae9defa0c1e95 = namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == var_b7e583d90618fed3) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fd
// Size: 0x6f8
function function_c9b0c1c4babe3cb(var_d6bfa53c531546d6) {
    if (function_de53ed8e35d0ed7a(self) != "REV_OB_ZOMBIE_STRONGHOLD") {
        return;
    }
    player = var_d6bfa53c531546d6.player;
    if (!isdefined(self.var_11189a5876d4212d)) {
        self.var_11189a5876d4212d = [];
    }
    if (!isdefined(self.var_441e741dad8237a6)) {
        self.var_441e741dad8237a6 = [];
    }
    var_2788abb533782ec5 = self.var_11189a5876d4212d;
    self.var_11189a5876d4212d = var_d6bfa53c531546d6.var_9f2dab34edc7e257;
    if (self.var_11189a5876d4212d.size > var_2788abb533782ec5.size && var_2788abb533782ec5.size == 0) {
        if (!array_contains(self.var_441e741dad8237a6, player)) {
            var_3bb38b68cd07463e = 1;
            if (var_3bb38b68cd07463e) {
                squad = player namespace_ca7b90256548aa40::getsquadmembers();
                if (squad.size == 0) {
                    squad = [0:player];
                }
                var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(17086, "quest_s0_a3t4_springcln_start", squad);
                if (!var_8c4ed29f8594fb86) {
                    var_896a02526e5df786 = [0:"zm_stronghold_approach_ravenov", 1:"zm_stronghold_approach_miller", 2:"zm_stronghold_approach_greene", 3:"zm_stronghold_approach_barrera"];
                    thread function_1281c7fff9456e18(var_896a02526e5df786[randomint(4)]);
                }
                foreach (var_8f7040e569ec9e98 in squad) {
                    var_8f7040e569ec9e98 callback::callback("on_approach_zm_stronghold");
                    self.var_441e741dad8237a6[self.var_441e741dad8237a6.size] = var_8f7040e569ec9e98;
                }
            }
        }
        foreach (var_fe06362889e1c0ec in self.var_2319616d73f58983) {
            var_db662a244a03025a = spawnscriptable("ob_aethernest_cyst_scriptable", var_fe06362889e1c0ec.origin, var_fe06362889e1c0ec.angles);
            var_db662a244a03025a.var_fe06362889e1c0ec = var_fe06362889e1c0ec;
            var_db662a244a03025a.health = var_fe06362889e1c0ec.var_c32336dbbd60b8d9;
            if (var_fe06362889e1c0ec.var_c32336dbbd60b8d9 > 0) {
                var_db662a244a03025a.var_c5e888c83b5caf2f = var_db662a244a03025a;
                var_db662a244a03025a.var_c5e888c83b5caf2f.var_52dcdba485e7ceeb = "tag_origin";
                var_db662a244a03025a.spawn_list = self.spawn_list;
                var_db662a244a03025a.var_2f5d509d7b71ce9a = self;
                if (isdefined(var_fe06362889e1c0ec.spawner)) {
                    var_db662a244a03025a.spawner = var_fe06362889e1c0ec.spawner;
                }
                self.var_84b0d6cec49dc02b[self.var_84b0d6cec49dc02b.size] = var_db662a244a03025a;
                var_db662a244a03025a setscriptablepartstate("usable", "off");
            } else {
                var_db662a244a03025a setscriptablepartstate("health", "ignore_damage");
                var_db662a244a03025a setscriptablepartstate("body", "bursted");
            }
            if (!isdefined(level.ob.var_84b0d6cec49dc02b)) {
                level.ob.var_84b0d6cec49dc02b = [];
            }
            level.ob.var_84b0d6cec49dc02b = array_add(level.ob.var_84b0d6cec49dc02b, var_db662a244a03025a);
            self.var_5eba52fdc9fb7b54[self.var_5eba52fdc9fb7b54.size] = var_db662a244a03025a;
        }
        if (!isdefined(self.var_15b4d0a72da5ccd4)) {
            function_a08bd3ee0d31ebd8();
        } else {
            for (i = 0; i < self.var_15b4d0a72da5ccd4.size; i++) {
                if (isdefined(self.var_15b4d0a72da5ccd4[i]) && isvector(self.var_15b4d0a72da5ccd4[i])) {
                    location = self.var_15b4d0a72da5ccd4[i];
                    self.var_15b4d0a72da5ccd4[i] = function_38e113a4c30f6c0d("obloot_essence_small", location, undefined, undefined, undefined, undefined, 1);
                    self.var_15b4d0a72da5ccd4[i].key = i;
                }
            }
            for (i = 0; i < self.var_150be27a3d15f800.size; i++) {
                if (isdefined(self.var_150be27a3d15f800[i]) && isvector(self.var_15b4d0a72da5ccd4[i])) {
                    location = self.var_150be27a3d15f800[i];
                    self.var_150be27a3d15f800[i] = function_38e113a4c30f6c0d("obloot_essence_large", location, undefined, undefined, undefined, undefined, 1);
                    self.var_150be27a3d15f800[i].key = i;
                }
            }
        }
    } else if (self.var_11189a5876d4212d.size == 0) {
        foreach (var_db662a244a03025a in self.var_5eba52fdc9fb7b54) {
            if (isdefined(var_db662a244a03025a) && isdefined(var_db662a244a03025a.var_fe06362889e1c0ec) && isdefined(var_db662a244a03025a.health)) {
                if (isdefined(level.ob.var_84b0d6cec49dc02b) && array_contains(level.ob.var_84b0d6cec49dc02b, var_db662a244a03025a)) {
                    level.ob.var_84b0d6cec49dc02b = array_remove(level.ob.var_84b0d6cec49dc02b, var_db662a244a03025a);
                }
                var_db662a244a03025a.var_fe06362889e1c0ec.var_c32336dbbd60b8d9 = var_db662a244a03025a.health;
                var_db662a244a03025a freescriptable();
            }
        }
        self.var_5eba52fdc9fb7b54 = [];
        self.var_84b0d6cec49dc02b = [];
        if (isdefined(self.var_15b4d0a72da5ccd4)) {
            foreach (essence in self.var_15b4d0a72da5ccd4) {
                if (isdefined(essence) && !isvector(essence)) {
                    self.var_15b4d0a72da5ccd4[essence.key] = essence.origin;
                    namespace_49e179ec476603d6::function_c14962ea14e58968(essence);
                }
            }
            foreach (essence in self.var_150be27a3d15f800) {
                if (isdefined(essence) && !isvector(essence)) {
                    self.var_150be27a3d15f800[essence.key] = essence.origin;
                    namespace_49e179ec476603d6::function_c14962ea14e58968(essence);
                }
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30fc
// Size: 0xe0
function function_fbc94dc837737154() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    namespace_41957062447a88fe::function_3e33031646de23b0(self);
    thread function_3d3f2b8fc6060ed2();
    self waittill("aethernest_start");
    self.scriptable setscriptablepartstate("audio_notifications", "nest_started");
    self.started = 1;
    thread namespace_80f1ffea676eeeaa::function_a26e39e03a0d6739();
    thread namespace_b2b546ada8578eda::function_c769482a1e8c11d5();
    thread function_8e5f7aaa701e23f8();
    self waittill("nest_cleared");
    self.scriptable setscriptablepartstate("audio_notifications", "nest_cleared");
    earthquake(0.6, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
    namespace_4fda5d7358015a06::function_612d18fdbc979c0b(var_2f5d509d7b71ce9a, 1);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e3
// Size: 0x4e
function function_e633f9daa5bf8b8a() {
    self.spawner endon("start_spawn");
    self.spawner endon("second_threshold_reached");
    self endon("death");
    self endon("despawn");
    while (1) {
        namespace_53fc9ddbb516e6e1::animscripted_sharedfunc(self.idle_anim, "idle_end", undefined, undefined);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3238
// Size: 0x5b
function function_b77d89314204f95d() {
    self.spawner endon("start_spawn");
    self.spawner endon("second_threshold_reached");
    spawner = self.spawner;
    self waittill("death");
    spawner.crawlers = array_remove(spawner.crawlers, self);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329a
// Size: 0x59
function function_fd451ad57dcd0b99() {
    waittill_any_2("start_spawn", "second_threshold_reached");
    crawler = namespace_b2b546ada8578eda::function_1757c4b6ecb2e2c6(1);
    namespace_b2b546ada8578eda::function_1dd4c3b1da546151(crawler);
    crawler = namespace_b2b546ada8578eda::function_1757c4b6ecb2e2c6(2);
    if (isdefined(crawler)) {
        wait(0.45);
        namespace_b2b546ada8578eda::function_1dd4c3b1da546151(crawler);
    }
    wait(1.5);
    namespace_b2b546ada8578eda::function_21034501787df0c9();
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32fa
// Size: 0x8b
function function_3d3f2b8fc6060ed2() {
    self endon("aethernest_start");
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_10855db46bb1b90c = 0;
    while (1) {
        nearby_players = sortbydistancecullbyradius(level.players, self.s_center.origin, 2000);
        if (nearby_players.size > 0) {
            if (!var_10855db46bb1b90c) {
                var_10855db46bb1b90c = 1;
                function_24b55c1a13b9a63a("ai_flood_fill_encounter:jup_ob_zombie_stronghold_flood_fill_encounter_passive", undefined, self.difficulty_region, 1);
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x338c
// Size: 0xcd
function function_9ca778648cd6e0c8(damage) {
    current_health = namespace_b2b546ada8578eda::function_9883479ef6511b80();
    prev_health = current_health + damage;
    if (prev_health >= self.var_376a304c3c7fe3d9 && current_health <= self.var_376a304c3c7fe3d9) {
        self notify("first_threshold_reached");
    } else if (prev_health >= self.var_407c4d80771903bd && current_health <= self.var_407c4d80771903bd) {
        self notify("second_threshold_reached");
        foreach (spawner in self.var_82994cf791e27f7d) {
            spawner notify("second_threshold_reached");
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3460
// Size: 0x11b
function function_8e5f7aaa701e23f8() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    function_24b55c1a13b9a63a("ai_flood_fill_encounter:jup_ob_zombie_stronghold_flood_fill_encounter", undefined, self.difficulty_region, 1);
    self waittill("first_threshold_reached");
    thread function_77b6255a8d4be491("second_threshold_reached", "wave_1", 22);
    self.scriptable setscriptablepartstate("audio_notifications", "health_threshold_1");
    earthquake(0.35, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
    self waittill("second_threshold_reached");
    thread function_77b6255a8d4be491("nest_cleared", "wave_2", 30);
    self.scriptable setscriptablepartstate("audio_notifications", "health_threshold_2");
    earthquake(0.47, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3582
// Size: 0x7e
function function_77b6255a8d4be491(var_4129ccfaab35ca70, var_f2db078b9c73e22b, wait_time) {
    if (isdefined(var_4129ccfaab35ca70)) {
        self endon(var_4129ccfaab35ca70);
    }
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread namespace_b2b546ada8578eda::function_b4adf91e395e53f0();
    if (isdefined(var_f2db078b9c73e22b)) {
        function_24b55c1a13b9a63a("ai_encounter:jup_ob_zombie_stronghold_encounter", var_f2db078b9c73e22b, self.difficulty_region);
    } else {
        function_24b55c1a13b9a63a("ai_encounter:jup_ob_zombie_stronghold_encounter");
    }
    wait(wait_time);
    function_24b55c1a13b9a63a("ai_flood_fill_encounter:jup_ob_zombie_stronghold_flood_fill_encounter", undefined, self.difficulty_region, 1);
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3607
// Size: 0xea
function function_24b55c1a13b9a63a(bundle, var_f555f0c2ce194ea8, var_4f51b9f082dab4dd, var_92190fa0ccb5e392) {
    var_46ec08045bb6e6e9 = 500;
    var_63cb8ebdf559dcb9 = 50;
    centerpoint = self.s_center.origin;
    self.encounterid = namespace_80f1ffea676eeeaa::function_f8ccadcd850da124(bundle, centerpoint, var_46ec08045bb6e6e9, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        if (isdefined(var_f555f0c2ce194ea8)) {
            function_d37068aac7785c04(self.encounterid, var_f555f0c2ce194ea8, 1);
        }
        if (isdefined(var_4f51b9f082dab4dd)) {
            function_d37068aac7785c04(self.encounterid, var_4f51b9f082dab4dd, 1);
        }
        namespace_80f1ffea676eeeaa::function_ce9c21523336cdbc(self.encounterid, &function_92eab905b00e7dd2, self);
        if (isdefined(var_92190fa0ccb5e392)) {
            if (var_92190fa0ccb5e392) {
                function_4b7d420e1bad897f(self.encounterid, self.var_c305d8b37977e9c9);
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f8
// Size: 0x82
function function_e2b7429085d664a(bundle, var_dc227058887f66f4, spawner) {
    centerpoint = spawner.origin;
    self.encounterid = function_f8ccadcd850da124(bundle, centerpoint, 80, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        function_d37068aac7785c04(self.encounterid, var_dc227058887f66f4, 1);
        function_ce9c21523336cdbc(self.encounterid, &function_c5417c4498aa702a, spawner);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3781
// Size: 0x83
function function_678f2d3acbd40b11(bundle, var_dc227058887f66f4) {
    centerpoint = self.s_center.origin;
    self.encounterid = function_f8ccadcd850da124(bundle, centerpoint, 500, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        function_d37068aac7785c04(self.encounterid, var_dc227058887f66f4, 1);
        function_ce9c21523336cdbc(self.encounterid, &function_f65d4eb41b0a5fa3, self);
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x380b
// Size: 0x62
function function_92eab905b00e7dd2(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        var_e6013eac45290cab = userdata;
        if (isdefined(var_e6013eac45290cab.last_player_attacker)) {
            agent zombie_utils::function_a047f71d0256058b(var_e6013eac45290cab.last_player_attacker);
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3874
// Size: 0x11f
function function_c5417c4498aa702a(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        data.var_d6efea6cb4660747 = 2;
        spawner = userdata;
        crawler = agent;
        crawler val::set("idle_hang", "damage", 0);
        crawler val::set("idle_hp_bar", "show_healthbar", 0);
        crawler.var_2f5d509d7b71ce9a = self;
        crawler.spawner = spawner;
        crawler.idle_anim = "nest_crawler_idle_two_drop_01";
        crawler.var_7c6c1f790fad020f = 1;
        crawler visiblenotsolid();
        crawler thread function_e633f9daa5bf8b8a();
        crawler thread function_b77d89314204f95d();
        spawner.crawlers[spawner.crawlers.size] = crawler;
        crawler ent_flag_wait("zombie_asm_init_finished");
        if (!isdefined(crawler.animname)) {
            crawler.animname = crawler.var_ae3ea15396b65c1f;
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399a
// Size: 0xbb
function function_f65d4eb41b0a5fa3(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        var_e6013eac45290cab = userdata;
        if (var_e6013eac45290cab.var_b18ef82cae22792d < var_e6013eac45290cab.var_d8875e62f764b801.size) {
            point = var_e6013eac45290cab.var_d8875e62f764b801[var_e6013eac45290cab.var_b18ef82cae22792d];
            var_e6013eac45290cab.var_b18ef82cae22792d = var_e6013eac45290cab.var_b18ef82cae22792d + 1;
            if (isdefined(point)) {
                namespace_f35b248fe3d46dfb::function_7f3bb3916bbd189d([0:point], agent, undefined, point.proplist, &function_dc12df4bf3fedd5b);
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a5c
// Size: 0x18
function function_2f109c081d5fd179(obj) {
    if (isdefined(obj)) {
        obj delete();
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7b
// Size: 0x51
function function_7b8f4f5e1fbe30d5() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = self.s_center.origin;
    var_cc7aa96a854fd8ee.angles = self.s_center.angles;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad3
// Size: 0x38
function function_c1cb9b8f30cff8c6(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b12
// Size: 0x98
function function_7208e454d9a1452e(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    foreach (player in var_2a29b237dcc66fe5) {
        if (isplayer(player)) {
            if (isdefined(self) && self.state != "EndedState") {
                player function_4a508fcbbea05afd();
            }
            player notify("left_aethernest");
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb1
// Size: 0x33
function function_4a508fcbbea05afd() {
    self endon("death_or_disconnect");
    wait(120);
    player = self;
    if (function_5acc35fc66331385(player, 17086)) {
        player ent_flag_clear("quest_s0_a3t4_springcln_start");
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3beb
// Size: 0x366
function function_2a6a959fd054e401(activity_succeeded) {
    self endon("instance_destroyed");
    thread namespace_80f1ffea676eeeaa::function_a26e39e03a0d6739();
    namespace_b2b546ada8578eda::function_45addf4a995d163(self.var_f683875f2e47f6bc);
    foreach (player in self.var_6c29f2fdb0054bbe) {
        squadmembers = player namespace_ca7b90256548aa40::getsquadmembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(17086, "quest_s0_a3t4_springcln_success", squadmembers);
        if (!var_8c4ed29f8594fb86) {
            if (function_51d76700600cebe3(50)) {
                var_678c76021261593d = [0:"zm_stronghold_clear_ravenov_miller", 1:"zm_stronghold_clear_ravenov_greene", 2:"zm_stronghold_clear_ravenov_barrera"];
                thread function_1281c7fff9456e18(var_678c76021261593d[randomint(3)], [0:player]);
            } else {
                thread function_1281c7fff9456e18("zm_stronghold_clear_ravenov_noresp", [0:player]);
            }
        }
    }
    namespace_bd7428f3122be80f::function_c402ecda1e84ba27(self.var_6c29f2fdb0054bbe, 0, self.difficulty_region, self.s_center.origin);
    powerups::powerup_drop("full_ammo", getclosestpointonnavmesh(self.s_center.origin) + (0, 0, 30));
    foreach (var_1434038a8e5d25b6 in self.var_cb898eb716da103f) {
        if (isdefined(var_1434038a8e5d25b6)) {
            var_1434038a8e5d25b6 setscriptablepartstate("state", "dead");
        }
    }
    foreach (cache in self.lootcaches) {
        foreach (player in level.players) {
            cache enablescriptableplayeruse(player);
        }
        cache setscriptablepartstate("body", "closed_usable");
    }
    if (isdefined(self.scriptable)) {
        self.scriptable freescriptable();
    }
    if (isdefined(self.var_dcbec0adc5c68ae8)) {
        foreach (gas in self.var_dcbec0adc5c68ae8) {
            gas setscriptablepartstate("state", "hidden");
        }
    }
    if (isdefined(self.var_37055a35f686fd39)) {
        foreach (vfx in self.var_37055a35f686fd39) {
            function_2f109c081d5fd179(vfx);
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f58
// Size: 0x2c7
function function_89bdb2d03896122b() {
    self endon("instance_destroyed");
    self notify("aethernest_cease");
    thread namespace_80f1ffea676eeeaa::function_a26e39e03a0d6739();
    if (isdefined(self.var_f683875f2e47f6bc)) {
        namespace_b2b546ada8578eda::function_45addf4a995d163(self.var_f683875f2e47f6bc);
    }
    if (isdefined(self.var_cb898eb716da103f)) {
        foreach (var_1434038a8e5d25b6 in self.var_cb898eb716da103f) {
            if (isdefined(var_1434038a8e5d25b6)) {
                var_1434038a8e5d25b6 freescriptable();
            }
        }
    }
    if (isdefined(self.var_86ca8e1c112dc232)) {
        foreach (prop in self.var_86ca8e1c112dc232) {
            prop setscriptablepartstate("state", "hidden");
        }
    }
    if (isdefined(self.lootcaches)) {
        foreach (cache in self.lootcaches) {
            cache freescriptable();
        }
    }
    if (isdefined(self.var_37055a35f686fd39)) {
        foreach (vfx in self.var_37055a35f686fd39) {
            function_2f109c081d5fd179(vfx);
        }
    }
    if (isdefined(self.var_82994cf791e27f7d)) {
        foreach (spawner in self.var_82994cf791e27f7d) {
            if (isdefined(spawner.scriptable)) {
                spawner.scriptable freescriptable();
            }
        }
    }
    if (isdefined(self.var_5eba52fdc9fb7b54)) {
        foreach (var_db662a244a03025a in self.var_5eba52fdc9fb7b54) {
            var_db662a244a03025a freescriptable();
        }
    }
    if (isdefined(self.scriptable)) {
        self.scriptable freescriptable();
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4226
// Size: 0x130
function function_3bd08a7c5eba1671(num_points, var_76a360b8b32e7746, var_f920810d1461251f, outer_radius, inner_radius, var_ffc346403d7b087d, var_81eab9f4b9cb06da, var_33a8409ba292ca46) {
    level endon("game_ended");
    spawn_points = [];
    var_ffc346403d7b087d = utility::function_53c4c53197386572(var_ffc346403d7b087d, 1);
    var_137fa8a8bdd21729 = 0;
    var_b4416eb8024a562b = [];
    for (i = 0; i < num_points; i++) {
        var_5b269e6a457efb2f = 0;
        while (var_5b269e6a457efb2f < 5) {
            var_f920810d1461251f = 10;
            var_b94b44484ba8ad14 = var_76a360b8b32e7746 + (0, 0, var_f920810d1461251f);
            random_point = math::function_e70fb12ac4e8f91b(var_b94b44484ba8ad14, outer_radius, inner_radius, var_81eab9f4b9cb06da, var_33a8409ba292ca46);
            var_382ca5f6deca0f5f = utility::function_114e5c055b13dacf(random_point, var_f920810d1461251f);
            if (var_b4416eb8024a562b.size == 0) {
                var_b4416eb8024a562b[var_b4416eb8024a562b.size] = random_point;
            }
            if (isdefined(var_382ca5f6deca0f5f)) {
                spawn_points[spawn_points.size] = var_382ca5f6deca0f5f;
                continue;
            } else {
                var_5b269e6a457efb2f++;
            }
            if (var_ffc346403d7b087d) {
                var_137fa8a8bdd21729++;
                if (var_137fa8a8bdd21729 % 3 == 0) {
                    waitframe();
                }
            }
        }
    }
    if (spawn_points.size == 0) {
        return var_b4416eb8024a562b;
    }
    return spawn_points;
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435e
// Size: 0x303
function function_dc12df4bf3fedd5b() {
    prop_height = (0, 0, 64);
    players = namespace_e47104b48662385b::getplayersinradius(self.origin, 100);
    if (players.size) {
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            if (istrue(player.ignoreme) || istrue(player.inlaststand)) {
                continue;
            }
            /#
                if (getdvarint(@"hash_821690ed248715f7", 0)) {
                    sphere(player.origin, 20, (0, 1, 0), 0, 1, 1);
                }
            #/
            if (isdefined(player.last_valid_position) && isdefined(self.var_599dd4f330308ca3)) {
                if (!trace::ray_trace_passed(player.last_valid_position, self.var_599dd4f330308ca3, [0:self], trace::create_default_contents(1))) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(player.last_valid_position, self.var_599dd4f330308ca3, (0, 1, 1), 1, 0, 1);
                            sphere(self.var_599dd4f330308ca3, 20, (1, 0, 0), 0, 1, 1);
                        }
                    #/
                    continue;
                }
            } else {
                var_dace4b70df8d5f18 = player gettagorigin("j_spine4");
                var_dace4b70df8d5f18 = utility::function_53c4c53197386572(var_dace4b70df8d5f18, player getcentroid());
                if (isdefined(var_dace4b70df8d5f18) && !sighttracepassed(self.origin + prop_height, var_dace4b70df8d5f18, 0, self)) {
                    /#
                        if (getdvarint(@"hash_821690ed248715f7", 0)) {
                            line(self.origin + prop_height, player gettagorigin("stronghold_mimic_spawn"), (1, 1, 0), 1, 0, 1);
                        }
                    #/
                    continue;
                }
            }
            traceresult = playerphysicstrace(self.origin + (0, 0, 20), player.origin + (0, 0, 36), player, undefined, self, 1);
            if (traceresult["fraction"] >= 1) {
                self notify("stop_shake_tell");
                return player;
            } else {
                /#
                    if (getdvarint(@"hash_821690ed248715f7", 0)) {
                        line(self.origin + (0, 0, 8), player.origin + (0, 0, 8), (1, 0, 0), 1, 0, 1);
                        sphere(traceresult["banner"], 4, (1, 0, 0), 1, 0, 10, 1);
                    }
                #/
            }
        }
    }
}

// Namespace namespace_c63df5a8b7194592/namespace_f8638ef0be82c4bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4668
// Size: 0x126
function function_8af75525d37866eb(params) {
    var_5e922aa9baf90c9 = params.item;
    if (!isdefined(var_5e922aa9baf90c9)) {
        /#
            /#
                assertmsg("ob_aethernest_toggleable_cover" + "<unknown string>");
            #/
        #/
        return;
    }
    var_f064f548b129ddb1 = params.var_fbe755f0978c0369;
    if (!isdefined(var_f064f548b129ddb1)) {
        /#
            /#
                assertmsg("<unknown string>" + "<unknown string>");
            #/
        #/
        return;
    }
    var_e476492a3c0a252a = getscriptbundle("itemspawnentry:" + var_f064f548b129ddb1);
    if (!isdefined(var_e476492a3c0a252a)) {
        /#
            /#
                assertmsg("<unknown string>" + var_f064f548b129ddb1 + "<unknown string>");
            #/
        #/
        return;
    }
    if (var_f064f548b129ddb1 == "ob_jup_item_keycard") {
        squad = namespace_ca7b90256548aa40::getsquadmembers();
        if (squad.size == 0) {
            squad = [0:self];
        }
        foreach (var_8f7040e569ec9e98 in squad) {
            var_8f7040e569ec9e98.var_2e3a9190f3171a15 = 1;
        }
    }
}

