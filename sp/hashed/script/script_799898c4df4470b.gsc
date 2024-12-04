#using script_5c36b3719581f7cc;
#using script_75c097cf31ac6c0;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_4a577941c165d9ba;

// Namespace namespace_4a577941c165d9ba / namespace_6c95a975df844bab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x200
// Size: 0x17d
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_74e013639cdc5a69");
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

// Namespace namespace_4a577941c165d9ba / namespace_6c95a975df844bab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x385
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_4a577941c165d9ba / namespace_6c95a975df844bab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e3
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default:
        return namespace_91bc0e6bf6fd1fa2::main();
    }
}

// Namespace namespace_4a577941c165d9ba / namespace_6c95a975df844bab
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42c
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_4a577941c165d9ba / namespace_6c95a975df844bab
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x442
// Size: 0x2b
function precache(classname) {
    namespace_91bc0e6bf6fd1fa2::precache_sp();
    precacheitem("jup_cp24_pi_glima21_sp_3d");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

