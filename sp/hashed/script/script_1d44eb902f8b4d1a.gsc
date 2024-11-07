#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_5bccd9adf1b2d853;
#using scripts\aitypes\assets.gsc;

#namespace namespace_780ee44c478d5b0b;

// Namespace namespace_780ee44c478d5b0b / namespace_a4685102e4d8a7f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x178
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_7b60183dda4c4ece");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = nullweapon();
    self.sidearm = nullweapon();
    self.behaviortreeasset = "civilian_livingworld";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "civilian_react";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = nullweapon();
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

// Namespace namespace_780ee44c478d5b0b / namespace_a4685102e4d8a7f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x375
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_780ee44c478d5b0b / namespace_a4685102e4d8a7f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3
// Size: 0x41
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    default:
        return namespace_ea6de496d128fb1b::main();
    }
}

// Namespace namespace_780ee44c478d5b0b / namespace_a4685102e4d8a7f8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41c
// Size: 0xe
function spawner() {
    self setspawnerteam("neutral");
}

// Namespace namespace_780ee44c478d5b0b / namespace_a4685102e4d8a7f8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x432
// Size: 0x20
function precache(classname) {
    namespace_ea6de496d128fb1b::precache_sp();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::civilian();
}
