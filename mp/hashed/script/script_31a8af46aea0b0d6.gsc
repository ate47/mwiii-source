#using script_5a10448e181e50bf;
#using script_6c32b2aeb4eff172;
#using scripts\aitypes\assets;
#using scripts\aitypes\bt_util;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\common\ai;
#using scripts\cp_mp\agents\agent_init;
#using scripts\mp\class;

#namespace namespace_37fbc4f4f505c5e7;

// Namespace namespace_37fbc4f4f505c5e7 / namespace_e8bb687e7ce6c48e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x1c9
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_2c4e5e8e9645570");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_57d7f8ea117bb959");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 300;
    self.maxhealth = 300;
    self.behaviortreeasset = "soldier_jup_ob";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_aggressive";
    self.asmasset = "soldier";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_soldier_base_ob");
    primaryweaponhash = "jup_jp20_lm_evictor, [ holo03, jup_jp20_lm_evictor_belt_200_556n, jup_grip_vert_05 ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 5;
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

// Namespace namespace_37fbc4f4f505c5e7 / namespace_e8bb687e7ce6c48e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450
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

// Namespace namespace_37fbc4f4f505c5e7 / namespace_e8bb687e7ce6c48e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4af
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_4dc2ef625e9b424f::main();
}

// Namespace namespace_37fbc4f4f505c5e7 / namespace_e8bb687e7ce6c48e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c0
// Size: 0xcf
function precache() {
    agent_type = "actor_jup_ob_schematic_soldier_buddy_8";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_57d7f8ea117bb959");
        namespace_4dc2ef625e9b424f::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace namespace_37fbc4f4f505c5e7 / namespace_e8bb687e7ce6c48e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0xbb
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_jp20_lm_evictor, [ holo03, jup_jp20_lm_evictor_belt_200_556n, jup_grip_vert_05 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_jp20_lm_evictor", ["holo03", "jup_jp20_lm_evictor_belt_200_556n", "jup_grip_vert_05"], "none", "none");
    }
    grenadeweaponhash = "thermobaric_grenade_jup_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("thermobaric_grenade_jup_mp");
    }
}

