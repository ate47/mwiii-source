#using script_1dc88bcecabc5e01;
#using script_426bacd5c38e6383;
#using script_474e48ca4c31ba88;
#using script_5c36b3719581f7cc;
#using script_5e1404f1499569f2;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_d806950254eda963;

// Namespace namespace_d806950254eda963 / namespace_67f515c6bfb29ef4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x1d7
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_58bca1b287ff9176");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1580d6bc10b4");
    self.subclass = self.var_534e788bc498be9f.name;
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_akilo105_sp", "iw9_ar_akilo74_sp"]);
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

// Namespace namespace_d806950254eda963 / namespace_67f515c6bfb29ef4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x427
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_d806950254eda963 / namespace_67f515c6bfb29ef4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x485
// Size: 0x83
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_1836d190bd506fdc::main();
    case 1:
        return namespace_1836d490bd507675::main();
    case 2:
        return namespace_1836d390bd507442::main();
    case 3:
        return namespace_1836ce90bd506943::main();
    }
}

// Namespace namespace_d806950254eda963 / namespace_67f515c6bfb29ef4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x510
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_d806950254eda963 / namespace_67f515c6bfb29ef4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0x61
function precache(classname) {
    namespace_1836d190bd506fdc::precache_sp();
    namespace_1836d490bd507675::precache_sp();
    namespace_1836d390bd507442::precache_sp();
    namespace_1836ce90bd506943::precache_sp();
    precacheitem("iw9_ar_akilo105_sp");
    precacheitem("iw9_ar_akilo74_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

