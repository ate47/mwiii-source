// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_253e6b831415228d;
#using script_6966b1c751920a89;
#using script_213ac602c46b9067;
#using script_cafc97c8dcda442;
#using script_20e33784157cd472;
#using script_31fa1039ff4c08da;
#using script_16b0f63f5e08b90d;
#using script_10003478b448a34d;
#using script_3547c63cd68b85d7;
#using script_7fee885a11b3a30b;
#using script_41be153c195e760a;
#using script_25155d7e58eb515b;
#using script_69b9523ab8a15c9e;
#using script_23ec1e44b29c405a;
#using script_589e89282e55f2fc;
#using script_27be92ad707105e3;
#using script_514982a76038da44;
#using script_7800bec655f4671c;
#using script_472227ccbec0290;
#using script_63779139672a2689;
#using script_20a49353cccdf990;
#using script_bd1533c9129da34;
#using script_6c6bc6450c8ef43d;
#using script_7a9b42ac2e51ea1b;
#using script_5074ef98eb4ae0c4;
#using script_f95169ef052939d;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_f02a7566345d263;
#using scripts\mp\class.gsc;

#namespace jup_spawner_zombie_base;

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355
// Size: 0x1e7
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"jup_spawner_zombie_base");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_4e638d9e3014c083");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "zombie_base";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_base";
    self.var_f7f189f0e87db6ac = %"hash_3664c8ba706ec788";
    self.var_570908460ede5c13 = "settings_zombie_base";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_base_jup");
    var_fea750d6814b803d = "jup_me_zombie_melee, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "jup_zombie_ranged_attack_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
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

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x543
// Size: 0x99
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7bb2cd766703d463":
        function_7a493635b81d4ce7();
        break;
    case #"hash_af83e47edfa8900a":
        function_8d815580e4ab1e96();
        break;
    case #"hash_5343b465e56ec9a4":
        function_1566a42efce5d0f8();
        break;
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3
// Size: 0x6e
function function_9ac26a51c94ccf52() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_e064dca95e16fbfd::main();
        break;
    case 1:
        return namespace_2f508fc93a5963c3::main();
        break;
    case 2:
        return namespace_2f8e97c93a9e191d::main();
        break;
    }
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x658
// Size: 0x11e
function function_7a493635b81d4ce7() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_2f508fc93a5963c3::main();
        break;
    case 1:
        return namespace_280546693ad09dae::main();
        break;
    case 2:
        return namespace_aa915dff9773392a::main();
        break;
    case 3:
        return namespace_d430a4dc6d501cae::main();
        break;
    case 4:
        return namespace_d910f80f6cf1170d::main();
        break;
    case 5:
        return namespace_46bf59f0bbdfa2af::main();
        break;
    case 6:
        return namespace_6d6ba3b89ccba887::main();
        break;
    case 7:
        return namespace_ac4f2da2c596a9c9::main();
        break;
    case 8:
        return namespace_a112df5249555346::main();
        break;
    case 9:
        return namespace_f7199de18b60472d::main();
        break;
    case 10:
        return namespace_52294e9689807b78::main();
        break;
    }
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0xf2
function function_8d815580e4ab1e96() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_2f8e97c93a9e191d::main();
        break;
    case 1:
        return namespace_e27e9255e64c7fb8::main();
        break;
    case 2:
        return namespace_d4b4a4dc6de14fe0::main();
        break;
    case 3:
        return namespace_469351f0bbaf2ab1::main();
        break;
    case 4:
        return namespace_aa1f5dff96f64354::main();
        break;
    case 5:
        return namespace_d7fd5db8f39ef374::main();
        break;
    case 6:
        return namespace_ae4e23ce8493b012::main();
        break;
    case 7:
        return namespace_faf678db1d4e0915::main();
        break;
    case 8:
        return namespace_96ad37eb9957a97c::main();
        break;
    }
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x876
// Size: 0xb0
function function_1566a42efce5d0f8() {
    /#
        assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    #/
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_f16950c7b0ec9a::main();
        break;
    case 1:
        return namespace_f16850c7b0ea67::main();
        break;
    case 2:
        return namespace_e064dca95e16fbfd::main();
        break;
    case 3:
        return namespace_286250693b37a94f::main();
        break;
    case 4:
        return namespace_2d6ec402a80dacf2::main();
        break;
    case 5:
        return namespace_e48cebc8a33291fb::main();
        break;
    }
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92d
// Size: 0x1cd
function precache() {
    agent_type = "actor_jup_spawner_zombie_base";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_4e638d9e3014c083");
        namespace_e064dca95e16fbfd::function_8168fbf6282d398b();
        namespace_2f508fc93a5963c3::function_8168fbf6282d398b();
        namespace_2f8e97c93a9e191d::function_8168fbf6282d398b();
        namespace_2f508fc93a5963c3::function_8168fbf6282d398b();
        namespace_280546693ad09dae::function_8168fbf6282d398b();
        namespace_aa915dff9773392a::function_8168fbf6282d398b();
        namespace_d430a4dc6d501cae::function_8168fbf6282d398b();
        namespace_d910f80f6cf1170d::function_8168fbf6282d398b();
        namespace_46bf59f0bbdfa2af::function_8168fbf6282d398b();
        namespace_6d6ba3b89ccba887::function_8168fbf6282d398b();
        namespace_ac4f2da2c596a9c9::function_8168fbf6282d398b();
        namespace_a112df5249555346::function_8168fbf6282d398b();
        namespace_f7199de18b60472d::function_8168fbf6282d398b();
        namespace_52294e9689807b78::function_8168fbf6282d398b();
        namespace_2f8e97c93a9e191d::function_8168fbf6282d398b();
        namespace_e27e9255e64c7fb8::function_8168fbf6282d398b();
        namespace_d4b4a4dc6de14fe0::function_8168fbf6282d398b();
        namespace_469351f0bbaf2ab1::function_8168fbf6282d398b();
        namespace_aa1f5dff96f64354::function_8168fbf6282d398b();
        namespace_d7fd5db8f39ef374::function_8168fbf6282d398b();
        namespace_ae4e23ce8493b012::function_8168fbf6282d398b();
        namespace_faf678db1d4e0915::function_8168fbf6282d398b();
        namespace_96ad37eb9957a97c::function_8168fbf6282d398b();
        namespace_f16950c7b0ec9a::function_8168fbf6282d398b();
        namespace_f16850c7b0ea67::function_8168fbf6282d398b();
        namespace_e064dca95e16fbfd::function_8168fbf6282d398b();
        namespace_286250693b37a94f::function_8168fbf6282d398b();
        namespace_2d6ec402a80dacf2::function_8168fbf6282d398b();
        namespace_e48cebc8a33291fb::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_base_jup";
    params.var_570908460ede5c13 = "settings_zombie_base";
    namespace_93ee5144f461ddc3::precache(params);
    thread function_e8cf870298e36bdc();
}

// Namespace jup_spawner_zombie_base/namespace_cecd894aa2e09559
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb01
// Size: 0xd7
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_fea750d6814b803d = "jup_me_zombie_melee, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_fea750d6814b803d])) {
        level.var_67b54180a55f70e1[var_fea750d6814b803d] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("jup_me_zombie_melee", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_a68442ebadb66eb1 = "jup_zombie_ranged_attack_mp";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("jup_zombie_ranged_attack_mp");
    }
}
