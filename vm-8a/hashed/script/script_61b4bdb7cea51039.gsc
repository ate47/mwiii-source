#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_3ff066f9a1443a7f;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_30a7bba69ce5f369;
#using script_515285d5287575ff;
#using scripts\mp\class.gsc;

#namespace namespace_60632daa6d34bee0;

// Namespace namespace_60632daa6d34bee0 / namespace_1800ac27b2cd1979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0x1fa
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_248e0183fa91503");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_377e01dde82ed647");
    self.subclass = self.var_534e788bc498be9f.name;
    self.nameindex = randomintrange(1, 5);
    self.health = 10000;
    self.maxhealth = 10000;
    self.behaviortreeasset = "zombie_mimic";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_mimic";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_mimic_hvt";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_mimic_hvt");
    primaryweaponhash = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "jup_zombie_mimic_ranged_attack_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 0;
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

// Namespace namespace_60632daa6d34bee0 / namespace_1800ac27b2cd1979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe
// Size: 0x56
function setup_model() {
    var_42e5c77b1d7fe6e7 = isdefined(self.var_42e5c77b1d7fe6e7) ? self.var_42e5c77b1d7fe6e7 : "default";
    switch (var_42e5c77b1d7fe6e7) {
    case #"hash_7038dec66d8275be":
    default: 
        function_9ac26a51c94ccf52();
        break;
    }
}

// Namespace namespace_60632daa6d34bee0 / namespace_1800ac27b2cd1979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_2a5ddef6b9e7fc31::main();
}

// Namespace namespace_60632daa6d34bee0 / namespace_1800ac27b2cd1979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d
// Size: 0x10f
function precache() {
    agent_type = "actor_jup_spawner_zombie_mimic_hvt_emp";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_377e01dde82ed647");
        namespace_2a5ddef6b9e7fc31::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_mimic_hvt";
    params.zombieaisetting = "settings_zombie_mimic_hvt";
    namespace_99e25c27505b58fd::precache(params);
    namespace_d7b9f3d899c5a909::function_6c78c4cdcb9d493();
    thread setup_weapons();
}

// Namespace namespace_60632daa6d34bee0 / namespace_1800ac27b2cd1979
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x584
// Size: 0xd6
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_me_zombie_mimic, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_me_zombie_mimic", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "jup_zombie_mimic_ranged_attack_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_zombie_mimic_ranged_attack_mp");
    }
}
