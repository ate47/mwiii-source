#using script_38c517e34d7c3efb;
#using script_503081a86c1539d3;
#using script_619b2bdd818c427d;
#using script_6c32b2aeb4eff172;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;

#namespace namespace_cbd93cc0d24c9a36;

// Namespace namespace_cbd93cc0d24c9a36 / namespace_64aea6ec2f2d918d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x185
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_466f4d9dd500c6df");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_58cf5793cab18f7b");
    self.subclass = self.var_534e788bc498be9f.name;
    self.nameindex = randomintrange(1, 10);
    self.health = 900;
    self.maxhealth = 900;
    self.behaviortreeasset = "zombie_disciple_pet";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_disciple";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_disciple_pet";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_disciple");
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

// Namespace namespace_cbd93cc0d24c9a36 / namespace_64aea6ec2f2d918d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x359
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

// Namespace namespace_cbd93cc0d24c9a36 / namespace_64aea6ec2f2d918d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_a02f4c5d421fe415::main();
}

// Namespace namespace_cbd93cc0d24c9a36 / namespace_64aea6ec2f2d918d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9
// Size: 0x107
function precache() {
    agent_type = "actor_jup_spawner_zombie_disciple_pet";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_58cf5793cab18f7b");
        namespace_a02f4c5d421fe415::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_disciple";
    params.zombieaisetting = "settings_zombie_disciple_pet";
    namespace_e58fc1f6d37e525b::precache(params);
    namespace_8fb1124048da2603::function_a57e56c880e80cdd();
}

