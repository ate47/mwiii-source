#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_7639c27eb3fd1c6a;
#using script_1c46827277379c17;
#using script_75c097cf31ac6c0;
#using scripts\aitypes\assets.gsc;

#namespace namespace_31e097df8478690a;

// Namespace namespace_31e097df8478690a / namespace_27227c07c897c3a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x210
// Size: 0x17d
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4c86f95142fd120f");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("jup_cp24_pi_glima21_sp_3d");
    setup_model();
    namespace_a8b91aa898baa76c::firstinit();
    self.a = spawnstruct();
    scripts\asm\asm::asm_init_blackboard();
    scripts\aitypes\bt_util::bt_init();
    assertex(isdefined(self.animationarchetype) && self.animationarchetype != "", "Aitype " + self.classname + " does not have the animation archetype defined on the asset.");
    assertex(isdefined(self.asmasset) && self.asmasset != "", "Aitype " + self.classname + " does not have the animation state machine defined on the asset.");
    self.var_a942dd31d55102c9 = self.asmasset;
    scripts\asm\asm_sp::asm_init(self.asmasset, self.animationarchetype);
    scripts\common\ai::ai_init();
}

// Namespace namespace_31e097df8478690a / namespace_27227c07c897c3a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x395
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_31e097df8478690a / namespace_27227c07c897c3a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f3
// Size: 0x6d
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0: 
        return namespace_91bc0c6bf6fd1b3c::main();
    case 1: 
        return namespace_91bc0f6bf6fd21d5::main();
    case 2: 
        return namespace_91bc0e6bf6fd1fa2::main();
    }
}

// Namespace namespace_31e097df8478690a / namespace_27227c07c897c3a5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x468
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_31e097df8478690a / namespace_27227c07c897c3a5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47e
// Size: 0x39
function precache(classname) {
    namespace_91bc0c6bf6fd1b3c::precache_sp();
    namespace_91bc0f6bf6fd21d5::precache_sp();
    namespace_91bc0e6bf6fd1fa2::precache_sp();
    precacheitem("jup_cp24_pi_glima21_sp_3d");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}
