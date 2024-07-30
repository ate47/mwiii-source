#using script_6c32b2aeb4eff172;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_55cd32383f94aedd;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using script_43dc597584d873cd;
#using scripts\mp\class.gsc;

#namespace namespace_83d317a3d51ebda0;

// Namespace namespace_83d317a3d51ebda0 / namespace_649d1e2265e89f61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x1e3
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"hash_66c787f2c374230f");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_c6e47b887001283");
    self.subclass = self.var_534e788bc498be9f.name;
    self.nameindex = randomintrange(1, 42);
    self.health = 67;
    self.maxhealth = 67;
    self.behaviortreeasset = "zombie_hellhound";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "zombie_hellhound";
    self.ai_eventlist = %"hash_3664c8ba706ec788";
    self.zombieaisetting = "settings_zombie_hellhound_jup";
    namespace_2361523b5e4b2d68::function_7b25d1c42e7f75be("aisettings_zombie_hellhound");
    primaryweaponhash = "jup_me_zombie_hellhound, [ none, none, none, none, none, none ], none, none";
    self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    self.grenadeweapon = nullweapon();
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

// Namespace namespace_83d317a3d51ebda0 / namespace_649d1e2265e89f61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x417
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

// Namespace namespace_83d317a3d51ebda0 / namespace_649d1e2265e89f61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x476
// Size: 0x8
function function_9ac26a51c94ccf52() {
    return namespace_73a6cc0fc98dee97::main();
}

// Namespace namespace_83d317a3d51ebda0 / namespace_649d1e2265e89f61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x487
// Size: 0x108
function precache() {
    agent_type = "actor_jup_spawner_zombie_hellhound_pet";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_c6e47b887001283");
        namespace_73a6cc0fc98dee97::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::zombie();
    params = spawnstruct();
    params.aisettingsbundle = "aisettings_zombie_hellhound";
    params.zombieaisetting = "settings_zombie_hellhound_jup";
    namespace_3b7139f4d3d9513f::precache(params);
    thread setup_weapons();
}

// Namespace namespace_83d317a3d51ebda0 / namespace_649d1e2265e89f61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x597
// Size: 0xa2
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    primaryweaponhash = "jup_me_zombie_hellhound, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[primaryweaponhash])) {
        level.var_67b54180a55f70e1[primaryweaponhash] = scripts\mp\class::function_e83615f8a92e4378("jup_me_zombie_hellhound", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
}

