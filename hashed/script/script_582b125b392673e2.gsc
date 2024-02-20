// mwiii decomp prototype
#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_34dce086a25328a2;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_c93bcd6863c1196b;

// Namespace namespace_c93bcd6863c1196b/namespace_9a2277de2fa644a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3
// Size: 0x1ca
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_d827a909fa7361c");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_6648bd5f43597e7d");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    var_fea750d6814b803d = "iw9_lm_rkilo, [ holo04, grip_angled05 ], none, none";
    self.weapon = level.var_67b54180a55f70e1[var_fea750d6814b803d];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_a68442ebadb66eb1 = "gas_grenade_exgm_chemist";
    self.grenadeweapon = level.var_67b54180a55f70e1[var_a68442ebadb66eb1];
    self.grenadeammo = 5;
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

// Namespace namespace_c93bcd6863c1196b/namespace_9a2277de2fa644a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4
// Size: 0x57
function setup_model() {
    if (isdefined(self.var_42e5c77b1d7fe6e7)) {
        goto LOC_00000028;
    }
    var_42e5c77b1d7fe6e7 = "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_c93bcd6863c1196b/namespace_9a2277de2fa644a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x412
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_2afe43695205fd58::main();
}

// Namespace namespace_c93bcd6863c1196b/namespace_9a2277de2fa644a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x423
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_enemy_specialist_heavytactician_fortressguard";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_6648bd5f43597e7d");
        namespace_2afe43695205fd58::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
    thread function_e8cf870298e36bdc();
}

// Namespace namespace_c93bcd6863c1196b/namespace_9a2277de2fa644a6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f9
// Size: 0xb3
function function_e8cf870298e36bdc() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_fea750d6814b803d = "iw9_lm_rkilo, [ holo04, grip_angled05 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_fea750d6814b803d])) {
        level.var_67b54180a55f70e1[var_fea750d6814b803d] = namespace_d19129e4fa5d176::function_e83615f8a92e4378("iw9_lm_rkilo", [0:"holo04", 1:"grip_angled05"], "none", "none");
    }
    var_a68442ebadb66eb1 = "gas_grenade_exgm_chemist";
    if (!isdefined(level.var_67b54180a55f70e1[var_a68442ebadb66eb1])) {
        level.var_67b54180a55f70e1[var_a68442ebadb66eb1] = makeweapon("gas_grenade_exgm_chemist");
    }
}
