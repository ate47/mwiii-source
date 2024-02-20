// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3e31016b9c11a616;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_4ef01fe6151dde4d;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_3a13b8032b62a5e6;
#using script_639bf783929acf9b;
#using script_638d701d263ee1ed;
#using script_7b2517368c79e5bc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4e6e58ab5d96c2b0;
#using script_5753ba9c28794a65;
#using script_22f1701e151b9d12;
#using script_16ea1b94f0f381b3;
#using script_39d11000e476a42a;
#using script_46c7c73b1a7e4773;
#using script_24f248b33b79e48d;
#using script_7f5e7a3cb514aca5;
#using script_3e34d236a84cfd96;

#namespace namespace_39f971ea9ca4fb9e;

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f
// Size: 0xc9
function function_d745018e64b6b902() {
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 0, &function_866135ff44f9a1b8);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 1, &function_1ddc9629c6534e38);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 2, &function_7b0fea7ae2112c25);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 3, &function_d17f711a3cf0d287);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 4, &function_6f747a641f77773c);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 5, &function_3d2a5e67e320a325);
    function_89384091f7a2dbd("REV_OB_BIGBOUNTY", 7, &function_93cc9badd07b3211);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_e2827300b9992692, "REV_OB_BIGBOUNTY");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_f0f14142a301b2e2, "REV_OB_BIGBOUNTY");
    function_8b5b2a3392fc7e2a("PlayerAbandon", &function_540f9b357f3b5419, "REV_OB_BIGBOUNTY");
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ff
// Size: 0x8d8
function function_866135ff44f9a1b8() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_45c17c8bd7095cc4 = function_b9c4aa88ad97ee68(self);
    self.var_7fef38b419e7c59a = var_45c17c8bd7095cc4;
    self.var_5078a08cc4ec9d12 = self.var_7fef38b419e7c59a.var_5078a08cc4ec9d12;
    self.circleradius = self.var_7fef38b419e7c59a.circleradius;
    self.var_66f9956b2a6b757e = self.var_7fef38b419e7c59a.maxdist;
    self.var_90e8bfde8e2a83f0 = self.var_7fef38b419e7c59a.mindist;
    self.var_4158f9fefbe61805 = self.var_7fef38b419e7c59a.var_4158f9fefbe61805;
    self.keylist = self.var_7fef38b419e7c59a.keylist;
    self.var_b226288584700d27 = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_a465314411ea4812;
    self.var_d51c5b5df247c905 = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.zoffset;
    self.var_f70e74acfb34f2b4 = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_5d0d0b335ab5007b;
    self.var_d24c97a0ba2de66f = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_9701643a970cc39c;
    self.var_664da60d21c76e48 = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_92fb51b98f7917ef;
    self.var_c55e3742fdc960b7 = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_3ed4a0ea874a05d4;
    self.var_85d91e92ec51fd5a = self.var_7fef38b419e7c59a.var_a138c52fb25ab79e.var_85d91e92ec51fd5a;
    self.var_4a30e8b5f565a933 = [];
    self.var_4a30e8b5f565a933["difficulty_easy"] = [];
    self.var_4a30e8b5f565a933["difficulty_normal"] = [];
    self.var_4a30e8b5f565a933["difficulty_hard"] = [];
    self.var_4a30e8b5f565a933["difficulty_darkaether"] = [];
    foreach (struct in self.var_7fef38b419e7c59a.var_36580a8603f37d28) {
        self.var_4a30e8b5f565a933["difficulty_easy"] = function_6d6af8144a5131f1(self.var_4a30e8b5f565a933["difficulty_easy"], struct.var_42dc5ba76891bff9);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_d5f514e3f40b591f) {
        self.var_4a30e8b5f565a933["difficulty_normal"] = function_6d6af8144a5131f1(self.var_4a30e8b5f565a933["difficulty_normal"], struct.var_42dc5ba76891bff9);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_202004aa59cd95a5) {
        self.var_4a30e8b5f565a933["difficulty_hard"] = function_6d6af8144a5131f1(self.var_4a30e8b5f565a933["difficulty_hard"], struct.var_42dc5ba76891bff9);
    }
    foreach (struct in self.var_7fef38b419e7c59a.var_8db5d77e931fbc88) {
        self.var_4a30e8b5f565a933["difficulty_darkaether"] = function_6d6af8144a5131f1(self.var_4a30e8b5f565a933["difficulty_darkaether"], struct.var_42dc5ba76891bff9);
    }
    var_f923d1b5e7f75c3b = function_4481ee309bf2c75c(var_2f5d509d7b71ce9a);
    if (isdefined(var_f923d1b5e7f75c3b) && isstring(var_f923d1b5e7f75c3b.str_ai)) {
        self.var_db0e660397a76bd8 = var_f923d1b5e7f75c3b.str_ai;
        self.var_24a16c52437dde0f = 1;
        callback::callback("big_bounty_quest_contract_starting", {player:var_f923d1b5e7f75c3b.var_b20fac6bac1d6fde, instance:var_2f5d509d7b71ce9a});
    }
    self.var_97e3283eeb5e237b = function_415547ee4122c2ca();
    if (!isdefined(self.var_db0e660397a76bd8)) {
        switch (self.var_97e3283eeb5e237b) {
        case #"hash_7bb2cd766703d463":
            self.var_3d51c5307549c964 = self.var_7fef38b419e7c59a.var_4d335db04f92489e;
            break;
        case #"hash_af83e47edfa8900a":
            self.var_3d51c5307549c964 = self.var_7fef38b419e7c59a.var_3db5481149848407;
            break;
        case #"hash_5343b465e56ec9a4":
            self.var_3d51c5307549c964 = self.var_7fef38b419e7c59a.var_eb166bed99d3ea61;
            break;
        case #"hash_651f76c0ad6741ec":
            self.var_3d51c5307549c964 = self.var_7fef38b419e7c59a.var_82482014ca52c65e;
            break;
        default:
            self.var_3d51c5307549c964 = self.var_7fef38b419e7c59a.var_4d335db04f92489e;
            break;
        }
        weights = [];
        foreach (ai in self.var_3d51c5307549c964) {
            weights = array_add(weights, ai.weight);
        }
        var_f1164393dac4665a = function_6e4039e57d0a3e7e(self.var_3d51c5307549c964, weights);
        self.var_db0e660397a76bd8 = var_f1164393dac4665a.var_c8b64adafd8e5711;
    }
    switch (self.var_db0e660397a76bd8) {
    case #"hash_c1fa8721b046b258":
        self.ai_type = "mimic";
        self.var_20e5602e719b2988 = self.var_f70e74acfb34f2b4;
        break;
    case #"hash_60cbd0daf82a39c9":
        self.ai_type = "mangler";
        self.var_20e5602e719b2988 = self.var_d24c97a0ba2de66f;
        break;
    case #"hash_c1b612499d7bd4a":
        self.ai_type = "disciple";
        self.var_20e5602e719b2988 = self.var_664da60d21c76e48;
        break;
    case #"hash_a18ec1c48b974dc7":
        self.ai_type = "megabomb";
        self.var_20e5602e719b2988 = self.var_c55e3742fdc960b7;
        break;
    }
    if (getdvarint(@"hash_a727d89442d7861", 0)) {
        self.ai_type = "mimic";
        self.var_db0e660397a76bd8 = "zombie_mimic_hvt";
        self.var_20e5602e719b2988 = self.var_f70e74acfb34f2b4;
    } else if (getdvarint(@"hash_33cc263918e8c228", 0)) {
        self.ai_type = "mangler";
        self.var_db0e660397a76bd8 = "zombie_mangler_hvt";
        self.var_20e5602e719b2988 = self.var_d24c97a0ba2de66f;
    } else if (getdvarint(@"hash_f85b2e43578eeb5b", 0)) {
        self.ai_type = "disciple";
        self.var_db0e660397a76bd8 = "zombie_disciple_hvt";
        self.var_20e5602e719b2988 = self.var_664da60d21c76e48;
    } else if (getdvarint(@"hash_ce59878585b9d4e6", 0)) {
        self.ai_type = "megabomb";
        self.var_db0e660397a76bd8 = "zombie_abom_mega_hvt";
        self.var_20e5602e719b2988 = self.var_c55e3742fdc960b7;
    }
    var_93249e2e66af0afc = getstructarray(self.var_626b45032e1892da, "target");
    self.var_bd16f0d97883fd8d = var_93249e2e66af0afc[0];
    foreach (struct in var_93249e2e66af0afc) {
        if (isdefined(struct.targetname)) {
            switch (struct.targetname) {
            case #"hash_dbd5b76bf287c738":
                self.var_bd16f0d97883fd8d = struct;
                break;
            }
        }
    }
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xede
// Size: 0x3e
function function_44c6c04fa367baea(point) {
    difficulty_region = undefined;
    difficulty_region = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(point);
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf24
// Size: 0x4d
function function_415547ee4122c2ca() {
    difficulty_region = undefined;
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(self));
    }
    if (!isdefined(difficulty_region) || is_equal(difficulty_region, "difficulty_undefined")) {
        return "difficulty_easy";
    }
    return difficulty_region;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79
