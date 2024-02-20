// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_605a7025b3443aeb;
#using script_77a99ae72773152d;
#using script_42c2a5ca589e14e4;
#using script_60ff8ec02a27588b;
#using script_432caa676ff6f3a5;
#using script_5ed53a82f5fe593c;
#using script_6e5aea2df432a57b;
#using script_691d7b45e4a09fbe;
#using script_2186e8b70dd1c45b;
#using script_1c4979cefe3fbe9e;
#using script_660a74d7ea912c7d;
#using script_2b3173a0a4b03027;
#using script_3135f3ae1ce6163a;
#using script_139d738b88f9b548;
#using script_6d7db6900a6781c1;
#using script_e82fad9e5eb9b2;
#using script_68a5d7921b3adc43;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace jup_ob_enemy_basic_grunt_long;

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x358
// Size: 0x224
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_ob_enemy_basic_grunt_long");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_579d39f2f40c41bf");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 180;
    self.maxhealth = 180;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    switch (namespace_ac7e8770abb7eb1::get_random_weapon(3)) {
    case 0:
        var_fea750d6814b803d = "iw9_ar_kilo53, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 1:
        var_fea750d6814b803d = "iw9_ar_mcharlie, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    case 2:
        var_fea750d6814b803d = "iw9_ar_golf3, [ none, none, none, none, none, none ], none, none";
        self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    setup_model();
    /#
        assert(isscriptedagent(self));
    #/
    /#
        assert(isdefined(self.behaviortreeasset));
    #/
    /#
        assert(isdefined(self.asmasset));
    #/
    self.var_a942dd31d55102c9 = self.asmasset;
    self.a = spawnstruct();
    namespace_bf5a1761a8d1bb07::asm_init_blackboard();
    namespace_f08e04b63067d27f::bt_init();
    namespace_28d7bb9fcf17949d::asm_init(self.asmasset, self.animationarchetype);
    namespace_6205bc7c5e394598::ai_init();
}

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x583
// Size: 0x6d
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_f19a3ecfe8b35af9":
        function_efa2a2a09745fbd();
        break;
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7
// Size: 0x14a
function function_9ac26a51c94ccf52() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_7d3b12eaf52e5063::main();
        break;
    case 1:
        return namespace_9c005241e2d2ce27::main();
        break;
    case 2:
        return namespace_9c005341e2d2d05a::main();
        break;
    case 3:
        return namespace_9c005441e2d2d28d::main();
        break;
    case 4:
        return namespace_489304c6fe3a495b::main();
        break;
    case 5:
        return namespace_489305c6fe3a4b8e::main();
        break;
    case 6:
        return namespace_5cfc4ed0ea7654ff::main();
        break;
    case 7:
        return namespace_5cfc4fd0ea765732::main();
        break;
    case 8:
        return namespace_ffc709ab88f6587f::main();
        break;
    case 9:
        return namespace_ffc70aab88f65ab2::main();
        break;
    case 10:
        return namespace_ffc70bab88f65ce5::main();
        break;
    case 11:
        return namespace_474abb8d4fd3a643::main();
        break;
    case 12:
        return namespace_474abc8d4fd3a876::main();
        break;
    }
}

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x748
// Size: 0x84
function function_efa2a2a09745fbd() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_385f3646395c9f26::main();
        break;
    case 1:
        return namespace_385f3546395c9cf3::main();
        break;
    case 2:
        return namespace_385f3446395c9ac0::main();
        break;
    case 3:
        return namespace_385f3b46395caa25::main();
        break;
    }
}

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3
// Size: 0x13f
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_grunt_long";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_579d39f2f40c41bf");
        namespace_7d3b12eaf52e5063::function_8168fbf6282d398b();
        namespace_9c005241e2d2ce27::function_8168fbf6282d398b();
        namespace_9c005341e2d2d05a::function_8168fbf6282d398b();
        namespace_9c005441e2d2d28d::function_8168fbf6282d398b();
        namespace_489304c6fe3a495b::function_8168fbf6282d398b();
        namespace_489305c6fe3a4b8e::function_8168fbf6282d398b();
        namespace_5cfc4ed0ea7654ff::function_8168fbf6282d398b();
        namespace_5cfc4fd0ea765732::function_8168fbf6282d398b();
        namespace_ffc709ab88f6587f::function_8168fbf6282d398b();
        namespace_ffc70aab88f65ab2::function_8168fbf6282d398b();
        namespace_ffc70bab88f65ce5::function_8168fbf6282d398b();
        namespace_474abb8d4fd3a643::function_8168fbf6282d398b();
        namespace_474abc8d4fd3a876::function_8168fbf6282d398b();
        namespace_385f3646395c9f26::function_8168fbf6282d398b();
        namespace_385f3546395c9cf3::function_8168fbf6282d398b();
        namespace_385f3446395c9ac0::function_8168fbf6282d398b();
        namespace_385f3b46395caa25::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace jup_ob_enemy_basic_grunt_long/namespace_5f8a7791a124bdc9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x919
// Size: 0x190
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_ar_kilo53, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_kilo53", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_5576d6be590aa0fd = "iw9_ar_mcharlie, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_mcharlie", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_ar_golf3, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_ar_golf3", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
}
