#using script_6c32b2aeb4eff172;
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

#namespace namespace_70fc35e94db9839b;

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x274
// Size: 0x1b1
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_688fafe09e676ff8");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_579d39f2f40c41bf");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 180;
    self.maxhealth = 180;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "iw9_sm_beta, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    setup_model();
    assert(isscriptedagent(self));
    assert(isdefined(self.behaviortreeasset));
    assert(isdefined(self.asmasset));
    self.var_a942dd31d55102c9 = self.asmasset;
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    scripts\asm\asm_mp::asm_init(self.asmasset, self.animationarchetype);
    scripts\common\ai::ai_init();
}

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d
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

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a2
// Size: 0x149
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_7d3b12eaf52e5063::main();
    case 1: 
        return namespace_9c005241e2d2ce27::main();
    case 2: 
        return namespace_9c005341e2d2d05a::main();
    case 3: 
        return namespace_9c005441e2d2d28d::main();
    case 4: 
        return namespace_489304c6fe3a495b::main();
    case 5: 
        return namespace_489305c6fe3a4b8e::main();
    case 6: 
        return namespace_5cfc4ed0ea7654ff::main();
    case 7: 
        return namespace_5cfc4fd0ea765732::main();
    case 8: 
        return namespace_ffc709ab88f6587f::main();
    case 9: 
        return namespace_ffc70aab88f65ab2::main();
    case 10: 
        return namespace_ffc70bab88f65ce5::main();
    case 11: 
        return namespace_474abb8d4fd3a643::main();
    case 12: 
        return namespace_474abc8d4fd3a876::main();
    }
}

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f3
// Size: 0x83
function function_efa2a2a09745fbd() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_385f3646395c9f26::main();
    case 1: 
        return namespace_385f3546395c9cf3::main();
    case 2: 
        return namespace_385f3446395c9ac0::main();
    case 3: 
        return namespace_385f3b46395caa25::main();
    }
}

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67e
// Size: 0x13f
function precache() {
    agent_type = "actor_jup_ob_enemy_basic_grunt";
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
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_70fc35e94db9839b / namespace_be1f12aa953a539a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c5
// Size: 0xa2
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_sm_beta, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("iw9_sm_beta", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
}

