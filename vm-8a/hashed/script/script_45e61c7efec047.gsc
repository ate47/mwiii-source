#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\scriptable.gsc;
#using script_639bf783929acf9b;
#using scripts\common\devgui.gsc;
#using script_67fb1233e876ed8;
#using script_398835140857d740;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_43971bbeefd98f05;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace perk_tombstone;

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7
// Size: 0x20d
function function_ce82f1d47d2e5a58(str_currency, var_fe59c44529c721a0) {
    if (istrue(level.var_5025186a3fc7fa4)) {
        return;
    }
    level thread function_f3a23df892bf82f6("specialty_tombstone", str_currency, var_fe59c44529c721a0, &function_c9b691d2acfb3c55, &function_be6733eb26422227);
    callback::add("player_spawned", &function_c0a90b470c8db3b5);
    callback::add("player_disconnect", &function_5f75982dd09c5aff);
    callback::add("player_death", &function_828d4e52d624e921);
    callback::add("player_revived", &function_72a8eb52f0be7b20);
    callback::add("player_connect", &function_a96eb05bcccdae3d);
    callback::add("ob_exfil_success", &function_cb0dffa5e243988f);
    callback::add(#"player_eliminated", &function_68a1dda7fd1c33f9);
    callback::add("map_to_map_transition", &function_daacf7d82f553a35);
    callback::add("player_item_pickup", &on_item_pickup);
    scriptable_addnotifycallback("stash_dead", &function_53984676bfb1fe35);
    level.var_2251a7fd416d962a = [];
    level.var_d3bc04e8a1946502 = [(36845, 17622, 3396), (36527, 17795, 3395), (36258, 17703, 3327), (35979, 17378, 3312), (35789, 17361, 3312), (35620, 17401, 3312), (35568, 17644, 3306), (35012, 17582, 3158), (34423, 17935, 3135), (34162, 18085, 3131), (33681, 19037, 3133), (37069, 17864, 3395), (35585, 18342, 3310), (33758, 19259, 3127), (35926, 17660, 3290)];
    setdvarifuninitialized(@"hash_6d31f61a8b813a5a", 1);
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fc
// Size: 0x9
function function_c9b691d2acfb3c55() {
    function_d60544ce1e681740();
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d
// Size: 0x2a
function function_be6733eb26422227(b_pause, str_perk, str_result, n_slot) {
    function_480ad40598a5406a();
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0xe
function function_d60544ce1e681740() {
    function_ab7a3ff9f75e4867("specialty_tombstone");
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0xe
function function_480ad40598a5406a() {
    function_fe0d28e6f0008329("specialty_tombstone");
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b
// Size: 0x4f3
function function_c0a90b470c8db3b5(params) {
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    if (mapname == "mp_jup_bigmap" || istrue(level.var_18a131403527449e)) {
        function_58b9475ad345f0d3();
        foreach (cache in level.var_2251a7fd416d962a) {
            if (!isdefined(cache)) {
                continue;
            }
            if (isdefined(self.var_9b55e3337571adb4) && is_equal(self.var_9b55e3337571adb4.cache, cache)) {
                cache enablescriptableplayeruse(self);
                if (isdefined(cache.icon) && isdefined(cache.icon.objectiveiconid)) {
                    scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(cache.icon.objectiveiconid, self);
                    scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(11, cache.origin, cache.icon.objectiveiconid);
                }
                continue;
            }
            if (isdefined(cache.icon) && isdefined(cache.icon.objectiveiconid)) {
                scripts\mp\objidpoolmanager::objective_playermask_hidefrom(cache.icon.objectiveiconid, self);
            }
            cache disablescriptableplayeruse(self);
        }
    }
    /#
        if (level._custom_perks.size) {
            self endon("<dev string:x1c>");
            var_3352bf952cfc182a = self.name;
            function_6e7290c8ee4f558b("<dev string:x22>" + var_3352bf952cfc182a + "<dev string:x2f>");
            function_b23a59dfb4ca49a1("<dev string:x31>", "<dev string:x47>" + var_3352bf952cfc182a + "<dev string:x5a>", &function_e8e91e981eed0341);
            function_b23a59dfb4ca49a1("<dev string:x5c>", "<dev string:x73>" + var_3352bf952cfc182a + "<dev string:x5a>", &function_d809d194ca48db47);
            function_b23a59dfb4ca49a1("<dev string:x87>", "<dev string:x9c>" + var_3352bf952cfc182a + "<dev string:x5a>", &function_1829cbe6d232c1d9);
            function_b23a59dfb4ca49a1("<dev string:xae>", "<dev string:xcb>" + var_3352bf952cfc182a + "<dev string:xe4>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:xe8>", "<dev string:x105>" + var_3352bf952cfc182a + "<dev string:x11e>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x122>", "<dev string:x13f>" + var_3352bf952cfc182a + "<dev string:x158>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x15c>", "<dev string:x179>" + var_3352bf952cfc182a + "<dev string:x192>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x196>", "<dev string:x1b3>" + var_3352bf952cfc182a + "<dev string:x1cc>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x1d0>", "<dev string:x1ed>" + var_3352bf952cfc182a + "<dev string:x206>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x20a>", "<dev string:x227>" + var_3352bf952cfc182a + "<dev string:x240>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x244>", "<dev string:x261>" + var_3352bf952cfc182a + "<dev string:x27a>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x27e>", "<dev string:x29b>" + var_3352bf952cfc182a + "<dev string:x2b4>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x2b8>", "<dev string:x2d6>" + var_3352bf952cfc182a + "<dev string:x2f0>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x2f4>", "<dev string:x312>" + var_3352bf952cfc182a + "<dev string:x32c>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x331>", "<dev string:x34f>" + var_3352bf952cfc182a + "<dev string:x369>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x36e>", "<dev string:x38c>" + var_3352bf952cfc182a + "<dev string:x3a6>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x3ab>", "<dev string:x3c9>" + var_3352bf952cfc182a + "<dev string:x3e3>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x3e8>", "<dev string:x406>" + var_3352bf952cfc182a + "<dev string:x420>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x425>", "<dev string:x443>" + var_3352bf952cfc182a + "<dev string:x45d>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x462>", "<dev string:x480>" + var_3352bf952cfc182a + "<dev string:x49a>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x49f>", "<dev string:x4bd>" + var_3352bf952cfc182a + "<dev string:x4d7>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x4dc>", "<dev string:x4fa>" + var_3352bf952cfc182a + "<dev string:x514>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x519>", "<dev string:x537>" + var_3352bf952cfc182a + "<dev string:x551>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x556>", "<dev string:x574>" + var_3352bf952cfc182a + "<dev string:x58e>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x593>", "<dev string:x5b1>" + var_3352bf952cfc182a + "<dev string:x5cb>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x5d0>", "<dev string:x5ee>" + var_3352bf952cfc182a + "<dev string:x608>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<dev string:x60d>", "<dev string:x62b>" + var_3352bf952cfc182a + "<dev string:x645>", &function_f8a387a8c88b1c8a);
            function_fe953f000498048f();
        }
    #/
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb66
// Size: 0x4d
function function_5f75982dd09c5aff(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache cleanup_cache(self, 1);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x12
function function_828d4e52d624e921(params) {
    function_5f07fd4885970a1d();
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0x74
function function_cb0dffa5e243988f(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache thread cleanup_cache(self, 1);
    }
    if (isplayer(self)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        function_8ec2a2bfd11473be();
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x4e
function function_68a1dda7fd1c33f9(param) {
    var_76063bf99f55fa00 = self getplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack");
    if (istrue(self.var_addfab42810330a4)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 1);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca7
// Size: 0x6d
function function_daacf7d82f553a35(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        self.var_9b55e3337571adb4.cache cleanup_cache(self, 1);
        waitframe();
        self commitstats(1);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c
// Size: 0xde
function function_5f07fd4885970a1d() {
    var_277e5a7de395bb2e = getdvarint(@"hash_5c869b8df5b17357", 0);
    if (var_277e5a7de395bb2e > 0) {
        if (gettime() <= function_a5b14435e3229bed(var_277e5a7de395bb2e)) {
            return;
        }
    }
    if (has_perk("specialty_tombstone")) {
        params = spawnstruct();
        if (isbot(self)) {
            /#
                function_39c1cce4c78f1e6c(params);
            #/
        } else {
            function_ea489c9a3e230419(params);
        }
        return;
    }
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        if (isplayer(self)) {
            self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
            self.var_9b55e3337571adb4.cache cleanup_cache(self, 1);
            waitframe();
            self commitstats(1);
        }
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0xb
function function_72a8eb52f0be7b20(params) {
    
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe15
// Size: 0x3a
function function_a96eb05bcccdae3d(params) {
    var_76063bf99f55fa00 = self getplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack");
    if (istrue(var_76063bf99f55fa00)) {
        self.var_9cabc8bf28b5247f = 1;
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe57
// Size: 0x3fe
function function_ea489c9a3e230419(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache cleanup_cache(self, 1);
    }
    if (!has_perk("specialty_tombstone") || self.sessionstate == "intermission") {
        return;
    }
    function_8ec2a2bfd11473be();
    self.var_9b55e3337571adb4 = spawnstruct();
    self.var_9b55e3337571adb4.a_backpack = [];
    self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
    for (i = 0; i < 10; i++) {
        lootid = function_d870b2c45335bd88(i);
        lootcount = function_5ce7fe3dca9c1a22(i);
        self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = lootcount;
        itembundlename = function_fc925a153c7fd55c(lootid);
        if (!isdefined(itembundlename)) {
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        scriptable = itembundle.scriptable;
        self.var_9b55e3337571adb4.a_backpack = array_add(self.var_9b55e3337571adb4.a_backpack, lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", lootcount);
        index_high = i;
    }
    var_7a83ce8a86de986 = self.scoreondeath;
    essence_total = isdefined(var_7a83ce8a86de986) ? var_7a83ce8a86de986 : currency::function_15975e20bbd2c824("essence");
    essence_total = int(essence_total * getdvarfloat(@"hash_6d31f61a8b813a5a"));
    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence", essence_total);
    if (essence_total > 0) {
        lootid = function_6d15e119c2779a93(getscriptbundle("itemspawnentry:ob_jup_item_essence_tombstone"));
        self.var_9b55e3337571adb4.a_backpack = array_add(self.var_9b55e3337571adb4.a_backpack, lootid);
        index = isdefined(index_high) ? index_high + 1 : 0;
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "lootID", lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "quantity", 1);
    }
    if (self.var_9b55e3337571adb4.a_backpack.size) {
        self.var_addfab42810330a4 = 1;
        mapname = scripts\cp_mp\utility\game_utility::getmapname();
        if (mapname != "mp_jup_bigmap" && !istrue(level.var_18a131403527449e) || scripts\mp\outofbounds::istouchingoobtrigger() || function_6c71c72547bb931(self.origin)) {
            randomspawn = function_b2cd26ac28946ea7(level.var_d3bc04e8a1946502);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0, randomspawn[0]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1, randomspawn[1]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2, randomspawn[2]);
            return;
        }
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0, self.origin[0]);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1, self.origin[1]);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2, self.origin[2]);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125d
// Size: 0x3ff
function function_388d12d30b04fbc1() {
    assertex(isdefined(self.clientid), "Player has no client id assigned.");
    var_e89a9a6a3475bd0a = undefined;
    if (!isdefined(self.var_9b55e3337571adb4) || !isdefined(self.var_9b55e3337571adb4.a_backpack) || self.var_9b55e3337571adb4.a_backpack.size < 1) {
        return;
    }
    if (isdefined(self.var_30ae0dc4dbcb9e7f)) {
        var_f4991b19147602f9 = self.var_30ae0dc4dbcb9e7f;
    } else {
        var_f4991b19147602f9 = self.clientid;
    }
    var_f7a2c7ec29f706c5 = var_f4991b19147602f9 + 1;
    if (var_f7a2c7ec29f706c5 < 10) {
        var_e89a9a6a3475bd0a = function_40fd49171fad19d3("tombstone_stash_0" + var_f7a2c7ec29f706c5);
    } else {
        var_e89a9a6a3475bd0a = function_40fd49171fad19d3("tombstone_stash_" + var_f7a2c7ec29f706c5);
    }
    x = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0);
    y = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1);
    z = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2);
    essence = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence");
    dropstruct = namespace_2abc885019e1956::function_59a2e61d79065dca();
    dropinfo = namespace_2abc885019e1956::function_49b86047c8a8b228(dropstruct, (x, y, z), (0, 0, 0), undefined, 1);
    icon = function_efda1ea04874e527(dropinfo.origin);
    if (!isdefined(icon)) {
        return;
    }
    cache = spawnscriptable(var_e89a9a6a3475bd0a, dropinfo.origin, dropinfo.angles);
    if (!isdefined(cache)) {
        assertmsg("Failed to create Tombstone stash: " + var_e89a9a6a3475bd0a + " for client# " + var_f4991b19147602f9);
        return;
    }
    cache.icon = icon;
    scripts\cp_mp\calloutmarkerping::calloutmarkerping_createcallout(11, cache.origin, icon.objectiveiconid);
    cache setscriptablepartstate("body", "closed_usable");
    var_b98ef95ec6346029 = [];
    var_b98ef95ec6346029 = array_combine(var_b98ef95ec6346029, self.var_9b55e3337571adb4.a_backpack);
    foreach (item in var_b98ef95ec6346029) {
        if (!isdefined(item)) {
            continue;
        }
        n_count = 1;
        if (isdefined(self.var_9b55e3337571adb4.var_af2cea418410a822[item])) {
            n_count = self.var_9b55e3337571adb4.var_af2cea418410a822[item];
        }
        namespace_3883e3399f2870b5::function_6eee0ede493b44e8(cache, n_count, item);
    }
    foreach (player in level.players) {
        if (player == self) {
            cache enablescriptableplayeruse(player);
            n_id = var_f4991b19147602f9 + 1;
            player setclientomnvar("tombstone_stash", n_id);
            continue;
        }
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(cache.icon.objectiveiconid, player);
        cache disablescriptableplayeruse(player);
    }
    self.var_9b55e3337571adb4.cache = cache;
    level.var_2251a7fd416d962a = array_add(level.var_2251a7fd416d962a, cache);
    cache callback::add("on_cache_closed", &function_db8eb6248ea8a6df);
    self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
    waitframe();
    self commitstats(1);
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1664
// Size: 0x115
function cleanup_cache(player, is_immediate) {
    if (!isdefined(is_immediate)) {
        is_immediate = 0;
    }
    self notify("cleanup_tombstone_cache");
    self endon("cleanup_tombstone_cache");
    if (!is_immediate && !player isContainerEmpty(self)) {
        return;
    }
    if (isdefined(self.icon)) {
        scripts\mp\objidpoolmanager::returnobjectiveid(self.icon.objectiveiconid);
        self.icon = undefined;
    }
    self setscriptablepartstate("body", "shutdown");
    player setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
    player function_8ec2a2bfd11473be();
    if (!is_immediate) {
        waittill_notify_or_timeout("stash_dead", 20);
    }
    while (isplayer(player) && player namespace_3883e3399f2870b5::function_d6041f45fee8083d() && !is_immediate) {
        wait 0.1;
    }
    level.var_2251a7fd416d962a = array_remove(level.var_2251a7fd416d962a, self);
    self freescriptable();
    if (isplayer(player)) {
        player setclientomnvar("tombstone_stash", 0);
        player.var_9b55e3337571adb4 = undefined;
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1781
// Size: 0xae
function function_db8eb6248ea8a6df(params) {
    player = params.opener;
    if (isplayer(player) && isdefined(player.var_9b55e3337571adb4) && isdefined(player.var_9b55e3337571adb4.cache) && self == player.var_9b55e3337571adb4.cache) {
        player callback::callback("on_tombstone_used_cache", {#var_506e11545ce72281:self});
        player.var_9b55e3337571adb4.cache cleanup_cache(params.opener);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1837
// Size: 0x2c
function function_53984676bfb1fe35(instance, note, param, var_535d9c3fdddab5a9) {
    waitframe();
    instance notify("stash_dead");
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x13
function function_70cb750bdeab27e1(instance, player) {
    
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1886
// Size: 0x74
function function_47a4709ac15919(oldweaponobj) {
    oldweaponclipammo = self getweaponammoclip(oldweaponobj);
    var_763c9d03986746af = self getweaponammoclip(oldweaponobj, "left");
    oldweaponstockammo = self getweaponammostock(oldweaponobj);
    var_742208586ecb63c3 = self getweaponammoclip(oldweaponobj getaltweapon());
    var_bb9462c52bd454eb = function_7209c8cd4b2e3afd(oldweaponclipammo + oldweaponstockammo, var_763c9d03986746af, var_742208586ecb63c3);
    return var_bb9462c52bd454eb;
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1903
// Size: 0x6c
function function_ebc56eeecea60302(weapon) {
    if (isdefined(weapon.basename)) {
        switch (weapon.basename) {
        case #"hash_6c8fe4d0c94a4fb4":
        case #"hash_b7c258f34317cf65":
        case #"hash_d95d00b228b20251": 
            return true;
        }
    }
    if (weapon.inventorytype == "altmode") {
        return true;
    }
    return false;
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1978
// Size: 0x18f
function function_58b9475ad345f0d3() {
    if (istrue(self.var_9cabc8bf28b5247f)) {
        self.var_9cabc8bf28b5247f = undefined;
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        self.var_9b55e3337571adb4 = spawnstruct();
        self.var_9b55e3337571adb4.a_backpack = [];
        self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
        for (i = 0; i < 10; i++) {
            var_57acedc40b2f974 = function_eb02768c294d3e1c(i);
            lootcount = var_57acedc40b2f974[1];
            lootid = var_57acedc40b2f974[0];
            if (lootid != 0) {
                self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = lootcount;
                itembundlename = function_fc925a153c7fd55c(lootid);
                if (!isdefined(itembundlename)) {
                    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", 0);
                    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", 0);
                    continue;
                }
                itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
                scriptable = itembundle.scriptable;
                self.var_9b55e3337571adb4.a_backpack = array_add(self.var_9b55e3337571adb4.a_backpack, lootid);
            }
        }
        function_388d12d30b04fbc1();
        waitframe();
        self commitstats(1);
    }
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x60
function function_eb02768c294d3e1c(index) {
    lootid = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "lootID");
    quantity = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "quantity");
    return [lootid, quantity];
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b78
// Size: 0x73
function function_8ec2a2bfd11473be() {
    for (i = 0; i < 10; i++) {
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", 0);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", 0);
    }
    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence", 0);
    waitframe();
    self commitstats(1);
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0xa6
function private function_efda1ea04874e527(origin) {
    objectiveiconid = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (objectiveiconid == -1) {
        return undefined;
    }
    icon = spawnstruct();
    icon.objectiveiconid = objectiveiconid;
    scripts\mp\objidpoolmanager::objective_add_objective(icon.objectiveiconid, "active", origin + (0, 0, 49), "jup_ui_icon_tombstone_soda");
    nobackground = 1;
    scripts\mp\objidpoolmanager::update_objective_setbackground(icon.objectiveiconid, nobackground);
    objective_setdescription(icon.objectiveiconid, %CP_ZMB/PING_TOMBSTONE_STASH);
    return icon;
}

// Namespace perk_tombstone / namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca2
// Size: 0x53
function on_item_pickup(params) {
    if (is_equal(params.itembundlename, "ob_jup_item_essence_tombstone")) {
        essence = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence");
        currency::function_3036cef61495210f("essence", essence - 1);
    }
}

/#

    // Namespace perk_tombstone / namespace_8f3ef228cc9c9507
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cfd
    // Size: 0x49
    function function_e8e91e981eed0341(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        params = spawnstruct();
        if (player has_perk("<dev string:x64a>")) {
            player function_388d12d30b04fbc1();
        }
    }

    // Namespace perk_tombstone / namespace_8f3ef228cc9c9507
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d4e
    // Size: 0x52
    function function_1829cbe6d232c1d9(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        params = spawnstruct();
        if (isbot(player)) {
            player thread function_39c1cce4c78f1e6c(params);
            return;
        }
        player thread function_ea489c9a3e230419(params);
    }

    // Namespace perk_tombstone / namespace_8f3ef228cc9c9507
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1da8
    // Size: 0x42
    function function_d809d194ca48db47(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        player.var_9b55e3337571adb4.cache thread cleanup_cache(player, 1);
    }

    // Namespace perk_tombstone / namespace_8f3ef228cc9c9507
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1df2
    // Size: 0x37
    function function_f8a387a8c88b1c8a(a_params) {
        player = function_b3818ef99e063667(a_params[0]);
        player.var_30ae0dc4dbcb9e7f = int(a_params[1]);
    }

    // Namespace perk_tombstone / namespace_8f3ef228cc9c9507
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e31
    // Size: 0x24a
    function function_39c1cce4c78f1e6c(params) {
        if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
            self.var_9b55e3337571adb4.cache cleanup_cache(self, 1);
        }
        if (!has_perk("<dev string:x64a>")) {
            return;
        }
        function_8ec2a2bfd11473be();
        self.var_9b55e3337571adb4 = spawnstruct();
        self.var_9b55e3337571adb4.a_backpack = [];
        self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
        for (i = 0; i < 10; i++) {
            lootid = level.players[0] function_d870b2c45335bd88(i);
            lootcount = level.players[0] function_5ce7fe3dca9c1a22(i);
            self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = lootcount;
            itembundlename = function_fc925a153c7fd55c(lootid);
            if (!isdefined(itembundlename)) {
                continue;
            }
            itembundle = getscriptbundle("<dev string:x65e>" + itembundlename);
            scriptable = itembundle.scriptable;
            self.var_9b55e3337571adb4.a_backpack = array_add(self.var_9b55e3337571adb4.a_backpack, lootid);
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x66e>", i, "<dev string:x680>", lootid);
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x66e>", i, "<dev string:x687>", lootcount);
        }
        if (self.var_9b55e3337571adb4.a_backpack.size) {
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x690>", 1);
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x6a9>", 0, self.origin[0]);
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x6a9>", 1, self.origin[1]);
            self setplayerdata(level.var_5d69837cf4db0407, "<dev string:x6a9>", 2, self.origin[2]);
        }
    }

#/
