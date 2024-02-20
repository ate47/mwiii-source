// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_2669878cf5a1b6bc;
#using script_3214e6fcdce468a7;

#namespace namespace_6f5afea353b0d311;

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f
// Size: 0x4b
function function_251cd47c5242ae4f() {
    level callback::add("on_ai_killed", &on_ai_killed);
    level.var_14fad57c290ee19a = &function_97ed4e4e49d3e1b;
    level.var_170ca38d1fed8147 = &function_1415d77bc67b91fc;
    /#
        level.var_e7e662c51dc0814a = getdvar(@"hash_a6a124879b28d19d");
    #/
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c1
// Size: 0x23a
function on_zombie_ai_killed(params) {
    if (istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa)) {
        return;
    }
    var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie";
    var_4bcef7981f5439fe = 2;
    if (self.subclass == "zombie_base_armored_heavy") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_armored";
    } else if (self.var_570908460ede5c13 == "settings_zombie_abom" || self.var_570908460ede5c13 == "settings_zombie_abom_mega" || self.var_570908460ede5c13 == "settings_zombie_abom_mega_hvt") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_abomination";
        var_4bcef7981f5439fe = 6;
    } else if (self.subclass == "zombie_hellhound") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_hellhound";
    } else if (self.subclass == "zombie_mangler") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_mangler";
    } else if (self.subclass == "zombie_mimic") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_mimic";
    } else if (self.subclass == "zombie_disciple") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_disciple";
    } else if (self.subclass == "zombie_disciple_hvt_stormcaller") {
        var_4bcef7981f5439fe = 6;
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_disciple_hvt_stormcaller";
    } else if (self.subclass == "zombie_base_armored_light") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_armored_light";
    } else if (self.subclass == "zombie_deathworm") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_deathworm";
        var_4bcef7981f5439fe = 10;
    } else if (self.subclass == "zombie_deathworm_quest_s1") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_deathworm";
        var_4bcef7981f5439fe = 10;
    } else if (self.subclass == "zombie_deathworm_riftrun") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_deathworm";
        var_4bcef7981f5439fe = 10;
    } else if (self.subclass == "zombie_deathworm_boss") {
        var_cde3aa266f27c24d = "ob_jup_items_enemy_droplist_zombie_deathworm";
        var_4bcef7981f5439fe = 10;
    }
    if (isdefined(level.var_e7e662c51dc0814a) && level.var_e7e662c51dc0814a != "") {
        var_cde3aa266f27c24d = level.var_e7e662c51dc0814a;
    }
    spawn_pos = self.origin;
    var_d03b21428bf6d166 = spawnstruct();
    function_f632348cbb773537(level.var_230e213404e33c44, var_d03b21428bf6d166);
    namespace_2abc885019e1956::function_cd45408bd44fab07(var_cde3aa266f27c24d, var_4bcef7981f5439fe, spawn_pos);
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x802
// Size: 0x83
function on_ai_killed(params) {
    if (!getdvarint(@"hash_ab61a3c338b17bdf", 1)) {
        return;
    }
    if (!isdefined(level.var_230e213404e33c44)) {
        level.var_230e213404e33c44 = function_e4c99b0f178ffb98("loot_drop_killed", 1, level.framedurationseconds);
    }
    if (self.unittype == "soldier") {
        function_1ebeccaabab5d730(params);
    } else if (self.type == "zombie") {
        on_zombie_ai_killed(params);
    }
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88c
// Size: 0x1b8
function function_1ebeccaabab5d730(params) {
    if (istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa)) {
        return;
    }
    if (isdefined(self.vehicle) && istrue(self.vehicle.isheli)) {
        return;
    }
    if (self.unittype == "soldier") {
        var_1a827f12b6347e9d = 2;
        var_2d62b5de8c483c2f = "ob_jup_items_enemy_droplist_solider";
        if (isdefined(level.var_e7e662c51dc0814a) && level.var_e7e662c51dc0814a != "") {
            var_2d62b5de8c483c2f = level.var_e7e662c51dc0814a;
        } else if (isdefined(self.ob) && isdefined(self.ob.var_2189bfeed28cbb65)) {
            var_2d62b5de8c483c2f = function_ecfc5eec680d2b6();
            var_1a827f12b6347e9d = function_25c1bfac5c9b6573();
        } else if (isdefined(self.ob) && istrue(self.ob.var_392cd09a100e53d5)) {
            var_2d62b5de8c483c2f = function_f22dd81df2150b04();
            var_1a827f12b6347e9d = function_3ca2b9357c34701();
        } else {
            var_2d62b5de8c483c2f = function_97263a41a3e0f9d7();
        }
        weapon = function_97ed4e4e49d3e1b();
        spawn_pos = self.origin;
        var_25627848d6165a46 = self getdroptofloorposition(spawn_pos);
        if (isdefined(var_25627848d6165a46)) {
            spawn_pos = var_25627848d6165a46;
        }
        var_4c72897b1b21ab7f = 0;
        if (istrue(self.var_4c72897b1b21ab7f)) {
            var_4c72897b1b21ab7f = 1;
        }
        var_d03b21428bf6d166 = spawnstruct();
        function_f632348cbb773537(level.var_230e213404e33c44, var_d03b21428bf6d166);
        if (!var_4c72897b1b21ab7f) {
            function_1415d77bc67b91fc(weapon, spawn_pos);
        }
        namespace_49e179ec476603d6::function_cd45408bd44fab07(var_2d62b5de8c483c2f, var_1a827f12b6347e9d, spawn_pos);
    }
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4b
// Size: 0xb6
function function_97ed4e4e49d3e1b() {
    if (isdefined(self.lastweapon) && (function_fc64178f71375137(strtok(self.lastweapon.basename, "_"), "la") || function_fc64178f71375137(strtok(self.lastweapon.basename, "_"), "sn"))) {
        return self.lastweapon;
    } else if (isdefined(self.primaryweapon) && self.primaryweapon.basename != "none") {
        return self.primaryweapon;
    } else {
        return weapon::buildweapon("iw9_pi_golf17_mp");
    }
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb08
// Size: 0x18f
function function_1415d77bc67b91fc(weapon, origin) {
    var_cb4fad49263e20c4 = namespace_49e179ec476603d6::function_49b86047c8a8b228(namespace_49e179ec476603d6::function_59a2e61d79065dca(), origin);
    var_2b7331baea302df8 = spawnstruct();
    var_2b7331baea302df8.var_e0116c5b8d303105 = weaponclipsize(weapon);
    var_2b7331baea302df8.var_734357a0b88e3a30 = weaponclipsize(weapon);
    if (namespace_736197e4d378b91b::function_aedc908c4a79d05e(weapon)) {
        goto LOC_00000080;
    }
    var_2b7331baea302df8.var_9bfd50804dd2553c = weaponclipsize(weapon getaltweapon());
    var_2b7331baea302df8.ammostock = weaponmaxammo(weapon);
    item = namespace_736197e4d378b91b::function_6cf4b48de9a4bc39(weapon, var_2b7331baea302df8, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, var_cb4fad49263e20c4.payload);
    if (!isdefined(item)) {
        return;
    }
    item.var_4f74f0aef2b2a8bf = spawnstruct();
    item.var_4f74f0aef2b2a8bf.var_fbe755f0978c0369 = namespace_736197e4d378b91b::function_46423e80a0fa8f2(weapon.basename, 0, weapon.variantid);
    item.var_4f74f0aef2b2a8bf.attachments = weapon.attachments;
    item.var_4f74f0aef2b2a8bf.rarity = 0;
    item.var_4f74f0aef2b2a8bf.baseweapon = weapon.basename;
    item.var_4f74f0aef2b2a8bf.variantid = weapon.variantid;
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9e
// Size: 0x4a
function function_97263a41a3e0f9d7() {
    if (isdefined(self.subclass)) {
        switch (self.subclass) {
        case #"hash_806a6487959205af":
            return "ob_jup_items_enemy_droplist_captain";
        default:
            return "ob_jup_items_enemy_droplist_solider";
            break;
        }
    }
    return "ob_jup_items_enemy_droplist_solider";
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf0
// Size: 0xd4
function function_ecfc5eec680d2b6() {
    if (!isdefined(level.ob)) {
        return "ob_jup_items_enemy_droplist_solider";
    }
    var_3ecf047d758de560 = level.ob.var_3ecf047d758de560[self.ob.var_2189bfeed28cbb65];
    if (isdefined(var_3ecf047d758de560)) {
        switch (self.subclass) {
        case #"hash_d646bb7570717551":
            return "ob_jup_items_warlord_allforone";
        case #"hash_12daa0cbf50f6442":
            return "ob_jup_items_warlord_chemist";
        case #"hash_8c92249632740ac":
            return "ob_jup_items_warlord_maestro";
        case #"hash_dde105a699b160b3":
            return "ob_jup_items_warlord_rainmaker";
        default:
            if (var_3ecf047d758de560.var_a2293a1278075bfe == "Chemist") {
                return "ob_jup_items_chemist_bodyguard";
            }
            break;
        }
    }
    return "ob_jup_items_enemy_droplist_solider";
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0xba
function function_25c1bfac5c9b6573() {
    if (!isdefined(level.ob)) {
        return 2;
    }
    var_3ecf047d758de560 = level.ob.var_3ecf047d758de560[self.ob.var_2189bfeed28cbb65];
    switch (self.subclass) {
    case #"hash_d646bb7570717551":
        return 1;
    case #"hash_12daa0cbf50f6442":
        return 1;
    case #"hash_8c92249632740ac":
        return 1;
    case #"hash_dde105a699b160b3":
        return 1;
    default:
        if (var_3ecf047d758de560.var_a2293a1278075bfe == "Chemist") {
            return 4;
        }
        break;
    }
    return 2;
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8e
// Size: 0x3d
function function_f22dd81df2150b04() {
    if (!isdefined(level.ob)) {
        return "ob_jup_items_enemy_droplist_solider";
    }
    if (self.ob.var_a2293a1278075bfe == "WARLORD_CHEMIST") {
        return "ob_jup_items_chemist_fortressguard";
    }
    return "ob_jup_items_enemy_droplist_solider";
}

// Namespace namespace_6f5afea353b0d311/namespace_4fc51f3f2cc55291
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed3
// Size: 0x34
function function_3ca2b9357c34701() {
    if (!isdefined(level.ob)) {
        return 2;
    }
    if (self.ob.var_a2293a1278075bfe == "WARLORD_CHEMIST") {
        return 3;
    }
    return 2;
}
