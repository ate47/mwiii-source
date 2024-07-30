#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;

#namespace namespace_9395a32298bee3c;

// Namespace namespace_9395a32298bee3c / namespace_fe1b774f444697f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x173
// Size: 0x120
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_302cfdfac2a59db");
    self.health = 100;
    self.maxhealth = 100;
    self.behaviortreeasset = "civilian_livingworld";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "civilian_react";
    self.zombieaisetting = "settings_zombie_base";
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

// Namespace namespace_9395a32298bee3c / namespace_fe1b774f444697f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
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

// Namespace namespace_9395a32298bee3c / namespace_fe1b774f444697f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fa
// Size: 0x1a
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "<dev string:x1c>");
}

// Namespace namespace_9395a32298bee3c / namespace_fe1b774f444697f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31c
// Size: 0xa0
function precache() {
    agent_type = "actor_civilian_mp_dmz_base";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "neutral";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}

