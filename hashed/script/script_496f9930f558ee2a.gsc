// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_595089f78ef8e11b;
#using script_405d05c89e998922;

#namespace zombie_base_audio;

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x2b3
function function_dbd4fdd08f5252a3() {
    if (flag("zombie_base_audio")) {
        return;
    }
    flag_set("zombie_base_audio");
    function_f11270bb42f7f080("ambient_normal", "ambient_normal", "vox_ai_zombie_ambient", 1);
    function_f11270bb42f7f080("ambient_crawl", "ambient_crawl", "vox_ai_zombie_crawl", 1);
    function_f11270bb42f7f080("ambient_sprint", "ambient_sprint", "vox_ai_zombie_sprint", 1);
    function_f11270bb42f7f080("ambient_investigate", "ambient_investigate", "vox_ai_zombie_investigate", 1);
    function_f11270bb42f7f080("ambient_redzone", "ambient_redzone", "vox_ai_zombie_ambient_redzone", 1);
    function_f11270bb42f7f080("anim_redzone", "anim_redzone", "vox_ai_zombie_idle_to_aware", 1);
    function_f11270bb42f7f080("zombie_pain_start", "pain", "vox_ai_zombie_pain", 3);
    function_f11270bb42f7f080("pain_electric_vox", "pain_electric", "vox_ai_zombie_pain_electric", 3);
    function_f11270bb42f7f080("melee_vox", "attack", "vox_ai_zombie_attack", 2);
    function_f11270bb42f7f080("toss_vox", "throw", "vox_ai_zombie_attack", 2);
    function_f11270bb42f7f080("behind_vox", "behind", "vox_ai_zombie_behind", 3);
    function_f11270bb42f7f080("zombie_transform", "transform", "vox_ai_zombie_transform", 3);
    function_ea9336bca9113548("zombie_base_abom_crawler", "ambient_normal", "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
    function_ea9336bca9113548("zombie_base_abom_crawler", "ambient_crawl", "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
    function_ea9336bca9113548("zombie_base_abom_crawler", "ambient_sprint", "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
    function_ea9336bca9113548("zombie_base_abom_crawler", "ambient_investigate", "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
    function_ea9336bca9113548("zombie_base_abom_crawler", "ambient_redzone", "ambient_normal", "vox_ai_abom_crawl_ambient", 1);
    level callback::add("player_connect", &function_622dfa9ef1c9ec44, self.basearchetype);
    foreach (player in level.players) {
        player thread function_622dfa9ef1c9ec44(undefined, self.basearchetype);
    }
    level thread function_1dc3dbebbb45158a();
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_c9071c313b8c83dc);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked", &function_7ca612e0628da67);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_94fe21f6edbcec92);
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0x2d
function function_f54dcf741aec59fb() {
    thread function_78c6b4fdf8524643();
    function_3b76e1d247d2f5a(&function_cd12e4b6f6fa089c);
    delaycall(1, &setentitysoundcontext, "gender", "zombie");
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x7f
function private function_cd12e4b6f6fa089c(event, zombie, var_c2aec59361d95878, alias, priority) {
    switch (event) {
    case #"hash_17116e75dd0568d1":
    case #"hash_b694a70b9092bed1":
        zombie function_5420e83b135ec96f(function_a5b14435e3229bed(1.5), 1);
        break;
    default:
        break;
    }
    function_d01c8da69fe6ad5(zombie, var_c2aec59361d95878, alias, priority);
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x746
// Size: 0xb3
function private function_c9071c313b8c83dc(params) {
    /#
        assert(isdefined(params.body));
    #/
    if (self isscriptable()) {
        self setscriptablepartstate("sound_vo", "off");
    }
    var_ed9360e85180f100 = function_fc041668d6654de8();
    self stopsoundchannel(var_ed9360e85180f100);
    if (self.subclass == "zombie_base_abom_crawler") {
        level thread function_cd12e4b6f6fa089c("abom_crawl_death", params.body, "abom_crawl_death", "vox_ai_abom_crawl_death", 4);
    } else {
        level thread function_cd12e4b6f6fa089c("death", params.body, "death", "vox_ai_zombie_death", 4);
    }
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x800
// Size: 0x4b
function private function_94fe21f6edbcec92(params) {
    if (isdefined(self.var_1f34fdbb706d1253) && gettime() < self.var_1f34fdbb706d1253) {
        return;
    }
    self.var_1f34fdbb706d1253 = gettime() + 1000;
    function_f707c26d8f269f94("zombie_pain_start");
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x852
// Size: 0x18
function private function_7ca612e0628da67(params) {
    function_f707c26d8f269f94("pain_electric_vox");
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0xcf
function function_78c6b4fdf8524643() {
    var_fc3f1cd5f74c5908 = 3;
    self endon("death");
    var_b038488e06f13dd0 = 0;
    while (1) {
        if (self.subclass == "zombie_base_abom_crawler") {
            if (isdefined(self.movemode) && self.movemode == "stop") {
                wait(1);
                continue;
            }
        }
        var_b4ee4904cd7d9269 = function_c9f228f5a6b505a0();
        if (isdefined(level.var_3c408363d81b00e0)) {
            level.var_3c408363d81b00e0++;
            if (level.var_3c408363d81b00e0 < var_fc3f1cd5f74c5908) {
                var_b038488e06f13dd0 = 1;
                function_f707c26d8f269f94(var_b4ee4904cd7d9269);
                waitframe();
                ent_flag_waitopen("playing_vo");
            }
        }
        if (var_b038488e06f13dd0) {
            var_b038488e06f13dd0 = 0;
            wait(randomfloatrange(0.5, 2));
        } else {
            wait(0.1);
        }
    }
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x947
// Size: 0xb5
function private function_c9f228f5a6b505a0() {
    if (isdefined(self.enemy)) {
        if (namespace_9e6ef02d993a7eba::is_crawling()) {
            return "ambient_crawl";
        } else if (bb_movetyperequested("run") || bb_movetyperequested("sprint") || bb_movetyperequested("super_sprint")) {
            return "ambient_sprint";
        } else if (bb_movetyperequested("wander_agitated")) {
            return "ambient_redzone";
        } else if (bb_movetyperequested("investigate")) {
            return "ambient_investigate";
        }
    } else if (bb_movetyperequested("wander_agitated")) {
        return "ambient_redzone";
    } else if (bb_movetyperequested("investigate")) {
        return "ambient_investigate";
    }
    return "ambient_normal";
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x2c
function private function_1dc3dbebbb45158a() {
    level endon("game_ended");
    level.var_3c408363d81b00e0 = 0;
    while (1) {
        level.var_3c408363d81b00e0 = 0;
        wait(0.1);
    }
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x1d
function private function_622dfa9ef1c9ec44(params, archetype) {
    thread function_32ee72de16d42902(archetype);
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa5b
// Size: 0x11f
function private function_32ee72de16d42902(archetype) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    while (1) {
        wait(0.5);
        var_71a254e149ef0e2b = 250;
        ai_array = getaiarrayinradius(self.origin, var_71a254e149ef0e2b);
        if (isdefined(ai_array)) {
            foreach (ai in ai_array) {
                if (!isdefined(ai) || !isdefined(ai.basearchetype) || ai.basearchetype != archetype) {
                    continue;
                }
                if (!isdefined(ai.enemy) || ai.enemy != self || !isplayer(ai.enemy)) {
                    continue;
                }
                if (function_c7ac2345de8620e8(ai)) {
                    ai function_f707c26d8f269f94("behind_vox");
                    wait(2.5);
                }
            }
        }
    }
}

// Namespace zombie_base_audio/namespace_5657a24d887f84ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb81
// Size: 0x12c
function private function_c7ac2345de8620e8(zombie) {
    dist = 150;
    if (zombie bb_movetyperequested("walk")) {
        dist = 175;
    } else if (zombie bb_movetyperequested("run")) {
        dist = 200;
    } else if (zombie bb_movetyperequested("sprint")) {
        dist = 225;
    } else if (zombie bb_movetyperequested("super_sprint")) {
        dist = 250;
    }
    var_6e9af20b91466ec6 = distance2dsquared(self.origin, zombie.origin) < dist * dist;
    var_4d18c820669d9625 = abs(self.origin[2] - zombie.origin[2]) < 140;
    /#
        /#
            assert(isplayer(zombie.enemy));
        #/
    #/
    return var_6e9af20b91466ec6 && var_4d18c820669d9625 && !within_fov_2d(zombie.enemy.origin, zombie.enemy.angles, zombie.origin, cos(95));
}

