#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using character\character_spetsnaz_ar.gsc;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_615d0954e44c90cd;

// Namespace namespace_615d0954e44c90cd / namespace_11ca35d0ff633660
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21f
// Size: 0x1ad
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_6b48a7461d4b2046");
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    primaryweaponhash = "iw9_ar_akilo, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    self.sidearm = level.var_67b54180a55f70e1[var_4f04b9c326eb7400];
    grenadeweaponhash = "frag_grenade_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 2;
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

// Namespace namespace_615d0954e44c90cd / namespace_11ca35d0ff633660
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d4
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

// Namespace namespace_615d0954e44c90cd / namespace_11ca35d0ff633660
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x433
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return character\character_spetsnaz_ar::main();
}

// Namespace namespace_615d0954e44c90cd / namespace_11ca35d0ff633660
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x444
// Size: 0xaf
function precache() {
    agent_type = "actor_jup_enemy_mp_ar_gl";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        character\character_spetsnaz_ar::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_615d0954e44c90cd / namespace_11ca35d0ff633660
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fb
// Size: 0x14c
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "iw9_ar_akilo, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("iw9_ar_akilo", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    var_4f04b9c326eb7400 = "iw9_pi_papa220, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\mp\class::function_e83615f8a92e4378("iw9_pi_papa220", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag_grenade_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag_grenade_mp");
    }
}