// Size: 0x7b
function function_a551ec2d5303061b(struct, maxdist) {
    if (distancesquared(struct.origin, self.var_bd16f0d97883fd8d.origin) >= squared(self.var_90e8bfde8e2a83f0) && distancesquared(struct.origin, self.var_bd16f0d97883fd8d.origin) <= squared(maxdist)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffc
// Size: 0x1d9
function function_1ddc9629c6534e38() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self.var_d781ff762095c86d = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16651, "quest_s0a2t3_bountyhunt_start", self.var_6c29f2fdb0054bbe);
    if (!self.var_d781ff762095c86d && !istrue(self.var_24a16c52437dde0f)) {
        thread function_1281c7fff9456e18("contract_bigbounty_start");
    }
    foreach (player in self.var_6c29f2fdb0054bbe) {
        player setclientomnvar("ui_br_objective_param", function_e56334b856964aef());
        params = spawnstruct();
        params.player = player;
        callback::callback("big_bounty_started", params);
    }
    function_e4dae689f876b8ba();
    function_70785f5ff53b07c9();
    self.ai_zombie waittill("death");
    var_1781558a71899b5f = getgroundposition(self.ai_zombie.origin, 1);
    if (!isdefined(var_1781558a71899b5f)) {
        var_1781558a71899b5f = self.ai_zombie.origin;
    }
    self.var_fa72b05f74204fb9 = var_1781558a71899b5f;
    var_ec5900b94ec05c4a = (var_1781558a71899b5f[0], var_1781558a71899b5f[1], var_1781558a71899b5f[2] - 1);
    self.var_e08f3403dfd64b48 = utility::spawn_model("jup_zm_pile_of_goo", var_ec5900b94ec05c4a, self.ai_zombie.angles);
    self.var_e08f3403dfd64b48 setscriptablepartstate("audio", "spawned");
    var_6c29f2fdb0054bbe = self.var_6c29f2fdb0054bbe;
    thread function_6f3caa9ac6c424a9(var_6c29f2fdb0054bbe, var_1781558a71899b5f);
    function_2c8097c0bcd7e70();
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11dc
// Size: 0x145
function function_6f3caa9ac6c424a9(players, var_1781558a71899b5f) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    if (istrue(self.var_24a16c52437dde0f)) {
        return;
    }
    var_f8f4f21c37f86c70 = namespace_c47da9d4c2db4f0d::function_709eb291cbeeb02(self, "contract_bigbounty_ee_goo");
    wait(4);
    while (1) {
        foreach (player in players) {
            if (isdefined(player) && isalive(player) && isdefined(var_1781558a71899b5f)) {
                dist = distancesquared(player.origin, var_1781558a71899b5f);
                if (dist < squared(100) && namespace_3c37cb17ade254d::within_fov(player.origin, player.angles, var_1781558a71899b5f, cos(70))) {
                    eyepos = player geteye();
                    if (sighttracepassed(eyepos, var_1781558a71899b5f, 1, player, self.var_e08f3403dfd64b48)) {
                        broadcast(var_f8f4f21c37f86c70, [0:player]);
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1328
// Size: 0x33
function function_2c8097c0bcd7e70() {
    var_2f5d509d7b71ce9a = self;
    if (!istrue(self.var_24a16c52437dde0f)) {
        thread function_1281c7fff9456e18("contract_bigbounty_success");
    }
    function_612d18fdbc979c0b(var_2f5d509d7b71ce9a, 1);
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1362
// Size: 0x141
function function_3bab4fee62f0fbd8() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("AI_seen");
    while (1) {
        if (distancesquared(self.ai_zombie.origin, self.var_7ca681f995301d27) > squared(self.circleradius)) {
            self notify("bigbounty_ping_marker_moved");
            self.var_7ca681f995301d27 = function_b51e0dd3c4ef0eed(self.var_756a07c77406000b);
            foreach (player in self.var_6c29f2fdb0054bbe) {
                if (isdefined(player)) {
                    self.var_394466c2ddb208cb = player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.var_7ca681f995301d27, self.var_e59541d364064648);
                    thread namespace_ede58c1e66c2c280::function_9a7200f5142066ba(player, self.var_394466c2ddb208cb, undefined, [0:"bigbounty_ping_marker_moved"]);
                    break;
                }
            }
            namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_e59541d364064648, self.var_7ca681f995301d27);
            function_6e148c8da2e4db13(self.var_7ca681f995301d27);
        }
        wait(5);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14aa
// Size: 0x22d
function function_6b9c1b0c02633e65() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self endon("AI_seen");
    while (1) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (!isdefined(player) || !isalive(player)) {
                continue;
            }
            dist = distancesquared(player.origin, self.ai_zombie.origin);
            if (dist < squared(2000) && namespace_3c37cb17ade254d::within_fov(player.origin, player.angles, self.ai_zombie.origin, cos(70))) {
                seen = 0;
                var_73b566ef640efc09 = (self.ai_zombie.origin[0], self.ai_zombie.origin[1], self.ai_zombie.origin[2] + 50);
                eyepos = player geteye();
                waitframe();
                if (sighttracepassed(eyepos, var_73b566ef640efc09, 1, player, self.ai_zombie)) {
                    function_d81084befdcda4a5();
                    seen = 1;
                    self notify("AI_seen");
                }
                if (self.ai_type == "megabomb" && !seen) {
                    var_73b566ef640efc09 = (self.ai_zombie.origin[0], self.ai_zombie.origin[1], self.ai_zombie.origin[2] + 200);
                    eyepos = player geteye();
                    waitframe();
                    if (sighttracepassed(eyepos, var_73b566ef640efc09, 1, player, self.ai_zombie)) {
                        function_d81084befdcda4a5();
                        self notify("AI_seen");
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16de
// Size: 0x44
function function_d81084befdcda4a5() {
    function_4eaf685bc40a3b9();
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.var_e59541d364064648, self.ai_zombie);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.var_e59541d364064648, self.var_20e5602e719b2988);
    thread namespace_b3f32c8cb80b8124::function_e73a92bbeb2ae323();
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1729
// Size: 0x9a
function function_b51e0dd3c4ef0eed(spawn_struct) {
    x_offset = randomintrange(self.var_85d91e92ec51fd5a * -1, self.var_85d91e92ec51fd5a);
    y_offset = randomintrange(self.var_85d91e92ec51fd5a * -1, self.var_85d91e92ec51fd5a);
    var_aa7e8b285ba5b96d = (spawn_struct.origin[0] + x_offset, spawn_struct.origin[1] + y_offset, spawn_struct.origin[2] + self.var_d51c5b5df247c905);
    return var_aa7e8b285ba5b96d;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17cb
// Size: 0x50
function private function_e56334b856964aef() {
    switch (self.var_db0e660397a76bd8) {
    case #"hash_c1fa8721b046b258":
        return 1;
    case #"hash_60cbd0daf82a39c9":
        return 2;
    case #"hash_c1b612499d7bd4a":
        return 3;
    case #"hash_a18ec1c48b974dc7":
        return 4;
        break;
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1822
// Size: 0x2b
function function_a8a2b5385efae3a6() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.var_c49cbe01c668b84b = 0;
    function_ec0ae7d1127fa00(self.var_97e3283eeb5e237b);
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1854
// Size: 0x1a6
function function_ec0ae7d1127fa00(region) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    if (!isdefined(self.var_4a30e8b5f565a933[self.var_97e3283eeb5e237b][0])) {
        return;
    }
    var_934083a148144947 = "ai_flood_fill_encounter:" + self.var_4a30e8b5f565a933[self.var_97e3283eeb5e237b][self.var_c49cbe01c668b84b];
    self.var_e90e6921b79022f5 = function_8988a4c89289d7f4(self);
    var_be8ebaf932e93656 = namespace_34bf641998024ddb::function_f8ccadcd850da124(var_934083a148144947, self.var_e90e6921b79022f5, 800, 1, 0, 1, 2);
    function_ce9c21523336cdbc(var_be8ebaf932e93656, &function_d984d0bc8b82a279, self);
    switch (region) {
    case #"hash_7bb2cd766703d463":
        function_d37068aac7785c04(var_be8ebaf932e93656, "base_zombie", 1);
        break;
    case #"hash_5343b465e56ec9a4":
    case #"hash_651f76c0ad6741ec":
    case #"hash_af83e47edfa8900a":
        function_d37068aac7785c04(var_be8ebaf932e93656, "base_zombie", 1);
        function_d37068aac7785c04(var_be8ebaf932e93656, "armored_zombie", 1);
        break;
    default:
        function_d37068aac7785c04(var_be8ebaf932e93656, "base_zombie", 1);
        break;
    }
    var_9b1faacf64b45dc1 = spawnstruct();
    var_9b1faacf64b45dc1.var_be8ebaf932e93656 = var_be8ebaf932e93656;
    var_9b1faacf64b45dc1.var_c49cbe01c668b84b = self.var_c49cbe01c668b84b;
    self.var_d8a75048641f114e["ambient"][var_be8ebaf932e93656] = var_9b1faacf64b45dc1;
    namespace_614554f86e52695c::function_bc5315dc37ae4cf(var_be8ebaf932e93656, &function_5648fc22043a73cf);
    namespace_614554f86e52695c::function_73147cdf5c28d10c(var_be8ebaf932e93656, &function_b7c01d53cbd78e62, self);
    function_4b7d420e1bad897f(var_be8ebaf932e93656, 8);
    self.var_be8ebaf932e93656 = var_be8ebaf932e93656;
    thread function_4e275d54aa5d27ec();
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a01
// Size: 0x63
function function_4e275d54aa5d27ec() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        if (distancesquared(self.var_e90e6921b79022f5, function_8988a4c89289d7f4(self)) > 1500) {
            self.var_e90e6921b79022f5 = function_8988a4c89289d7f4(self);
            function_df930eed75d4f74f(self.var_be8ebaf932e93656, self.var_e90e6921b79022f5, 800);
        }
        wait(1);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6b
// Size: 0x16
function function_5648fc22043a73cf(requestid, userdata) {
    return 1;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a89
// Size: 0x81
function function_b7c01d53cbd78e62(requestid, userdata) {
    if (!isdefined(userdata)) {
        return 1;
    }
    if (!isarray(userdata.var_d8a75048641f114e)) {
        return 1;
    }
    if (!isdefined(userdata.var_d8a75048641f114e["ambient"][requestid])) {
        return 1;
    }
    if (!is_equal(userdata.var_d8a75048641f114e["ambient"][requestid].var_c49cbe01c668b84b, userdata.var_c49cbe01c668b84b)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b12
// Size: 0x24
function function_d984d0bc8b82a279(requestid, userdata, agent, data) {
    
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d
// Size: 0x1d1
function function_70785f5ff53b07c9() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_2f5d509d7b71ce9a endon("AI_spawned");
    ai_spawned = 0;
    while (!ai_spawned) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (distancesquared(player.origin, self.var_756a07c77406000b.origin) <= squared(self.var_5078a08cc4ec9d12)) {
                ai_spawned = 1;
                spawn_point = getclosestpointonnavmesh(self.var_756a07c77406000b.origin);
                aitype = namespace_53fc9ddbb516e6e1::get_aitype_by_subclass_SharedFunc(self.var_db0e660397a76bd8);
                self.ai_zombie = namespace_53fc9ddbb516e6e1::spawnNewAIType_SharedFunc(aitype[0], spawn_point, self.var_756a07c77406000b.angles, "team_two_hundred");
                waitframe();
                if (isdefined(self.ai_zombie)) {
                    self.ai_zombie ent_flag_init("big_bounty_target");
                    self.ai_zombie ent_flag_set("log_on_despawn");
                    self.ai_zombie callback::add("on_zombie_ai_killed", &on_zombie_ai_killed);
                }
                thread function_f069e10a4ee93d9f();
                thread function_6b9c1b0c02633e65();
                thread function_3bab4fee62f0fbd8();
                thread function_a8a2b5385efae3a6();
                if (self.var_db0e660397a76bd8 != "zombie_disciple_hvt") {
                    thread function_da005eb9ab9ef712();
                }
                callback::callback("big_bounty_target_spawned", {instance:self});
                self notify("AI_spawned");
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d15
// Size: 0x1cf
function on_zombie_ai_killed(params) {
    var_129cfed92896a644 = string(self getentitynumber());
    weaponname = isdefined(params.objweapon) ? params.objweapon.basename : "";
    damage = isdefined(params.idamage) ? string(params.idamage) : "";
    if (isdefined(params.eattacker)) {
        goto LOC_000000e5;
    }
    entitynum = "";
    classname = isdefined(params.eattacker) && isdefined(params.eattacker.classname) ? params.eattacker.classname : "";
    inflictor = isdefined(params.einflictor) ? params.einflictor.classname : "";
    if (isdefined(params.einflictor)) {
        goto LOC_00000189;
    }
    var_405e1f9370025d56 = "";
    error_msg = "Bounty slain [ " + var_129cfed92896a644 + " ]. Weapon: " + weaponname + " - Damage: " + damage + " - Attacker EntNum: " + entitynum + " - Attacker Class: " + classname + " - Inflictor EntNum: " + var_405e1f9370025d56 + " - Inflictor Class: " + inflictor;
    logstring(error_msg);
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eeb
// Size: 0x12a
function function_da005eb9ab9ef712() {
    self.ai_zombie endon("death");
    var_3d17afd54b2e8657 = self.ai_zombie.origin;
    var_b88633e593471f5c = 0;
    while (1) {
        if (!ispointonnavmesh(self.ai_zombie.origin)) {
            var_5887e5956c362ea2 = getclosestpointonnavmesh(self.ai_zombie.origin);
            if (!isdefined(var_5887e5956c362ea2) || distancesquared(self.ai_zombie.origin, var_5887e5956c362ea2) > squared(256)) {
                var_b88633e593471f5c++;
            }
            if (var_b88633e593471f5c > 3) {
                if (isdefined(var_5887e5956c362ea2) && distancesquared(self.ai_zombie.origin, var_5887e5956c362ea2) <= squared(256)) {
                    var_b88633e593471f5c = 0;
                    self.ai_zombie forceteleport(var_5887e5956c362ea2);
                } else {
                    var_b88633e593471f5c = 0;
                    self.ai_zombie forceteleport(var_3d17afd54b2e8657);
                }
            }
        } else {
            var_b88633e593471f5c = 0;
            var_3d17afd54b2e8657 = self.ai_zombie.origin;
        }
        wait(3);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201c
// Size: 0x19c
function function_f069e10a4ee93d9f() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_682d602ddf0d8234 = 0;
    while (!var_682d602ddf0d8234) {
        foreach (player in self.var_6c29f2fdb0054bbe) {
            if (distancesquared(player.origin, self.var_756a07c77406000b.origin) <= squared(self.circleradius)) {
                var_5ef9b5a1fb992a8d = 0;
                if (namespace_3c37cb17ade254d::within_fov(player.origin, player.angles, self.ai_zombie.origin, cos(70))) {
                    var_73b566ef640efc09 = (self.ai_zombie.origin[0], self.ai_zombie.origin[1], self.ai_zombie.origin[2] + 50);
                    eyepos = player geteye();
                    waitframe();
                    if (sighttracepassed(eyepos, var_73b566ef640efc09, 1, player, self.ai_zombie)) {
                        var_5ef9b5a1fb992a8d = 1;
                    }
                }
                if (!var_5ef9b5a1fb992a8d && !istrue(self.var_24a16c52437dde0f)) {
                    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("bigbounty_approached_hvt");
                }
                var_682d602ddf0d8234 = 1;
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21bf
// Size: 0x3fc
function function_e4dae689f876b8ba() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_ce7d122aeea98ccd = 10;
    var_97a6bab110b12e3e = getstructarray("bigbounty_spawn", "targetname");
    self.var_330bae6241dd76bc = [];
    for (index = 0; index < var_97a6bab110b12e3e.size; index++) {
        struct = var_97a6bab110b12e3e[index];
        var_b7bfeab9b9d2d249 = function_44c6c04fa367baea(struct.origin);
        if (var_b7bfeab9b9d2d249 == self.var_97e3283eeb5e237b && function_a551ec2d5303061b(struct, self.var_66f9956b2a6b757e) && struct.script_noteworthy == self.ai_type) {
            self.var_330bae6241dd76bc[self.var_330bae6241dd76bc.size] = struct;
        }
        if (index % var_ce7d122aeea98ccd == 0) {
            waitframe();
        }
    }
    if (self.var_330bae6241dd76bc.size < 3) {
        var_26c5a897b99d49 = 0;
        maxdist = self.var_66f9956b2a6b757e + 500;
        while (!var_26c5a897b99d49) {
            counter = 0;
            foreach (struct in var_97a6bab110b12e3e) {
                var_b7bfeab9b9d2d249 = function_44c6c04fa367baea(struct.origin);
                if (function_a551ec2d5303061b(struct, maxdist) && struct.script_noteworthy == self.ai_type && var_b7bfeab9b9d2d249 == self.var_97e3283eeb5e237b) {
                    self.var_330bae6241dd76bc = function_6d6af8144a5131f1(self.var_330bae6241dd76bc, struct);
                    if (self.var_330bae6241dd76bc.size >= 3) {
                        var_26c5a897b99d49 = 1;
                    }
                }
                counter++;
                if (counter >= 200) {
                    waitframe();
                    counter = 0;
                }
            }
            maxdist = maxdist + 500;
            if (maxdist >= 18000) {
                var_26c5a897b99d49 = 1;
            }
            waitframe();
        }
    }
    if (self.var_330bae6241dd76bc.size < 0) {
        function_612d18fdbc979c0b(var_2f5d509d7b71ce9a, 0);
        function_d17f711a3cf0d287();
    }
    spawn_struct = self.var_330bae6241dd76bc[0];
    var_cd6a2decee3d5798 = 0;
    var_ce7d122aeea98ccd = 10;
    for (index = 0; index < self.var_330bae6241dd76bc.size; index++) {
        if (index % var_ce7d122aeea98ccd == 0) {
            waitframe();
        }
        struct = self.var_330bae6241dd76bc[index];
        if (isdefined(level.var_24b61da48c7bdf06) && level.var_24b61da48c7bdf06.radiation namespace_6d781a0248843409::function_1b4f63fa623de69a(struct.origin) || namespace_af57321bdeb06a78::function_a055325e4e4436fe(struct.origin, 1)) {
            continue;
        }
        mindistance = distancesquared(level.players[0].origin, struct.origin);
        var_7ef6a8808a48f958 = level.players[0];
        foreach (var_cdcd4978f5179a4d in level.players) {
            if (distancesquared(var_cdcd4978f5179a4d.origin, struct.origin) < mindistance) {
                mindistance = distancesquared(var_cdcd4978f5179a4d.origin, struct.origin);
                var_7ef6a8808a48f958 = var_cdcd4978f5179a4d;
            }
        }
        if (distancesquared(var_7ef6a8808a48f958.origin, struct.origin) > var_cd6a2decee3d5798) {
            var_cd6a2decee3d5798 = distancesquared(var_7ef6a8808a48f958.origin, struct.origin);
            spawn_struct = struct;
        }
    }
    self.var_756a07c77406000b = spawn_struct;
    function_3a38fb1773a90e3d();
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c2
// Size: 0x156
function function_3a38fb1773a90e3d() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("activity_ended");
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    self.var_e59541d364064648 = function_36a95c9de2ace25a("jup_ob_objectivemarker_bigbounty", 1, 1);
    waitframe();
    self.var_7ca681f995301d27 = function_b51e0dd3c4ef0eed(self.var_756a07c77406000b);
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.var_e59541d364064648, self.var_7ca681f995301d27);
    waitframe();
    foreach (player in self.var_6c29f2fdb0054bbe) {
        if (isdefined(player)) {
            self.var_394466c2ddb208cb = player namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, self.var_7ca681f995301d27, self.var_e59541d364064648);
            break;
        }
    }
    function_6b6b6273f8180522("BigBounty_Ob", self.var_7ca681f995301d27, self.circleradius);
    foreach (member in self.var_6c29f2fdb0054bbe) {
        function_cfd53c8f6878014f(member);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x271f
// Size: 0x37
function function_7b0fea7ae2112c25(activity_succeeded) {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    var_2f5d509d7b71ce9a function_a26e39e03a0d6739();
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275d
// Size: 0x5e
function function_d17f711a3cf0d287() {
    var_2f5d509d7b71ce9a = self;
    var_2f5d509d7b71ce9a endon("instance_destroyed");
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
    if (isdefined(self.ai_zombie)) {
        self.ai_zombie kill();
    }
    if (isdefined(self.var_e08f3403dfd64b48)) {
        self.var_e08f3403dfd64b48 delete();
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c2
// Size: 0x29
function function_6f747a641f77773c() {
    if (isdefined(self.var_bd16f0d97883fd8d)) {
        return self.var_bd16f0d97883fd8d.origin;
    } else {
        return undefined;
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f2
// Size: 0x35
function function_3d2a5e67e320a325() {
    var_6c1956fd6ce84917 = 1;
    var_cc7aa96a854fd8ee = namespace_71ca15b739deab72::function_3ae7f99339b96499(self.var_fa72b05f74204fb9, var_6c1956fd6ce84917, self.var_4158f9fefbe61805);
    return var_cc7aa96a854fd8ee;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x282f
// Size: 0x97
function function_93cc9badd07b3211(var_b381b0883bcd4847) {
    var_2f5d509d7b71ce9a = self;
    if (isdefined(self.var_cda97c89ff1bb729) && isdefined(self.var_295815e7263cda4d) && array_contains(var_b381b0883bcd4847.var_19d8d6f6f454266a, self.var_295815e7263cda4d)) {
        var_3466372ca93c1fb9 = spawnstruct();
        var_3466372ca93c1fb9.lootid = self.var_cda97c89ff1bb729;
        var_3466372ca93c1fb9.quantity = 1;
        return [0:var_3466372ca93c1fb9];
    } else {
        return var_2f5d509d7b71ce9a namespace_71ca15b739deab72::function_9302d6fba4ac736a(var_b381b0883bcd4847);
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cd
// Size: 0x38
function function_e2827300b9992692(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290c
// Size: 0x78
function function_f0f14142a301b2e2(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    if (function_acaa75ca8754452e()) {
        foreach (player in var_2a29b237dcc66fe5) {
            function_d7d113d56ef0ef5b(player);
        }
    }
}

// Namespace namespace_39f971ea9ca4fb9e/namespace_1b69156531898c9d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298b
// Size: 0x42
function function_540f9b357f3b5419(var_b381b0883bcd4847) {
    if (!istrue(self.var_24a16c52437dde0f) && isdefined(var_b381b0883bcd4847.playerlist)) {
        thread function_1281c7fff9456e18("contract_bigbounty_abandoned", var_b381b0883bcd4847.playerlist);
    }
}
