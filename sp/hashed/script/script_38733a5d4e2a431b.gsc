#using script_1dc886a0cbed83a2;
#using script_235003c98a1b1b96;
#using script_2d04cea621f69fb8;
#using script_4182479ba5b6a32f;
#using script_5c36b3719581f7cc;
#using script_7bb0b5b316a6e416;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\character;
#using scripts\common\ai;

#namespace namespace_9e9e3a0836f6fd4a;

// Namespace namespace_9e9e3a0836f6fd4a / namespace_36e58cfeb8638faf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_65c89dea6ccc6911");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_papa220_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "ar";
    switch (scripts\code\character::get_random_weapon(2)) {
    case 0:
        self.weapon = makeweapon("iw9_ar_akilo105_sp");
        break;
    case 1:
        self.weapon = makeweapon("iw9_ar_akilo74_sp");
        break;
    }
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

// Namespace namespace_9e9e3a0836f6fd4a / namespace_36e58cfeb8638faf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x419
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_9e9e3a0836f6fd4a / namespace_36e58cfeb8638faf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x477
// Size: 0x99
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_464d64e23897e812::main();
    case 1:
        return namespace_464d63e23897e5df::main();
    case 2:
        return namespace_464d62e23897e3ac::main();
    case 3:
        return namespace_464d60e23897df46::main();
    case 4:
        return namespace_340b358275ffbc2c::main();
    }
}

// Namespace namespace_9e9e3a0836f6fd4a / namespace_36e58cfeb8638faf
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_9e9e3a0836f6fd4a / namespace_36e58cfeb8638faf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52e
// Size: 0x68
function precache(classname) {
    namespace_464d64e23897e812::precache_sp();
    namespace_464d63e23897e5df::precache_sp();
    namespace_464d62e23897e3ac::precache_sp();
    namespace_464d60e23897df46::precache_sp();
    namespace_340b358275ffbc2c::precache_sp();
    precacheitem("iw9_ar_akilo105_sp");
    precacheitem("iw9_ar_akilo74_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

