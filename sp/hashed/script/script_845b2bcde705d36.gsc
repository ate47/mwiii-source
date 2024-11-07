#using scripts\code\ai.gsc;
#using script_5c36b3719581f7cc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_sp.gsc;
#using scripts\common\ai.gsc;
#using script_310204433018ccf1;
#using scripts\aitypes\assets.gsc;

#namespace namespace_8c89a4c8ffd50aef;

// Namespace namespace_8c89a4c8ffd50aef / namespace_69a05f741909dbea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x195
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_24165d41c032ab30");
    self.grenadeweapon = nullweapon();
    self.grenadeammo = 0;
    self.secondaryweapon = scripts\code\ai::create_weapon_in_script("");
    self.sidearm = scripts\code\ai::create_weapon_in_script("", "sidearm");
    self.behaviortreeasset = "enemy_combatant";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    self.usescriptedweapon = 1;
    self.scriptedweaponclassprimary = "pistol";
    self.weapon = scripts\code\ai::create_weapon_in_script(["iw9_pi_papa220_sp_hijack"]);
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

// Namespace namespace_8c89a4c8ffd50aef / namespace_69a05f741909dbea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x331
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default:
        return function_9ac26a51c94ccf52();
    }
}

// Namespace namespace_8c89a4c8ffd50aef / namespace_69a05f741909dbea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38f
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_1e12596559e30ab1::main();
}

// Namespace namespace_8c89a4c8ffd50aef / namespace_69a05f741909dbea
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a0
// Size: 0xe
function spawner() {
    self setspawnerteam("axis");
}

// Namespace namespace_8c89a4c8ffd50aef / namespace_69a05f741909dbea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b6
// Size: 0x2b
function precache(classname) {
    namespace_1e12596559e30ab1::precache_sp();
    precacheitem("iw9_pi_papa220_sp_hijack");
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
}
