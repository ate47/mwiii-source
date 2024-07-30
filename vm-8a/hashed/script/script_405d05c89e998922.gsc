#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\values.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using script_5a4a5d9ba343ff8f;

#namespace namespace_dfe20d80cfb5220c;

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x359
// Size: 0x18
function autoexec init() {
    utility::registersharedfunc("zombie_dismemberment", "dismemberHead", &dismember_head);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0x55
function function_582bd4b9c9a2091d(params) {
    level._effect["zombie_base_annihilate"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_blood_annihilate_exp.vfx");
    level._effect["zombie_base_annihilate_safe"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_explode_death.vfx");
    registersharedfunc("ai", "isLimbDismembered", &function_ca5cecb3f1666b6);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d6
// Size: 0x82
function function_b718bd8a845dc9ab() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_damaged", &function_e2c1f2a81d46d73d);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_killed", &function_d37efd30de1a9951);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("killed_body_cloned", &function_3cf0e5ddfe2f900);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_corpse_annihilated", &on_corpse_annihilated);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x54
function function_9d6df53b2bb22d73() {
    if (getdvarint(@"hash_bcec05140f24d4a1", 0)) {
        return;
    }
    self._blackboard.var_75b2c9ba4bfca43d = 0;
    self.var_3e84854a738e628d = &dismember_head;
    self.var_7fb81e56992abf97 = &function_ef549c6c35e41708;
    self.var_7050024e5f8ca246 = &function_8b2d889a2541d28f;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc
// Size: 0x2c
function function_79995fabeaf95d91() {
    assertex(!istrue(isai(self)) && !istrue(isalive(self)), "Needs to be a corpse and not an AI.");
    function_4b644866a082cf78(16);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f0
// Size: 0x15
function dismember_head(is_lethal) {
    dismember(16, is_lethal);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d
// Size: 0x31
function function_ef549c6c35e41708() {
    if (!isdefined(self._blackboard.var_75b2c9ba4bfca43d)) {
        return 0;
    }
    return self._blackboard.var_75b2c9ba4bfca43d & 16;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547
// Size: 0x99
function function_ca5cecb3f1666b6(str_location) {
    limb_flag = function_acb5b44b64b97f9f(str_location);
    var_44c6db708d4a15fe = 0;
    if (isalive(self)) {
        if (isdefined(self._blackboard.var_75b2c9ba4bfca43d)) {
            var_44c6db708d4a15fe = self._blackboard.var_75b2c9ba4bfca43d;
        }
    } else {
        corpse = self getcorpseentity();
        if (isdefined(corpse) && isdefined(corpse.var_44c6db708d4a15fe)) {
            var_44c6db708d4a15fe = corpse.var_44c6db708d4a15fe;
        }
    }
    return (var_44c6db708d4a15fe & limb_flag) > 0;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e9
// Size: 0xd
function dismember_legs() {
    dismember(12, 0, 0);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fe
// Size: 0x12
function function_8b2d889a2541d28f() {
    dismember(19 | 12, 1, 1);
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x618
// Size: 0x26
function private function_f010e99aad3beeff() {
    return isalive(self) && !function_8ce7894f1a52fb77("charm") && val::get("allow_dismember");
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x647
// Size: 0xad
function private is_friendly_damage(agent, attacker) {
    if (isdefined(attacker) && isdefined(agent) && isdefined(agent.team)) {
        if (isdefined(attacker.team) && attacker.team == agent.team) {
            return true;
        }
        if (isdefined(attacker.owner) && isdefined(attacker.owner.team) && attacker.owner.team == agent.team) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6fd
// Size: 0x2c3
function private function_e2c1f2a81d46d73d(params) {
    if (!function_f010e99aad3beeff() || weaponisimpaling(params.sweapon)) {
        return;
    }
    var_65de9a18ad444853 = params.idamage >= self.health;
    limb = function_acb5b44b64b97f9f(params.shitloc);
    is_explosion = isdefined(params.smeansofdeath) && isexplosivedamagemod(params.smeansofdeath);
    if (var_65de9a18ad444853 && !is_friendly_damage(self, params.eattacker)) {
        if (function_5c4d80762e50bd12(params.eattacker, params.shitloc, params.sweapon, params.idamage, params.smeansofdeath)) {
            dismember(19 | 12, var_65de9a18ad444853, 1);
            return;
        }
        if (is_explosion) {
            dismember(19 | 12, var_65de9a18ad444853);
            return;
        }
        if (limb != 0 && limb != 1) {
            dismember(limb, var_65de9a18ad444853);
            return;
        }
        if (randomint(100) < 50) {
            function_bce021b0a87015f6(var_65de9a18ad444853);
            if (randomint(100) < 50) {
                function_bce021b0a87015f6(var_65de9a18ad444853);
            }
        }
        return;
    }
    damage_percent = ter_op(self.maxhealth > 0, params.idamage / self.maxhealth, 1) * 100;
    if (is_explosion && damage_percent >= 50 && randomint(100) < 20) {
        dismember(12, var_65de9a18ad444853);
    }
    if (limb == 16) {
        health_percent = ter_op(self.maxhealth > 0, self.health / self.maxhealth, 0) * 100;
        if (health_percent < 30 && randomint(100) < 1) {
            dismember(16, var_65de9a18ad444853);
        }
        return;
    }
    if (limb == 2 || limb == 0) {
        damage_percent = ter_op(self.maxhealth > 0, params.idamage / self.maxhealth, 1) * 100;
        if (damage_percent > 10 && randomint(100) < 5) {
            dismember(2, var_65de9a18ad444853);
        }
        return;
    }
    if (limb == 4 || limb == 8) {
        damage_percent = ter_op(self.maxhealth > 0, params.idamage / self.maxhealth, 1) * 100;
        if (damage_percent >= 50 && randomint(100) < 5) {
            dismember(limb, var_65de9a18ad444853);
        }
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c8
// Size: 0x49
function private function_d37efd30de1a9951(params) {
    if (istrue(self.var_745cd904c1ec804c) || isdefined(self.var_941802a0997e0c42) && !istrue(self.var_93eb5ea81d2cc4d) || istrue(self.var_f33496b914378bbd)) {
        annihilate();
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa19
// Size: 0x9a
function private function_3cf0e5ddfe2f900(params) {
    if (!isdefined(params.body)) {
        return;
    }
    if (!isdefined(self._blackboard.var_75b2c9ba4bfca43d)) {
        return;
    }
    if (self._blackboard.var_75b2c9ba4bfca43d == 0) {
        return;
    }
    params.body function_4b644866a082cf78(self._blackboard.var_75b2c9ba4bfca43d);
    params.body.var_44c6db708d4a15fe = self._blackboard.var_75b2c9ba4bfca43d;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x71
function private on_corpse_annihilated(params) {
    level endon("game_ended");
    corpse = params.corpse;
    if (isdefined(corpse)) {
        if (isdefined(params.annihilate_time)) {
            wait_time = params.annihilate_time - level.framedurationseconds;
            if (wait_time > 0) {
                wait wait_time;
            }
        }
        if (isdefined(corpse)) {
            corpse annihilate();
        }
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0xd8
function private function_acb5b44b64b97f9f(str_location) {
    switch (str_location) {
    case #"hash_5d5aac570f6fd382":
    case #"hash_d42e71cd9f1e822f":
    case #"hash_da2f35145aa58933": 
        return 1;
    case #"hash_da51cc36a471058":
    case #"hash_51d5d0b9add9cc5a":
    case #"hash_a7980c387477e7bb": 
        return 2;
    case #"hash_1cbc508a2fe01b79":
    case #"hash_9536712388e65bce":
    case #"hash_a638fec9040cfcf4": 
        return 4;
    case #"hash_168c74e879f0ba11":
    case #"hash_7b36142458a6c2d5":
    case #"hash_810a7426c8bac3ac": 
        return 8;
    case #"hash_8a1772f5f912c880":
    case #"hash_92bbfe494d03d772":
    case #"hash_b107b5547c755d23": 
        return 16;
    }
    return 0;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc15
// Size: 0xa0
function function_bce021b0a87015f6(var_332cbc3917a73aa1) {
    var_5b2447741c6ede0a = (19 | 12) ^ self._blackboard.var_75b2c9ba4bfca43d;
    if (var_5b2447741c6ede0a > 0) {
        var_a6ef929aaddcf48d = randomint(function_bb2659ad962ee09e(var_5b2447741c6ede0a));
        var_17bd5a9839793309 = 0;
        for (flag_offset = 0; (19 | 12) >> flag_offset > 0; flag_offset++) {
            limb = 1 << flag_offset;
            if (var_5b2447741c6ede0a & limb) {
                if (var_17bd5a9839793309 == var_a6ef929aaddcf48d) {
                    dismember(limb, var_332cbc3917a73aa1);
                    break;
                }
                var_17bd5a9839793309++;
            }
        }
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcbd
// Size: 0x83
function private function_4b644866a082cf78(limbs) {
    if (limbs & 1) {
        utility::function_3677f2be30fdd581("gib_arm_right", "gibbed");
    }
    if (limbs & 2) {
        utility::function_3677f2be30fdd581("gib_arm_left", "gibbed");
    }
    if (limbs & 4) {
        utility::function_3677f2be30fdd581("gib_leg_right", "gibbed");
    }
    if (limbs & 8) {
        utility::function_3677f2be30fdd581("gib_leg_left", "gibbed");
    }
    if (limbs & 16) {
        utility::function_3677f2be30fdd581("gib_head", "gibbed");
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd48
// Size: 0x137
function private dismember(limbs, var_65de9a18ad444853, annihilate) {
    var_9cb196782b2726c9 = limbs;
    var_9cb196782b2726c9 &= ~self._blackboard.var_75b2c9ba4bfca43d;
    if (var_9cb196782b2726c9 & 3 && self._blackboard.var_75b2c9ba4bfca43d & 3) {
        var_9cb196782b2726c9 &= ~3;
    }
    if (var_9cb196782b2726c9 == 0) {
        return;
    }
    if (!isdefined(level.var_8f6a7de5c1dccb9a) || gettime() != level.var_8f6a7de5c1dccb9a) {
        level.var_8f6a7de5c1dccb9a = gettime();
        level.var_3b88e927b3abcd3f = 1;
    } else {
        level.var_3b88e927b3abcd3f++;
        if (level.var_3b88e927b3abcd3f > 5) {
            return;
        }
    }
    self._blackboard.var_75b2c9ba4bfca43d |= var_9cb196782b2726c9;
    function_4b644866a082cf78(var_9cb196782b2726c9);
    if (var_9cb196782b2726c9 & 16) {
        utility::function_3677f2be30fdd581("base", "base_off");
        if (!istrue(var_65de9a18ad444853)) {
            thread function_c4f73d6490f607f7();
        }
    }
    if (var_9cb196782b2726c9 & 12) {
        function_dd8dcd65f2ebbb35(1);
    }
    if (istrue(annihilate)) {
        annihilate();
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe87
// Size: 0x9a
function annihilate() {
    callback::callback("on_annihilated");
    self.nocorpse = 1;
    if (!isdismembermentenabled()) {
        effect_id = level._effect["zombie_base_annihilate_safe"];
    } else {
        effect_id = level._effect["zombie_base_annihilate"];
    }
    effect_pos = self gettagorigin("j_spine4");
    var_8f8922f650e9a081 = self gettagangles("j_spine4");
    if (isdefined(effect_pos) && isdefined(var_8f8922f650e9a081)) {
        playfx(effect_id, effect_pos, anglestoforward(var_8f8922f650e9a081), anglestoup(var_8f8922f650e9a081));
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf29
// Size: 0x2d
function private function_bb2659ad962ee09e(limbs) {
    num_parts = 0;
    while (limbs > 0) {
        num_parts++;
        limbs -= limbs & 0 - limbs;
    }
    return num_parts;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf5f
// Size: 0x40
function private function_c4f73d6490f607f7() {
    self endon("death");
    damage_amount = self.maxhealth * 0.05;
    while (true) {
        self dodamage(damage_amount, self.origin, self);
        wait 1;
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfa7
// Size: 0xcf
function private function_5c4d80762e50bd12(eattacker, str_hit_loc, weapon, n_damage, str_damage_type) {
    if (istrue(self.var_c216c30f467f0ce) || function_95ce7ff0b2df8f26(weapon)) {
        return false;
    }
    if (isdefined(eattacker) && isdefined(eattacker.vehicle) && istrue(eattacker.vehicle.var_e638ad685a5c1544)) {
        return true;
    }
    damage_percent = ter_op(self.maxhealth > 0, n_damage / self.maxhealth, 1) * 100;
    return n_damage > self.maxhealth && damage_percent >= 50 && str_damage_type != "MOD_MELEE" && randomint(100) < 25;
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107f
// Size: 0x82
function function_dd8dcd65f2ebbb35(is_crawling) {
    var_93f193eea56d3601 = is_crawling();
    assertex(istrue(is_crawling) || !istrue(var_93f193eea56d3601), "<dev string:x1c>");
    if (is_crawling != var_93f193eea56d3601 && isdefined(self._blackboard.var_93aa3eefdf57f46)) {
        self._blackboard.var_93aa3eefdf57f46 = is_crawling;
        self.currentpose = "prone";
        callback::callback("on_is_crawling_changed");
    }
}

// Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0x16
function is_crawling() {
    return istrue(self._blackboard.var_93aa3eefdf57f46);
}

/#

    // Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1128
    // Size: 0xc8
    function function_cd37404b5eaaf996() {
        function_6e7290c8ee4f558b("<dev string:x47>");
        function_b23a59dfb4ca49a1("<dev string:x58>", "<dev string:x67>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:x79>", "<dev string:x8d>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:xa4>", "<dev string:xb7>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:xcd>", "<dev string:xe1>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:xf8>", "<dev string:x10b>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:x121>", "<dev string:x135>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:x14c>", "<dev string:x161>", &debug_dismember);
        function_b23a59dfb4ca49a1("<dev string:x179>", "<dev string:x191>", &make_crawlers);
        function_fe953f000498048f();
    }

    // Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11f8
    // Size: 0xd4
    function debug_dismember(param) {
        switch (param[0]) {
        case #"hash_b107b5547c755d23": 
            function_d01b0187d13524d0(16, 0, 0);
            break;
        case #"hash_948f3990649345f0": 
            function_d01b0187d13524d0(1, 0, 0);
            break;
        case #"hash_657829471a2d778d": 
            function_d01b0187d13524d0(2, 0, 0);
            break;
        case #"hash_3341ee903158263a": 
            function_d01b0187d13524d0(4, 0, 0);
            break;
        case #"hash_12529c46ee2fd68f": 
            function_d01b0187d13524d0(8, 0, 0);
            break;
        case #"hash_e98e93069693d456": 
            function_d01b0187d13524d0(12, 0, 0);
            break;
        case #"hash_b5ccd1af3942a54": 
            function_d01b0187d13524d0(19 | 12, 1, 1);
            break;
        }
    }

    // Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x12d4
    // Size: 0x6d
    function private make_crawlers(params) {
        all_ai = getaiarray();
        foreach (ai in all_ai) {
            ai function_dd8dcd65f2ebbb35(1);
        }
    }

    // Namespace namespace_dfe20d80cfb5220c / namespace_9e6ef02d993a7eba
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1349
    // Size: 0xca
    function function_d01b0187d13524d0(limbs, var_65de9a18ad444853, annihilate) {
        player = level.players[0];
        all_ai = getaiarray();
        foreach (ai in all_ai) {
            if (!isdefined(ai._blackboard.var_75b2c9ba4bfca43d)) {
                continue;
            }
            ai dismember(limbs, var_65de9a18ad444853, annihilate);
            if (var_65de9a18ad444853) {
                ai kill(player.origin, player);
            }
        }
    }

#/