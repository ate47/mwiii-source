#using script_1161301ab760c579;
#using script_4e91548d4a22eb8b;
#using script_57fc53023cbf709d;
#using script_5abc580d67ca9ce0;
#using script_5c36b3719581f7cc;
#using script_62155c1f834bed3e;
#using script_6752cb0792ddf2fb;
#using script_6bc926fc1b25be60;
#using script_e58cb13c7e71ede;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\code\ai;
#using scripts\common\ai;

#namespace namespace_3e13a75009eb1afc;

// Namespace namespace_3e13a75009eb1afc / namespace_e9b241112dd97e89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x1a4
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_31f2f17c025f409b");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("iw9_pi_papa220_sp", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "ar";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_ar_golf3_sp", "iw9_ar_akilo74_sp"]);
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

// Namespace namespace_3e13a75009eb1afc / namespace_e9b241112dd97e89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x411
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_3e13a75009eb1afc / namespace_e9b241112dd97e89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0xdb
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_cb9caa4dcf612a9b::main();
    case 1:
        return namespace_2ab5831f12b183ce::main();
    case 2:
        return namespace_cb9cad4dcf613134::main();
    case 3:
        return namespace_2ac2771f12bf7def::main();
    case 4:
        return namespace_cb9cab4dcf612cce::main();
    case 5:
        return namespace_2ab96b1f12b544dd::main();
    case 6:
        return namespace_cb9cac4dcf612f01::main();
    case 7:
        return namespace_2abe4f1f12bb3020::main();
    }
}

// Namespace namespace_3e13a75009eb1afc / namespace_e9b241112dd97e89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x552
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_3e13a75009eb1afc / namespace_e9b241112dd97e89
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x568
// Size: 0x7d
function precache(classname) {
    namespace_cb9caa4dcf612a9b::precache_sp();
    namespace_2ab5831f12b183ce::precache_sp();
    namespace_cb9cad4dcf613134::precache_sp();
    namespace_2ac2771f12bf7def::precache_sp();
    namespace_cb9cab4dcf612cce::precache_sp();
    namespace_2ab96b1f12b544dd::precache_sp();
    namespace_cb9cac4dcf612f01::precache_sp();
    namespace_2abe4f1f12bb3020::precache_sp();
    precacheitem("iw9_ar_golf3_sp");
    precacheitem("iw9_ar_akilo74_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

