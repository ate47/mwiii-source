#using scripts\code\character.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\common\ai.gsc;
#using script_2a75efcd3da99f86;
#using script_585020cc144da263;
#using script_110368d614fc4337;
#using script_1470a8e739bebb8a;
#using script_7fe81083032e13e1;
#using script_296ecd7e84a52368;
#using script_124c0460ed84305f;
#using script_76b1008b255c1686;
#using script_403097a9b8da5e0b;
#using scripts\cp_mp\agents\agent_init.gsc;
#using scripts\aitypes\assets.gsc;
#using scripts\cp\cp_weapon.gsc;

#namespace jup_enemy_cp_ar_tier3_rus_pmc;

// Namespace jup_enemy_cp_ar_tier3_rus_pmc / namespace_18234f87148eaaa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb
// Size: 0x2a6
function main() {
    self.aitypeid = function_2336488258354fbc(#"aitype", %"jup_enemy_cp_ar_tier3_rus_pmc");
    self.var_534e788bc498be9f = getscriptbundle(%"hash_d4c1580d6bc10b4");
    self.subclass = self.var_534e788bc498be9f.name;
    self.health = 150;
    self.maxhealth = 150;
    self.behaviortreeasset = "soldier_agent";
    self.var_6cb8f78a7c37e43b = "ai_shoot_styles_default";
    self.asmasset = "soldier";
    switch (scripts\code\character::get_random_weapon(5)) {
    case 0:
        primaryweaponhash = "iw9_ar_akilo105_mp, [ reflex06_tall, bar_ar_hvyshort_p04_akilo105, comp_ar_01 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 1:
        primaryweaponhash = "jup_jp01_ar_golf36_mp, [ jup_twofivex_golf36, jup_jp01_ar_golf36_mag_40_556n, jup_jp01_ar_golf36_stock_tac ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 2:
        primaryweaponhash = "iw9_ar_akilo105_mp, [ reflex03_tall, mag_ar_lgtlarge_p04_akilo105, stock_ar_light_p04_akilo105 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 3:
        primaryweaponhash = "iw9_ar_akilo_mp, [ iw9_minireddot04_tall, grip_angled01, stock_ar_tactical_p04_akilo ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    case 4:
        primaryweaponhash = "iw9_ar_akilo105_mp, [ iw9_minireddot02_tall, mag_ar_lgtlarge_p04_akilo105, bar_ar_heavy_p04_akilo105 ], none, none";
        self.weapon = level.var_67b54180a55f70e1[primaryweaponhash];
        break;
    }
    self giveweapon(self.weapon);
    self setspawnweapon(self.weapon);
    self.bulletsinclip = weaponclipsize(self.weapon);
    self.primaryweapon = self.weapon;
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21_mp, [ none, none, none, none, none, none ], none, none";
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

// Namespace jup_enemy_cp_ar_tier3_rus_pmc / namespace_18234f87148eaaa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a9
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

// Namespace jup_enemy_cp_ar_tier3_rus_pmc / namespace_18234f87148eaaa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x907
// Size: 0xf1
function function_9ac26a51c94ccf52() {
    assertex(isdefined(self.var_e2682e6f1838391e), "self.characterSelectionIndex has not been set, it should have been set in Agent_Spawn() for mp and InitSpawn() in SP in code");
    switch (self.var_e2682e6f1838391e) {
    case 0:
        return namespace_2622642e4c38e8b4::main();
    case 1:
        return namespace_2622672e4c38ef4d::main();
    case 2:
        return namespace_43f4b8363c66be49::main();
    case 3:
        return namespace_43f4b5363c66b7b0::main();
    case 4:
        return namespace_71acf378f477f6a9::main();
    case 5:
        return namespace_71acf078f477f010::main();
    case 6:
        return namespace_71acf178f477f243::main();
    case 7:
        return namespace_71acf678f477fd42::main();
    case 8:
        return namespace_dcd14716d043ae51::main();
    }
}

// Namespace jup_enemy_cp_ar_tier3_rus_pmc / namespace_18234f87148eaaa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa00
// Size: 0x106
function precache() {
    agent_type = "actor_jup_enemy_cp_ar_tier3_rus_pmc";
    if (!isdefined(level.agent_definition)) {
        level.agent_definition = [];
    }
    if (!isdefined(level.agent_definition[agent_type])) {
        level.agent_definition[agent_type] = [];
        level.agent_definition[agent_type]["team"] = "axis";
        level.agent_definition[agent_type]["setup_func"] = &main;
        level.agent_definition[agent_type]["setup_model_func"] = &setup_model;
        level.agent_definition[agent_type]["subclass"] = getscriptbundle(%"hash_d4c1580d6bc10b4");
        namespace_2622642e4c38e8b4::function_8168fbf6282d398b();
        namespace_2622672e4c38ef4d::function_8168fbf6282d398b();
        namespace_43f4b8363c66be49::function_8168fbf6282d398b();
        namespace_43f4b5363c66b7b0::function_8168fbf6282d398b();
        namespace_71acf378f477f6a9::function_8168fbf6282d398b();
        namespace_71acf078f477f010::function_8168fbf6282d398b();
        namespace_71acf178f477f243::function_8168fbf6282d398b();
        namespace_71acf678f477fd42::function_8168fbf6282d398b();
        namespace_dcd14716d043ae51::function_8168fbf6282d398b();
    }
    scripts\cp_mp\agents\agent_init::agent_init();
    scripts\aitypes\bt_util::init();
    scripts\aitypes\assets::soldier();
    thread setup_weapons();
}

// Namespace jup_enemy_cp_ar_tier3_rus_pmc / namespace_18234f87148eaaa8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0e
// Size: 0x2a4
function setup_weapons() {
    while (!isdefined(level.weaponmapdata)) {
        waitframe();
    }
    if (!isdefined(level.var_67b54180a55f70e1)) {
        level.var_67b54180a55f70e1 = [];
    }
    var_5576d3be590a9a64 = "iw9_ar_akilo105_mp, [ reflex06_tall, bar_ar_hvyshort_p04_akilo105, comp_ar_01 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d3be590a9a64])) {
        level.var_67b54180a55f70e1[var_5576d3be590a9a64] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo105_mp", ["reflex06_tall", "bar_ar_hvyshort_p04_akilo105", "comp_ar_01"], "none", "none");
    }
    var_5576d6be590aa0fd = "jup_jp01_ar_golf36_mp, [ jup_twofivex_golf36, jup_jp01_ar_golf36_mag_40_556n, jup_jp01_ar_golf36_stock_tac ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d6be590aa0fd])) {
        level.var_67b54180a55f70e1[var_5576d6be590aa0fd] = scripts\cp\cp_weapon::function_e83615f8a92e4378("jup_jp01_ar_golf36_mp", ["jup_twofivex_golf36", "jup_jp01_ar_golf36_mag_40_556n", "jup_jp01_ar_golf36_stock_tac"], "none", "none");
    }
    var_5576d5be590a9eca = "iw9_ar_akilo105_mp, [ reflex03_tall, mag_ar_lgtlarge_p04_akilo105, stock_ar_light_p04_akilo105 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d5be590a9eca])) {
        level.var_67b54180a55f70e1[var_5576d5be590a9eca] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo105_mp", ["reflex03_tall", "mag_ar_lgtlarge_p04_akilo105", "stock_ar_light_p04_akilo105"], "none", "none");
    }
    var_5576d0be590a93cb = "iw9_ar_akilo_mp, [ iw9_minireddot04_tall, grip_angled01, stock_ar_tactical_p04_akilo ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576d0be590a93cb])) {
        level.var_67b54180a55f70e1[var_5576d0be590a93cb] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo_mp", ["iw9_minireddot04_tall", "grip_angled01", "stock_ar_tactical_p04_akilo"], "none", "none");
    }
    var_5576cfbe590a9198 = "iw9_ar_akilo105_mp, [ iw9_minireddot02_tall, mag_ar_lgtlarge_p04_akilo105, bar_ar_heavy_p04_akilo105 ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_5576cfbe590a9198])) {
        level.var_67b54180a55f70e1[var_5576cfbe590a9198] = scripts\cp\cp_weapon::function_e83615f8a92e4378("iw9_ar_akilo105_mp", ["iw9_minireddot02_tall", "mag_ar_lgtlarge_p04_akilo105", "bar_ar_heavy_p04_akilo105"], "none", "none");
    }
    var_4f04b9c326eb7400 = "jup_cp24_pi_glima21_mp, [ none, none, none, none, none, none ], none, none";
    if (!isdefined(level.var_67b54180a55f70e1[var_4f04b9c326eb7400])) {
        level.var_67b54180a55f70e1[var_4f04b9c326eb7400] = scripts\cp\cp_weapon::function_e83615f8a92e4378("jup_cp24_pi_glima21_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenadeweaponhash = "frag_grenade_mp";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("frag_grenade_mp");
    }
}
