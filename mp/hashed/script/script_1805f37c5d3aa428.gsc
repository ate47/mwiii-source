#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_550dd7ffd47d264c;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_6a1593331aebf847;

#namespace namespace_6ad4bf1253a58d79;

// Namespace namespace_6ad4bf1253a58d79 / namespace_c6b69b15ed6e1d28
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad
// Size: 0x173
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_948eb57c9200eae");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_1b4e3639bb9eee21");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 1000;
    self.maxhealth = 1000;
    self.behaviortreeasset = "zombie_abom";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_abom";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_abom_mega";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_abom_mega");
    self.weapon = nullweapon();
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

// Namespace namespace_6ad4bf1253a58d79 / namespace_c6b69b15ed6e1d28
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x328
// Size: 0x57
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_6ad4bf1253a58d79 / namespace_c6b69b15ed6e1d28
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x387
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_f14ed9739ed41d26::main();
}

// Namespace namespace_6ad4bf1253a58d79 / namespace_c6b69b15ed6e1d28
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x398
// Size: 0x100
function precache() {
    agent_type = "actor_jup_spawner_zombie_abom_s3_rr_unlock";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_1b4e3639bb9eee21");
        namespace_f14ed9739ed41d26::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_abom_mega";
    params.zombieaisetting = "settings_zombie_abom_mega";
    namespace_d2273ed91d2b732b::precache(params);
}
