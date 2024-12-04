#using script_26b3115514a3172c;
#using script_5c36b3719581f7cc;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_sp;
#using scripts\common\ai;

#namespace namespace_2b311b692ecf3d6b;

// Namespace namespace_2b311b692ecf3d6b / namespace_a3fe97deafec17d8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x192
// Size: 0x188
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_4409e4dd9505f1a6");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_papa220_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("iw9_ar_mike4_sp");
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

// Namespace namespace_2b311b692ecf3d6b / namespace_a3fe97deafec17d8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x322
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_2b311b692ecf3d6b / namespace_a3fe97deafec17d8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_cd1af3a2183e651a::main();
}

// Namespace namespace_2b311b692ecf3d6b / namespace_a3fe97deafec17d8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x391
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_2b311b692ecf3d6b / namespace_a3fe97deafec17d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0x41
function precache(classname) {
    namespace_cd1af3a2183e651a::precache_sp();
    precacheitem("iw9_ar_mike4_sp");
    precacheitem("iw9_pi_papa220_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}

