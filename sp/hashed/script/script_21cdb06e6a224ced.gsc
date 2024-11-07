#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_625c3213ebb81a29;
#using scripts\aitypes\assets.gsc;

#namespace namespace_4d00e9ecef228524;

// Namespace namespace_4d00e9ecef228524 / namespace_4fb7816211a801b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a
// Size: 0x188
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_1a7c15f40086a555");
    self.grenadeweapon = makeweapon("frag");
    self.grenadeammo = 2;
    self.secondaryweapon = nullweapon();
    self.sidearm = makeweapon("iw9_pi_golf17_sp");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 0;
    self.scriptedweaponclassprimary = "none";
    self.weapon = makeweapon("jup_jp02_ar_bromeo805_sp");
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

// Namespace namespace_4d00e9ecef228524 / namespace_4fb7816211a801b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_4d00e9ecef228524 / namespace_4fb7816211a801b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_ef7f3291faf20a89::main();
}

// Namespace namespace_4d00e9ecef228524 / namespace_4fb7816211a801b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x399
// Size: 0xe
function spawner() {
    self setspawnerteam("allies");
}

// Namespace namespace_4d00e9ecef228524 / namespace_4fb7816211a801b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3af
// Size: 0x41
function precache(classname) {
    namespace_ef7f3291faf20a89::precache_sp();
    precacheitem("jup_jp02_ar_bromeo805_sp");
    precacheitem("iw9_pi_golf17_sp");
    precacheitem("frag");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}
