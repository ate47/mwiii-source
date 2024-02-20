// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_6cf4e656f0f29727;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_448bd9a9504ba3bb;

// Namespace namespace_448bd9a9504ba3bb/namespace_19a443bf64856d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119
// Size: 0x146
function main() {
    self.var_9d26ac1e325367ce = function_2336488258354fbc(#"aitype", %"hash_3a5e8d0afca97482");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_6faa50f86e056055");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "capture_bot";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "capture_bot";
    self.weapon = nullweapon();
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

// Namespace namespace_448bd9a9504ba3bb/namespace_19a443bf64856d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
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

// Namespace namespace_448bd9a9504ba3bb/namespace_19a443bf64856d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4
// Size: 0x9
function function_9ac26a51c94ccf52() {
    return namespace_7eb5c3a922f62367::main();
}

// Namespace namespace_448bd9a9504ba3bb/namespace_19a443bf64856d84
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d5
// Size: 0xc7
function precache() {
    agent_type = "actor_jup_capture_bot_mp_base";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_6faa50f86e056055");
        namespace_7eb5c3a922f62367::function_8168fbf6282d398b();
    }
    namespace_e8f3f30f2d3e4a89::agent_init();
    namespace_f08e04b63067d27f::init();
    namespace_8bef0f00d6d36a69::soldier();
}

