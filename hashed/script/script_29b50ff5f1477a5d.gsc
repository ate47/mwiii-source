// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\values.gsc;
#using script_22f1701e151b9d12;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2583ee5680cf4736;
#using script_43971bbeefd98f05;
#using script_2669878cf5a1b6bc;
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
#using scripts\engine\scriptable.gsc;
#using script_5d8202968463a21d;
#using scripts\common\vehicle.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_54be039c89fddc12;
#using script_7c40fa80892a721;
#using scripts\mp\mp_agent_damage.gsc;
#using script_5762ac2f22202ba2;
#using script_2590b7a7de3dfc79;
#using script_58be75c518bf0d40;
#using script_77be8cd2b6610d5;
#using script_7b2517368c79e5bc;
#using script_1f97a44d1761c919;
#using script_d60e0219a7419e0;
#using scripts\common\powerups.gsc;

#namespace namespace_b2b546ada8578eda;

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1b
// Size: 0xac
function function_cf070c7d20b69e36() {
    function_89384091f7a2dbd("REV_OB_AETHERNEST", 0, &function_ed03dff524b1f1ec);
    function_89384091f7a2dbd("REV_OB_AETHERNEST", 1, &function_af2f8c2f34b7292c);
    function_89384091f7a2dbd("REV_OB_AETHERNEST", 2, &function_5c710295d42036e9);
    function_89384091f7a2dbd("REV_OB_AETHERNEST", 3, &function_38736a058eca7b23);
    function_89384091f7a2dbd("REV_OB_AETHERNEST", 5, &function_f2842b850f8fed3b);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_43705e033b99948e, "REV_OB_AETHERNEST");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_f9b067b93ae7bb66, "REV_OB_AETHERNEST");
    if (!isdefined(level.var_96a2d0c3a5256c2)) {
        function_96a2d0c3a5256c2();
        level.var_96a2d0c3a5256c2 = 1;
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbce
// Size: 0xf
function function_96a2d0c3a5256c2() {
    scripts/engine/scriptable::scriptable_adddamagedcallback(&function_e9836f11aaedad08);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe4
// Size: 0x340
function function_ed03dff524b1f1ec() {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_4188e118731a30f4();
    self.variant_definition = var_45c17c8bd7095cc4;
    self.s_center = getstruct(self.varianttag, "targetname");
    self.difficulty_region = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.s_center.origin);
    switch (self.difficulty_region) {
    case #"hash_651f76c0ad6741ec":
        self.var_67d58bcaf37c2e2b = 3800;
        self.var_c305d8b37977e9c9 = 6;
        self.var_b775d3fc5973f7ac = 10;
        self.spawn_list = "ob_jup_items_activity_aethernest_red";
        break;
    case #"hash_5343b465e56ec9a4":
        self.var_67d58bcaf37c2e2b = 3125;
        self.var_c305d8b37977e9c9 = 5;
        self.var_b775d3fc5973f7ac = 9;
        self.spawn_list = "ob_jup_items_activity_aethernest_orange";
        break;
    case #"hash_af83e47edfa8900a":
        self.var_67d58bcaf37c2e2b = 1800;
        self.var_c305d8b37977e9c9 = 4;
        self.var_b775d3fc5973f7ac = 7;
        self.spawn_list = "ob_jup_items_activity_aethernest_yellow";
        break;
    case #"hash_7bb2cd766703d463":
    default:
        self.var_67d58bcaf37c2e2b = 900;
        self.var_c305d8b37977e9c9 = 3;
        self.var_b775d3fc5973f7ac = 5;
        self.difficulty_region = "difficulty_easy";
        self.spawn_list = "ob_jup_items_activity_aethernest_green";
        break;
    }
    self.floor_count = 1;
    level._effect["smoke_effect_1"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_area_500.vfx");
    level._effect["smoke_effect_4"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_vent_release.vfx");
    level._effect["camera_vfx"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_aether_cyst_spore_area_camera.vfx");
    function_b9c12dbbc627c840();
    self.var_f683875f2e47f6bc = [];
    self.crawlers = [];
    self.var_ec031f5af338bc24 = self.var_67d58bcaf37c2e2b;
    self.first_threshold = self.var_67d58bcaf37c2e2b * 0.666667;
    self.second_threshold = self.var_67d58bcaf37c2e2b * 0.333333;
    function_c2f1ea19349c995e();
    function_1055046bfeb8d74d();
    self.var_2319616d73f58983 = function_b25446edb490c05f(self.var_a0fa0c27dc0dbab1, self.var_b775d3fc5973f7ac);
    foreach (s_cyst in self.var_2319616d73f58983) {
        s_cyst.var_c32336dbbd60b8d9 = int(self.var_67d58bcaf37c2e2b / self.var_2319616d73f58983.size);
    }
    self.cysts = [];
    self.var_5eba52fdc9fb7b54 = [];
    self.var_e171f154ea4ec2c8 = 0;
    self.var_3b4e070a9fbc7044 = [];
    namespace_8480efeffcd6e233::function_2dac62aa2032b9b1("SpatialZoneContainerGroup_ActivityInstance_AwarenessZone", &function_92e06b144888d213);
    self.started = 0;
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b
// Size: 0x3b3
function function_92e06b144888d213(var_d6bfa53c531546d6) {
    if (function_de53ed8e35d0ed7a(self) != "REV_OB_AETHERNEST") {
        return;
    }
    if (!isdefined(self.players_nearby)) {
        self.players_nearby = [];
    }
    var_2788abb533782ec5 = self.players_nearby;
    self.players_nearby = var_d6bfa53c531546d6.var_9f2dab34edc7e257;
    if (self.players_nearby.size > var_2788abb533782ec5.size && var_2788abb533782ec5.size == 0) {
        switch (getmapname()) {
        case #"hash_224f194c88e9eac":
        case #"hash_330a93d145b37045":
        case #"hash_d7741d09a5c36348":
            var_b02d13c9b463922c = 1;
            break;
        default:
            var_b02d13c9b463922c = 0;
            break;
        }
        foreach (s_cyst in self.var_2319616d73f58983) {
            cyst = spawnscriptable("ob_aethernest_cyst_scriptable", s_cyst.origin, s_cyst.angles);
            cyst.s_cyst = s_cyst;
            cyst.health = s_cyst.var_c32336dbbd60b8d9;
            if (s_cyst.var_c32336dbbd60b8d9 > 0) {
                cyst.eidentifier = cyst;
                cyst.eidentifier.var_52dcdba485e7ceeb = "tag_origin";
                cyst.spawn_list = self.spawn_list;
                cyst.activity_instance = self;
                self.cysts[self.cysts.size] = cyst;
                cyst setscriptablepartstate("usable", "off");
                if (var_b02d13c9b463922c) {
                    cyst setscriptablepartstate("body", "pristine_rift_run");
                }
            } else {
                cyst setscriptablepartstate("health", "ignore_damage");
                cyst setscriptablepartstate("body", "bursted");
            }
            if (!isdefined(level.ob.cysts)) {
                level.ob.cysts = [];
            }
            level.ob.cysts = array_add(level.ob.cysts, cyst);
            self.var_5eba52fdc9fb7b54[self.var_5eba52fdc9fb7b54.size] = cyst;
        }
        return;
    }
    if (self.players_nearby.size == 0) {
        foreach (cyst in self.var_5eba52fdc9fb7b54) {
            if (isdefined(cyst) && isdefined(cyst.s_cyst) && isdefined(cyst.health)) {
                cyst.s_cyst.var_c32336dbbd60b8d9 = cyst.health;
                if (isdefined(level.ob.cysts) && array_contains(level.ob.cysts, cyst)) {
                    level.ob.cysts = array_remove(level.ob.cysts, cyst);
                }
                cyst freescriptable();
            }
        }
        self.var_5eba52fdc9fb7b54 = [];
        self.cysts = [];
        self.var_2090e50657f45b8a = 0;
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12e5
// Size: 0x5d
function function_ce5af2f09a72177a(offsets, axes) {
    x_axis = axes["forward"];
    y_axis = axes["right"];
    z_axis = axes["up"];
    return offsets[0] * x_axis + offsets[1] * y_axis + offsets[2] * z_axis;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134a
// Size: 0x180
function function_b25446edb490c05f(var_a649f057274db819, num_spawns) {
    buckets = [];
    var_8a2272f39e290538 = [];
    foreach (struct in var_a649f057274db819) {
        if (isdefined(struct.script_noteworthy)) {
            if (!isdefined(buckets[struct.script_noteworthy])) {
                buckets[struct.script_noteworthy] = [];
                var_8a2272f39e290538[var_8a2272f39e290538.size] = struct.script_noteworthy;
            }
            buckets[struct.script_noteworthy][buckets[struct.script_noteworthy].size] = struct;
        }
    }
    if (var_8a2272f39e290538.size > 0) {
        var_8a2272f39e290538 = array_randomize(var_8a2272f39e290538);
        var_a23d7a44b71c7bc1 = [];
        i = 0;
        var_1f516aa1cb36eb04 = min(num_spawns, var_a649f057274db819.size);
        while (var_a23d7a44b71c7bc1.size < var_1f516aa1cb36eb04) {
            key_index = i % var_8a2272f39e290538.size;
            if (buckets[var_8a2272f39e290538[key_index]].size > 0) {
                random_selection = array_random(buckets[var_8a2272f39e290538[key_index]]);
                buckets[var_8a2272f39e290538[key_index]] = array_remove(buckets[var_8a2272f39e290538[key_index]], random_selection);
                var_a23d7a44b71c7bc1[var_a23d7a44b71c7bc1.size] = random_selection;
            }
            i = i + 1;
        }
        return var_a23d7a44b71c7bc1;
    }
    return array_slice(array_randomize(var_a649f057274db819), 0, num_spawns);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d1
// Size: 0x3f0
function function_1055046bfeb8d74d() {
    var_4f0815c18c21f38b = getstructarray(self.varianttag, "target");
    self.var_3b71feeee7e739e1 = undefined;
    self.var_48870c486fffdeb2 = [];
    self.var_91d27f052acb9f09 = [];
    self.var_a0fa0c27dc0dbab1 = [];
    self.s_loot_cache_spawn = undefined;
    var_46a4ac8d6a98d672 = ["patch1", "patch2", "patch3", "patch4", "root1", "root2", "root3"];
    var_2e022fb2a196ab4 = ["jup_foliage_tree_roots_01", "t10_terrain_redacted_ground_patch_04", "t10_terrain_redacted_ground_patch_03", "jup_foliage_tree_roots_02", "ee_foliage_tree_spruce_01_debris_l_roots", "ee_foliage_tree_spruce_01_debris_k_roots", "ee_foliage_tree_spruce_01_debris_m_roots"];
    var_4a21f2ea02343335 = 20;
    for (index = 0; index < var_4f0815c18c21f38b.size; index++) {
        if (index % var_4a21f2ea02343335 == 0) {
            waitframe();
        }
        struct = var_4f0815c18c21f38b[index];
        if (!isdefined(struct.targetname)) {
            continue;
        } else if (struct.targetname == "ceiling_spawner") {
            self.var_3b71feeee7e739e1 = struct;
            continue;
        } else if (struct.targetname == "ceiling_zombie") {
            self.var_48870c486fffdeb2[self.var_48870c486fffdeb2.size] = struct;
            continue;
        } else if (struct.targetname == "s_cyst_spawn") {
            self.var_a0fa0c27dc0dbab1[self.var_a0fa0c27dc0dbab1.size] = struct;
            continue;
        } else if (struct.targetname == "s_loot_cache_spawn") {
            self.s_loot_cache_spawn = struct;
            continue;
        }
        if (!isdefined(self.var_91d27f052acb9f09[struct.targetname])) {
            self.var_91d27f052acb9f09[struct.targetname] = [];
        }
        self.var_91d27f052acb9f09[struct.targetname][self.var_91d27f052acb9f09[struct.targetname].size] = struct;
    }
    if (isdefined(self.s_loot_cache_spawn)) {
        cache = common_cache::cache_spawncache(#"hash_ee41a7fa562ce499", self.s_loot_cache_spawn.origin, self.s_loot_cache_spawn.angles);
        mound = spawnscriptable("ob_aethernest_toggleable_cover", self.s_loot_cache_spawn.origin, self.s_loot_cache_spawn.angles);
        mound setscriptablepartstate("state", "visible_large_hint");
        mound namespace_5775ad2badedbcaa::function_98fc2e3f04194a50(&function_ea0d2f50c264d5ef);
        self.cache = cache;
        self.cache_cover = mound;
        waitframe();
        foreach (player in level.players) {
            cache disablescriptableplayeruse(player);
        }
    }
    waitframe();
    if (isdefined(self.var_3b71feeee7e739e1)) {
        self.var_3b71feeee7e739e1.scriptable = spawnscriptable("ob_aethernest_toggleable_spawner", self.var_3b71feeee7e739e1.origin, self.var_3b71feeee7e739e1.angles);
        self.var_3b71feeee7e739e1.scriptable setscriptablepartstate("state", "visible");
        self.num_spawns = randomintrange(1, 3);
        function_e2b7429085d664a("ai_encounter:ob_aethernest_crawlers", self.num_spawns);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c8
// Size: 0x15
function function_ea0d2f50c264d5ef(scriptable, player) {
    return false;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e5
// Size: 0x172
function function_c2f1ea19349c995e() {
    if (isdefined(self.s_center.target)) {
        root_structs = getstructarray(self.s_center.target, "targetname");
        self.root_struct = getclosest(self.s_center.origin, root_structs, 1000);
        if (isdefined(self.root_struct)) {
            radius = float(default_to(self.s_center.script_noteworthy, 600));
            self.var_86ca8e1c112dc232 = getentitylessscriptablearray(self.root_struct.target, "targetname", self.s_center.origin, radius);
            self.var_dcbec0adc5c68ae8 = [];
            foreach (prop in self.var_86ca8e1c112dc232) {
                prop setscriptablepartstate("state", "visible");
                if (issubstr(prop.classname, "gas")) {
                    self.var_dcbec0adc5c68ae8[self.var_dcbec0adc5c68ae8.size] = prop;
                }
            }
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5e
// Size: 0xa5
function function_b9c12dbbc627c840() {
    trigger_volumes = function_f159c10d5cf8f0b4("aethernest_interior_trigger", "targetname");
    self.var_83116f41aad4fc96 = trigger_volumes;
    self.var_1258379e7ea78440 = [];
    foreach (trigger_volume in trigger_volumes) {
        if (is_equal(trigger_volume.target, self.varianttag)) {
            trigger_volume thread function_e94bfecc4848adc(self);
        }
    }
    thread function_82440f5119dba754();
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0a
// Size: 0x2ba
function function_e94bfecc4848adc(instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    instance endon("aethergas_cleared");
    while (true) {
        ent = self waittill("trigger");
        is_player = isplayer(ent);
        is_vehicle = ent scripts/common/vehicle::isvehicle();
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
            player.var_ce51e639071849f = gettime();
            if (!array_contains(instance.var_1258379e7ea78440, player)) {
                instance.var_1258379e7ea78440 = function_6d6af8144a5131f1(instance.var_1258379e7ea78440, player);
                player thread function_950d1ee4567388cb(self, instance);
            } else if (array_contains(instance.var_1258379e7ea78440, player) && !istrue(player.var_7bf8710b8f268d67)) {
                player thread function_950d1ee4567388cb(self, instance);
            }
        }
        var_91e59e745cfdf8a5 = function_e1b3ae526db82c88(instance);
        foreach (player in var_91e59e745cfdf8a5) {
            player.var_ce51e639071849f = gettime();
            if (!array_contains(instance.var_1258379e7ea78440, player)) {
                instance.var_1258379e7ea78440 = function_6d6af8144a5131f1(instance.var_1258379e7ea78440, player);
                player thread function_950d1ee4567388cb(self, instance);
                continue;
            }
            if (array_contains(instance.var_1258379e7ea78440, player) && !istrue(player.var_7bf8710b8f268d67)) {
                player thread function_950d1ee4567388cb(self, instance);
            }
        }
        waitframe();
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcb
// Size: 0x85
function function_e1b3ae526db82c88(activityinstance) {
    var_74cd31da10a00e02 = [];
    players_nearby = namespace_4c2b495b8d79cc2e::function_7ec62d1550b9897e(activityinstance, "Awareness_Zone");
    foreach (player in players_nearby) {
        if (player istouching(self)) {
            var_74cd31da10a00e02[var_74cd31da10a00e02.size] = player;
        }
    }
    return var_74cd31da10a00e02;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e58
// Size: 0x6a
function function_b320ab2e583e71f2(trigger, instance) {
    instance endon("activity_ended");
    instance endon("instance_destroyed");
    instance endon("aethergas_cleared");
    self endon("aethergas_exited");
    while (true) {
        ent = trigger waittill("trigger");
        if (is_equal(ent, self)) {
            self.var_ce51e639071849f = gettime();
        }
        wait(0.1);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec9
// Size: 0xf5
function function_af2f8c2f34b7292c() {
    activity_instance = self;
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    function_3e33031646de23b0(self);
    thread function_3d3f2b8fc6060ed2();
    thread function_bde54847b120dfb5();
    self waittill("aethernest_start");
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_aethernest_damaged");
    function_4dc9c5a8aa3eecd3("snd_aethernest_start", self.var_6c29f2fdb0054bbe);
    thread function_f62fd3496b0a06e8();
    self.started = 1;
    thread function_a26e39e03a0d6739();
    thread function_c769482a1e8c11d5();
    thread function_8e5f7aaa701e23f8();
    self waittill("nest_cleared");
    function_4dc9c5a8aa3eecd3("snd_aethernest_cleared", self.var_6c29f2fdb0054bbe);
    earthquake(0.6, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
    endactivity(activity_instance, 1);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc5
// Size: 0x3f
function function_9f61ce12bbb16cac() {
    self.activity_instance endon("aethernest_start");
    self endon("death");
    self endon("despawn");
    while (true) {
        namespace_53fc9ddbb516e6e1::Animscripted_SharedFunc(self.idle_anim, "idle_end", undefined, undefined);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200b
// Size: 0x4c
function function_77e6043e861fdb3b() {
    self.activity_instance endon("aethernest_start");
    activity_instance = self.activity_instance;
    self waittill("death");
    activity_instance.crawlers = array_remove(activity_instance.crawlers, self);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205e
// Size: 0x55
function function_f62fd3496b0a06e8() {
    if (isdefined(self.var_3b71feeee7e739e1)) {
        crawler = function_1757c4b6ecb2e2c6(1);
        function_1dd4c3b1da546151(crawler);
        crawler = function_1757c4b6ecb2e2c6(2);
        if (isdefined(crawler)) {
            wait(0.45);
            function_1dd4c3b1da546151(crawler);
        }
        wait(1.5);
        function_21034501787df0c9();
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ba
// Size: 0x70
function function_1757c4b6ecb2e2c6(count) {
    foreach (crawler in self.crawlers) {
        if (isalive(crawler)) {
            count = count - 1;
            if (count == 0) {
                return crawler;
            }
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2131
// Size: 0x89
function function_1dd4c3b1da546151(crawler) {
    if (isalive(crawler)) {
        crawler thread namespace_53fc9ddbb516e6e1::Animscripted_SharedFunc("spawn_nest_crawler_single", "spawn_end", undefined, undefined);
        crawler val::reset("idle_hang", "damage");
        crawler val::reset("idle_hp_bar", "show_healthbar");
        crawler.var_7c6c1f790fad020f = 0;
        crawler visiblesolid();
        self.crawlers = array_remove(self.crawlers, crawler);
        crawler.dropped = 1;
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c1
// Size: 0x90
function function_21034501787df0c9() {
    foreach (crawler in self.crawlers) {
        if (isalive(crawler)) {
            if (istrue(crawler._blackboard.animscriptedactive) && !istrue(crawler.dropped)) {
                function_1dd4c3b1da546151(crawler);
                wait(0.45);
            }
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2258
// Size: 0x89
function function_3d3f2b8fc6060ed2() {
    self endon("aethernest_start");
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_10855db46bb1b90c = 0;
    while (true) {
        nearby_players = sortbydistancecullbyradius(level.players, self.s_center.origin, 2000);
        if (nearby_players.size > 0) {
            if (!var_10855db46bb1b90c) {
                var_10855db46bb1b90c = 1;
                function_24b55c1a13b9a63a("ai_flood_fill_encounter:ob_aethernest_passive_flood_fill_encounter", undefined, self.difficulty_region);
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e8
// Size: 0xb5
function function_bde54847b120dfb5() {
    self endon("aethernest_start");
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_10855db46bb1b90c = 0;
    while (true) {
        nearby_players = sortbydistancecullbyradius(level.players, self.s_center.origin, 500);
        if (nearby_players.size > 0) {
            if (!var_10855db46bb1b90c) {
                var_10855db46bb1b90c = 1;
                if (isalive(nearby_players[0])) {
                    params = spawnstruct();
                    params.player = nearby_players[0];
                    params.player callback::callback("aethernest_approach", params);
                }
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a4
// Size: 0x63
function function_280292a937210629(players) {
    foreach (player in players) {
        player setscriptablepartstate("nest_fx", "on", 0);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x240e
// Size: 0x72
function function_45addf4a995d163(players) {
    foreach (player in players) {
        if (isdefined(player) && isalive(player)) {
            player setscriptablepartstate("nest_fx", "off", 0);
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2487
// Size: 0x48
function function_4ae44d09c29841c9(activity_instance) {
    activity_instance endon("aethernest_start");
    activity_instance endon("aethernest_cease");
    activity_instance endon("activity_ended");
    activity_instance endon("instance_destroyed");
    while (true) {
        wait(randomfloat(10));
        thread function_155971201d58c7dc("aethernest_cyst_gas_expel");
        wait(15);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d6
// Size: 0xf1
function function_82440f5119dba754() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self endon("aethergas_cleared");
    while (true) {
        exit_buffer = ter_op(self.var_1258379e7ea78440.size > 8, 400, 200);
        foreach (player in self.var_1258379e7ea78440) {
            if (isplayer(player) && isdefined(player.var_ce51e639071849f) && gettime() - player.var_ce51e639071849f > exit_buffer) {
                var_7b24f88f7b6ff5da = player getistouchingentities(self.var_83116f41aad4fc96);
                if (var_7b24f88f7b6ff5da.size == 0) {
                    player thread function_b006b89a63144ac5(self);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ce
// Size: 0x158
function function_950d1ee4567388cb(trigger, activity_instance) {
    self endon("death");
    self endon("aethergas_cleared");
    self endon("aethergas_exited");
    thread function_25dfef63d653d7ca();
    scripts/cp_mp/killstreaks/white_phosphorus::enableloopingcoughaudio();
    function_280292a937210629([self]);
    if (scripts/cp_mp/gasmask::hasgasmask(self)) {
        if (!namespace_8055140764bdf2f4::function_aeffe7dc479451ad()) {
            if (isdefined(level.var_f26b4e7eb9af8155)) {
                self [[ level.var_f26b4e7eb9af8155 ]]("aether_gas");
            } else if (!istrue(self.gasmaskequipped)) {
                self notify("toggle_gasmask");
            }
        }
    }
    wait(1);
    while (true) {
        if (istrue(self.gasmaskequipped)) {
            scripts/cp_mp/gasmask::processdamage(3.6);
        } else {
            self dodamage(3.6, self.origin, self, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            namespace_f8d3520d3483c1::damagearmor(3.6, undefined, self, "MOD_TRIGGER_HURT");
            if (scripts/cp_mp/gasmask::hasgasmask(self)) {
                scripts/cp_mp/gasmask::processdamage(3.6);
            }
        }
        if (!istrue(self.gasmaskequipped)) {
            if (scripts/cp_mp/gasmask::hasgasmask(self)) {
                if (!namespace_8055140764bdf2f4::function_aeffe7dc479451ad()) {
                    if (isdefined(level.var_f26b4e7eb9af8155)) {
                        self [[ level.var_f26b4e7eb9af8155 ]]("aether_gas");
                    }
                }
            } else if (loopingcoughaudioissupressed()) {
                scripts/cp_mp/killstreaks/white_phosphorus::disableloopingcoughaudiosupression();
            }
        }
        wait(1.6);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272d
// Size: 0x27
function function_25dfef63d653d7ca() {
    self endon("disconnect");
    self.var_7bf8710b8f268d67 = 1;
    self waittill("death");
    self.var_7bf8710b8f268d67 = 0;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275b
// Size: 0xa5
function function_b006b89a63144ac5(activity_instance) {
    self notify("aethergas_exited");
    scripts/cp_mp/killstreaks/white_phosphorus::disableloopingcoughaudio();
    scripts/cp_mp/killstreaks/white_phosphorus::clearloopingcoughaudio();
    function_45addf4a995d163([self]);
    if (isdefined(activity_instance)) {
        activity_instance.var_1258379e7ea78440 = array_remove(activity_instance.var_1258379e7ea78440, self);
    }
    if (istrue(self.gasmaskequipped) || istrue(self.gasmaskswapinprogress) && !istrue(self.gasmaskequipped)) {
        if (isdefined(level.var_c57ee1e174e42601)) {
            self [[ level.var_c57ee1e174e42601 ]]("aether_gas");
            return;
        }
        self notify("toggle_gasmask");
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2807
// Size: 0x1a
function function_b4e25f2d73c0223b(idamage) {
    return int(max(idamage, 500));
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2829
// Size: 0x417
function function_e9836f11aaedad08(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!is_equal(instance.type, "ob_aethernest_cyst_scriptable") || istrue(instance.destroyed)) {
        return;
    }
    if (isdefined(instance.playerusing)) {
        return;
    }
    if (isdefined(instance.spawner)) {
        instance.spawner notify("start_spawn");
    }
    if (weapon::iswonderweapon(objweapon)) {
        idamage = function_b4e25f2d73c0223b(idamage);
    }
    if (isdefined(instance.health)) {
        instance.health = instance.health - idamage;
        if (isplayer(eattacker)) {
            instance.var_f49149402765ecae = function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
            if (scripts/mp/mp_agent_damage::function_87c3b43d00319847()) {
                scripts/mp/mp_agent_damage::function_c54b2cc2e762c201(eattacker, instance.eidentifier, "none", smeansofdeath, objweapon, int(idamage), undefined, 0, undefined, 0, 0);
            }
            eattacker namespace_e072c8407b2a861c::updatehitmarker("standard", instance.health <= 0, 0, 0, undefined);
            if (!array_contains(instance.activity_instance.var_6c29f2fdb0054bbe, eattacker)) {
                function_bbdcd857d0c2a65e(instance.activity_instance, eattacker);
            }
        }
        instance.activity_instance.last_player_attacker = eattacker;
        if (!instance.activity_instance.started) {
            instance.activity_instance notify("aethernest_start");
        }
        instance.activity_instance function_9ca778648cd6e0c8(idamage);
        if (instance.health <= 0) {
            eattacker namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_626189d6229d39b4");
            instance thread function_155971201d58c7dc("aethernest_cyst_gas_burst");
            instance.destroyed = 1;
            instance setscriptablepartstate("usable", "off");
            params = spawnstruct();
            params.player = eattacker;
            params.cyst = instance;
            eattacker callback::callback("aethernest_cyst_destroyed", params);
            if (isdefined(instance.spawningsquad) && !isdefined(instance.var_26fd9d9c73229afe)) {
                instance.activity_instance.var_2090e50657f45b8a = 0;
            }
            if (function_de53ed8e35d0ed7a(instance.activity_instance) == "REV_OB_ZOMBIE_STRONGHOLD") {
                if (isplayer(eattacker) && !istrue(eattacker.var_d45cc2b767709d2d)) {
                    squad = eattacker namespace_ca7b90256548aa40::getsquadmembers();
                    if (squad.size == 0) {
                        squad = [eattacker];
                    }
                    instance.activity_instance thread function_1281c7fff9456e18("zm_stronghold_destroy_cyst");
                    foreach (squadmate in squad) {
                        squadmate.var_d45cc2b767709d2d = 1;
                    }
                }
            }
            return;
        }
        if (isdefined(instance.activity_instance.var_3b4e070a9fbc7044) && !istrue(instance.activity_instance.var_2090e50657f45b8a) && !array_contains(instance.activity_instance.var_3b4e070a9fbc7044, eattacker) && isdefined(level.var_d0ae7d85b0070ba0) && [[ level.var_d0ae7d85b0070ba0 ]](eattacker) && namespace_28253c2ed4569abd::get_element(objweapon, eattacker, smeansofdeath) == "toxic") {
            function_60302fa0d978c62b(instance, eattacker);
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c47
// Size: 0x81
function function_60302fa0d978c62b(scriptable, player) {
    scriptable setscriptablepartstate("body", "rift_gate_quest_model");
    scriptable setscriptablepartstate("usable", "on");
    namespace_5775ad2badedbcaa::function_32645103f7520635(scriptable, &function_5251088e615017c5, undefined, &function_a71cfebe6cfde69b);
    scriptable namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_d3af10ea2f04c99b);
    scriptable.activity_instance.var_2090e50657f45b8a = 1;
    scriptable.spawningsquad = player namespace_ca7b90256548aa40::getsquadmembers();
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ccf
// Size: 0x58
function function_a71cfebe6cfde69b(player) {
    if (isdefined(self.playerusing) && self.playerusing != player) {
        return;
    }
    player endon("interaction_complete");
    player endon("death");
    self.playerusing = player;
    while (player usebuttonpressed()) {
        waitframe();
    }
    self.playerusing = undefined;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2e
// Size: 0x85
function function_d3af10ea2f04c99b(interact, player) {
    if (isdefined(interact.playerusing) && interact.playerusing != player || !array_contains(interact.spawningsquad, player)) {
        return {string:"", type:"HINT_NOBUTTON"};
    }
    return {string:"JUP_OB_S1/RIFT_GATE_QUEST_CYST_INTERACT_HINT", type:"HINT_BUTTON"};
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dbb
// Size: 0x7c
function function_5251088e615017c5(player) {
    self.spawningsquad = player namespace_ca7b90256548aa40::getsquadmembers();
    player notify("interaction_complete");
    self.var_26fd9d9c73229afe = player;
    self.playerusing = undefined;
    self.health = 0;
    player namespace_301533d2f1378cb9::function_ddee59d6b1a2b9e(#"hash_626189d6229d39b4");
    thread function_155971201d58c7dc("aethernest_cyst_gas_burst");
    self.destroyed = 1;
    self setscriptablepartstate("usable", "off");
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3e
// Size: 0x78
function function_9ca778648cd6e0c8(damage) {
    current_health = function_9883479ef6511b80();
    prev_health = current_health + damage;
    if (prev_health >= self.first_threshold && current_health <= self.first_threshold) {
        self notify("first_threshold_reached");
        return;
    }
    if (prev_health >= self.second_threshold && current_health <= self.second_threshold) {
        self notify("second_threshold_reached");
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebd
// Size: 0x76
function function_9883479ef6511b80() {
    current_health = 0;
    foreach (cyst in self.cysts) {
        current_health = current_health + cyst.health;
    }
    self.var_ec031f5af338bc24 = current_health;
    return current_health;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f3b
// Size: 0xa9
function function_c769482a1e8c11d5() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (true) {
        self waittill("cyst_cleared");
        if (self.var_e171f154ea4ec2c8 == self.var_b775d3fc5973f7ac) {
            self notify("aethergas_cleared");
            foreach (player in self.var_1258379e7ea78440) {
                player notify("aethergas_cleared");
                player thread function_b006b89a63144ac5();
            }
            break;
        }
        waitframe();
    }
    self notify("nest_cleared");
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2feb
// Size: 0x10b
function function_8e5f7aaa701e23f8() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    function_24b55c1a13b9a63a("ai_flood_fill_encounter:ob_aethernest_flood_fill_encounter", undefined, undefined, 1);
    self waittill("first_threshold_reached");
    thread wave_logic("second_threshold_reached", "size_5", 16);
    function_4dc9c5a8aa3eecd3("snd_aethernest_healthchange", self.var_6c29f2fdb0054bbe);
    earthquake(0.35, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
    self waittill("second_threshold_reached");
    thread wave_logic("nest_cleared", "size_7", 20);
    function_4dc9c5a8aa3eecd3("snd_aethernest_healthchange", self.var_6c29f2fdb0054bbe);
    earthquake(0.47, 1.7, self.s_center.origin, 500);
    playrumbleonposition("grenade_rumble", self.s_center.origin);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30fd
// Size: 0x7e
function wave_logic(endon_tag, size_tag, wait_time) {
    if (isdefined(endon_tag)) {
        self endon(endon_tag);
    }
    self endon("activity_ended");
    self endon("instance_destroyed");
    thread function_b4adf91e395e53f0();
    if (isdefined(size_tag)) {
        function_24b55c1a13b9a63a("ai_encounter:ob_aethernest_encounter", size_tag, self.difficulty_region);
    } else {
        function_24b55c1a13b9a63a("ai_encounter:ob_aethernest_encounter");
    }
    wait(wait_time);
    function_24b55c1a13b9a63a("ai_flood_fill_encounter:ob_aethernest_flood_fill_encounter", undefined, self.difficulty_region, 1);
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3182
// Size: 0x6c
function function_b4adf91e395e53f0() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    foreach (cyst in self.cysts) {
        cyst thread function_155971201d58c7dc("aethernest_cyst_gas_expel");
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f5
// Size: 0x2bd
function function_155971201d58c7dc(effect_type) {
    self endon("death");
    switch (effect_type) {
    case #"hash_2f0f62be9305365f":
        self setscriptablepartstate("health", "ignore_damage");
        self setscriptablepartstate("body", "bursted");
        self.activity_instance.var_779e11fc33f215f9 = self.s_cyst;
        self.activity_instance.cysts = array_remove(self.activity_instance.cysts, self);
        self.activity_instance.var_e171f154ea4ec2c8 = self.activity_instance.var_e171f154ea4ec2c8 + 1;
        var_375c9bbee9c8fdf6 = self.spawn_list;
        var_5edfc5b3c4d591b1 = self.origin;
        var_bd4ee238fcb23d3f = self.angles;
        waitframe();
        self.activity_instance notify("cyst_cleared");
        wait(0.5);
        if (isdefined(self.var_26fd9d9c73229afe)) {
            itembundlename = "ob_jup_item_key_rift_gate_season1_toxic";
            itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
            payload = [#"teamselect", self.var_26fd9d9c73229afe getentitynumber()];
            a_squad = self.var_26fd9d9c73229afe namespace_ca7b90256548aa40::getsquadmembers();
            item = namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, self.origin + anglestoup(self.angles) * 7, self.angles + (7, 7, 7), 1, 0, payload);
            self.activity_instance.var_2090e50657f45b8a = 0;
            self.activity_instance.var_3b4e070a9fbc7044 = array_combine(self.activity_instance.var_3b4e070a9fbc7044, a_squad);
            params = spawnstruct();
            params.item = item;
            params.itembundlename = itembundlename;
            params.payload = payload;
            if (isdefined(level.var_8b939fbe0ef2d56b)) {
                self.var_26fd9d9c73229afe [[ level.var_8b939fbe0ef2d56b ]](params);
            }
            thread namespace_446fc987a980892f::playevent("quest_s1_rift_gate_unlock_object_acquired", a_squad, 1);
        } else {
            namespace_2abc885019e1956::function_cd45408bd44fab07(var_375c9bbee9c8fdf6, 1, var_5edfc5b3c4d591b1 + anglestoup(var_bd4ee238fcb23d3f) * 10);
        }
        wait(2);
        break;
    case #"hash_9a6d8b5ace91c19b":
    default:
        break;
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b9
// Size: 0xfb
function function_24b55c1a13b9a63a(bundle, var_f555f0c2ce194ea8, var_4f51b9f082dab4dd, var_92190fa0ccb5e392) {
    encounter_radius = 250;
    z_clamp = 50;
    centerpoint = self.s_center.origin + (0, 0, z_clamp * (self.floor_count - 1));
    self.encounterid = function_f8ccadcd850da124(bundle, centerpoint, encounter_radius, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        if (isdefined(var_f555f0c2ce194ea8)) {
            function_d37068aac7785c04(self.encounterid, var_f555f0c2ce194ea8, 1);
        }
        if (isdefined(var_4f51b9f082dab4dd)) {
            function_d37068aac7785c04(self.encounterid, var_4f51b9f082dab4dd, 1);
        }
        function_ce9c21523336cdbc(self.encounterid, &function_92eab905b00e7dd2, self);
        if (isdefined(var_92190fa0ccb5e392)) {
            if (var_92190fa0ccb5e392) {
                function_4b7d420e1bad897f(self.encounterid, self.var_c305d8b37977e9c9);
            }
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35bb
// Size: 0x82
function function_e2b7429085d664a(bundle, num_spawns) {
    centerpoint = self.var_3b71feeee7e739e1.origin;
    self.encounterid = function_f8ccadcd850da124(bundle, centerpoint, 80, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        function_d37068aac7785c04(self.encounterid, num_spawns, 1);
        function_ce9c21523336cdbc(self.encounterid, &function_c2efd8eb6c962bc2, self);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3644
// Size: 0x78
function function_cadda8ac1fffb5(bundle, optional_tag, suffix) {
    self.encounterid = function_3ee36bc763779ba1(self.varianttag + suffix, 1, 1, 1, 2);
    if (isdefined(self.encounterid)) {
        if (isdefined(optional_tag)) {
            function_d37068aac7785c04(self.encounterid, optional_tag, 1);
        }
        function_ce9c21523336cdbc(self.encounterid, &function_92eab905b00e7dd2, self);
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c3
// Size: 0x62
function function_92eab905b00e7dd2(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        activityinstance = userdata;
        if (isdefined(activityinstance.last_player_attacker)) {
            agent function_a047f71d0256058b(activityinstance.last_player_attacker);
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x372c
// Size: 0x112
function function_c2efd8eb6c962bc2(requestid, userdata, agent, data) {
    agent endon("death");
    if (isalive(agent)) {
        data.spawnspeed = 2;
        activityinstance = userdata;
        crawler = agent;
        crawler val::set("idle_hang", "damage", 0);
        crawler val::set("idle_hp_bar", "show_healthbar", 0);
        crawler.activity_instance = activityinstance;
        crawler.idle_anim = "nest_crawler_idle_two_drop_01";
        crawler.var_7c6c1f790fad020f = 1;
        crawler visiblenotsolid();
        crawler thread function_9f61ce12bbb16cac();
        crawler thread function_77e6043e861fdb3b();
        activityinstance.crawlers[activityinstance.crawlers.size] = crawler;
        crawler ent_flag_wait("zombie_asm_init_finished");
        if (!isdefined(crawler.animname)) {
            crawler.animname = crawler.animsetname;
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3845
// Size: 0x18
function function_2f109c081d5fd179(obj) {
    if (isdefined(obj)) {
        obj delete();
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3864
// Size: 0x51
function function_f2842b850f8fed3b() {
    var_cc7aa96a854fd8ee = spawnstruct();
    var_cc7aa96a854fd8ee.origin = self.s_center.origin;
    var_cc7aa96a854fd8ee.angles = self.s_center.angles;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bc
// Size: 0x38
function function_43705e033b99948e(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38fb
// Size: 0x78
function function_f9b067b93ae7bb66(var_b381b0883bcd4847) {
    player_list = var_b381b0883bcd4847.playerlist;
    foreach (player in player_list) {
        if (isplayer(player)) {
            player notify("left_aethernest");
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397a
// Size: 0x245
function function_5c710295d42036e9() {
    self endon("instance_destroyed");
    thread function_a26e39e03a0d6739();
    function_45addf4a995d163(self.var_1258379e7ea78440);
    if (self.var_8b79601f5cca1fa9) {
        namespace_40713433c91dd86c::function_c402ecda1e84ba27(self.var_6c29f2fdb0054bbe, 0, self.difficulty_region, self.s_center.origin);
        scripts/common/powerups::powerup_drop("full_ammo", getclosestpointonnavmesh(self.s_center.origin) + (0, 0, 30));
        if (isdefined(self.cache)) {
            self.cache_cover setscriptablepartstate("state", "dead");
            self.cache setscriptablepartstate("body", "closed_usable");
            foreach (player in level.players) {
                self.cache enablescriptableplayeruse(player);
            }
        }
        foreach (player in self.var_6c29f2fdb0054bbe) {
            player thread function_b006b89a63144ac5();
        }
    }
    if (isdefined(self.gas_vfx)) {
        foreach (vfx in self.gas_vfx) {
            function_2f109c081d5fd179(vfx);
        }
    }
    if (isdefined(self.var_dcbec0adc5c68ae8)) {
        foreach (gas in self.var_dcbec0adc5c68ae8) {
            gas setscriptablepartstate("state", "hidden");
        }
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc6
// Size: 0x204
function function_38736a058eca7b23() {
    self endon("instance_destroyed");
    self notify("aethernest_cease");
    thread function_a26e39e03a0d6739();
    function_45addf4a995d163(self.var_1258379e7ea78440);
    if (isdefined(self.gas_vfx)) {
        foreach (vfx in self.gas_vfx) {
            function_2f109c081d5fd179(vfx);
        }
    }
    foreach (cyst in self.var_5eba52fdc9fb7b54) {
        cyst freescriptable();
    }
    if (isdefined(self.cache)) {
        self.cache freescriptable();
    }
    if (isdefined(self.cache_cover)) {
        self.cache_cover freescriptable();
    }
    if (isdefined(self.var_85c0a3df419144e7)) {
        foreach (prop in self.var_85c0a3df419144e7) {
            function_2f109c081d5fd179(prop);
        }
    }
    if (isdefined(self.var_86ca8e1c112dc232)) {
        foreach (prop in self.var_86ca8e1c112dc232) {
            prop setscriptablepartstate("state", "hidden");
        }
    }
    if (isdefined(self.var_3b71feeee7e739e1)) {
        self.var_3b71feeee7e739e1.scriptable freescriptable();
    }
}

// Namespace namespace_b2b546ada8578eda / namespace_b45a9c6ad5a91687
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dd1
// Size: 0x6a
function function_4dc9c5a8aa3eecd3(soundevent, array_players) {
    foreach (player in array_players) {
        if (isplayer(player)) {
            player playsoundevent(soundevent);
        }
    }
}

